package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.member.MemberService;
import com.hospital.member.MemberVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "adminIndex", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv) throws Exception {
		mv.setViewName("admin/adminIndex");
		
		return mv;
	}
	
	
	@RequestMapping(value = "memberNormal", method = RequestMethod.GET)
	public ModelAndView memberNomal(ModelAndView mv) throws Exception {
		List<MemberVO> list = memberService.getList();
		mv.addObject("list", list);
		mv.setViewName("admin/memberNormal");
		
		return mv;
	}
	
	@RequestMapping(value = "memberKakao", method = RequestMethod.GET)
	public ModelAndView memberKakao(ModelAndView mv) throws Exception {
		mv.setViewName("admin/memberKakao");
		
		return mv;
	}
	
	@RequestMapping(value = "memberUpgrade", method = RequestMethod.POST)
	public ModelAndView memberUpgrade(String [] id, ModelAndView mv) throws Exception {
		int result = memberService.setUpgrade(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}

	@RequestMapping(value = "memberDowngrade", method = RequestMethod.POST)
	public ModelAndView memberDowngrade(String [] id, ModelAndView mv) throws Exception {
		int result = memberService.setDowngrade(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
}