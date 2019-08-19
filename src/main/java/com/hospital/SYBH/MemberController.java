package com.hospital.SYBH;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;


import com.hospital.checkup.CheckUpService;
import com.hospital.checkup.CheckUpVO;
import com.hospital.member.MemberService;
import com.hospital.member.MemberVO;
import com.hospital.member.mail.MailVO;
import com.hospital.pay.PayService;
import com.hospital.pay.PayVO;
import com.hospital.qna.QnAService;
import com.hospital.qna.QnAVO;
import com.hospital.treatbreakdown.TreatBreakDownService;
import com.hospital.treatbreakdown.TreatBreakDownVO;
import com.hospital.util.PageMaker;
import com.hospital.member.captcha.VerifyRecaptcha;
import com.hospital.member.kakao.KakaoMemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private PayService payService;
	@Inject
	private CheckUpService checkUpService;
	@Inject
	private TreatBreakDownService treatBreakDownService;
	@Inject
	private QnAService qnaService;
	
	@RequestMapping(value = "memberMyPage", method = RequestMethod.GET)
	public ModelAndView myPage(ModelAndView mv, HttpSession session) throws Exception {
		String variety = (String)session.getAttribute("variety");
		KakaoMemberVO kakaoMemberVO = null;
		MemberVO memberVO = null;
		String id = null;
		if(variety.equals("kakao")) {
			kakaoMemberVO = (KakaoMemberVO)session.getAttribute("memberVO");
			id = kakaoMemberVO.getId();
		} else {
			memberVO = (MemberVO)session.getAttribute("memberVO");
			id = memberVO.getId();
		}
		memberVO = memberService.getSelect(id);
		if(memberVO != null) {
			mv.addObject("memberVO", memberVO);
			mv.addObject("variety", "member");
			mv.setViewName("member/memberMyPage");
		} else if(kakaoMemberVO != null) {
			mv.addObject("memberVO", kakaoMemberVO);
			mv.addObject("variety", "kakao");
			mv.setViewName("member/memberMyPage");
		} else {
			mv.addObject("message", "정보가 없습니다.");
			mv.addObject("path", "redirect:../");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	
	//일반진료 예약내역
	@RequestMapping(value = "memberNomal", method = RequestMethod.GET)
	public ModelAndView memberNomal(PageMaker pageMaker, TreatBreakDownVO treatBreakDownVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = ((MemberVO)session.getAttribute("memberVO")).getId();
		treatBreakDownVO.setId(id);
		List<TreatBreakDownVO> list = treatBreakDownService.getOneList(pageMaker, treatBreakDownVO);
		int totalCount = treatBreakDownService.getOneTotalCount(treatBreakDownVO);
		mv.addObject("list",list);
		mv.addObject("pager",pageMaker);
		mv.addObject("count",totalCount);
		mv.addObject("board", "Nomal");
		mv.setViewName("member/memberBreakdown");
		return mv;
			
	}
	
	//건강검진 예약내역
	@RequestMapping(value = "memberMedical", method = RequestMethod.GET)
	public ModelAndView getOneList(PageMaker pageMaker, CheckUpVO checkUpVO,HttpSession session)throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = ((MemberVO)session.getAttribute("memberVO")).getId();
		checkUpVO.setId(id);
		List<CheckUpVO> list = checkUpService.getOneList(pageMaker, checkUpVO);
		int totalCount = checkUpService.getOneTotalCount(checkUpVO);
		mv.addObject("list",list);
		mv.addObject("pager",pageMaker);
		mv.addObject("count",totalCount);
		mv.addObject("board", "Medical");
		mv.setViewName("member/memberBreakdown");
		return mv;
	}
	
	
	//내 문의 내역
	@RequestMapping(value = "memberQna", method = RequestMethod.GET)
	public ModelAndView getQna(PageMaker pageMaker, QnAVO qnaVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = ((MemberVO)session.getAttribute("memberVO")).getId();
		qnaVO.setWriter(id);
		List<QnAVO> list = qnaService.getMemberQnaList(pageMaker, qnaVO);
		int totalCount = qnaService.getMemberTotalCount(qnaVO);
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("count", totalCount);
		mv.addObject("board", "Qna");
		mv.setViewName("member/memberBreakdown");
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "memberIdFind", method = RequestMethod.GET)
	public void memberIdFind() throws Exception {}
	
	@RequestMapping(value = "memberIdFind", method = RequestMethod.POST)
	public ModelAndView memberIdFind(ModelAndView mv, String email) throws Exception{
		MailVO mailVO = memberService.getId(email);
		if(mailVO != null) {
			mv.setViewName("member/memberLogin");
		} else {
			mv.addObject("message", "존재하지 않는 이메일입니다.");
			mv.addObject("path", "member/memberIdFind");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberPwFind", method = RequestMethod.GET)
	public void memberPwFind() throws Exception {}
	
	@RequestMapping(value = "memberPwUpdate", method = RequestMethod.POST)
	public ModelAndView memberPwFind(ModelAndView mv, String email) throws Exception{
		MailVO mailVO = memberService.getPw(email);
		if(mailVO != null) {
			mv.addObject("email", email);
			mv.setViewName("member/memberPwUpdate");
		} else {
			mv.addObject("message", "존재하지 않는 이메일입니다.");
			mv.addObject("path", "member/memberPwFind");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberSetPwUpdate", method = RequestMethod.POST)
	public ModelAndView memberPwUpdate(String email, String currPw, String newPw, String newPw2, ModelAndView mv) throws Exception{
		int result = memberService.setPwUpdate(email, currPw, newPw, newPw2);
		if(result > 0) {
			mv.setViewName("redirect:./memberLogin");
		} else {
			mv.addObject("message", "비밀번호 변경을 실패하였습니다.");
			mv.addObject("path", "redirect:./memberLogin");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberPwCheck", method = RequestMethod.POST)
	public ModelAndView memberPwCheck(MemberVO memberVO, ModelAndView mv) throws Exception{
		int result = memberService.getPwCheck(memberVO);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void login() throws Exception {}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView login(MemberVO memberVO, HttpSession session, ModelAndView mv) throws Exception{
		HashMap<String, Object> map = memberService.login(memberVO);
		memberVO = (MemberVO)map.get("memberVO");
		//int loginCheck = (Integer)map.get("loginCheck");
		if(memberVO != null) {
			//if(loginCheck == 2) {
				session.setAttribute("memberVO", memberVO);
				session.setAttribute("variety", "member");
				mv.setViewName("redirect:../");
			/*} else {
				mv.addObject("message", "다른 컴퓨터에서 사용하고 있는 아이디입니다.");
				mv.addObject("path", "../member/memberLogin");
				mv.setViewName("common/messageMove");
			}*/
		} else {
			mv.addObject("message", "로그인 실패하셨습니다.");
			mv.addObject("path", "../member/memberLogin");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping("memberLogout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) throws Exception{
		int result = memberService.logout(session);
		if(result > 0) {
			session.invalidate();
			mv.setViewName("redirect:../");
		} else {
			mv.addObject("message", "로그아웃을 실패하였습니다.");
			mv.addObject("path", "redirect:../");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void memberAgree() throws Exception {}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void memberJoin(@ModelAttribute MemberVO memberVO) throws Exception {}
	
	//회원 가입시 이메일 인증코드를 생성
	//이 인증 코드는 후에 다른 컨트롤러에서 처리를 받아 회원 상태를 활성화
	//(/register 로 매핑되는 컨트롤러에서 등록한 ID는 authStatus[로그인 가능 유 무] 가 활성화 되지 않은 상태)
	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(@Valid MemberVO memberVO, BindingResult br, ModelAndView mv) throws Exception {
		if(br.hasErrors()) {
			mv.setViewName("member/memberJoin");
		} else {
			int result = memberService.setWrite(memberVO);
			if(result > 0) {
				mv.setViewName("redirect:./memberLogin");
			} else {
				mv.addObject("message", "Login Fail");
				mv.addObject("path", "../");
				mv.setViewName("common/messageMove");
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "memberIdCheck", method = RequestMethod.POST)
	public ModelAndView memberIdCheck(String id, ModelAndView mv) throws Exception{
		int result = memberService.getIdDuplication(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "memberEmailCheck", method = RequestMethod.POST)
	public ModelAndView memberEmailCheck(MemberVO memberVO, ModelAndView mv) throws Exception{
		int result = memberService.getEmailDuplication(memberVO);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	//재혁 후원내역 작성
	@RequestMapping(value="memberDonation", method = RequestMethod.GET)
	public ModelAndView memberDonation(PageMaker pageMaker, PayVO payVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id="";
		try {
			id = ((MemberVO)session.getAttribute("memberVO")).getId();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		payVO.setId(id);
		payVO.setCategory(1);
		List<PayVO> list =  payService.getOneList(pageMaker, payVO);
		int totalCount = payService.getOneTotalCount(payVO);
		mv.addObject("board", "Donation");
		mv.addObject("what", "후원");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("count",totalCount);
		mv.setViewName("member/memberBreakdown");
		return mv;
	}
	
	@RequestMapping(value = "memberDelete", method = RequestMethod.GET)
	public ModelAndView memberDelete(HttpSession session, ModelAndView mv) throws Exception{
		String id = ((MemberVO)session.getAttribute("memberVO")).getId();
		int result = memberService.setDelete(id);
		if(result > 0) {
			mv.setViewName("redirect:../");
			session.invalidate();
		} else {
			mv.addObject("message", "회원탈퇴를 실패하였습니다.");
			mv.addObject("path", "../member/memberMyPage");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberReLogin", method = RequestMethod.GET)
	public void memberReLogin() throws Exception{}
	
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVO memberVO, HttpSession session, ModelAndView mv) throws Exception{
		memberVO = memberService.reLogin(memberVO, session);
		if(memberVO != null) {
			mv.addObject("memberVO", memberVO);
			mv.setViewName("member/memberUpdate");
		} else {
			mv.addObject("message", "로그인 실패하셨습니다.");
			mv.addObject("path", "../member/memberReLogin");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberSetUpdate", method = RequestMethod.POST)
	public ModelAndView memberSetUpdate(@Valid MemberVO memberVO, HttpSession session, ModelAndView mv) throws Exception{
		int result = memberService.setUpdate(memberVO, session);
		if(result > 0) {
			mv.setViewName("redirect:./memberMyPage");
		} else {
			mv.addObject("message", "정보수정을 실패하였습니다.");
			mv.addObject("path", "./memberUpdate");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	//사용자가 인증을 확인하였을 때 서버에서 요청받을 컨트롤러를 생성
	@RequestMapping(value = "memberEmailConfirm", method = RequestMethod.GET)
	public ModelAndView memberEmailConfirm(MemberVO memberVO, ModelAndView mv) throws Exception{
		int result = memberService.userAuth(memberVO.getEmail());
		if(result > 0) {
			mv.addObject("email", memberVO.getEmail());
			mv.addObject("authCode", memberVO.getAuthCode());
			mv.setViewName("member/memberEmailConfirm");
		} else {
			mv.addObject("message", "이메일 인증을 실패하셨습니다.");
			mv.addObject("path", "redirect:../");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
    @RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
    public ModelAndView VerifyRecaptcha(String recaptcha, ModelAndView mv) throws Exception {
    	int result = 0;
        VerifyRecaptcha.setSecretKey("6LeDI7EUAAAAAOl-nsomoO5UGCFyfw6_mYexVvex");
        //0 = 오류, 1 = 성공, 2 = 실패
        try {
            if(VerifyRecaptcha.verify(recaptcha)) {
            	result = 1;
            } else {
            	result = 2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("result", result);
        mv.setViewName("common/message");
        
        return mv;
    }
    
    @RequestMapping(value = "checkUnserviceability", method = RequestMethod.POST)
    public ModelAndView checkUnserviceability(String id, ModelAndView mv) throws Exception {
    	int result = memberService.getUnserviceability(id);
        mv.addObject("result", result);
        mv.setViewName("common/message");
        
        return mv;
    }
}