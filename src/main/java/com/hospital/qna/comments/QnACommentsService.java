package com.hospital.qna.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<QnACommentsVO> getList(int num, PageMaker pageMaker) throws Exception {
		
		pageMaker.makeRow();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("pager", pageMaker);
		
		return qnACommentsDAO.getList(map);
	}
	
	public int getTotalCount(int num) throws Exception {
		
		return qnACommentsDAO.getTotalCount(num);
	}
	

}
