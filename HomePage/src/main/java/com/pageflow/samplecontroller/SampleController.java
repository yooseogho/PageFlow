package com.pageflow.samplecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
  // 관리자 페이지
  @GetMapping("/admin_page")
  public void admin_page() {
  }


  // 아이디 찾기 & 비밀번호 찾기 페이지
  @GetMapping("/member_find_id_page")
  public void find_id_page() {
  }

  // 아이디 찾기 결과 페이지
  @GetMapping("/member_find_id_result_page")
  public void find_id_result_page() {
  }

  
  @GetMapping("/mail_code_check_page")
  public ModelAndView mailCodeCheckPage() {
    return new ModelAndView("mail_code_check_page");
  }
  
}
