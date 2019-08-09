package com.hospital.qna.comments.like;

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
	
	public int getSelect(int lnum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", lnum);
	}
	

}
