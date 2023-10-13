package com.example.demo;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.example.demo.dao.member.*;
import com.example.demo.entity.member.*;

@Component
public class MyUserDetailsService implements UserDetailsService {
	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private MemberDao memberDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if (username.equals("admin"))
			return User.builder().username("admin").password(encoder.encode("1234")).roles("ADMIN").build();
		Member member = memberDao.findById(username);
		if (member == null)
			throw new UsernameNotFoundException("사용자를 찾을 수 없습니다");
		return User.builder().username(member.getMemberId()).password(member.getPassword()).roles("USER").build();

	}
}