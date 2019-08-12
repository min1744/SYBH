package com.hospital.SYBH;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.treatbreakdown.TreatBreakDownService;
import com.hospital.treatbreakdown.TreatBreakDownVO;

@Controller
@RequestMapping("/treatBreakDown/")
public class TreatBreakDownController {
	@Inject
	private TreatBreakDownService treatBreakDownService;
	
	@RequestMapping(value = "treatWrite", method = {RequestMethod.POST})
	@ResponseBody
	public int setWrite(TreatBreakDownVO treatBreakDownVO)throws Exception{
		return treatBreakDownService.setWrite(treatBreakDownVO);
	}
	
	//마이페이지, 시간 경과 후
	@RequestMapping(value = "treatBreakDownUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int setUpdate(TreatBreakDownVO treatBreakDownVO)throws Exception{
		return treatBreakDownService.setUpdate(treatBreakDownVO);
	}
}
