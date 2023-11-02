package com.pageflow;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.security.access.*;
import org.springframework.security.web.access.*;
import org.springframework.stereotype.*;


// AccessDeniedHandler → 403을 처리
// 비로그인의 403은 로그인 후 이동(스프링 시큐리티 구현)
// 스프링 시큐리티가 기본 구현하지 않은 403은 개발자가 AccessDeniedHandler를 구현해서 등록

// 403을 어떻게 처리할까?
//	1. 루트 페이지로 보내서 그곳에서 오류메세지를 출력 (MVC의 경우)
//	2. ajax라면? (REST) 403이라고 쏴주자 
// 	문제점 : 요청 방식이 MVC인지 AJAX인지 어떻게 알 수 있을까? 구별해야된다!

@Component
public class MyAccessDenialHandler implements AccessDeniedHandler {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// request 객체, response 객체는 header와 body로 구성된다.
		// 비유하자면 편지는 편지지(body)와 편지봉투(header)로 구성된다.
		
		// ajax 방식인 경우 "X-Requested-With"란 헤더의 값이 "XMLHttpRequest"가 된다.
		// ajax 방식이 아닌 경우 "X-Requested-With"란 헤더의 값이 null
		String ajax = request.getHeader("X-Requested-With");
		
		Boolean isAjax = ajax!=null && ajax.equals("XMLHttpRequest");
		// ajax라면 403을 쏴준다 (여긴 컨트롤러가 아니므로 servlet 방식으로 출력)
		if(isAjax) {
			response.sendError(403);
		} else {
			response.sendRedirect("/?error");
		}
	}
}
