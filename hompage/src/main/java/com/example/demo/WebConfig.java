///*
// * 10/25 16:21
// * 작성자 : 갈현
// * 작성 내용 : Interceptor 클래스를 사용하는 Config 작성
// * *참고*
// * 다른 방법도 있음, 이건 첫 번째 방법
// * 
// * '' 16:27
// * 수정자 : 갈현
// * 수정 내용 : 특정 경로에서만 세션에서 이메일을 날리지 않는 구문 추가
// * */
//
//package com.example.demo;
//
//import org.springframework.context.annotation.*;
//import org.springframework.web.servlet.config.annotation.*;
//
//@Configuration
//// WebMvcConfigurer 인터페이스를 상속받음
//public class WebConfig implements WebMvcConfigurer {
//  private final SessionInterceptor sessionInterceptor;
//
//  public WebConfig(SessionInterceptor sessionInterceptor) {
//    this.sessionInterceptor = sessionInterceptor;
//  }
//
//  @Override
//  public void addInterceptors(InterceptorRegistry registry) {
////    모든 경로에 대한 요청에 대하여 세션에서의 이메일 값을 제거하지만,
//    registry.addInterceptor(sessionInterceptor).addPathPatterns("/**")
////    이메일 인증 코드 확인 페이지와 회원 가입 페이지에 대한 경로에 대해서만 작동하지 않음(exclude : 제외하다)
//        .excludePathPatterns("/mail_code_check_page", "/member_create_page");
////    참고 : 이메일 코드 확인 페이지에서 회원 가입 페이지로 넘어가는 부분에서만 제외,
////    사용자가 이전 페이지로 돌아가는 등의 작업으로 이메일 코드 확인 페이지로 갔다가 돌아와도 삭제됨
//  }
//
//}
