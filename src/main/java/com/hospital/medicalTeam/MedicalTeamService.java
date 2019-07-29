package com.hospital.medicalTeam;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MedicalTeamService {
	@Inject
	public MedicalTeamDAO medicalTeamDAO;
	
	//list
	public List<MedicalTeamVO> getList(int mid) throws Exception{
		return medicalTeamDAO.getList(mid);
	}
}
