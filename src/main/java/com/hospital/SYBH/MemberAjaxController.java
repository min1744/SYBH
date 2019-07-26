package com.hospital.SYBH;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.member.MemberService;

@Controller
@RequestMapping("/ajax")
public class MemberAjaxController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "memberIdCheck")
	public ModelAndView memberIdCheck(String id, ModelAndView mv) throws Exception{
		memberService.geti
		
		return mv;
	}
}