package com.example.demo.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.member.MemberService;

// 10/08 RestContoroller  유석호

@RestController
	public class MemberRestController {
	
	
	@Autowired
	private MemberService service;


	// 1. 아이디 중복확인 
	@GetMapping("/member/username/available/{memberId}") 
	public ResponseEntity<Void> usernameAvailable(@PathVariable String memberId) { 
		//usernameAvailable 메서드는 HTTP GET 요청을 처리하며, 주어진 memberId가 사용 가능한지 확인합니다. 서비스 레이어에서 결과를 받아, 
		//만약 사용 가능하다면 HTTP 상태 코드 200(OK)을 반환하고, 그렇지 않다면 409(CONFLICT)를 반환합니다.
	    Boolean result = service.idAvailable(memberId);
	    return result ? ResponseEntity.ok().build() : ResponseEntity.status(HttpStatus.CONFLICT).build();
	}	
	
	// 2. 비밀번호 중복 확인  10-17 유석호 edit_page에서 비밀번호 변경 할때 필요함
    @GetMapping("/member/password/available/{memberId}")
    public ResponseEntity<Void> passwordAvailable(@PathVariable String memberId, @RequestParam String password) {
    	//passwordAvailable 메서드는 특정 회원의 비밀번호가 입력한 비밀번호와 일치하는지 확인합니다.
    	//만약 일치한다면 HTTP 상태 코드 200(OK), 그렇지 않다면 409(CONFLICT)를 반환합니다.
        Boolean result = service.passwordAvailable(memberId, password);
        return result ? ResponseEntity.ok().build() : ResponseEntity.status(HttpStatus.CONFLICT).build();
    }
	//  3. 전화번호 중복 확인edit_page에서 활용 
    @GetMapping("/member/memberTel/available")
    public ResponseEntity<Boolean> checkTelAvailable(@RequestParam String memberTel) {
    	//checkTelAvailable 메서드는 주어진 전화번호가 이미 등록되어 있는지 검사합니다. 
    	//결과값인 isAvailabe을 바디에 담아 OK 상태와 함께 응답을 보냅니다.
        Boolean isAvailable = service.telAvailable(memberTel);
        return new ResponseEntity<>(isAvailable, HttpStatus.OK);
    }

 // 4. 이메일 중복 확인 edit_page에서 활용 
    @GetMapping("/member/email/available")
    public ResponseEntity<Boolean> checkEmailAvailable(@RequestParam String memberEmail) {
    	// checkEmailAvailabe 메서드는 주어진 이메일이 이미 등록되어 있는지 검사합니다.
    	//결과값인 isAvailabe을 바디에 담아 OK 상태와 함께 응답을 보냅니다.
        Boolean isAvailable = service.checkEmailAvailable(memberEmail);
        return new ResponseEntity<>(isAvailable, HttpStatus.OK);
    }
    
    
    
}
	
