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
	public MemberVO getLogin(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberVO);
	}
	
	//회원가입
	public int setWrite(MemberVO memberVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", memberVO);
	}
	
	//회원 정보 수정
	public int setUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", memberVO);
	}
	
	//회원 관리(삭제)
	public int setDeletes(List<String> list) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeletes", list);
	}
	
	//회원 탈퇴
	public int setDelete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", id);
	}
}