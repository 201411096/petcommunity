package com.mycompany.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// servlet-context.xml���� interceptor �±װ� �ʿ���
public class LoggerInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requesturl = request.getRequestURI();
//		System.out.println("preHandle " + requesturl);
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
		String requesturl = request.getRequestURI();
//		System.out.println("postHandle " + requesturl);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
		String requesturl = request.getRequestURI();
//		System.out.println("afterCompletion " + requesturl);
	}
	
}
