package com.hospital.news.comments;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class NewsCommentsDAO {

	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="NewsCommentsMapper.";
	
	//댓글등록
	public int setWrite(NewsCommentsVO newsCommentsVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", newsCommentsVO);
	}
	
	//댓글리스트
	public List<NewsCommentsVO> getList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", map);
	}
	
	//총 댓글 수 //select 에도 필요함
	public int getTotalCount(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", num);
	}
	
	//댓글수정
	public int setUpdate(NewsCommentsVO newsCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", newsCommentsVO);
	}
	
	//댓글삭제
	public int setDelete (int ref) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", ref);
	}
	
	//답글 insert
	public int setReply(NewsCommentsVO newsCommentsVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReply", newsCommentsVO);
	}
	
	//답글 update(사전작업)
	public int setReplyUpdate(NewsCommentsVO newsCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", newsCommentsVO);
	}
	
	//댓글 답글 삭제
	public int replyDelete (int cnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"replyDelete", cnum);
	}
	
	
	//댓글 t_like 테이블의 like_check 값 확인하는 select
	public int likeSelect(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"likeSelect", map);
	}
	
	//댓글 좋아요 update
	public int likeUpdate(NewsCommentsVO newsCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"likeUpdate", newsCommentsVO);
	}
	
	//댓글 좋아요 delete
	public int likeDelete(NewsCommentsVO newsCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"likeDelete", newsCommentsVO);
	}
	
	
}
