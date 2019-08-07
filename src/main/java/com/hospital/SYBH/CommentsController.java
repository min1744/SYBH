package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.qna.comments.QnACommentsService;
import com.hospital.qna.comments.QnACommentsVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/comments/")
public class CommentsController {
	
	@Inject
	private QnACommentsService qnACommentsService;
	
	@RequestMapping(value = "commentsWrite", method = RequestMethod.POST)
	@ResponseBody
	public int setWrite(QnACommentsVO qnACommentsVO) throws Exception {
		
		int result = qnACommentsService.setWrite(qnACommentsVO);
		
		return result;
		
	}
	
	
	@RequestMapping(value = "commentsList", method = RequestMethod.GET)
	public ModelAndView getList(int num, PageMaker pageMaker) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		List<QnACommentsVO> list = qnACommentsService.getList(num, pageMaker);
		int totalCount = qnACommentsService.getTotalCount(num);
		mv.addObject("list", list);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("common/commentsList");
		
		return mv;
	}
	

}
