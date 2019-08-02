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
	
	//마이페이지, 시간 경과 후 
	@RequestMapping(value = "checkUpUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int setUpdate(CheckUpVO checkUpVO)throws Exception{
		return checkUpService.setUpdate(checkUpVO);
	}
}
