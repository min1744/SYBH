package com.hospital.SYBH;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.medicalTeam.MedicalTeamService;
import com.hospital.medicalTeam.MedicalTeamVO;

@Controller
@RequestMapping("/medical/")
public class MedicalTeamController {
	@Inject
	public MedicalTeamService medicalTeamService;
	
	@RequestMapping(value = "medicalTeamList", method = RequestMethod.GET)
	public ModelAndView getList(Integer mid) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(mid ==null) {
			mid = 1;
		}
		List<MedicalTeamVO> list = medicalTeamService.getList(mid);
		mv.addObject("list",list);
		mv.addObject("mid",mid);
		mv.setViewName("medical/medicalTeam");
		
		return mv;
	}
	
	@RequestMapping(value="medicalTeamSearch", method = RequestMethod.GET)
	public ModelAndView getSearch(String name) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(name==null) {
			name = "";
		}
		List<MedicalTeamVO> list = medicalTeamService.getSearch(name);
		mv.addObject("list",list);
		mv.setViewName("medical/medicalTeam");
		return mv;
	}
	
}
