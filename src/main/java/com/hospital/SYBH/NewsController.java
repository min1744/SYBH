package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.news.NewsService;
import com.hospital.news.NewsVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping(value = "/news/")
public class NewsController {
	
	@Inject
	private NewsService newsService;
	
	
	
	//all
	//@RequestMapping(value = "newsAll", method = RequestMethod.GET)
	//public ModelAndView allList() throws Exception {
	//	List<NewsVO> alist=newsService.getList();
	//	ModelAndView mv = new ModelAndView();
	//	mv.setViewName("news/newsAll");
	//	return mv;
	//}
	
	//list
	@RequestMapping(value = "newsList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception {
		List<NewsVO> lists=newsService.getList(pageMaker);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",lists);
		mv.addObject("pager", pageMaker);
		mv.setViewName("news/newsList");
		return mv;
	}
	
	//write
	@RequestMapping(value = "newsWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsWrite");
		return mv;
	}
	
	@RequestMapping(value = "newsWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(NewsVO newsVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = newsService.setWrite(newsVO, session);
		if(result>0) {
		mv.setViewName("news/newsWrite");
		}else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./newsList");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	//select
	@RequestMapping(value = "newsSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO = newsService.getSelect(num);
		mv.addObject("vo", newsVO);
		mv.setViewName("news/newsSelect");
		return mv;
	}
	
	//update
	@RequestMapping(value = "newsUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO= newsService.getSelect(num);
		mv.addObject("vo", newsVO);
		mv.setViewName("news/newsUpdate");
		return mv;
	}
	@RequestMapping(value = "newsUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(NewsVO newsVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = newsService.setUpdate(newsVO);
		mv.setViewName("redirect:./newsList");
		return mv;
	}
	
	//delete 
	@RequestMapping(value = "newsDelete", method = RequestMethod.GET)
	public String setDelete(int num, HttpSession session)throws Exception{
		int result = newsService.setDelete(num, session);
		return "redirect:./newsList";
	}

}
