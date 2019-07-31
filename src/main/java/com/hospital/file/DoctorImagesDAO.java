package com.hospital.file;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.medicalTeam.MedicalTeamVO;

@Repository
public class DoctorImagesDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE= "DoctorImagesMapper.";
	
	public int setWrite(DoctorImagesVO doctorImagesVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite",doctorImagesVO);
	}
	
	public DoctorImagesVO getSelect(MedicalTeamVO medicalTeamVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect",medicalTeamVO);
	}
	
	public int setDelete(int fnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete",fnum);
	}
}
