package com.example.demo.email;

import java.io.*;

import javax.mail.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import lombok.*;

@RestController
@RequiredArgsConstructor
public class EmailController {
  @Autowired
  private final EmailService emailService;

  @PostMapping("/login/mailConfirm")
  public String mailConfirm(@RequestBody EmailAuthRequestDto emailDto)
      throws MessagingException, UnsupportedEncodingException {

    String authCode = emailService.sendEmail(emailDto.getEmail());
    return authCode;
  }
}
