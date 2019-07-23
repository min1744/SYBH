package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.pay.PayService;
import com.hospital.pay.PayVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/pay/")
public class PayController {
	@Inject
	private PayService payService;
	
	//결제 입력
	@RequestMapping(value = "payWrite",method = RequestMethod.POST)
	public ModelAndView setWrite(PayVO payVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = payService.setWrite(payVO);
		if(result>0) {
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("message","결제 실패");
			mv.addObject("path","../");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	
	//한사람 모든 결제 내역
	public ModelAndView getOneList(PageMaker pageMaker,String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PayVO> list = payService.getOneList(pageMaker, id);
		
		mv.addObject("list",list);
		mv.addObject("pager",pageMaker);
		mv.setViewName("");
		
		return mv;
	}
	
}
