package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/medical/")
public class MedicalTeamController {

	
	@RequestMapping(value = "medicalTeamList", method = RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("medical/medicalTeam");
		
		return mv;
		
	}
	
}
