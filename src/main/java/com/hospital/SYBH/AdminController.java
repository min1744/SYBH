package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@RequestMapping(value = "adminIndex", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv) throws Exception {
		mv.setViewName("admin/adminIndex");
		
		return mv;
	}
	
	
	@RequestMapping(value = "memberNomal", method = RequestMethod.GET)
	public ModelAndView memberNomal(ModelAndView mv) throws Exception {
		mv.setViewName("admin/memberNomal");
		
		return mv;
	}
	
	@RequestMapping(value = "memberKakao", method = RequestMethod.GET)
	public ModelAndView memberKakao(ModelAndView mv) throws Exception {
		mv.setViewName("admin/memberKakao");
		
		return mv;
	}
}