package com.hospital.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hospital.board.BoardVO;
import com.hospital.member.MemberVO;

public class NoticeWriteInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String method = request.getMethod();
		if(method.equals("GET")) {
			
			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			Map<String, Object> map = modelAndView.getModel();
			BoardVO boardVO = (BoardVO)map.get("boardVO");
			String writer = "";
			String grade = "1";
			try {
				writer = memberVO.getId();
				grade = Integer.toString(memberVO.getGrade());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			if(!grade.equals("2")) {
				modelAndView.addObject("message", "No Access");
				modelAndView.addObject("path", "./"+(String)map.get("board")+"List");
				map.remove("boardVO");
				modelAndView.setViewName("common/messageMove");
			}
		}
			
				
	}
	
}
