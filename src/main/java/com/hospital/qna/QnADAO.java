package com.hospital.qna;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.board.BoardDAO;
import com.hospital.board.BoardVO;
import com.hospital.util.PageMaker;

@Repository
public class QnADAO implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="QnaMapper.";

	
	//답글 insert
	public int setReply(BoardVO qnaVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReply", qnaVO);
	}
	
	//답글 update(사전작업)
	public int setReplyUpdate(BoardVO qnaVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", qnaVO);
	}
	
	//totalCount
	@Override
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	
	//write
	public int setWrite(QnAVO qnaVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", qnaVO);
	}
	
	//list
	public List<QnAVO> getList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", map);
	}
	
	//hit
	public int addHit(int num) throws Exception {
		return sqlSession.update(NAMESPACE+"setHitUpdate", num);
	}
	
	//update
	public int setUpdate(QnAVO qnaVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", qnaVO);
	}
	
	//select
	@Override
	public QnAVO getSelect(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}

	//delete
	@Override
	public int setDelete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}

	/////////////////////////////////////////////////////////////////

	@Override
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception {
		return null;
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int addHit() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int setWrite(BoardVO boardVO) throws Exception {
		return 0;
	}

	
	

}
