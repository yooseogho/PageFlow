package com.pageflow;

import org.springframework.context.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.security.crypto.password.*;

@Configuration
public class BeanConfig {
	@Bean
	public PasswordEncoder passwordEncoder() {
		// BCrypt는 비밀번호 암호화 전용 알고리즘
		return new BCryptPasswordEncoder();
	}
}
