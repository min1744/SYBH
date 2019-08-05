package com.hospital.SYBH;

import java.util.HashMap;

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
	
	@RequestMapping(value="kakaoLogin")
	public void kakaoLogin(MemberVO memberVO, HttpSession session) throws Exception{}
	
	@RequestMapping(value = "kakaoDelete")
	public String kakaoDelete(HttpSession session) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		memberService.kakaoDelete(memberVO);
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value = "kakaoLogout")
	public String kakaoLogout(HttpSession session) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		memberService.kakaoLogout(memberVO);
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value = "getInfo")
	public String getInfo(String access_token, HttpSession session) throws Exception{
		HashMap<String, Object> map = memberService.getInfo(access_token);
		session.setAttribute("memberVO", (MemberVO)map.get("memberVO"));
		session.setAttribute("age_range", (String)map.get("age_range"));
		session.setAttribute("variety", "kakao");
		
		return "redirect:../";
	}
}