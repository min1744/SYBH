package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	
		
	@RequestMapping(value = "newsAll", method = RequestMethod.GET)
	public ModelAndView allList(PageMaker pageMaker,String menu) throws Exception {
		List<NewsVO> alist=newsService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", alist);
		mv.addObject("pager", pageMaker);
		mv.setViewName("news/newsAll");
		return mv;
	}
	
	
	//공통 write post
	
	@RequestMapping(value = "newsWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(NewsVO newsVO,HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = newsService.setWrite(newsVO, session);
		if(result > 0 && newsVO.getMenu().equals("disease")) {
			mv.setViewName("redirect:./disease");
		}else if(result > 0 && newsVO.getMenu().equals("nutrition")) {
			mv.setViewName("redirect:./nutrition");
		}else if(result > 0 && newsVO.getMenu().equals("exercise")) {
			mv.setViewName("redirect:./exercise");
		}else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./disease");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	//공통 update post
	
	@RequestMapping(value = "newsUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(NewsVO newsVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = newsService.setUpdate(newsVO);
		if(result > 0 && newsVO.getMenu().equals("disease")) {
			mv.setViewName("redirect:./disease");
		}else if(result > 0 && newsVO.getMenu().equals("nutrition")) {
			mv.setViewName("redirect:./nutrition");
		}else if(result > 0 && newsVO.getMenu().equals("exercise")) {
			mv.setViewName("redirect:./exercise");
		} else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./disease");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
		
	
	//공통 delete post  
	@RequestMapping(value = "newsDelete", method = RequestMethod.POST)
	public ModelAndView diseaseDelete(NewsVO newsVO,int num, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = newsService.setDelete(num, session);
		
		if(result > 0 && newsVO.getMenu().equals("disease")) {
			mv.setViewName("redirect:./disease");
		}else if (result > 0 && newsVO.getMenu().equals("nutrition")) {
			mv.setViewName("redirect:./nutrition");
		}else if (result > 0 && newsVO.getMenu().equals("exercise")) {
			mv.setViewName("redirect:./exercise");
		}else {
			mv.addObject("message", "Delete Fail");
			mv.addObject("path", "./disease");
			mv.setViewName("common/messageMove");
		}
				
		return mv;
	}
	
	
	//////////////////////  질환정보   ///////////////////
	//list
	@RequestMapping(value = "disease", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker,String menu) throws Exception {
		
		menu = "disease";
		List<NewsVO> list = newsService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("pager", pageMaker);
		mv.addObject("menu","disease");
		mv.setViewName("news/newsList");
		return mv;
	}
	
	//write
	@RequestMapping(value = "diseaseWrite", method = RequestMethod.GET)
	public ModelAndView dieaseWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "disease");
		mv.setViewName("news/newsWrite");
		return mv;
	}
	
	
	//select
	@RequestMapping(value = "diseaseSelect", method = RequestMethod.GET)
	public ModelAndView diseaseSelect(int num) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO = newsService.getSelect(num);
		mv.addObject("vo", newsVO);
		mv.addObject("menu", "disease");
		mv.setViewName("news/newsSelect");
		return mv;
	}
	
	
	
	
	//update
	@RequestMapping(value = "diseaseUpdate", method = RequestMethod.GET)
	public ModelAndView diseaseUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO= newsService.getSelect(num);
		mv.addObject("newsVO", newsVO);
		mv.addObject("menu", "disease");
		mv.setViewName("news/newsUpdate");
		return mv;
	}
	
	//////////////////////////영양정보 ////////////////////
	//list
	@RequestMapping(value = "nutrition", method = RequestMethod.GET)
	public ModelAndView nutritionList(PageMaker pageMaker,String menu) throws Exception {
		
		menu = "nutrition";
		List<NewsVO> list=newsService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("pager", pageMaker);
		mv.addObject("menu","nutrition");
		mv.setViewName("news/newsList");
		return mv;
	}
	
	//write
	@RequestMapping(value = "nutritionWrite",method = RequestMethod.GET)
	public ModelAndView nutritionWrite() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "nutrition");
		mv.setViewName("news/newsWrite");
		return mv;
	}
	
	
	//select 
	@RequestMapping(value = "nutritionSelect",method = RequestMethod.GET)
	public ModelAndView nutritionSelect(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO = newsService.getSelect(num);
		
		mv.addObject("vo", newsVO);
		mv.addObject("menu", "nutrition");
		mv.setViewName("news/newsSelect");
		return mv;
	}
	//Update
	@RequestMapping(value = "nutritionUpdate", method = RequestMethod.GET)
	public ModelAndView nutritionUpdate(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO = newsService.getSelect(num);
		mv.addObject("newsVO", newsVO);
		mv.addObject("menu", "nutrition");
		mv.setViewName("news/newsUpdate");
		return mv;
	}
	
	/////////////////////////운동정보//////////////////
	//list
	@RequestMapping(value = "exercise", method = RequestMethod.GET)
	public ModelAndView exerciseList(PageMaker pageMaker,String menu) throws Exception {
		
		menu = "exercise";
		List<NewsVO> list=newsService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("pager", pageMaker);
		mv.addObject("menu","exercise");
		mv.setViewName("news/newsList");
		return mv;
	}
	
	//write
	@RequestMapping(value = "exerciseWrite",method = RequestMethod.GET)
	public ModelAndView exerciseWrite() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "exercise");
		mv.setViewName("news/newsWrite");
		return mv;
	}
	
	//select 
		@RequestMapping(value = "exerciseSelect",method = RequestMethod.GET)
		public ModelAndView exerciseSelect(int num) throws Exception{
			ModelAndView mv = new ModelAndView();
			NewsVO newsVO = newsService.getSelect(num);
			
			mv.addObject("vo", newsVO);
			mv.addObject("menu", "exercise");
			mv.setViewName("news/newsSelect");
			return mv;
		}
						
		
		//Update
		@RequestMapping(value = "exerciseUpdate", method = RequestMethod.GET)
		public ModelAndView exerciseUpdate(int num) throws Exception{
			
			ModelAndView mv = new ModelAndView();
			NewsVO newsVO = newsService.getSelect(num);
			mv.addObject("newsVO", newsVO);
			mv.addObject("menu", "exercise");
			mv.setViewName("news/newsUpdate");
			return mv;
		}	

}
