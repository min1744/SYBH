package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reserve/")
public class ReserveController {

	
	@RequestMapping(value = "reserveInfo", method = RequestMethod.GET)
	public ModelAndView info() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveInfo");
		
		return mv;
	}
	
	
	@RequestMapping(value = "reserveNomal", method = RequestMethod.GET)
	public ModelAndView nomal() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveNomal");
		
		return mv;
	}
	
	@RequestMapping(value = "reserveMedical", method = RequestMethod.GET)
	public ModelAndView medical() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveMedical");
		
		return mv;
	}
	
	@RequestMapping(value = "reserveCal", method = RequestMethod.GET)
	public ModelAndView getCal() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveCal");
		
		return mv;
	}
	
	
}
