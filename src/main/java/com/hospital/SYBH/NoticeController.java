package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.naming.NoInitialContextException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.hospital.board.BoardVO;
import com.hospital.notice.NoticeDAO;
import com.hospital.notice.NoticeService;
import com.hospital.notice.NoticeVO;
import com.hospital.util.PageMaker;


//interceptor, 페이징처리(한페이지처리수), 상단고정 


@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
	@Inject 
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String board() {
		return "notice";
	} 
	
	
	
	//delete
	@RequestMapping(value = "noticeDelete", method = RequestMethod.POST)
	public String setDelete(int num, HttpSession session)throws Exception{
		int result = noticeService.setDelete(num, session);
		return "redirect:./noticeList";
		
	}
	

	
	  //write
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET) 
	public ModelAndView setWrite()throws Exception{ 
		ModelAndView mv = new ModelAndView(); 
		int result = noticeService.fixCount();
		mv.addObject("result", result); 
		mv.setViewName("board/boardWrite");
		return mv; 
	}
	  @RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	  public ModelAndView setWrite(NoticeVO noticeVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setWrite(noticeVO,session);
		if(result>0) {
			mv.setViewName("redirect:./noticeList");
			
		}else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./noticeList");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	
	//update
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(int num)throws Exception{
		ModelAndView mv = new ModelAndView();
		NoticeVO noticeVO = noticeService.getSelect(num);
		int result = noticeService.fixCount();
		mv.addObject("vo", noticeVO);
		mv.addObject("result", result );
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setUpdate(noticeVO);
		mv.setViewName("redirect:./noticeList");
		return mv; 
	}
	
	
	
	
	//select
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(int num)throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = noticeService.getSelect(num);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		return mv;
	}
	
	
	
	//list
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker)throws Exception{
		
		List<BoardVO> lists= noticeService.getList(pageMaker);
		List<NoticeVO> list2= noticeService.getList2();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", lists);
		mv.addObject("list2", list2);
		mv.addObject("pager", pageMaker);
				
		mv.setViewName("board/boardList");

		return mv;
	}
	


	
}
