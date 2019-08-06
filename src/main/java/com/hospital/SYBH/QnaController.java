package com.hospital.SYBH;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.qna.QnAService;
import com.hospital.qna.QnAVO;
import com.hospital.qna.comments.QnACommentsService;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	@Inject
	private QnACommentsService qnACommentsService;
	@Inject
	private QnAService qnaService;
	
	@ModelAttribute("board")
	public String board() {
		return "qna";
	}
	
	
	////////////// 공통 Write - post
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(QnAVO qnaVO, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setWrite(qnaVO, session);
		if(result > 0 && qnaVO.getMenu().equals("complaint")) {
			mv.setViewName("redirect:./complaint");
		} else if(result > 0 && qnaVO.getMenu().equals("praise")){
			mv.setViewName("redirect:./praise");
		} else if(result > 0 && qnaVO.getMenu().equals("qna")){
			mv.setViewName("redirect:./qnaList");
		} else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./complaint");
			mv.setViewName("common/massageMove");
		}
		
		return mv;
	}
	
	//건의합니다
	
	//list
	@RequestMapping(value = "complaint", method = RequestMethod.GET)
	public ModelAndView complaintList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	//write
	@RequestMapping(value = "complaintWrite", method = RequestMethod.GET)
	public ModelAndView complaintWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardWrite");
		
		return mv;
	}
	
	//select
	@RequestMapping(value = "complaintSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(PageMaker pageMaker) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		int totalCount = qnACommentsService.getTotalCount(pageMaker);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardSelect");
		
		return mv;
		
	}
	
	
	//칭찬합니다
	@RequestMapping(value = "praise", method = RequestMethod.GET)
	public ModelAndView praiseList() throws Exception {
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "praise");
		mv.setViewName("board/boardList");
			
		return mv;
			
	}
	
	//write
	@RequestMapping(value = "praiseWrite", method = RequestMethod.GET)
	public ModelAndView praiseWrite() throws Exception {
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "praise");
		mv.setViewName("board/boardWrite");
			
		return mv;
	}
		
		
		
	
	//질문과답변
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList() throws Exception {
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "qnaList");
		mv.setViewName("board/boardList");
				
		return mv;
				
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardWrite");
		
		return mv;
	}
	
		

}
