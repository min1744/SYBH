package com.hospital.qna;

import java.util.List;

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

	@Override
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int setWrite(QnAVO qnaVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", qnaVO);
	}


	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO getSelect(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
