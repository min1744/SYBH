package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	
	//현아 작성 (qnaList jsp 테스트)
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("qna", "suggestive");
		mv.addObject("qna", "compliment");
		mv.addObject("qna", "qna");
		mv.setViewName("qna/qnaList");
		
		return mv;
		
	}

}
