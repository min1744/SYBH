package com.hospital.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hospital.member.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean result = false;
		HttpSession session = request.getSession();
		if(session.getAttribute("memberVO") != null) {
			int grade = ((MemberVO)session.getAttribute("memberVO")).getGrade();
			if(grade == 2) {
				result = true;
			} else {
				response.sendRedirect("../");
			}
		} else {
			response.sendRedirect("../member/memberLogin");
		}
		
		return result;
	}
}