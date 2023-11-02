package com.pageflow.email;

import java.io.*;

import javax.mail.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import lombok.*;

@RestController
@RequiredArgsConstructor
public class EmailController {
  @Autowired
  private final EmailService emailService;

  @PostMapping("/login/mailConfirm")
  public ResponseEntity<String> mailConfirm(@RequestBody EmailRequestDto emailDto, HttpServletRequest request) {
    try {
      String authCode = emailService.sendEmail(emailDto.getEmail(), request);

      // 세션에 이메일 값 저장
      HttpSession session = request.getSession();
      session.setAttribute("email", emailDto.getEmail());

      return ResponseEntity.ok(authCode);

    } catch (MessagingException | IOException e) {
      System.out.println(e); // 예외 내용 확인용(추후 지워야 함)
      e.printStackTrace();
      return ResponseEntity.status(500).body("이메일 전송 중 발생한 에러(500): " + e.getMessage());
    }
  }

//  세션에서 이메일 값을 받아오는 메서드
  @GetMapping("/getSessionEmail")
  public ResponseEntity<String> getSessionEmail(HttpServletRequest request) {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");

    if (email == null || email.isEmpty()) {
      return ResponseEntity.status(400).body("세션에 이메일이 없습니다..");
    } else {
      return ResponseEntity.ok(email);
    }
  }
}
