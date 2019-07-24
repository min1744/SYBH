package com.hospital.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


import com.hospital.board.BoardService;
import com.hospital.board.BoardVO;
import com.hospital.util.PageMaker;

@Service
public class NoticeService implements BoardService {
	
	
	
	@Inject
	private NoticeDAO noticeDAO;

	@Override
	public int setWrite(BoardVO boardVO, HttpSession session) throws Exception {
		int result = noticeDAO.setWrite(boardVO);
		return result;
	}

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		
		int result = noticeDAO.setDelete(num);
		return result;
	}

	@Override
	public int setUpdate(BoardVO boardVO, HttpSession session) throws Exception {
		int result = noticeDAO.setUpdate(boardVO);
		
		return result;
	}

	@Override
	public BoardVO getSelect(int num) throws Exception {
		BoardVO boardVO = noticeDAO.getSelect(num);
		noticeDAO.setHitUpdate(num);
	    return boardVO;
	}
	
	@Override
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception {
		//startRow, lastRow
		pageMaker.makeRow();
		List<BoardVO> list = noticeDAO.getList(pageMaker);
		
		//페이징
		int totalCount = noticeDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	
	
	
	
	

}
