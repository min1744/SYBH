package com.hospital.interceptor;

import java.io.PrintWriter;

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
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 사용가능합니다.'); location.href='../member/memberLogin';</script>");
			out.flush();
		}
		
		return result;
	}
}