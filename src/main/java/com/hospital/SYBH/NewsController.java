package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/news/")
public class NewsController {
	
	@RequestMapping(value = "newsAll", method = RequestMethod.GET)
	public void allList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsAll");
	}

}
