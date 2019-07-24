package com.hospital.SYBH;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.member.MemberService;
import com.hospital.member.MemberVO;
import com.hospital.pay.PayDAO;
import com.hospital.pay.PayService;
import com.hospital.pay.PayVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private PayService payService;
	@Inject
	private PayDAO payDAO;
	
	//현아 작성 (마이페이지 jsp 잘 나오는지 테스트용)
	@RequestMapping(value = "memberMyPage", method = RequestMethod.GET)
	public ModelAndView myPage() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberMyPage");
		
		return mv;
		
	}
	
	//현아 작성 (마이페이지 jsp 잘 나오는지 테스트용)
	@RequestMapping(value = "memberBreakdown", method = RequestMethod.GET)
	public ModelAndView memberBreakdown() throws Exception {
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberBreakdown");
			
		return mv;
			
	}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void login() throws Exception {}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView login(MemberVO memberVO, HttpSession session, ModelAndView mv) throws Exception{
		memberVO = memberService.login(memberVO);
		if(memberVO != null) {
			session.setAttribute("memberVO", memberVO);
			mv.setViewName("redirect:../");
		} else {
			mv.addObject("message", "로그인 실패하셨습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping("memberLogout")
	public String logOut(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:../";
	}
	
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void memberAgree() throws Exception {}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void memberJoin(@ModelAttribute MemberVO memberVO) throws Exception {}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(@Valid MemberVO memberVO, BindingResult br, ModelAndView mv) throws Exception {
		if(br.hasErrors()) {
			mv.setViewName("member/memberJoin");
		} else {
			int result = memberService.setWrite(memberVO);
			if(result > 0) {
				mv.setViewName("member/memberLogin");
			} else {
				mv.addObject("message", "Login Fail");
				mv.addObject("path", "../");
				mv.setViewName("common/messageMove");
			}
		}
		return mv;
	}
	
	//재혁 후원내역 작성
	@RequestMapping(value="memberDonation", method = RequestMethod.GET)
	public ModelAndView memberDonation(PageMaker pageMaker, PayVO payVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = ((MemberVO)session.getAttribute("memberVO")).getId();
		payVO.setId(id);
		payVO.setCategory(1);
		List<PayVO> list =  payService.getOneList(pageMaker, payVO);
		int totalCount = payDAO.getOneTotalCount(payVO);
		mv.addObject("board", "Donation");
		mv.addObject("what", "후원");
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("count",totalCount);
		mv.setViewName("member/memberBreakdown");
		return mv;
		
	}
}