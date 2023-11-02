///*
// * 10/25 16:19
// * 작성자 : 갈현
// * 작성 내용 : [모든 요청]이 들어오고 나갈 때마다 세션에서 이메일 값을 날리는 Interceptor 클래스 추가
// * *참고*
// * 작성 내용이 의아하다면 WebConfig 참고
// * */
//
//package com.example.demo;
//
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@Component
//public class SessionInterceptor implements HandlerInterceptor {
//  @Override
//  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//    HttpSession session = request.getSession();
//    session.removeAttribute("email");
//    return true;
//  }
//}
