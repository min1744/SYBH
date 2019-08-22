package com.hospital.interceptor;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hospital.member.MemberVO;
import com.hospital.qna.QnAVO;

public class CommentInterceptor extends HandlerInterceptorAdapter{
	
	
	// 컨트롤러를 진입 후 한번 필터링
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		String obj = ((MemberVO)(session.getAttribute("memberVO"))).getAuthStatus();
		if(!obj.equals("2")) {
			modelAndView.addObject("message", "이메일 인증  후 사용 가능합니다 \\n이메일 인증 링크는 회원가입시 입력하였던 메일로 발송하였습니다.");
			modelAndView.addObject("path", "../member/memberMyPage");
			modelAndView.setViewName("common/messageMove");
		}
				
	}

	
	
}
