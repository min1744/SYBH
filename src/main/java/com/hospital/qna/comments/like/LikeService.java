package com.hospital.qna.comments.like;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class LikeService {
	
	@Inject
	private LikeDAO likeDAO;
	
	public int setWrtie(LikeVO likeVO) throws Exception {
		return likeDAO.likeWrite(likeVO);
	}
	
	public int getSelete(int lnum) throws Exception {
		return likeDAO.getSelect(lnum);
	}
 
}
