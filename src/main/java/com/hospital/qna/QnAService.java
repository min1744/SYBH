package com.hospital.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hospital.board.BoardService;
import com.hospital.board.BoardVO;
import com.hospital.util.PageMaker;

@Service
public class QnAService implements BoardService{
	
	@Inject
	private QnADAO qnaDAO;
	
	//답글
	public int setReply(QnAVO qnaVO) throws Exception {
		
		//답글 update
		int result = qnaDAO.setReplyUpdate(qnaVO);
		//답글 insert
		result = qnaDAO.setReply(qnaVO);
		
		return result;
	}
	
	//write
	public int setWrite(QnAVO qnaVO, HttpSession session) throws Exception {
		return qnaDAO.setWrite(qnaVO);
	}
	
	//update
	public int setUpdate(QnAVO qnaVO) throws Exception {
		return qnaDAO.setUpdate(qnaVO);
	}

	//delete
	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		return qnaDAO.setDelete(num);
	}
	
	//select
	@Override
	public QnAVO getSelect(int num) throws Exception {
		QnAVO qnaVO = qnaDAO.getSelect(num);
		qnaDAO.addHit(num);
		return qnaVO;
	}
	
	//list
	public List<QnAVO> getList(PageMaker pageMaker, String menu) throws Exception {
		
		pageMaker.makeRow();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("menu", menu);
		map.put("pager", pageMaker);
		
		return qnaDAO.getList(map);
	}

	
	//////////////////////////////////////////////////////////////////
	
	@Override
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception {
		return null;
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
