package com.hospital.SYBH;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.checkup.CheckUpService;
import com.hospital.checkup.CheckUpVO;

@Controller
@RequestMapping("/checkup/")
public class CheckUpController {
	@Inject
	private CheckUpService checkUpService;
	
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
