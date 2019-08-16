package com.hospital.notice;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.hospital.board.BoardService;
import com.hospital.board.BoardVO;
import com.hospital.util.PageMaker;

@Service
public class NoticeService implements BoardService {
	
	
	
	@Inject
	private NoticeDAO noticeDAO;
	
	public int fixCount() throws Exception{
		int result = noticeDAO.fixCount();

		return result;

	}
	

	public int setWrite(NoticeVO noticeVO, HttpSession session) throws Exception {
		int result = noticeDAO.setWrite(noticeVO);
		if(noticeVO.getFix() != 1 ) {
			noticeVO.setFix(0);
		}
		return result;
	}

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		return noticeDAO.setDelete(num);
	}
	//delete all
	public int setDelete(Integer[] num) throws Exception{
		List<Integer> list = Arrays.asList(num);
		return noticeDAO.setListDelete(list);
	}
	
	public int setUpdate(NoticeVO noticeVO) throws Exception {
		int result = noticeDAO.setUpdate(noticeVO);
		if(noticeVO.getFix() != 1 ) {
			noticeVO.setFix(0);
		}
		return result;
	}

	@Override
	public NoticeVO getSelect(int num) throws Exception {
		NoticeVO noticeVO = noticeDAO.getSelect(num);
		noticeDAO.setHitUpdate(num);
	    return noticeVO;
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
	
	public List<NoticeVO> getList2() throws Exception{
		return noticeDAO.getListFix();
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
