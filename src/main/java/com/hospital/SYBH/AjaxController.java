package com.hospital.SYBH;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.news.NewsVO;
import com.hospital.news.newsimages.NewsImagesService;
import com.hospital.news.newsimages.NewsImagesVO;

@Controller
public class AjaxController {
	@Inject
	private NewsImagesService newsImagesService;
	

	@RequestMapping(value = "/ajax/fileDelete", method = RequestMethod.POST)
	public ModelAndView fileDelete(NewsImagesVO newsImagesVO, HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = newsImagesService.setDelete(newsImagesVO, session);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		return mv;
	}
	

}
