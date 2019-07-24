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
	
	
	@RequestMapping(value = "newsList", method = RequestMethod.GET)
	public void getList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsList");
	}
	
	
	@RequestMapping(value = "newsWrite", method = RequestMethod.GET)
	public void setWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsWrite");
	}
	
	
	@RequestMapping(value = "newsSelect", method = RequestMethod.GET)
	public void getSelect() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsSelect");
	}
	
	
	@RequestMapping(value = "newsUpdate", method = RequestMethod.GET)
	public void setUpdate() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsUpdate");
	}

}
