package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.pay.PayService;
import com.hospital.pay.PayVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/pay/")
public class PayController {
	@Inject
	private PayService payService;
	
	@RequestMapping(value = "payPopup", method = RequestMethod.GET)
	public ModelAndView popup() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pay/payPopup");
		
		return mv;
	}
	
	
	//결제 입력
	@RequestMapping(value = "donationWrite",method = RequestMethod.POST)
	@ResponseBody
	public int setWrite(PayVO payVO)throws Exception{
		
		return payService.setWrite(payVO);
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
