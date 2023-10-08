package com.example.demo.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.member.MemberService;

// 10/08 RestContoroller  유석호

@RestController
public class MemberRestController {
	
	
	@Autowired
	private MemberService service;

	// 아이디 중복확인 

	@GetMapping("/member/username/available/{memberId}")
	public ResponseEntity<Void> usernameAvailable(@PathVariable String memberId) {
	    Boolean result = service.idAvailable(memberId);
	    return result ? ResponseEntity.ok().build() : ResponseEntity.status(HttpStatus.CONFLICT).build();
	}
}
