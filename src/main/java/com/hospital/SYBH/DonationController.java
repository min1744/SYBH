package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/donation/")
public class DonationController {
	
	@RequestMapping(value = "donationPopup", method = RequestMethod.GET)
	public ModelAndView popup() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("donation/donationPopup");
		
		return mv;
	}

}
