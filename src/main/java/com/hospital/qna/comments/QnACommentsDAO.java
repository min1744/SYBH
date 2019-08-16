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
	public int setDelete (int ref) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", ref);
	}
	
	//답글 insert
	public int setReply(QnACommentsVO qnACommentsVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReply", qnACommentsVO);
	}
	
	//답글 update(사전작업)
	public int setReplyUpdate(QnACommentsVO qnACommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", qnACommentsVO);
	}
	
	//댓글 답글 삭제
	public int replyDelete (int qcnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"replyDelete", qcnum);
	}
	
	
	//댓글 t_like 테이블의 like_check 값 확인하는 select
	public int likeSelect(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"likeSelect", map);
	}
	
	//댓글 좋아요 update
	public int likeUpdate(QnACommentsVO qnACommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"likeUpdate", qnACommentsVO);
	}
	
	//댓글 좋아요 delete
	public int likeDelete(QnACommentsVO qnACommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"likeDelete", qnACommentsVO);
	}
	
	
	
	
	

}
