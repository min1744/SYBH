package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
		List<PayVO> list =  payService.getDonationList();
		mv.addObject("list", list);
		
		return mv;
	}
	
	
	//결제 입력
	@RequestMapping(value = "donationWrite",method = RequestMethod.POST)
	@ResponseBody
	public int setWrite(PayVO payVO)throws Exception{
		
		return payService.setWrite(payVO);
	}
	
	//한사람 모든 결제 내역
	public ModelAndView getOneList(PageMaker pageMaker,PayVO payVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<PayVO> list = payService.getOneList(pageMaker, payVO);
		
		mv.addObject("list",list);
		mv.addObject("pager",pageMaker);
		mv.setViewName("");
		
		return mv;
	}
	//총 후원 금액
	@RequestMapping(value="donationTotal", method = RequestMethod.GET)
	@ResponseBody
	public int donationTotal() throws Exception{
		return payService.getDonationTotal();
	}
	
	//후원인 총 인원
	@RequestMapping(value = "donationPeopleTotal", method = RequestMethod.GET)
	@ResponseBody
	public int donationPeopleTotal() throws Exception{
		return payService.getDonationPeopleTotal();
	}
	
	//후원 내역 전체인원
	@RequestMapping(value = "donationList", method = RequestMethod.GET)
	public ModelAndView donationList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PayVO> list =  payService.getDonationList();
		mv.addObject("list", list);
		return mv;
	}
}
