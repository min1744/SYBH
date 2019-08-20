package com.hospital.SYBH;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.pharmacy.PharmacyService;

@Controller
@RequestMapping("/pharmacy/")
public class PharmacyController {
	
	@Inject
	private PharmacyService pharmacyService;
	
	@RequestMapping(value = "pharmacyInfo", method = RequestMethod.GET)
	public ModelAndView pharmacy(ModelAndView mv) throws Exception {
		List<HashMap<String, String>> list = pharmacyService.getInfo();
		mv.addObject("list", list);
		
		return mv;
	}
}