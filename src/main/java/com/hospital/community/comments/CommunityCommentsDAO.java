package com.hospital.community.comments;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CommunityCommentsDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="CommunityCommentsMapper.";
	
	//댓글등록
	public int setWrite(CommunityCommentsVO communityCommentsVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", communityCommentsVO);
	}
	
	//댓글리스트
	public List<CommunityCommentsVO> getList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", map);
	}
	
	//총 댓글 수 //select 에도 필요함
	public int getTotalCount(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", num);
	}
	
	//댓글수정
	public int setUpdate(CommunityCommentsVO communityCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", communityCommentsVO);
	}
	
	//댓글삭제
	public int setDelete (int ref) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", ref);
	}
	
	//답글 insert
	public int setReply(CommunityCommentsVO communityCommentsVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReply", communityCommentsVO);
	}
	
	//답글 update(사전작업)
	public int setReplyUpdate(CommunityCommentsVO communityCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", communityCommentsVO);
	}
	
	//댓글 답글 삭제
	public int replyDelete (int ccnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"replyDelete", ccnum);
	}
	
	
	//댓글 t_like 테이블의 like_check 값 확인하는 select
	public int likeSelect(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"likeSelect", map);
	}
	
	//댓글 좋아요 update
	public int likeUpdate(CommunityCommentsVO communityCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"likeUpdate", communityCommentsVO);
	}
	
	//댓글 좋아요 delete
	public int likeDelete(CommunityCommentsVO communityCommentsVO) throws Exception {
		return sqlSession.update(NAMESPACE+"likeDelete", communityCommentsVO);
	}

}
