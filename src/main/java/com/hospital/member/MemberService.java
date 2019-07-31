package com.hospital.member;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.hospital.util.PageMaker;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSender mailSender;
	
	//Admin페이지 List
	public List<MemberVO> getList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		pageMaker.makePage(memberDAO.getTotalCount(pageMaker));
		
		return memberDAO.getList(pageMaker);
	}
	
	//myPage
	public MemberVO getSelect(String id) throws Exception{
		return memberDAO.getSelect(id);
	}
	
	//login
	public MemberVO login(MemberVO memberVO) throws Exception{
		memberVO = memberDAO.login(memberVO);
		//주민등록번호 복호화
		if(memberVO != null) {
			String res_reg_num_dec = memberDAO.setResDecryption(memberVO.getRes_reg_num());
			memberVO.setRes_reg_num(res_reg_num_dec);
		}
		
		return memberVO;
	}
	
	//아이디 찾기
	public MailVO getId(String email) throws Exception{
		String id = memberDAO.getId(email);
		MailVO mailVO = null;
		if(id != null) {
			mailVO = new MailVO();
			mailVO.setSetFrom("alsrms1744@gmail.com");//보내는 사람
			mailVO.setToMail(email);//받는 사람의 이메일
			mailVO.setTitle("[SYBH]안녕하세요, 쌍용백병원입니다.");//메일 제목
			mailVO.setContents("귀하의 아이디는 "+id+"입니다.");//메일 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(mailVO.getSetFrom()); // 보내는사람 생략하면 정상작동을 안함
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
			System.out.println("randomPw : "+randomPw);
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
			mailVO.setTitle("[SYBH]안녕하세요, 쌍용백병원입니다.");//메일 제목
			mailVO.setContents("귀하의 임시비밀번호는 "+pw+"입니다. 비밀번호를 마이페이지에서 변경해주시기 바랍니다.");//메일 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(mailVO.getSetFrom()); // 보내는사람 생략하면 정상작동을 안함
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
		
		int result = memberDAO.getIdDuplication(memberVO.getId());
		if(result < 1) {
			throw new Exception();
		}
		
		result = memberDAO.getEmailDuplication(memberVO.getEmail());
		if(result < 1) {
			throw new Exception();
		}
		
		return memberDAO.setWrite(memberVO);
	}
	
	//check ID duplication
	public int getIdDuplication(String id) throws Exception{
		int result = memberDAO.getIdDuplication(id);
		if(result < 1) {
			throw new Exception();
		}
		
		return result;
	}
	
	//check Email
	public int getEmailDuplication(MemberVO memberVO) throws Exception{
		int result = 0;
		if(memberVO.getEmail1() != null && memberVO.getEmail2() != null) {
			String email = memberVO.getEmail1() + "@" + memberVO.getEmail2();
			result = memberDAO.getEmailDuplication(email);
		} else {
			throw new Exception();
		}
		if(result < 1) {
			throw new Exception();
		}
		
		return result;
	}
	
	//회원 탈퇴
	public int setDelete(String id) throws Exception{
		int result = memberDAO.setDelete(id);
		if(result < 1) {
			throw new Exception();
		}
		return result;
	}
}