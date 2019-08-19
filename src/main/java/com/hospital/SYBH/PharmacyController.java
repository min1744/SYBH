package com.hospital.SYBH;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
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
	public void pharmacy() throws Exception {}
	
}