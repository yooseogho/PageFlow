package com.pageflow;

import org.springframework.beans.factory.annotation.*;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.method.configuration.*;
import org.springframework.security.config.annotation.web.builders.*;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.web.*;
import org.springframework.security.web.access.*;

@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
@EnableWebSecurity
@Configuration
public class SecurityConfig {
  @Autowired
  private AccessDeniedHandler accessDeniedHandler;

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http.csrf().disable();
    http.formLogin().loginPage("/member_login_page").loginProcessingUrl("/login").defaultSuccessUrl("/")
        .failureUrl("/member_login_page?error");
    http.exceptionHandling().accessDeniedHandler(accessDeniedHandler);
    http.logout().logoutUrl("/logout").logoutSuccessUrl("/");
    return http.build();
  }

}
