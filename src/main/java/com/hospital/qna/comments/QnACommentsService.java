package com.hospital.qna.comments;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.util.PageMaker;

@Service
public class QnACommentsService {
	
	@Inject
	private QnACommentsDAO qnACommentsDAO;
	
	public int setWrite(QnACommentsVO qnACommentsVO) throws Exception {
		
		return qnACommentsDAO.setWrite(qnACommentsVO);
	}
	
	public List<QnACommentsVO> getList(PageMaker pageMaker) throws Exception {
		
		//startRow, lastRow
		pageMaker.makeRow();
		List<QnACommentsVO> list = qnACommentsDAO.getList(pageMaker);
		
		int totalCount = qnACommentsDAO.getCount(pageMaker);
		pageMaker.makePage(totalCount);
		
		return list;
	}
	
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		
		return qnACommentsDAO.getCount(pageMaker);
	}

}
