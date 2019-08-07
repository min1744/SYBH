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
	
	//댓글 등록
	public int setWrite(QnACommentsVO qnACommentsVO) throws Exception {
		return qnACommentsDAO.setWrite(qnACommentsVO);
	}

	//댓글리스트
	public List<QnACommentsVO> getList(int num, PageMaker pageMaker) throws Exception {
		
		pageMaker.makeRow();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("pager", pageMaker);
		
		return qnACommentsDAO.getList(map);
	}
	
	//댓글 총 갯수 //select 에도 필요함
	public int getTotalCount(int num) throws Exception {
		return qnACommentsDAO.getTotalCount(num);
	}
	
	//댓글 수정
	public int setUpdate(QnACommentsVO qnACommentsVO) throws Exception {
		return qnACommentsDAO.setUpdate(qnACommentsVO);
	}
	
	//댓글 삭제
	public int setDelete(int qcnum) throws Exception {
		return qnACommentsDAO.setDelete(qcnum);
	}

}
