package com.pageflow.email;

import javax.servlet.http.*;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/session")
public class SessionController {
// 이메일 날리기
  @PostMapping("/removeEmail")
  public void removeEmail(HttpSession session) {
    session.removeAttribute("email");
  }
}
