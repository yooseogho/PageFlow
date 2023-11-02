package com.pageflow.controller.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pageflow.entity.inquiry.*;
import com.pageflow.service.inquiry.*;

@Controller
public class InquiryController {
  @Autowired
  private InquiryService inquiryService;

  // 문의사항 상세 정보 조회
//  @GetMapping("/{inno}")
//  public String viewInquiryDetails(@PathVariable Long inno, Model model) {
//    Inquiry inquiry = inquiryService.getInquiryByInno(inno);
//    if (inquiry == null) {
//      // 문의사항이 존재하지 않을 경우 에러 페이지로 리다이렉트 또는 다른 처리 수행
//      return "redirect:/error";
//    }
//
//    model.addAttribute("inquiry", inquiry);
//    return "inquiry/details"; // 상세 정보 페이지로 이동
//  }

  // 문의사항 등록 양식 표시
  @GetMapping("/new")
  public String showInquiryForm() {
    return "inquiry/form"; // 문의사항 등록 양식 페이지로 이동
  }

		  // 문의사항 등록 처리
  		 @Secured("ROLE_USER")
		  @PostMapping("/customer_inquiry_write_page")
		  public String createInquiry(@ModelAttribute Inquiry inquiry, RedirectAttributes redirectAttributes) {
		    Boolean result = inquiryService.createInquiry(inquiry);
		    if (result) {
		      // 등록 성공 시 메시지를 추가하고 성공 페이지로 리다이렉트
		      redirectAttributes.addFlashAttribute("successMessage", "문의사항이 등록되었습니다.");
		      return "redirect:/customer_inquiry_list";
		    } else {
		      // 등록 실패 시 에러 페이지로 리다이렉트 또는 다른 처리 수행
		      return "redirect:/error";
		    }
		  }

  // 문의사항 수정 양식 표시
  @GetMapping("/{inno}/edit")
  public String showEditForm(@PathVariable Long inno, Model model) {
    Inquiry inquiry = inquiryService.getInquiryByInno(inno);
    if (inquiry == null) {
      // 문의사항이 존재하지 않을 경우 에러 페이지로 리다이렉트 또는 다른 처리 수행
      return "redirect:/error";
    }

    model.addAttribute("inquiry", inquiry);
    return "inquiry/edit"; // 수정 양식 페이지로 이동
  }

  // 문의사항 수정 처리
  @PostMapping("/{inno}/edit")
  public String editInquiry(@PathVariable Long inno, @RequestParam String newContent,
      RedirectAttributes redirectAttributes) {
    Boolean result = inquiryService.updateInquiryContent(inno, newContent);
    if (result) {
      // 수정 성공 시 메시지를 추가하고 상세 정보 페이지로 리다이렉트
      redirectAttributes.addFlashAttribute("successMessage", "문의사항이 수정되었습니다.");
      return "redirect:/inquiries/" + inno;
    } else {
     // 수정 실패 시 에러 페이지로 리다이렉트 또는 다른 처리 수행
      return "redirect:/error";
    }
  }

  // 문의사항 삭제 처리
  @PostMapping("/{inno}/delete")
  public String deleteInquiry(@PathVariable Long inno, RedirectAttributes redirectAttributes) {
    Boolean result = inquiryService.deleteInquiry(inno);
    if (result) {
      // 삭제 성공 시 메시지를 추가하고 문의사항 목록 페이지로 리다이렉트
      redirectAttributes.addFlashAttribute("successMessage", "문의사항이 삭제되었습니다.");
      return "redirect:/inquiries";
    } else {
      // 삭제 실패 시 에러 페이지로 리다이렉트 또는 다른 처리 수행
      return "redirect:/error";
    }
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
