package com.hospital.schedule;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	@Inject
	public ScheduleDAO scheduleDAO;
	
	//의사 한명 스케쥴 표
	public List<ScheduleVO> getOneList(int num)throws Exception{
		return scheduleDAO.getOneList(num);
	}
}
