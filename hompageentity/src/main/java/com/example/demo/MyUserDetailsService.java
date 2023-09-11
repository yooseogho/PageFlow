package com.example.demo;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

@Component
public class MyUserDetailsService implements UserDetailsService {
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if(username.equals("admin"))
			return User.builder().username("admin").password(encoder.encode("1234")).roles("ADMIN").build();
		else {
			return User.builder().username("spring").password(encoder.encode("1234")).roles("USER").build();
		}
	}

}







