package com.hospital.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.board.BoardDAO;
import com.hospital.board.BoardVO;
import com.hospital.util.PageMaker;

@Repository
public class CommunityDAO implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CommunityMapper.";

	@Override
	public int getTotalCount(PageMaker pageMaker) throws Exception {

		return sqlSession.selectOne(NAMESPACE + "getCount", pageMaker);
	}

	@Override
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList", pageMaker);
	}
	@Override
	public CommunityVO getSelect(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getSelect", num);
	}

	public int setWrite(CommunityVO communityVO) throws Exception {
		System.out.println("comu");
		return sqlSession.insert(NAMESPACE + "setWrite", communityVO);
	}


	@Override
	public int setDelete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDelete", num);
	}

	public int setUpdate(CommunityVO communityVO) throws Exception {
		return sqlSession.update(NAMESPACE + "setUpdate", communityVO);
	}


	public int setHitUpdate(int num) throws Exception {
		return sqlSession.update(NAMESPACE + "setHitUpdate", num);
	}

	@Override
	public int setWrite(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addHit(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
