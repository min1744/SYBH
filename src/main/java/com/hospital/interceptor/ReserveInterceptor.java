package com.hospital.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

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
			out.println("<script>alert('로그인 후 사용가능합니다.');</script>");
			response.sendRedirect("../member/memberLogin");
			out.flush();
		}
		
		return result;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("memberVO");
		if(obj== null) {
			modelAndView.addObject("message", "로그인 후 사용 가능합니다");
			modelAndView.addObject("path", "./payPopup");
			modelAndView.setViewName("common/messageMove");
		}
	}
	
}
