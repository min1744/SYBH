package com.hospital.community.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.community.like.CommuLikeDAO;
import com.hospital.community.like.CommuLikeVO;
import com.hospital.util.PageMaker;

@Service
public class CommunityCommentsService {

	@Inject
	private CommunityCommentsDAO communityCommentsDAO;
	@Inject
	private CommuLikeDAO commuLikeDAO;

	// 댓글 등록
	public int setWrite(CommunityCommentsVO communityCommentsVO) throws Exception {
		return communityCommentsDAO.setWrite(communityCommentsVO);
	}

	// 댓글리스트
	public List<CommunityCommentsVO> getList(int num, PageMaker pageMaker) throws Exception {

		pageMaker.makeRow();
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("num", num);
		map.put("pager", pageMaker);

		return communityCommentsDAO.getList(map);
	}

	// 댓글 총 갯수 //select 에도 필요함
	public int getTotalCount(int num) throws Exception {
		return communityCommentsDAO.getTotalCount(num);
	}

	// 댓글 수정
	public int setUpdate(CommunityCommentsVO communityCommentsVO) throws Exception {
		return communityCommentsDAO.setUpdate(communityCommentsVO);
	}

	// 원본 댓글 삭제
	public int setDelete(int ref) throws Exception {
		return communityCommentsDAO.setDelete(ref);
	}

	// 댓글 답글 삭제
	public int replyDelete(int ccnum) throws Exception {
		return communityCommentsDAO.replyDelete(ccnum);
	}

	// 답글
	public int setReply(CommunityCommentsVO communityCommentsVO) throws Exception {

		// 답글 update
		int result = communityCommentsDAO.setReplyUpdate(communityCommentsVO);
		// 답글 insert
		result = communityCommentsDAO.setReply(communityCommentsVO);

		return result;
	}

	///////////////////////////////////// 댓글 좋아요
	// 댓글 t_like 테이블의 like_check 값 확인하는 select
	public int likeUpdate(int ccnum, int num, String id, CommuLikeVO commuLikeVO,
			CommunityCommentsVO communityCommentsVO) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		String select = commuLikeDAO.getSelect(map);
		int result = 0;
		if (select == null) {
			result = commuLikeDAO.likeWrite(commuLikeVO);
			result = communityCommentsDAO.likeUpdate(communityCommentsVO);
		}
		if (select != null) {
			int updateSelect = commuLikeDAO.updateSelect(map);
			if (updateSelect == 1) {
				result = commuLikeDAO.setUpdateDelete(commuLikeVO);
				result = communityCommentsDAO.likeDelete(communityCommentsVO);
			} else if (updateSelect == 0) {
				result = commuLikeDAO.setUpdate(commuLikeVO);
				result = communityCommentsDAO.likeUpdate(communityCommentsVO);
			}
		}
		return result;
	}

	/// 댓글 Like 테이블 리스트 가져오기
	public List<CommuLikeVO> likeList(int num, String id) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("num", num);
		map.put("id", id);

		List<CommuLikeVO> likeList = commuLikeDAO.likeList(map);

		return likeList;
	}

}
