package com.example.demo;

import org.springframework.beans.factory.annotation.*;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.method.configuration.*;
import org.springframework.security.config.annotation.web.builders.*;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.web.*;
import org.springframework.security.web.access.*;

// 보안 : 인증(로그인), 인가(권한), 위변조 방지(csrf), 악성코드 실행 금지(xss)
// 스프링 시큐리티는 인증, 인가, 위변조 방지 기능을 제공

// 스프링 시큐리티를 사용하려면 
// 1. UserDetails : 아이디, 비밀번호, 권한...을 담은 인증 객체 인터페이스
// 2. UserDetailsService : UserDetails를 생성하는 인터페이스
// 3. SecurityFilterChain : 스프링 시큐리티의 필터들이 나열되는 것

@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
@EnableWebSecurity
@Configuration
public class SecurityConfig {
  @Autowired
  private AccessDeniedHandler accessDeniedHandler;

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http.csrf().disable();
    http.formLogin().loginPage("/member_login_page").loginProcessingUrl("/member_login_page").defaultSuccessUrl("/")
        .failureUrl("/member_login_page?error");
    http.exceptionHandling().accessDeniedHandler(accessDeniedHandler);
    http.logout().logoutUrl("/logout").logoutSuccessUrl("/");
    return http.build();
  }

}
