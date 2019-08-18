package com.hospital.qna.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.qna.comments.like.LikeDAO;
import com.hospital.qna.comments.like.LikeVO;
import com.hospital.util.PageMaker;

@Service
public class QnACommentsService {
	
	@Inject
	private QnACommentsDAO qnACommentsDAO;
	@Inject
	private LikeDAO likeDAO;
	
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
	
	//원본 댓글 삭제
	public int setDelete(int ref) throws Exception {
		return qnACommentsDAO.setDelete(ref);
	}
	
	//댓글 답글 삭제
	public int replyDelete(int qcnum) throws Exception {
		return qnACommentsDAO.replyDelete(qcnum);
	}
	
	
	//답글
	public int setReply(QnACommentsVO qnACommentsVO) throws Exception {
		
		//답글 update
		int result = qnACommentsDAO.setReplyUpdate(qnACommentsVO);
		//답글 insert
		result = qnACommentsDAO.setReply(qnACommentsVO);
		
		return result;
	}
	
	
	
	
	/////////////////////////////////////댓글 좋아요
	//댓글 t_like 테이블의 like_check 값 확인하는 select
	public int likeUpdate(int qcnum, int num, String id, LikeVO likeVO, QnACommentsVO qnACommentsVO) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("id", id);
		
		String select = likeDAO.getSelect(map);
		int result = 0;
		
		if(select == null) {
			
			result = likeDAO.likeWrite(likeVO);
			result = qnACommentsDAO.likeUpdate(qnACommentsVO);
			
		} 
		
		if(select != null) {
			
			int updateSelect = likeDAO.updateSelect(map);
			
			if(updateSelect == 1){
				
				result = likeDAO.setUpdateDelete(likeVO);
				result = qnACommentsDAO.likeDelete(qnACommentsVO);
				
			} else if(updateSelect == 0) {
				
				result = likeDAO.setUpdate(likeVO);
				result = qnACommentsDAO.likeUpdate(qnACommentsVO);
				
			} 
			
		}
		
		
		return result;
		
	}
	
	
	
	
	/// 댓글 Like 테이블 리스트 가져오기
	public List<LikeVO> likeList(int num, String id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("id", id);
		
		List<LikeVO> likeList = likeDAO.likeList(map);
		
		return likeList;
	}
	
	

}
