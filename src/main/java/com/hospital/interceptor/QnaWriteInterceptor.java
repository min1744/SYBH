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

public class QnaWriteInterceptor extends HandlerInterceptorAdapter{
	
	//컨트롤러 진입 전에 한번 필터링
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("memberVO");
		boolean result = false;
			
		if(obj != null) {
				
			result = true;
		} else {
				
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 사용가능합니다.'); location.href='../member/memberLogin';</script>");
			out.flush();
		}
			
		//리턴값이 true면 다음 컨트롤러로 진행
		//리턴값이 false면 다음 컨트롤러 진입 안됨
		return result;
	}
	
	
	// jsp를 렌더링 한 후에 필터링(view 직전)
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HttpSession session = request.getSession();
		boolean result = false;
		
		Object obj = ((MemberVO)(session.getAttribute("memberVO"))).getAuthStatus();
		
		super.afterCompletion(request, response, handler, ex);
	}

	
	// 컨트롤러를 진입 후 한번 필터링
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		String method = request.getMethod();
		MemberVO memberVO = null;
		if(method.equals("GET")) {
			HttpSession session = request.getSession();
			memberVO = (MemberVO)session.getAttribute("memberVO");
			Map<String, Object> map = modelAndView.getModel();
			QnAVO qnaVO = (QnAVO)map.get("qnaVO");
			String writer = "";
			Integer grade = 1;
			try {
				writer = memberVO.getId();
				grade = memberVO.getGrade();
			} catch (Exception e) {
				// TODO: handle exception
			}
		
			if(!grade.equals(1) && grade.equals(2)) {
				modelAndView.addObject("message", "No Access");
				modelAndView.addObject("path", "./"+(String)map.get("menu"));
				map.remove("qnaVO");
				modelAndView.setViewName("common/messageMove");
			}
		}
		
		super.postHandle(request, response, handler, modelAndView);
				
	}

	
	
}
