package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.community.comments.CommunityCommentsService;
import com.hospital.community.comments.CommunityCommentsVO;
import com.hospital.community.like.CommuLikeVO;
import com.hospital.news.comments.NewsCommentsService;
import com.hospital.news.comments.NewsCommentsVO;
import com.hospital.qna.comments.QnACommentsService;
import com.hospital.qna.comments.QnACommentsVO;
import com.hospital.qna.comments.like.LikeVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/comments/")
public class CommentsController {
	
	@Inject
	private QnACommentsService qnACommentsService;
	@Inject
	private NewsCommentsService newsCommentsService;
	@Inject
	private CommunityCommentsService communityCommentsService;
	
	
	////////////////////커뮤니티 코멘트 관련
		
	//댓글 등록
	@RequestMapping(value = "commuCommentsWrite", method = RequestMethod.POST)
	@ResponseBody
	public int setWrite(CommunityCommentsVO communityCommentsVO) throws Exception {
	int result = communityCommentsService.setWrite(communityCommentsVO);
	return result;
	}
	
	//댓글 리스트
	@RequestMapping(value = "commuCommentsList", method = RequestMethod.GET)
	public ModelAndView commuGetList(int num, String id, PageMaker pageMaker) throws Exception {
	
	ModelAndView mv = new ModelAndView();
	List<CommunityCommentsVO> list = communityCommentsService.getList(num, pageMaker);
	int totalCount = communityCommentsService.getTotalCount(num);
	mv.addObject("list", list);
	mv.addObject("totalCount", totalCount);
	mv.setViewName("common/commuCommentsList");
	
	return mv;
	}
	
	
	//댓글 수정
	@RequestMapping(value = "commuCommentsUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int commuSetUpdate(CommunityCommentsVO communityCommentsVO) throws Exception {
	int result = communityCommentsService.setUpdate(communityCommentsVO);
	return result;
	}
	
	
	//원본 댓글 삭제
	@RequestMapping(value = "commuCommentsDelete", method = RequestMethod.POST)
	@ResponseBody
	public int commuSetDelete(int ref) throws Exception {
	int result = communityCommentsService.setDelete(ref);
	return result;
	}
	
	//댓글 답글 삭제
	@RequestMapping(value = "commuCommentsReplyDelete", method = RequestMethod.POST)
	@ResponseBody
	public int commuReplyDelete(int cnum) throws Exception {
	int result = communityCommentsService.replyDelete(cnum);
	return result;
	}
	
	
	//답글
	@RequestMapping(value = "commuCommentsReply", method = RequestMethod.POST)
	@ResponseBody
	public int setReply(CommunityCommentsVO communityCommentsVO) throws Exception {
	int result = communityCommentsService.setReply(communityCommentsVO);
	
	return result;
	}
	
	
	
	//좋아요
	@RequestMapping(value = "commuCommentsLike", method = RequestMethod.POST)
	@ResponseBody
	public int likeUpdate(int ccnum, int num, String id, CommuLikeVO commuLikeVO, CommunityCommentsVO communityCommentsVO) throws Exception {
	
	int result = communityCommentsService.likeUpdate(ccnum, num, id, commuLikeVO, communityCommentsVO);
	
	return result;
	}
	
	
	////////////////////////////////////
	
	
	
	
	
	
	//////////////////////////////////////////////////////// news 코멘트 관련
	
	//댓글 등록
	@RequestMapping(value = "newsCommentsWrite", method = RequestMethod.POST)
	@ResponseBody
	public int setWrite(NewsCommentsVO newsCommentsVO) throws Exception {
		int result = newsCommentsService.setWrite(newsCommentsVO);
		return result;
	}
			
	//댓글 리스트
	@RequestMapping(value = "newsCommentsList", method = RequestMethod.GET)
	public ModelAndView getList(int num, String id, PageMaker pageMaker) throws Exception {
				
		ModelAndView mv = new ModelAndView();
		List<NewsCommentsVO> list = newsCommentsService.getList(num, pageMaker);
		int totalCount = newsCommentsService.getTotalCount(num);
		mv.addObject("list", list);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("common/commentsList");
				
		return mv;
	}
			
			
	//댓글 수정
	@RequestMapping(value = "newsCommentsUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int setUpdate(NewsCommentsVO newsCommentsVO) throws Exception {
		int result = newsCommentsService.setUpdate(newsCommentsVO);
		return result;
	}
			
			
	//원본 댓글 삭제
	@RequestMapping(value = "newsCommentsDelete", method = RequestMethod.POST)
	@ResponseBody
	public int setDelete(int ref) throws Exception {
		int result = newsCommentsService.setDelete(ref);
		return result;
	}
			
	//댓글 답글 삭제
	@RequestMapping(value = "newsCommentsReplyDelete", method = RequestMethod.POST)
	@ResponseBody
	public int replyDelete(int cnum) throws Exception {
		int result = newsCommentsService.replyDelete(cnum);
		return result;
	}
			
			
	//답글
	@RequestMapping(value = "newsCommentsReply", method = RequestMethod.POST)
	@ResponseBody
	public int setReply(NewsCommentsVO newsCommentsVO) throws Exception {
		int result = newsCommentsService.setReply(newsCommentsVO);
				
		return result;
	}
			
			
			
	//좋아요
	@RequestMapping(value = "newsCommentsLike", method = RequestMethod.POST)
	@ResponseBody
	public int likeUpdate(int cnum, int num, String id, LikeVO likeVO, NewsCommentsVO newsCommentsVO) throws Exception {
				
		int result = newsCommentsService.likeUpdate(cnum, num, id, likeVO, newsCommentsVO);
		
		return result;
	}
	
	
	////////////////////////////////////
	
	
	
	
	
	/////////////////////// qna 댓글 테스트 관련 코드
	
//	//댓글 등록
//	@RequestMapping(value = "commentsWrite", method = RequestMethod.POST)
//	@ResponseBody
//	public int setWrite(QnACommentsVO qnACommentsVO) throws Exception {
//		int result = qnACommentsService.setWrite(qnACommentsVO);
//
//		return result;
//	}
//	
//	//댓글 리스트
//	@RequestMapping(value = "commentsList", method = RequestMethod.GET)
//	public ModelAndView getList(int num, String id, PageMaker pageMaker) throws Exception {
//		
//		ModelAndView mv = new ModelAndView();
//		List<QnACommentsVO> list = qnACommentsService.getList(num, pageMaker);
//		int totalCount = qnACommentsService.getTotalCount(num);
//		mv.addObject("list", list);
//		mv.addObject("totalCount", totalCount);
//		mv.setViewName("common/commentsList");
//		
//		return mv;
//	}
//	
//	
//	//댓글 수정
//	@RequestMapping(value = "commentsUpdate", method = RequestMethod.POST)
//	@ResponseBody
//	public int setUpdate(QnACommentsVO qnACommentsVO) throws Exception {
//		int result = qnACommentsService.setUpdate(qnACommentsVO);
//		return result;
//	}
//	
//	
//	//원본 댓글 삭제
//	@RequestMapping(value = "commentsDelete", method = RequestMethod.POST)
//	@ResponseBody
//	public int setDelete(int ref) throws Exception {
//		int result = qnACommentsService.setDelete(ref);
//		System.out.println(result);
//		return result;
//	}
//	
//	//댓글 답글 삭제
//	@RequestMapping(value = "commentsReplyDelete", method = RequestMethod.POST)
//	@ResponseBody
//	public int replyDelete(int qcnum) throws Exception {
//		int result = qnACommentsService.replyDelete(qcnum);
//		return result;
//	}
//	
//	
//	//답글
//	@RequestMapping(value = "commentsReply", method = RequestMethod.POST)
//	@ResponseBody
//	public int setReply(QnACommentsVO qnACommentsVO) throws Exception {
//		int result = qnACommentsService.setReply(qnACommentsVO);
//		
//		return result;
//	}
//	
//	
//	
//	//좋아요
//	@RequestMapping(value = "commentsLike", method = RequestMethod.POST)
//	@ResponseBody
//	public int likeUpdate(int qcnum, int num, String id, LikeVO likeVO, QnACommentsVO qnACommentsVO) throws Exception {
//		
//		int result = qnACommentsService.likeUpdate(qcnum, num, id, likeVO, qnACommentsVO);
//		
//		return result;
//	}
	
	
	
	
	

}
