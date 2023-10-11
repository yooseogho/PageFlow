package com.example.demo.email;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.*;
import org.thymeleaf.spring5.*;

import lombok.*;

@Service
@RequiredArgsConstructor
public class EmailService {

  private final JavaMailSender emailSender;
  private final SpringTemplateEngine templateEngine;
  private String authNum;

  public void createCode() {
    Random random = new Random();
    StringBuffer key = new StringBuffer();

    for (int i = 0; i < 8; i++) {
      int index = random.nextInt(3);

      switch (index) {
      case 0:
        key.append((char) ((int) random.nextInt(26) + 97));
        break;
      case 1:
        key.append((char) ((int) random.nextInt(26) + 65));
        break;
      case 2:
        key.append(random.nextInt(9));
        break;
      }
    }
    authNum = key.toString();
  }

  public MimeMessage createEmailForm(String email) throws MessagingException, UnsupportedEncodingException {

    createCode();
    String setFrom = "grow0728@naver.com";
    String toEmail = email;
    String title = "PageFlow 회원가입 인증 번호";

    MimeMessage message = emailSender.createMimeMessage();

    // 발신자 이름을 'PageFlow 인증센터'로 설정
    message.setFrom(new InternetAddress(setFrom, "PageFlow 인증센터"));

    message.addRecipients(MimeMessage.RecipientType.TO, toEmail);
    message.setSubject(title);
    message.setText(setContext(authNum), "utf-8", "html");

    return message;
  }

  public String sendEmail(String toEmail) throws MessagingException, UnsupportedEncodingException {

    MimeMessage emailForm = createEmailForm(toEmail);
    emailSender.send(emailForm);

    return authNum;
  }

  public String setContext(String code) {
    Context context = new Context();
    context.setVariable("code", code);
    return templateEngine.process("mail", context); // mail.html
  }

}
