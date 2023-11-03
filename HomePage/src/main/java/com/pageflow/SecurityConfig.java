package com.pageflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
@EnableWebSecurity
@Configuration
public class SecurityConfig {
  @Autowired
  private AccessDeniedHandler accessDeniedHandler;

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    http.csrf().disable();
	    http.formLogin()
	    .loginPage("/member_login_page")
	    .loginProcessingUrl("/login")  // 11-01 수정 로그인 postmapping이라 안겹치게함
	    .defaultSuccessUrl("/")
	    .failureUrl("/member_login_page?error");

	    http.exceptionHandling().accessDeniedHandler(accessDeniedHandler);
	    http.logout().logoutUrl("/logout").logoutSuccessUrl("/");

	    // 유석호 : 10-13 일 비회원이 문의사항등록페이지 들어가면 로그인창으로 넘어가고 로그인하면 문의사항등록페이에 들어갈수 있음
	    http.authorizeRequests().antMatchers(HttpMethod.GET, "/customer_inquiry_write_page").hasRole("USER").and()
	            .exceptionHandling()
	            .authenticationEntryPoint(new LoginUrlAuthenticationEntryPoint("/member_login_page"));

	    return http.build();
	}
}
