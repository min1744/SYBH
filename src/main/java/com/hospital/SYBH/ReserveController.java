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
@RequestMapping("/reserve/")
public class ReserveController {
	@Inject
	public MedicalTeamService medicalTeamService;
	
	
	@RequestMapping(value = "reserveInfo", method = RequestMethod.GET)
	public ModelAndView info() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveInfo");
		
		return mv;
	}
	
	
	@RequestMapping(value = "reserveNomal", method = RequestMethod.GET)
	public ModelAndView nomal(Integer mid) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(mid == null) {
			mid = 1;
		}
		List<MedicalTeamVO> list = medicalTeamService.getList(mid);
		
		mv.addObject("list", list);
		
		mv.setViewName("reserve/reserveNomal");
		
		return mv;
	}
	
	@RequestMapping(value = "reserveMedical", method = RequestMethod.GET)
	public ModelAndView medical() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveMedical");
		
		return mv;
	}
	
	
	@RequestMapping(value = "medicalConfirm", method = RequestMethod.POST)
	public ModelAndView medicalConfirm() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/medicalConfirm");
		
		return mv;
	}
	
	
}
