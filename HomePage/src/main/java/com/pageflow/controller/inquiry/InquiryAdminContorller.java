package com.pageflow.controller.inquiry;

import java.security.*;
import java.time.*;
import java.util.*;
import java.util.stream.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.pageflow.dto.inquiry.*;
import com.pageflow.entity.inquiry.*;
import com.pageflow.service.inquiry.*;

@Secured("ROLE_ADMIN")
@Controller
public class InquiryAdminContorller {
	@Autowired
	private InquiryService inquiryService;

	// 관리자 1:1 문의 리스트 페이지
	@GetMapping("/admin_inquiry_list_page")
	public String showAdminPage(Model model, Principal principal) {
		List<Inquiry> inquiries = inquiryService.getAllInquiries();
		List<InquiryDto.Read> inquiryDtos = inquiries.stream().map(inquiry -> {
			String inquiryStatus;
			if (inquiry.getInquiryAnswer() == null || inquiry.getInquiryAnswer().isEmpty()) {
				inquiryStatus = "준비중";
			} else if (!"완료".equals(inquiry.getInquiryAnswer())) {
				inquiryStatus = "답변완료";
			} else {
				inquiryStatus = "처리중";
			}
			return new InquiryDto.Read(inquiry.getInno(), inquiry.getInquiryTitle(), inquiry.getContent(),
					inquiry.getInquiryType(), LocalDate.now(), inquiry.getInquiryAnswer(), LocalDate.now(),
					inquiryStatus, principal.getName());
		}).collect(Collectors.toList());
		model.addAttribute("inquirys", inquiryDtos);
		return "/admin_inquiry_list_page";
	}

	// 관리자 1:1 문의하기 답변 페이지
	@GetMapping("/admin_inquiry_answer_page/{inno}")
	public String admin_inquiry_answer(@PathVariable Long inno, Model model) {
		Inquiry inquiry = inquiryService.getInquiryByInno(inno);

		if (inquiry == null) {
			return "redirect:/error";
		}

		String memberId = inquiry.getMemberId(); // Inquiry 객체에서 memberId 가져오기
		model.addAttribute("inquiry", inquiry);
		model.addAttribute("memberId", memberId); // 사용자 ID를 모델에 추가
		return "/admin_inquiry_answer_page";
	}

	// 관리자 답변 작성
	@PostMapping("/admin_inquiry_answer_page/{inno}")
	public String createAnswer(@PathVariable Long inno, @RequestParam String inquiryAnswer,
			RedirectAttributes redirectAttributes) {
		boolean isSuccess = inquiryService.createAnswer(inno, inquiryAnswer);

		if (isSuccess) {
			redirectAttributes.addFlashAttribute("message", "답변이 성공적으로 등록되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "답변 등록에 실패하였습니다.");
		}

		return "redirect:/admin_inquiry_list_page";
	}
}
