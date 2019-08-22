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
	
	//내 문의내역 리스트
	public List<QnAVO> getMemberQnaList(PageMaker pageMaker, QnAVO qnaVO) throws Exception {
		
		pageMaker.setKind(qnaVO.getWriter());
		pageMaker.makeRow();
		int totalCount = qnaDAO.getMemberQnaTotalCount(qnaVO);
		pageMaker.makePage(totalCount);
		List<QnAVO> list = qnaDAO.getMemberQnaList(pageMaker);
		
		return list;
	}
	
	//내 문의내역 갯수
	public int getMemberTotalCount(QnAVO qnaVO) throws Exception {
		int total;
		try {
			total = qnaDAO.getMemberQnaTotalCount(qnaVO);
		} catch (Exception e) {
			total = 0;
		}
		return total;
	}
	
	//답글
	public int setReply(QnAVO qnaVO) throws Exception {
		
		//답글 update
		int result = qnaDAO.setReplyUpdate(qnaVO);
		//답글 insert
		result = qnaDAO.setReply(qnaVO);
		
		return result;
	}
	
	//답글 delete
	public int replyDelete(int num, HttpSession session) throws Exception {
		return qnaDAO.replyDelete(num);
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
	public int setDelete(int ref, HttpSession session) throws Exception {
		return qnaDAO.setDelete(ref);
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
		int totalCount = qnaDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
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
