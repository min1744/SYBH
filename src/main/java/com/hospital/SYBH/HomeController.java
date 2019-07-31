package com.hospital.SYBH;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.board.BoardVO;
import com.hospital.notice.NoticeService;
import com.hospital.util.PageMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale,ModelAndView mv) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(1);
		pageMaker.setPerPage(5);
		List<BoardVO> indexlist= noticeService.getList(pageMaker);
		mv.addObject("list",indexlist );
		mv.setViewName("index/home");
		
		return mv;
	}
	
	
	
}
