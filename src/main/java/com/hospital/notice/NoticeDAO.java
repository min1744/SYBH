package com.hospital.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.board.BoardDAO;
import com.hospital.board.BoardVO;
import com.hospital.util.PageMaker;

@Repository
public class NoticeDAO implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="NoticeMapper.";
	
	
	
	@Override
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	@Override
	public int setWrite(BoardVO boardVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", boardVO);
	}
	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate", boardVO);
	}
	@Override
	public int setDelete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}
	@Override
	public BoardVO getSelect(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	@Override
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}

	/*
	 * public List<NoticeVO> getList2(PageMaker pageMaker) throws Exception{ return
	 * sqlSession.selectOne(NAMESPACE+"getList2", pageMaker); }
	 */
	@Override
	public int addHit() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
