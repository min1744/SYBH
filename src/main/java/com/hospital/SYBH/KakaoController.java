package com.hospital.SYBH;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.member.MemberService;
import com.hospital.member.MemberVO;


@Controller
@RequestMapping("/member/")
public class KakaoController {
	
	@Inject
	private MemberService memberService;
	
	@ModelAttribute("variety")
	public String board() {
		return "kakao";
	}
	
	@RequestMapping(value="kakaoLogin")
	public void kakaoLogin(HttpSession session) throws Exception{
		session.setAttribute("varitey", "kakao");
	}
	
	/*@RequestMapping(value = "kakaoDelete")
	public String kakaoDelete(HttpSession session) throws Exception{
		KakaoMemberVO kakaoMemberVO = (KakaoMemberVO)session.getAttribute("memberVO");
		memberService.kakaoDelete(kakaoMemberVO);
		session.invalidate();
		return "redirect:../";
	}*/
	
	@RequestMapping(value = "kakaoLogout")
	public String kakaoLogout(HttpSession session) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		memberService.kakaoLogout(memberVO);
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value = "getInfo")
	public String getInfo(String access_token, HttpSession session) throws Exception{
		MemberVO memberVO = memberService.getInfo(access_token);
		session.setAttribute("memberVO", memberVO);
		
		return "redirect:../";
	}
}