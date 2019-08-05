package com.hospital.qna.comments;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.util.PageMaker;

@Repository
public class QnACommentsDAO {
	
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="QnACommentsMapper.";
	
	public int setWrite(QnACommentsVO qnACommentsVO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setWrite", qnACommentsVO);
	}
	
	public List<QnACommentsVO> getList(PageMaker pageMaker) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
		
	}
	
	public int getCount(PageMaker pageMaker) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}

}
