/*
 * 10/25 16:09
 * 수정자 : 갈현
 * 수정 내용 : 이메일 파일의 경로 변경
 * *참고*
 * 이메일 파일 경로는 실제로 변경되었음
 * 원본 : src/main/resources/mail.html
 * 수정본 : src/main/resources/toSend/mail.html
 * */

package com.example.demo.email;

import java.io.*;
import java.util.*;
import java.util.stream.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.*;

import org.springframework.core.io.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Service;

import lombok.*;

@Service
@RequiredArgsConstructor
public class EmailService {

  private final JavaMailSender emailSender;
  private String authNum;

  public void createCode(HttpServletRequest request) {
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
    request.getSession().setAttribute("authNum", authNum);
  }

  public MimeMessage createEmailForm(String email, HttpServletRequest request)
      throws MessagingException, UnsupportedEncodingException, IOException {

    createCode(request);
    String setFrom = "pageflow@naver.com";
    String toEmail = email;
    String title = "PageFlow 회원가입 인증 번호";

    MimeMessage message = emailSender.createMimeMessage();

    // 발신자 이름을 'PageFlow 인증센터'로 설정
    message.setFrom(new InternetAddress(setFrom, "PageFlow 인증센터"));

    message.addRecipients(MimeMessage.RecipientType.TO, toEmail);
    message.setSubject(title);

    String htmlContent = readHtmlFile("mail.html");

    // 인증 코드를 세션에서 받아옴
    String authNum = (String) request.getSession().getAttribute("authNum");

    if (authNum == null) {
      throw new IllegalStateException("Authentication code not found in session.");
    }

    htmlContent = htmlContent.replace("{code}", authNum);

    message.setText(htmlContent, "utf-8", "html");

    return message;
  }

  public String sendEmail(String toEmail, HttpServletRequest request)
      throws MessagingException, UnsupportedEncodingException, IOException {
    try {
      MimeMessage emailForm = createEmailForm(toEmail, request);
      emailSender.send(emailForm);

      // 세션에서 인증 코드를 가져옴
      String authNum = (String) request.getSession().getAttribute("authNum");

      if (authNum == null) {
        throw new IllegalStateException("세션에서 인증 코드를 찾을 수 없습니다.");
      }

      return authNum;
    } catch (MessagingException | IOException e) {
      System.out.println(e); // 예외 확인용
      e.printStackTrace();
    }

    // 예외가 발생 후 진행 (이메일 전송 실패)
    return null;
  }

//  이메일 파일 경로 변경
  private String readHtmlFile(String filename) throws IOException {
    Resource resource = new ClassPathResource("toSend/" + filename);
    InputStream in = resource.getInputStream();

    if (in == null) {
      throw new FileNotFoundException("file not found: " + filename);
    }

    try (BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {
      return reader.lines().collect(Collectors.joining(System.lineSeparator()));
    }
  }

}
