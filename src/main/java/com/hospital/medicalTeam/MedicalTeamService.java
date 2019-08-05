package com.hospital.medicalTeam;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MedicalTeamService {
	@Inject
	public MedicalTeamDAO medicalTeamDAO;
	
	//list
	public List<MedicalTeamVO> getList(Integer mid) throws Exception{
		if(mid ==null) {
			mid=1;
		}
		return medicalTeamDAO.getList(mid);
	}
	
	//search
	public List<MedicalTeamVO> getSearch(String name) throws Exception{
		return medicalTeamDAO.getSearch(name);
	}
}
