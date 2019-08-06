package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.board.BoardVO;
import com.hospital.member.MemberDAO;
import com.hospital.member.MemberService;
import com.hospital.member.MemberVO;
import com.hospital.notice.NoticeService;
import com.hospital.util.PageMaker;

@Controller
public class HomeController {
	@Inject
	private NoticeService noticeService;
	@Inject
	private MemberService memberService;
	
	//진우 : noticeList
	//민근 : variety(member or kakao)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, HttpSession session) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(1);
		pageMaker.setPerPage(5);
		List<BoardVO> indexlist= noticeService.getList(pageMaker);
		String variety = (String)session.getAttribute("variety");
		mv.addObject("list", indexlist);
		mv.addObject("variety", variety);
		mv.setViewName("index/home");
		
		return mv;
	}
}