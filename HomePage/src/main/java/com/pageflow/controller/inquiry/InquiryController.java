package com.pageflow.controller.inquiry;

import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.core.context.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.pageflow.dto.inquiry.*;
import com.pageflow.dto.inquiry.InquiryDto.*;
import com.pageflow.dto.memberGrade.*;
import com.pageflow.entity.inquiry.*;
import com.pageflow.entity.member.*;
import com.pageflow.service.inquiry.*;
import com.pageflow.service.member.*;
import com.pageflow.service.memberGrade.*;

@Secured("ROLE_USER")
@Controller
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberGradeService gradeService;

	// 문의사항 리스트 페이지
	@GetMapping("/customer_inquiry_list_page")
	public ModelAndView getInquiryListPage(Principal principal, Model model) {
		String memberId = principal.getName();
		Member member = memberService.findById(memberId);
		
	    // MemberGradeDto.MemberInfoDto 객체에서 gradeCode를 가져옵니다.
	    MemberGradeDto.MemberInfoDto memberInfo = memberService.getMemberInfo(principal.getName());
	    Long gradeCode = memberInfo.getGradeCode();

	    // gradeCode를 이용해서 gradeName을 가져옵니다.
	    String gradeName = gradeService.getGradeNameByCode(gradeCode);
		
		
		List<Read> inquiryDtos = inquiryService.getInquiriesByMemberId(principal.getName());
		ModelAndView mav = new ModelAndView("customer_inquiry_list_page");
		mav.addObject("inquirys", inquiryDtos);
		model.addAttribute("member", member);
		model.addAttribute("gradeName", gradeName);

		return mav;
	}

	// 문의사항 리스트 페이지
	@GetMapping("/api/customer_inquiry_list_page")
	public ResponseEntity<List<InquiryDto.Read>> getInquiryList(@RequestParam(required = false) String status) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = null;

		if (principal instanceof UserDetails) {
			memberId = ((UserDetails) principal).getUsername();
		} else {
			// 로그인하지 않은 사용자에 대한 처리
			// 예: 로그인 페이지로 리다이렉트
		}

		List<InquiryDto.Read> inquiries = inquiryService.getInquiriesByStatusAndMemberId(status, memberId);
		return new ResponseEntity<>(inquiries, HttpStatus.OK);
	}

	// 1:1 문의하기 페이지
	@GetMapping("/customer_inquiry_write_page")
	public String customer_inquiry_write_page(Principal principal, Model model) {
		String memberId = principal.getName(); // 현재 로그인한 사용자의 아이디를 가져옵니다.
		Member member = memberService.findById(memberId); // 사용자의 정보를 가져옵니다.
		model.addAttribute("member", member); // 사용자 정보를 모델에 추가합니다.
		return "/customer_inquiry_write_page"; // JSP 페이지 이름을 반환합니다.
	}

	// 유저 문의사항 작성
	@PostMapping("/customer_inquiry_write_page")
	public String createInquiry(@ModelAttribute InquiryDto.Create inquiryDtoCreate, boolean notifyRequest,
			RedirectAttributes redirectAttributes, Principal principal) {

		if (principal != null) {
			String memberId = principal.getName();

			try {
				Boolean result = inquiryService.createInquiry(inquiryDtoCreate.toEntity(memberId));

				if (result) {
					redirectAttributes.addFlashAttribute("successMessage", "문의사항이 등록되었습니다.");
					return "redirect:/customer_inquiry_list_page";
				} else {
					redirectAttributes.addFlashAttribute("errorMessage", "문의사항 등록에 실패했습니다.");
					return "redirect:/customer_inquiry_write_page";
				}
			} catch (IllegalArgumentException e) {
				redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
				return "redirect:/customer_inquiry_write_page";
			}
		} else {
			return "redirect:/error";
		}
	}

	// 문의사항 수정 양식 표시
	@GetMapping("/customer_inquiry_edit_page/{inno}")
	public String showEditForm(@PathVariable Long inno, Principal principal, Model model) {
		Inquiry inquiry = inquiryService.getInquiryByInno(inno);
		String memberId = principal.getName(); // 현재 로그인한 사용자의 아이디를 가져옵니다.
		Member member = memberService.findById(memberId); // 사용자의 정보를 가져옵니다.

		if (inquiry != null) {
			model.addAttribute("inquiry", inquiry);
			model.addAttribute("member", member); // 사용자 정보를 모델에 추가합니다.
			return "/customer_inquiry_edit_page";
		} else {
			return "?error";
		}

	}

	// 문의사항 수정 처리
	@PostMapping("/customer_inquiry_edit_page/{inno}")
	public String editInquiry(@PathVariable Long inno, @RequestParam String inquiryType,
			@RequestParam String inquiryTitle, @RequestParam String content) {

		boolean isSuccess = inquiryService.updateInquiryContent(inno, inquiryType, inquiryTitle, content);
		if (isSuccess) {
			// 수정 성공 시 메시지를 추가하고 상세 정보 페이지로 리다이렉트
			return "redirect:/customer_inquiry_list_page";
		} else {
			return "redirect:/error";
		}
	}

	// 문의사항 삭제 처리
	@DeleteMapping("/customer_inquiry_delete/{inno}")
	@ResponseBody // 추가된 애노테이션
	public ResponseEntity<?> deleteInquiry(@PathVariable Long inno) {
		Boolean result = inquiryService.deleteInquiry(inno);

		if (result) {
			// 삭제 성공 시 JSON 형식으로 성공 메시지 반환
			return new ResponseEntity<>("문의사항이 삭제되었습니다.", HttpStatus.OK);
		} else {
			// 삭제 실패 시 JSON 형식으로 오류 메시지 반환
			return new ResponseEntity<>("문의사항 삭제에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	/*
	 * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
	 * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
	 */
}
