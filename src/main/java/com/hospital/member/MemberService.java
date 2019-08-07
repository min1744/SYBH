package com.hospital.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hospital.member.kakao.KakaoMemberVO;
import com.hospital.member.mail.MailHandler;
import com.hospital.member.mail.MailVO;
import com.hospital.member.mail.TempKey;
import com.hospital.util.PageMaker;

@Transactional
@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSender mailSender;
	
	//Admin페이지 List
	public List<MemberVO> getList() throws Exception{
		List<MemberVO> list = memberDAO.getList();
		for(MemberVO memberVO : list) {
			//주민등록번호 복호화 및 뒷자리 *처리
			String res_reg_num = memberDAO.setResDecryption(memberVO.getRes_reg_num());
			if(res_reg_num == null) {
				throw new Exception();
			}
			res_reg_num = memberDAO.setUpdateRes(res_reg_num);
			if(res_reg_num == null) {
				throw new Exception();
			}
			memberVO.setRes_reg_num(res_reg_num);
		}
		
		return list;
	}
	
	//일반회원 login
	public HashMap<String, Object> login(MemberVO memberVO) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		//int loginCheck = memberDAO.loginCheck(memberVO.getId());
		//if(loginCheck > 0) {
			memberVO = memberDAO.login(memberVO);
			if(memberVO != null) {
				int result = memberDAO.setLoginStatus(memberVO.getId());
				if(result < 1) {
					throw new Exception();
				}
			}
			map.put("memberVO", memberVO);
			/*map.put("loginCheck", loginCheck);
		} else {
			throw new Exception();
		}*/
		
		return map;
	}
	
	//일반회원 logout
	public int logout(HttpSession session) throws Exception{
		String id = ((MemberVO)session.getAttribute("memberVO")).getId();
		
		return memberDAO.setLogoutStatus(id);
	}
	
	//MyPage
	public MemberVO getSelect(String id) throws Exception{
		MemberVO memberVO = memberDAO.getSelect(id);
		if(memberVO != null) {
			String res_reg_num = memberDAO.setResDecryption(memberVO.getRes_reg_num());
			String res_reg_num_dec = memberDAO.setUpdateRes(res_reg_num);
			memberVO.setRes_reg_num(res_reg_num_dec);
		}
		return memberVO;
	}
	
	//reLogin
	public MemberVO reLogin(MemberVO memberVO, HttpSession session) throws Exception{
		memberVO = memberDAO.login(memberVO);
		if(memberVO != null) {
			String dbId = memberVO.getId();
			String sessionId = ((MemberVO)session.getAttribute("memberVO")).getId();
			if(!dbId.equals(sessionId)) {
				memberVO = null;
			} else {
				//주민등록번호 복호화
				String res_reg_num = memberDAO.setResDecryption(memberVO.getRes_reg_num());
				String [] res = res_reg_num.split("-");
				memberVO.setRes_reg_num1(res[0]);
				memberVO.setRes_reg_num2(res[1]);
				
				res = memberVO.getPhone().split("-");
				memberVO.setPhone1(res[0]);
				memberVO.setPhone2(res[1]);
				memberVO.setPhone3(res[2]);
				
				res = memberVO.getEmail().split("@");
				memberVO.setEmail1(res[0]);
				memberVO.setEmail2(res[1]);
			}
		}

		return memberVO;
	}
	
	//회원정보 수정
	public int setUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		int result = 0;
		String res_reg_num1 = memberVO.getRes_reg_num1();
		String res_reg_num2 = memberVO.getRes_reg_num2();
		if(res_reg_num1 != null && res_reg_num2 != null) {
			memberVO.setRes_reg_num(res_reg_num1 + "-" + res_reg_num2);
		} else {
			throw new Exception();
		}
		
		String phone1 = memberVO.getPhone1();
		String phone2 = memberVO.getPhone2();
		String phone3 = memberVO.getPhone3();
		if(phone1 != null && phone2 != null && phone3 != null) {
			memberVO.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		} else {
			throw new Exception();
		}
		
		String email1 = memberVO.getEmail1();
		String email2 = memberVO.getEmail2();
		if(email1 != null && email2 != null) {
			memberVO.setEmail(email1 + "@" + email2);
		} else {
			throw new Exception();
		}
		
		result = memberDAO.setUpdate(memberVO);
		if(result < 1) {
			throw new Exception();
		}
		
		String email = ((MemberVO)session.getAttribute("memberVO")).getEmail();
		if(!email.equals(memberVO.getEmail())) {
			//이메일 변경 시 다시 이메일 인증을 받도록 설정
			result = memberDAO.setStatusInit(memberVO.getId());
			if(result < 1) {
				throw new Exception();
			}
			String key = new TempKey().getKey(50, false); // 인증키 생성
			System.out.println("key : "+key);
			System.out.println("email : "+memberVO.getEmail());
			memberVO.setAuthCode(key);
			memberVO.setEmail(memberVO.getEmail());
			result = memberDAO.createAuthKey(memberVO); // 인증키 DB저장
			if(result < 1) {
				throw new Exception();
			}

			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[SYBH](이메일 인증)안녕하세요, 쌍용백병원입니다.");
			sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost/SYBH/member/memberEmailConfirm?email=").append(memberVO.getEmail()).append("&authCode=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("alsrms1744@gmail.com", "쌍용백병원(SYBH)");
			sendMail.setTo(memberVO.getEmail());
			sendMail.send();
		}
		
		return result;
	}
	
	//아이디 찾기
	public MailVO getId(String email) throws Exception{
		String id = memberDAO.getId(email);
		MailVO mailVO = null;
		if(id != null) {
			mailVO = new MailVO();
			mailVO.setSetFrom("alsrms1744@gmail.com");//보내는 사람
			mailVO.setToMail(email);//받는 사람의 이메일
			mailVO.setTitle("[SYBH](아이디 찾기)안녕하세요, 쌍용백병원입니다.");//메일 제목
			mailVO.setContents("귀하의 아이디는 " + id + "입니다.");//메일 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(mailVO.getSetFrom(), "쌍용백병원(SYBH)"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(mailVO.getToMail()); // 받는사람 이메일
				messageHelper.setSubject(mailVO.getTitle()); // 메일제목은 생략이 가능하다
				messageHelper.setText(mailVO.getContents()); // 메일 내용
				
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		return mailVO;
	}
	
	//비밀번호 찾기
	public MailVO getPw(String email) throws Exception{
		String id = memberDAO.getId(email);
		MailVO mailVO = null;
		if(id != null) {
			MemberVO memberVO = new MemberVO();
			String randomPw = UUID.randomUUID().toString().substring(0, 10);
			memberVO.setPw(randomPw);
			memberVO.setEmail(email);
			int result = memberDAO.setPwUpdate(memberVO);
			if(result < 1) {
				throw new Exception();
			}
			String pw = memberDAO.getPw(email);
			mailVO = new MailVO();
			mailVO.setSetFrom("alsrms1744@gmail.com");//보내는 사람
			mailVO.setToMail(email);//받는 사람의 이메일
			mailVO.setTitle("[SYBH](비밀번호 찾기)안녕하세요, 쌍용백병원입니다.");//메일 제목
			mailVO.setContents("귀하의 비밀번호가 임시비밀번호로 변경되었습니다. 임시비밀번호는 " + pw + "입니다. 비밀번호를 마이페이지에서 변경해주시기 바랍니다.");//메일 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(mailVO.getSetFrom(), "쌍용백병원(SYBH)"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(mailVO.getToMail()); // 받는사람 이메일
				messageHelper.setSubject(mailVO.getTitle()); // 메일제목은 생략이 가능하다
				messageHelper.setText(mailVO.getContents()); // 메일 내용
				
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		return mailVO;
	}
	
	//비밀번호 변경하기
	public int setPwUpdate(String email, String currPw, String newPw, String newPw2) throws Exception{
		String pw = memberDAO.getPw(email);
		int result = 0;
		if(pw.equals(currPw)) {
			MemberVO memberVO = new MemberVO();
			memberVO.setPw(newPw);
			memberVO.setEmail(email);
			result= memberDAO.setPwUpdate(memberVO);
		}
		
		return result;
	}
	
	//비밀번호 확인하기
	public int getPwCheck(MemberVO memberVO) throws Exception{
		String pw = memberDAO.getPw(memberVO.getEmail());
		int result = 0;
		if(pw.equals(memberVO.getPw())) {
			result = 1;
		}
		
		return result;
	}
	
	//회원가입
	public int setWrite(MemberVO memberVO) throws Exception{
		String res_reg_num1 = memberVO.getRes_reg_num1();
		String res_reg_num2 = memberVO.getRes_reg_num2();
		if(res_reg_num1 != null && res_reg_num2 != null) {
			memberVO.setRes_reg_num(res_reg_num1 + "-" + res_reg_num2);
		} else {
			throw new Exception();
		}
		
		String phone1 = memberVO.getPhone1();
		String phone2 = memberVO.getPhone2();
		String phone3 = memberVO.getPhone3();
		if(phone1 != null && phone2 != null && phone3 != null) {
			memberVO.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		} else {
			throw new Exception();
		}
		
		String email1 = memberVO.getEmail1();
		String email2 = memberVO.getEmail2();
		if(email1 != null && email2 != null) {
			memberVO.setEmail(email1 + "@" + email2);
		} else {
			throw new Exception();
		}
		
		int result = memberDAO.setWrite(memberVO);
		if(result < 1) {
			throw new Exception();
		}
		
		String key = new TempKey().getKey(50, false); // 인증키 생성
		System.out.println("key : "+key);
		System.out.println("email : "+memberVO.getEmail());
		memberVO.setAuthCode(key);
		memberVO.setEmail(memberVO.getEmail());
		result = memberDAO.createAuthKey(memberVO); // 인증키 DB저장
		if(result < 1) {
			throw new Exception();
		}

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[SYBH](이메일 인증)안녕하세요, 쌍용백병원입니다.");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost/SYBH/member/memberEmailConfirm?email=").append(memberVO.getEmail()).append("&authCode=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("alsrms1744@gmail.com", "쌍용백병원(SYBH)");
		sendMail.setTo(memberVO.getEmail());
		sendMail.send();
		
		return result;
	}
	
	//이메일 인증 확인
	public int userAuth(String email) throws Exception {
		return memberDAO.userAuth(email);
	}
	
	//아이디 중복확인
	public int getIdDuplication(String id) throws Exception{
		return memberDAO.getIdDuplication(id);
	}
	
	//이메일 중복확인
	public int getEmailDuplication(MemberVO memberVO) throws Exception{
		String email = null;
		if(memberVO.getEmail() != null) {
			email = memberVO.getEmail();
		} else {
			String email1 = memberVO.getEmail1();
			String email2 = memberVO.getEmail2();
			if(email1 != null && email2 != null) {
				email = email1 + "@" + email2;
			}
		}
		
		return memberDAO.getEmailDuplication(email);
	}
	
	//회원 탈퇴
	public int setDelete(String id) throws Exception{
		int result = memberDAO.setDelete(id);
		if(result < 1) {
			throw new Exception();
		}
		return result;
	}
	
	//kakao 탈퇴
	public void kakaoDelete(KakaoMemberVO kakaoMemberVO) throws Exception{
		URL url = null;
		HttpURLConnection con = null;
		String header = "Bearer ";
		String kakaoUrl="https://kapi.kakao.com/v1/user/unlink";
		header += kakaoMemberVO.getAccess_token();
		
		url = new URL(kakaoUrl);
		con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.addRequestProperty("Authorization", header);
		System.out.println(con.getResponseCode());
		System.out.println(kakaoMemberVO.getAccess_token());
	}

	//로그아웃(token 해제)
	public void kakaoLogout(KakaoMemberVO kakaoMemberVO) throws Exception{
		URL url = null;
		HttpURLConnection con = null;
		String header = "Bearer ";
		String kakaoUrl="https://kapi.kakao.com/v1/user/logout";
		header += kakaoMemberVO.getAccess_token();

		url = new URL(kakaoUrl);
		con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.addRequestProperty("Authorization", header);
	}

	//로그인 성공 시 사용자 정보를 가져오기
	public KakaoMemberVO getInfo(String access_token) throws Exception{
		URL url=null;
		HttpURLConnection con = null;
		String header="Bearer ";
		String kakaoUrl="https://kapi.kakao.com/v2/user/me";
		header=header+access_token;
		
		url = new URL(kakaoUrl);
		con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.addRequestProperty("Authorization", header);

		//java코드가 왔다갔다 하기 때문에 socket 연결
		int resultCode = con.getResponseCode();
		BufferedReader br= null;
		KakaoMemberVO kakaoMemberVO = null;
		if(resultCode==200) {
			//즉, byte가 이동하므로 String 타입으로 변환
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String resultMessage=null;
			//문자열을 합치는 역할
			StringBuffer sb = new StringBuffer();
			while((resultMessage=br.readLine()) != null) {
				sb.append(resultMessage);
			}
			try {
				JSONParser jsonParser = new JSONParser();
				JSONObject js = (JSONObject)jsonParser.parse(sb.toString());
				JSONObject js_properties = (JSONObject)js.get("properties");
				JSONObject js_kakao_account = (JSONObject)js.get("kakao_account");
				
				kakaoMemberVO = new KakaoMemberVO();
				kakaoMemberVO.setId(js.get("id").toString());
				kakaoMemberVO.setName(js_properties.get("nickname").toString());
				kakaoMemberVO.setEmail(js_kakao_account.get("email").toString());
				String birthday = js_kakao_account.get("birthday").toString();
				String birthMonth = birthday.substring(0, 2);
				String birthDate = birthday.substring(2, 4);
				kakaoMemberVO.setBirthday(birthMonth+"월"+birthDate+"일");
				String gender = js_kakao_account.get("gender").toString();
				if(gender.equals("male")) {
					gender = "남자";
				} else {
					gender = "여자";
				}
				kakaoMemberVO.setGender(gender);
				String age_range = js_kakao_account.get("age_range").toString();
				String first = age_range.substring(0, 1);
				if(!first.equals("0")) {
					age_range = first+"0대";
				} else {
					age_range = "유아∙어린이";
				}
				kakaoMemberVO.setAge_range(age_range);
				kakaoMemberVO.setAccess_token(access_token);
				
				//카카오톡 로그인 시 꺼낼 수 있는 정보들에 대한 키값 구하기
				/*Set set = js_kakao_account.keySet();
				Iterator iterator = set.iterator();
				while(iterator.hasNext()){
					String key = (String)iterator.next();
					System.out.println("jsEmail hashMap Key : " + key);
				}*/
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}
		br.close();

		return kakaoMemberVO;
	}
	
	//등급 상향
	public int setUpgrade(String [] id) throws Exception{
		List<String> list = Arrays.asList(id);
		return memberDAO.setUpgrade(list);
	}
	
	//등급 상향
	public int setDowngrade(String [] id) throws Exception{
		List<String> list = Arrays.asList(id);
		return memberDAO.setDowngrade(list);
	}
}