package com.hospital.medicalTeam;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MedicalTeamDAO {
	@Inject
	public SqlSession sqlSession;
	public static final String NAMESPACE ="MedicalTeamMapper.";
	
	//LIST
	public List<MedicalTeamVO> getList(int mid) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", mid);
	}

}
