package com.hospital.SYBH;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.member.MemberService;
import com.hospital.member.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	//현아 작성 (마이페이지 jsp 잘 나오는지 테스트용)
	@RequestMapping(value = "memberMyPage", method = RequestMethod.GET)
	public ModelAndView myPage() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberMyPage");
		
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
			mv.addObject("path", "../");
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
	public void memberJoin() throws Exception {
		
	}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public void memberJoin(MemberVO memberVO) throws Exception {
		int result = memberService.setWrite(memberVO);
		if(result > 0) {
			
		}
	}
}