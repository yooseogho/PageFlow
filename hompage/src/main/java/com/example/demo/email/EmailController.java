package com.example.demo.email;

import java.io.*;

import javax.mail.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import lombok.*;

@RestController
@RequiredArgsConstructor
public class EmailController {
  @Autowired
  private final EmailService emailService;

  @PostMapping("/login/mailConfirm")
  public ResponseEntity<String> mailConfirm(@RequestBody EmailAuthRequestDto emailDto) {
    try {
      String authCode = emailService.sendEmail(emailDto.getEmail());
      return ResponseEntity.ok(authCode);
    } catch (MessagingException | IOException e) {
      e.printStackTrace();
      // 상태 코드 500 발생 시 클라이언트에 에러 메시지 반환
      return ResponseEntity.status(500).body("이메일 전송 중 발생한 에러(500): " + e.getMessage());
    }
  }
}
