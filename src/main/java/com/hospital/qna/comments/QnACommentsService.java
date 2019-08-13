package com.hospital.qna.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.qna.comments.hate.HateDAO;
import com.hospital.qna.comments.hate.HateVO;
import com.hospital.qna.comments.like.LikeDAO;
import com.hospital.qna.comments.like.LikeVO;
import com.hospital.util.PageMaker;

@Service
public class QnACommentsService {
	
	@Inject
	private QnACommentsDAO qnACommentsDAO;
	@Inject
	private LikeDAO likeDAO;
	@Inject
	private HateDAO hateDAO;
	
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
	
	
	/////////////////////////////////////댓글 싫어요
	//댓글 t_hate 테이블의 hate_check 값 확인하는 select
	public int hateUpdate(int qcnum, int num, String id, HateVO hateVO, QnACommentsVO qnACommentsVO) throws Exception {
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("id", id);
		
		String select = hateDAO.getSelect(map);
		int result = 0;
		
		if(select == null) {
			
			result = hateDAO.hateWrite(hateVO);
			result = qnACommentsDAO.hateUpdate(qnACommentsVO);
		
		} 
		
		if(select != null) {
		
			int updateSelect = hateDAO.updateSelect(map);
		
		if(updateSelect == 1){
		
			result = hateDAO.setUpdateDelete(hateVO);
			result = qnACommentsDAO.hateDelete(qnACommentsVO);
		
		} else if(updateSelect == 0) {
		
			result = hateDAO.setUpdate(hateVO);
			result = qnACommentsDAO.hateUpdate(qnACommentsVO);
		} 
	
	}

		return result;

	}
	
	
	
	//// 댓글 like_check 값 가져오기
	public int likeCheck(int num, String id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("id", id);
		
		int updateSelect = likeDAO.updateSelect(map);
		
		return updateSelect;
		
	}
	
	
	/// 댓글 Like 테이블 리스트 가져오기
	public List<LikeVO> likeList(int num, String id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("id", id);
		
		List<LikeVO> likeList = likeDAO.likeList(map);
		
		return likeList;
	}
	
	
	////댓글 hate_check 값 가져오기
	public int hateCheck(int num, String id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("id", id);
		
		int updateSelect = hateDAO.updateSelect(map);
		System.out.println(updateSelect);
		
		return updateSelect;
		
	}
	
	
	/// 댓글 Hate 테이블 리스트 가져오기
	public List<HateVO> hateList(int num, String id) throws Exception {
			
		Map<String, Object> map = new HashMap<String, Object>();
			
		map.put("num", num);
		map.put("id", id);
			
		List<HateVO> hateList = hateDAO.hateList(map);
			
		return hateList;
	}

}
