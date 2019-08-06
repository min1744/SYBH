package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hospital.board.BoardVO;
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
	
	
	/////////////// 공통 update - post
	//update - POST
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ModelAndView qnaUpdate(QnAVO qnaVO) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setUpdate(qnaVO);
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
	
	
	////////////////////////////////////////건의합니다
	
	//list
	@RequestMapping(value = "complaint", method = RequestMethod.GET)
	public ModelAndView complaintList(PageMaker pageMaker, String menu) throws Exception {
		
		menu = "complaint";
		List<QnAVO> list = qnaService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	//write - get
	@RequestMapping(value = "complaintWrite", method = RequestMethod.GET)
	public ModelAndView complaintWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardWrite");
		
		return mv;
	}
	
	//select
	@RequestMapping(value = "complaintSelect", method = RequestMethod.GET)
	public ModelAndView complaintSelect(int num) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
		
		mv.addObject("vo", boardVO);
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardSelect");
		
		return mv;
		
	}
	
	//update - get
	@RequestMapping(value = "complaintUpdate", method = RequestMethod.GET)
	public ModelAndView complaintUpdate(int num) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		QnAVO qnaVO = qnaService.getSelect(num);
		mv.addObject("qnaVO", qnaVO);
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardUpdate");
			
		return mv;
	}
	
	
	//delete
	@RequestMapping(value = "complaintDelete", method = RequestMethod.GET)
	public String complaintDelete(int num, HttpSession session) throws Exception {
		int result = qnaService.setDelete(num, session);
		return "redirect:./complaint";
	}
	
	
	//reply
	@RequestMapping(value = "complaintReply", method = RequestMethod.GET)
	public ModelAndView setReply(int num) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
		
		mv.addObject("vo", boardVO);
		mv.addObject("num", num);
		mv.addObject("menu", "complaint");
		mv.setViewName("board/boardReply");
		
		return mv;
	}
	
	//reply - post
	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	public ModelAndView setReply(QnAVO qnaVO, RedirectAttributes rd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setReply(qnaVO);
		
		String message = "Reply False";
		
		if(result > 0) {
			
			message = "success";
		}
		
		rd.addFlashAttribute("message", message);
		mv.setViewName("redirect:./complaint");
		
		return mv;
	}
	
	
	
	
	
	
	
	////////////////////////////////////////칭찬합니다
	
	//list
	@RequestMapping(value = "praise", method = RequestMethod.GET)
	public ModelAndView praiseList(PageMaker pageMaker, String menu) throws Exception {
		
		menu = "praise";
		List<QnAVO> list = qnaService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
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
	
	
	//select
	@RequestMapping(value = "praiseSelect", method = RequestMethod.GET)
	public ModelAndView praiseSelect(int num) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
			
		mv.addObject("vo", boardVO);
		mv.addObject("menu", "praise");
		mv.setViewName("board/boardSelect");
			
		return mv;
			
	}
	
	
	//update - get
	@RequestMapping(value = "praiseUpdate", method = RequestMethod.GET)
	public ModelAndView praiseUpdate(int num) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		QnAVO qnaVO = qnaService.getSelect(num);
		mv.addObject("qnaVO", qnaVO);
		mv.addObject("menu", "praise");
		mv.setViewName("board/boardUpdate");
		
		return mv;
	}
	
		
	//delete
	@RequestMapping(value = "praiseDelete", method = RequestMethod.GET)
	public String praiseDelete(int num, HttpSession session) throws Exception {
		int result = qnaService.setDelete(num, session);
		return "redirect:./praise";
	}
	
	
	
	
	
	
	////////////////////////////////////////질문과답변
	
	//list
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList(PageMaker pageMaker, String menu) throws Exception {
		
		menu = "qna";
		List<QnAVO> list = qnaService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("menu", "qnaList");
		mv.setViewName("board/boardList");
				
		return mv;
				
	}
	
	//write
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardWrite");
		
		return mv;
	}
	
	
	//select
	@RequestMapping(value = "qnaSelect", method = RequestMethod.GET)
	public ModelAndView qnaSelect(int num) throws Exception {
				
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
				
		mv.addObject("vo", boardVO);
		mv.addObject("menu", "qna");
		mv.setViewName("board/boardSelect");
				
		return mv;
				
	}
	
	
	//update - get
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ModelAndView qnaUpdate(int num) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		QnAVO qnaVO = qnaService.getSelect(num);
		mv.addObject("qnaVO", qnaVO);
		mv.addObject("menu", "qna");
		mv.setViewName("board/boardUpdate");
			
		return mv;
	}
	
	
	//delete
	@RequestMapping(value = "qnaDelete", method = RequestMethod.GET)
	public String qnaDelete(int num, HttpSession session) throws Exception {
		int result = qnaService.setDelete(num, session);
		return "redirect:./qnaList";
	}
	
		

}
