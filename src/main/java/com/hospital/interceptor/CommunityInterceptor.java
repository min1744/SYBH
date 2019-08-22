package com.hospital.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommunityInterceptor extends HandlerInterceptorAdapter {

	// 컨트롤러 진입 전
	@Override // 지정된 컨트롤러의 동작 이전에 가로채는 역할
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("memberVO");
		boolean result = false;
		if (obj != null) {
			result = true;
		} else {
			response.sendRedirect("../member/memberLogin");
		}

		// return이 true면 다음 컨트롤러로 진행
		// return이 false면 컨트롤러 진입 안됌.
		return result;
	}

	// 컨트롤러 진입 후
	@Override // 지정된 컨트롤러의 동작 이후에 처리
				// 처리하기 전에 동작.
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	// jsp을 렌더링 후
	@Override // DispatcherServlet의 화면 처리가 완료된 상태에서 처리
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

}
