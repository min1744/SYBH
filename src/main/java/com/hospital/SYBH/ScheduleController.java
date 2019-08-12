package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.schedule.ScheduleService;
import com.hospital.schedule.ScheduleVO;

@Controller
@RequestMapping("/schedule/")
public class ScheduleController {
	@Inject
	public ScheduleService scheduleService;
	
	@RequestMapping(value = "getOneList", method = RequestMethod.POST)
	@ResponseBody
	public List<ScheduleVO> getOneList(int num) throws Exception{
		List<ScheduleVO> list = scheduleService.getOneList(num);
		
		return list;
	}
}
