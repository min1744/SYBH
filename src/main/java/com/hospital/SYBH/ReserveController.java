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
	
	
	//진료 예약 안내
	@RequestMapping(value = "reserveInfo", method = RequestMethod.GET)
	public ModelAndView info() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveInfo");
		
		return mv;
	}
	
	//외래 안내
	@RequestMapping(value = "outgoingInfo", method = RequestMethod.GET)
	public ModelAndView outgoingInfo() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/outgoingInfo");
		
		return mv;
	}
	
	
	@RequestMapping(value = "reserveNomal", method = RequestMethod.GET)
	public ModelAndView nomal(Integer mid,String name) throws Exception {
		ModelAndView mv = new ModelAndView();
		MedicalTeamVO medic = null;
		if(mid == null) {
			mid = 1;
		}
		if(name == null) {
			name= "";
		}else {
			medic = new MedicalTeamVO();
			medic = medicalTeamService.getSelect(name);
			mv.addObject("medic",medic);
		}
		List<MedicalTeamVO> list = medicalTeamService.getList(mid);
		
		mv.addObject("list", list);
		mv.addObject("mid", mid);
		
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
