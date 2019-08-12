package com.hospital.qna.comments.like;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class LikeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="LikeMapper.";
	
	public int likeWrite(LikeVO likeVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrtie", likeVO);
	}
	
	//최초 좋아요 눌렀을때 데이터가 있는지 확인하는 select
	public String getSelect(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", map);
	}
	
	//좋아요 눌렀을때 check값이 0인지 1인지 확인하는 select
	public int updateSelect(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"updateSelect", map);
	}
	
	//좋아요 check 값 +1
	public int setUpdate(LikeVO likeVO) throws Exception {
		return sqlSession.update(NAMESPACE+"like_check", likeVO);
	}
	
	//좋아요 check 값 0
	public int setUpdateDelete(LikeVO likeVO) throws Exception {
		return sqlSession.update(NAMESPACE+"like_check_cancel", likeVO);
	}
	
	//댓글 좋아요 테이블 값 가져오기
	public List<LikeVO> likeList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"likeList", map);
	}

}
