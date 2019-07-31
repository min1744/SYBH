package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.member.MailVO;
import com.hospital.member.MemberService;
import com.hospital.member.MemberVO;
import com.hospital.pay.PayDAO;
import com.hospital.pay.PayService;
import com.hospital.pay.PayVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private PayService payService;
	@Inject
	private PayDAO payDAO;
	
	//현아 작성 (마이페이지 jsp 잘 나오는지 테스트용)
	@RequestMapping(value = "memberMyPage", method = RequestMethod.GET)
	public ModelAndView myPage() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberMyPage");
		return mv;
	}
	
	//현아 작성 (일반 진료 예약내역 jsp 잘 나오는지 테스트용)
	@RequestMapping(value = "memberNomal", method = RequestMethod.GET)
	public ModelAndView memberNomal() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "nomal");
		mv.setViewName("member/memberBreakdown");
		return mv;
			
	}
	
	//현아 작성 (건강검진 예약내역 jsp 잘 나오는지 테스트용)
	@RequestMapping(value = "memberMedical", method = RequestMethod.GET)
	public ModelAndView memberMedical() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "medical");
		mv.setViewName("member/memberBreakdown");
		return mv;
				
	}
	
	//현아 작성 (아이디/비번찾기 jsp 잘 나오는지 테스트용)
	@RequestMapping(value = "memberIdFind", method = RequestMethod.GET)
	public String memberIdFind() throws Exception {
		return "member/memberIdFind";
	}
	
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
	public String memberPwFind() throws Exception {
		return "member/memberPwFind";
	}
	
	@RequestMapping(value = "memberPwFind", method = RequestMethod.POST)
	public ModelAndView memberPwFind(ModelAndView mv, String email) throws Exception{
		MailVO mailVO = memberService.getPw(email);
		if(mailVO != null) {
			mv.setViewName("member/memberLogin");
		} else {
			mv.addObject("message", "존재하지 않는 이메일입니다.");
			mv.addObject("path", "member/memberPwFind");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void login() throws Exception {}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView login(MemberVO memberVO, HttpSession session, ModelAndView mv) throws Exception{
		memberVO = memberService.login(memberVO);
		if(memberVO != null) {
			session.setAttribute("memberVO", memberVO);
			mv.setViewName("redirect:../");
		} else {
			mv.addObject("message", "로그인 실패하셨습니다.");
			mv.addObject("path", "../member/memberLogin");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping("memberLogout")
	public String logOut(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:../";
	}
	
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void memberAgree() throws Exception {}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void memberJoin(@ModelAttribute MemberVO memberVO) throws Exception {}
	
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
		int totalCount = payDAO.getOneTotalCount(payVO);
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
		System.out.println("id : "+id);
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
	
	@RequestMapping(value = "memberReLogin", method = RequestMethod.POST)
	public ModelAndView memberReLogin(MemberVO memberVO, ModelAndView mv) throws Exception{
		memberVO = memberService.reLogin(memberVO);
		if(memberVO != null) {
			mv.setViewName("member/memberUpdate");
		} else {
			mv.addObject("message", "로그인 실패하셨습니다.");
			mv.addObject("path", "../member/memberReLogin");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberUpdate", method = RequestMethod.GET)
	public ModelAndView memberUpdate(String id, ModelAndView mv) throws Exception{
		MemberVO memberVO = memberService.getSelect(id);
		if(memberVO != null) {
			mv.addObject("memberVO", memberVO);
			mv.setViewName("member/memberUpdate");
		} else {
			mv.addObject("message", "데이터를 불러오지 못했습니다.");
			mv.addObject("path", "../member/memberReLogin");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVO memberVO, ModelAndView mv) throws Exception{
		
		
		return mv;
	}
}