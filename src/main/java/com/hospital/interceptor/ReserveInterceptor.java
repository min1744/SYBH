package com.hospital.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hospital.member.MemberVO;

public class ReserveInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("memberVO");
		boolean result = false;
		if(obj != null) {
			result = true;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 사용가능합니다.'); location.href='../member/memberLogin';</script>");
			out.flush();
		}
		
		return result;
	}
	
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HttpSession session = request.getSession();
		boolean result = false;
		
		Object obj = ((MemberVO)(session.getAttribute("memberVO"))).getAuthStatus();
		
		super.afterCompletion(request, response, handler, ex);
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		String obj = ((MemberVO)(session.getAttribute("memberVO"))).getAuthStatus();
		if(!obj.equals("2")) {
			modelAndView.addObject("message", "이메일 인증  후 사용 가능합니다 \\n이메일 인증 링크는 회원가입시 입력하였던 메일로 발송하였습니다.");
			modelAndView.addObject("path", "../member/memberMyPage");
			modelAndView.setViewName("common/messageMove");
		}
	}
	
}
