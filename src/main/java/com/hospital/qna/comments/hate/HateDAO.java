package com.hospital.qna.comments.hate;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.qna.comments.like.LikeVO;


@Repository
public class HateDAO {
	
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="HateMapper.";
	
	public int hateWrite(HateVO hateVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrtie", hateVO);
	}
	
	//최초 싫어요 눌렀을때 데이터가 있는지 확인하는 select
	public String getSelect(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", map);
	}
	
	//싫어요 눌렀을때 check값이 0인지 1인지 확인하는 select
	public int updateSelect(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"updateSelect", map);
	}
	
	//싫어요 check 값 +1
	public int setUpdate(HateVO hateVO) throws Exception {
		return sqlSession.update(NAMESPACE+"hate_check", hateVO);
	}
	
	//싫어요 check 값 0
	public int setUpdateDelete(HateVO hateVO) throws Exception {
		return sqlSession.update(NAMESPACE+"hate_check_cancel", hateVO);
	}
	
	//댓글 싫어요 테이블 값 가져오기
	public List<HateVO> hateList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"hateList", map);
	}
	

}
