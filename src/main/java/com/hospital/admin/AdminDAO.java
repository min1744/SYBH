package com.hospital.admin;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.member.MemberVO;
import com.hospital.member.unserviceability.UnserviceabilityVO;
import com.hospital.pay.PayVO;

@Repository
public class AdminDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="AdminMapper.";
	
	//회원 List
	public List<MemberVO> getList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", id);
	}
	
	//관리자를 제외한 모든 회원들의 수
	public int getAnnualMemberCount(int year) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAnnualMemberCount", year);
	}
	
	//관리자를 제외한 모든 회원들의 수
	public int getAllMemberCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllMemberCount");
	}
	
	//의사 수
	public int getAllDoctorCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllDoctorCount");
	}
	
	//관리자 수
	public int getAllAdminCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllAdminCount");
	}
	
	//가입 날짜 모두 select하기
	public List<LocalDate> getRegDate(int year) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getRegDate", year);
	}
	
	//결제 날짜 모두 select하기
	public List<PayVO> getPayDate(int year) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPayDate", year);
	}
	
	//방문객들의 방문 날짜 모두 select하기
	public List<LocalDate> getAccessDate(int year) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAccessDate", year);
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
	
	//후원을 제외한 earnings 구하기
	public List<Integer> getEarnings(int year) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getEarnings", year);
	}
	
	// 총 후원 금액 구하기 구하기
	public List<Integer> getDonations(int year) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getDonations", year);
	}
	
	//AccessInfo table insert
	public int setAccess(AccessVO accessVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setAccess", accessVO);
	}
	
	//AccessInfo TotalCount
	public int getAllAccessCounts(Map<String, Integer> map) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllAccessCounts", map);
	}
	
	//AccessInfo List
	public List<AccessInfoVO> getAccessInfoList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAccessInfoList");
	}
}