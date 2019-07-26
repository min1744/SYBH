package com.hospital.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.util.PageMaker;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="MemberMapper.";
	
	//totalCount
	public int getTotalCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pageMaker);
	}
	
	//회원 List
	public List<MemberVO> getList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	//select
	public MemberVO getSelect(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", id);
	}
	
	//login
	public MemberVO login(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"login", memberVO);
	}
	
	//id 찾기
	public String getId(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getId", email);
	}
	
	//비밀번호 찾기
	public int getPw(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPw", email);
	}
	
	//비밀번호 분실로 인한 비밀번호 난수로 변경
	public int setPwUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"setPwUpdate", memberVO);
	}
	
	//회원가입
	public int setWrite(MemberVO memberVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", memberVO);
	}
	
	//회원 정보 수정
	public int setUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", memberVO);
	}
	
	//주민등록번호 복호화
	public String setResDecryption(String res_reg_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"setResDecryption", res_reg_num);
	}
	
	//등급 수정
	public int setGradeUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"setGradeUpdate", memberVO);
	}
	
	//회원 관리(삭제)
	public int setDelete(List<String> list) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeletes", list);
	}
	
	//회원 탈퇴
	public int setDelete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", id);
	}
}