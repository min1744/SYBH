package com.hospital.qna.comments;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.util.PageMaker;

@Repository
public class QnACommentsDAO {
	
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="QnACommentsMapper.";
	
	//댓글등록
	public int setWrite(QnACommentsVO qnACommentsVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", qnACommentsVO);
	}
	
	//댓글리스트
	public List<QnACommentsVO> getList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", map);
	}
	
	//총 댓글 수 //select 에도 필요함
	public int getTotalCount(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", num);
	}
	
	//댓글수정
	public int setUpdate(QnACommentsVO qnACommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", qnACommentsVO);
	}
	
	//댓글삭제
	public int setDelete (int qcnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", qcnum);
	}
	

}
