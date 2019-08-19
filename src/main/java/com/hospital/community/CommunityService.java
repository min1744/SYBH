package com.hospital.community;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.hospital.board.BoardService;
import com.hospital.board.BoardVO;
import com.hospital.util.PageMaker;

@Service
public class CommunityService implements BoardService{
	
	@Inject
	private CommunityDAO communityDAO;

	@Override
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception {
		pageMaker.makeRow();
		List<BoardVO> list = communityDAO.getList(pageMaker);

		// 페이징
		int totalCount = communityDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}

	@Override
	public CommunityVO getSelect(int num) throws Exception {
		CommunityVO communityVO = communityDAO.getSelect(num);
		communityDAO.setHitUpdate(num);
		return communityVO;
	}

	public int setWrite(CommunityVO communityVO, HttpSession session) throws Exception {
		int result = communityDAO.setWrite(communityVO);
		return result;
	}

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		int result = communityDAO.setDelete(num);
		return result;
	}

	public int setUpdate(CommunityVO communityVO) throws Exception {
		int result = communityDAO.setUpdate(communityVO);
		return result;
	}

	@Override
	public int setWrite(BoardVO boardDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUpdate(BoardVO boardDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
