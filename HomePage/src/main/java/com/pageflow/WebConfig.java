/*
 * 10/25 16:21
 * 작성자 : 갈현
 * 작성 내용 : Interceptor 클래스를 사용하는 Config 작성
 * *참고*
 * 다른 방법도 있음, 이건 첫 번째 방법
 * 
 * '' 16:27
 * 수정자 : 갈현
 * 수정 내용 : 특정 경로에서만 세션에서 이메일을 날리지 않는 구문 추가
 * 
 * 11/01 19:38
 * 수정자 : 갈현
 * 수정 내용 : 루트 페이지로 이동하는 요청에 대해서만 세션에서 이메일 값을 날림
 * */

package com.pageflow;

import org.springframework.context.annotation.*;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {
  private final SessionInterceptor sessionInterceptor;

  public WebConfig(SessionInterceptor sessionInterceptor) {
    this.sessionInterceptor = sessionInterceptor;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(sessionInterceptor).addPathPatterns("/", "/page");
  }
}
