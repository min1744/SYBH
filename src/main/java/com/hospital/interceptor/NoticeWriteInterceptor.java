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
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			Map<String, Object> map = modelAndView.getModel();
			BoardVO boardVO = (BoardVO)map.get("vo");
			
			if(!memberVO.getId().equals(boardVO.getWriter())) {
				modelAndView.addObject("message", "No Access");
				modelAndView.addObject("path", "./"+(String)map.get("board")+"List");
				map.remove("vo");
				modelAndView.setViewName("common/messageMove");
			}
		}
			
				
	}
	
}
