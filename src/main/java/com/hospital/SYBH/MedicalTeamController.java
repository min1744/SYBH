package com.hospital.SYBH;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.medicalTeam.MedicalTeamService;

@Controller
@RequestMapping("/medical/")
public class MedicalTeamController {
	@Inject
	public MedicalTeamService medicalTeamService;
	
	@RequestMapping(value = "medicalTeamList", method = RequestMethod.GET)
	public ModelAndView getList(int mid) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("medical/medicalTeam");
		
		return mv;
		
	}
	
}
