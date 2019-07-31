package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hospital/")
public class HospitalInfoController {
	
	@RequestMapping(value = "hospitalInfo", method = RequestMethod.GET)
	public ModelAndView info() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hospital/hospitalInfo");
		
		return mv;
	}
	
	
	@RequestMapping(value = "floorInfo", method = RequestMethod.GET)
	public ModelAndView floorInfo() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hospital/floorInfo");
		
		return mv;
	}
	
	
	@RequestMapping(value = "location", method = RequestMethod.GET)
	public ModelAndView location() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hospital/location");
		
		return mv;
	}

}
