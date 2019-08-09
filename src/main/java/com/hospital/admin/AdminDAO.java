package com.hospital.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.member.MemberVO;
import com.hospital.member.unserviceability.UnserviceabilityVO;

@Repository
public class AdminDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="AdminMapper.";
	
	//회원 List
	public List<MemberVO> getList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	//회원 관리(삭제)
	public int setDelete(List<String> list) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeletes", list);
	}
	
	//등급 상향
	public int setUpgrade(List<String> list) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpgrade", list);
	}
		
	//등급 하향
	public int setDowngrade(List<String> list) throws Exception{
		return sqlSession.update(NAMESPACE+"setDowngrade", list);
	}
	
	//주민번호를 활용해서 회원탈퇴를 당한 사람이 로그인하지 못하도록 기록남기기 
	public int setUnserviceability(UnserviceabilityVO unserviceabilityVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setUnserviceability", unserviceabilityVO);
	}
	
	//차단된 사람인지 조사
	public int getUnserviceability(String res_reg_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getUnserviceability", res_reg_num);
	}
	
	//차된 된 사람들 리스트
	public List<UnserviceabilityVO> getUnserviceabilityList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getUnserviceabilityList");
	}
	
	//차단 해제
	public int setDeleteUnserviceability(List<String> list) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteUnserviceability", list);
	}
}