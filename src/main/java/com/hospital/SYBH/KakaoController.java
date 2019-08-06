package com.hospital.SYBH;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.member.MemberService;
import com.hospital.member.kakao.KakaoMemberVO;


@Controller
@RequestMapping("/member/")
public class KakaoController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="kakaoLogin")
	public void kakaoLogin() throws Exception{}
	
	@RequestMapping(value = "kakaoDelete")
	public String kakaoDelete(HttpSession session) throws Exception{
		KakaoMemberVO kakaoMemberVO = (KakaoMemberVO)session.getAttribute("memberVO");
		memberService.kakaoDelete(kakaoMemberVO);
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value = "kakaoLogout")
	public String kakaoLogout(HttpSession session) throws Exception{
		KakaoMemberVO kakaoMemberVO = (KakaoMemberVO)session.getAttribute("memberVO");
		memberService.kakaoLogout(kakaoMemberVO);
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value = "getInfo")
	public String getInfo(String access_token, HttpSession session) throws Exception{
		KakaoMemberVO kakaoMemberVO = memberService.getInfo(access_token);
		session.setAttribute("memberVO", kakaoMemberVO);
		session.setAttribute("variety", "kakao");
		
		return "redirect:../";
	}
}