package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.naming.NoInitialContextException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.hospital.board.BoardVO;
import com.hospital.community.CommunityDAO;
import com.hospital.community.CommunityService;
import com.hospital.community.CommunityVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping(value = "/community/")
public class CommunityController {
	@Inject
	private CommunityService communityService;

	@ModelAttribute("board")
	public String board() {
		return "community";
	}

	// ** 게시판 - 목록 페이지 이동
	@RequestMapping(value = "communityList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception {

		// ** 게시판 - 목록 조회
		List<BoardVO> lists = communityService.getList(pageMaker);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", lists);
		mv.addObject("pager", pageMaker);
		mv.setViewName("board/boardList");

		return mv;
	}

	// ** 게시판 - 작성 페이지 이동
	// ModelAndView 리턴 타입 검색된 Model 데이터와 View 이름을 모두 저장하여 리턴
	@RequestMapping(value = "communityWrite", method = RequestMethod.GET)
	public ModelAndView setWrite() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardWrite");
		return mv;

	}

	// ** 게시판 - 등록
	@RequestMapping(value = "communityWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(CommunityVO communityVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = communityService.setWrite(communityVO, session);
		if (result > 0) {
			mv.setViewName("redirect:./communityList");

		} else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./communityList");
			mv.setViewName("common/messageMove");
		}
		return mv;

	}

	// ** 게시판 - 상세 페이지 이동
	@RequestMapping(value = "communitySelect", method = RequestMethod.GET)
	public ModelAndView getSelect(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = communityService.getSelect(num);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		return mv;
	}

	// ** 게시판 - 삭제 *
	// String 리턴 타입 완벽한 View 이름을 문자열로 리턴
	@RequestMapping(value = "communityDelete", method = RequestMethod.GET)
	public String setDelete(int num, HttpSession session) throws Exception {
		int result = communityService.setDelete(num, session);
		return "redirect:./communityList";

	}

	// ** 게시판 - 수정 페이지 이동
	@RequestMapping(value = "communityUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		CommunityVO communityVO = communityService.getSelect(num);
		int result = communityService.setUpdate(communityVO);
		mv.addObject("vo", communityVO);
		mv.addObject("result", result);
		mv.setViewName("board/boardUpdate");
		return mv;
	}

	// ** 게시판 - 수정
	@RequestMapping(value = "communityUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(CommunityVO communityVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = communityService.setUpdate(communityVO);
		mv.setViewName("redirect:./communityList");
		return mv;
	}
}
