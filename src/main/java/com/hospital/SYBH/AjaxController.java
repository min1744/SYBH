package com.hospital.SYBH;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.file.FileService;
import com.hospital.news.NewsVO;
import com.hospital.news.newsimages.NewsImagesService;
import com.hospital.news.newsimages.NewsImagesVO;

@Controller
public class AjaxController {
	@Inject
	private NewsImagesService newsImagesService;
	@Inject
	private FileService fileService;
	

	@RequestMapping(value = "/ajax/fileDelete", method = RequestMethod.POST)
	public ModelAndView fileDelete(NewsImagesVO newsImagesVO, HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = newsImagesService.setDelete(newsImagesVO, session);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		return mv;
	}
	
	
	
	//써머노트
	@RequestMapping(value = "/ajax/summerFileDelete", method = RequestMethod.POST)
	public ModelAndView summerFileDelete(String fileName, HttpSession session) throws Exception {
		
		int result = fileService.summerFileDelete(fileName, session);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/ajax/summerFileUpload", method = RequestMethod.POST)
	public ModelAndView summerFileUpload(MultipartFile file, HttpSession session) throws Exception {
		
		String fileName = session.getServletContext().getContextPath();
		//fileName=fileName+File.separator+"resources"+File.separator+"summernote"+File.separator;
		fileName=fileName+"/resources/summernote/";
		fileName =fileName + fileService.summerFileUpload(file, session);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", fileName);
		mv.setViewName("common/message");
		return mv;
	}
	

}
