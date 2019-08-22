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

public class QnaReplyInterceptor extends HandlerInterceptorAdapter{
	
	//컨트롤러 진입 전에 한번 필터링
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("memberVO");
		boolean result = false;
		
		if(obj != null) {
			
			Integer grade = ((MemberVO)(session.getAttribute("memberVO"))).getGrade();
			if(grade != 2) {
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('관리자만 이용가능합니다.'); location.href='../';</script>");
				out.flush();
				result = false;
				
			} else {
				
				result = true;
			}
			
			
		} else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자만 이용가능합니다.'); location.href='../';</script>");
			out.flush();
			result = false;
			
		}
		
		//리턴값이 true면 다음 컨트롤러로 진행
		//리턴값이 false면 다음 컨트롤러 진입 안됨
		return result;
	}
	
	
}
