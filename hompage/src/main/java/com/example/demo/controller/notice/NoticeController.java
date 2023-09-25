package com.example.demo.controller.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.service.notice.*;
import com.example.demo.entity.notice.*;

import java.util.List;

@Controller
public class NoticeController {
  @Autowired
  private NoticeService noticeService;

  // 공지사항 목록을 표시하는 페이지 매핑
  @GetMapping
  public String showNoticeList(Model model) {
    // NoticeService의 모든 공지사항을 가져옴
    List<Notice> notices = noticeService.getAllNotices();

    model.addAttribute("notices", notices); // 모델에 공지사항 목록을 추가

    return "notice-list"; // 공지사항 목록을 표시하는 템플릿 반환
  }

  // 공지사항 상세 정보 페이지를 표시하는 페이지 매핑
  @GetMapping("/{nno}")
  public String showNoticeDetails(@PathVariable Long nno, Model model) {
    // NoticeService의 공지사항 상세 정보를 가져옴
    Notice notice = noticeService.checkNotice(nno);

    if (notice != null) {
      model.addAttribute("notice", notice); // 모델에 공지사항 상세 정보를 추가
      return "notice-details"; // 공지사항 상세 정보를 표시하는 템플릿 이름을 반환
    } else {
      // 공지사항을 찾을 수 없는 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 공지사항 등록 페이지를 표시하는 페이지 매핑
  @Secured("ROLE_ADMIN")
  @GetMapping("/create")
  public String showCreateNoticeForm() {
    // 공지사항 등록 양식을 표시하는 템플릿 반환
    return "create-notice";
  }

  // 공지사항 등록 요청을 처리하는 매핑
  @Secured("ROLE_ADMIN")
  @PostMapping("/create")
  public String createNotice(@RequestParam String noticeTitle, @RequestParam String noticeContent) {
    // NoticeService의 공지사항 등록 메서드를 호출
    boolean isSuccess = noticeService.insertNotice(noticeTitle, noticeContent);

    if (isSuccess) {
      return "redirect:/notices"; // 공지사항 등록 성공 시 공지사항 목록 페이지로 리다이렉션
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 공지사항 수정 페이지를 표시하는 페이지 매핑
  @Secured("ROLE_ADMIN")
  @GetMapping("/{nno}/edit")
  public String showEditNoticeForm(@PathVariable Long nno, Model model) {
    // NoticeService의 공지사항 상세 정보를 가져옴
    Notice notice = noticeService.checkNotice(nno);

    if (notice != null) {
      model.addAttribute("notice", notice); // 모델에 공지사항 상세 정보를 추가
      return "edit-notice"; // 공지사항 수정 양식을 표시하는 템플릿 반환
    } else {
      // 공지사항을 찾을 수 없는 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 공지사항 수정 요청을 처리하는 매핑
  @Secured("ROLE_ADMIN")
  @PostMapping("/{nno}/edit")
  public String editNotice(@PathVariable Long nno, @RequestParam String noticeTitle,
      @RequestParam String noticeContent) {
    // NoticeService의 공지사항 수정 메서드를 호출
    boolean isSuccess = noticeService.updateNotice(nno, noticeTitle, noticeContent);

    if (isSuccess) {
      return "redirect:/notices/" + nno; // 공지사항 수정 성공 시 해당 공지사항 상세 페이지로 리다이렉션
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 공지사항 삭제 요청을 처리하는 매핑
  @Secured("ROLE_ADMIN")
  @PostMapping("/{nno}/delete")
  public String deleteNotice(@PathVariable Long nno) {
    // NoticeService의 공지사항 삭제 메서드를 호출
    boolean isSuccess = noticeService.deleteNotice(nno);

    if (isSuccess) {
      return "redirect:/notices"; // 공지사항 삭제 성공 시 공지사항 목록 페이지로 리다이렉션
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }
}
