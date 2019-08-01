package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.checkup.CheckUpDAO;
import com.hospital.checkup.CheckUpService;
import com.hospital.checkup.CheckUpVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/checkup/")
public class CheckUpController {
	@Inject
	private CheckUpService checkUpService;
	@Inject
	private CheckUpDAO checkUpDAO;
	
	@RequestMapping(value = "checkUpWrite", method = RequestMethod.POST)
	@ResponseBody
	public int setWrite(CheckUpVO checkUpVO) throws Exception{
		return checkUpService.setWrite(checkUpVO);
	}
	
	//한사람 건강검진 내역
	public ModelAndView getOneList(PageMaker pageMaker, CheckUpVO checkUpVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CheckUpVO> list = checkUpService.getOneList(pageMaker, checkUpVO);
		int totalCount = checkUpDAO.getOneTotalCount(checkUpVO);
		mv.addObject("list",list);
		mv.addObject("count",totalCount);
		
		return mv;
		
	}
}
