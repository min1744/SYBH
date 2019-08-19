package com.hospital.medicalTeam;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.util.PageMaker;

@Repository
public class MedicalTeamDAO {
	@Inject
	public SqlSession sqlSession;
	public static final String NAMESPACE ="MedicalTeamMapper.";
	
	//LIST
	public List<MedicalTeamVO> getList(int mid) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", mid);
	}
	
	//search
	public List<MedicalTeamVO> getSearch(String name) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSearch",name);
	}
	
	//한명
	public MedicalTeamVO getSelect(String name) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", name);
	}
	
	//관리자페이지 출력
	public List<MedicalTeamVO> getMedicalList(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMedicalList",pageMaker);
	}
	
	public MedicalTeamVO getMedicalSelect(int num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMedicalSelect",num);
	}
	//의사 입력
	public int setWrite(MedicalTeamVO medicalTeamVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite",medicalTeamVO);
	}
	
	//한개삭제
	public int setDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete",num);
	}
	//여러개 삭제
	public int setListDelete(List<Integer> list) throws Exception{
		return sqlSession.delete(NAMESPACE+"setListDelete",list);
	}
	
	public int setUpdate(MedicalTeamVO medicalTeamVO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate",medicalTeamVO);
	}
	
	//관리자 끝
	
	
	//총갯수
	public int getTotalCount (PageMaker pageMaker)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pageMaker);
	}
}
