package com.pageflow.controller.notice;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.pageflow.dao.notice.*;
import com.pageflow.dto.notice.*;
import com.pageflow.entity.notice.*;
import com.pageflow.service.notice.*;

@ControllerAdvice
@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeDao noticeDao;

	// 공지사항 상세 정보 페이지를 표시하는 페이지 매핑
	@GetMapping("/customer_notice_read_page")
	public String showNoticeDetails(@RequestParam("nno") Long nno, Model model) {
		// NoticeService의 공지사항 상세 정보를 가져옴
		Notice notice = noticeService.checkNotice(nno);

		if (notice != null) {
			Notice prevNotice = noticeService.findPrev(nno);
			Notice nextNotice = noticeService.findNext(nno);

			model.addAttribute("notice", notice); // 모델에 공지사항 상세 정보를 추가
			model.addAttribute("prevNotice", prevNotice);
			model.addAttribute("nextNotice", nextNotice);

			return "customer_notice_read_page"; // 공지사항 상세 정보를 표시하는 템플릿 이름을 반환
		} else {
			// 공지사항을 찾을 수 없는 경우 오류 처리를 수행
			return "?error";
		}
	}

	// 공지사항 등록 페이지를 표시하는 페이지 매핑
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin_notice_write_page")
	public String showCreateNoticeForm() {
		// 공지사항 등록 양식을 표시하는 템플릿 반환
		return "admin_notice_write_page";
	}

	// 공지사항 등록 요청을 처리하는 매핑
	@Secured("ROLE_ADMIN")
	@PostMapping("/admin_notice_write_page")
	public String createNotice(@RequestParam String noticeTitle, @RequestParam String noticeContent) {
		// NoticeService의 공지사항 등록 메서드를 호출
		boolean isSuccess = noticeService.insertNotice(noticeTitle, noticeContent);

		if (isSuccess) {
			return "redirect:/customer_notice_list_page"; // 공지사항 등록 성공 시 공지사항 목록 페이지로 리다이렉트
		} else {
			// 실패한 경우 오류 처리를 수행
			return "?error";
		}
	}

	// 공지사항 수정 페이지를 표시하는 페이지 매핑
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin_notice_edit_page/{nno}")
	public String showEditNoticeForm(@PathVariable Long nno, Model model) {
		// NoticeService의 공지사항 상세 정보를 가져옴
		Notice notice = noticeService.checkNotice(nno);

		if (notice != null) {
			model.addAttribute("notice", notice); // 모델에 공지사항 상세 정보를 추가
			return "admin_notice_edit_page"; // 공지사항 수정 양식을 표시하는 템플릿 반환
		} else {
			// 공지사항을 찾을 수 없는 경우 오류 처리를 수행
			return "?error";
		}
	}

	// 공지사항 수정 요청을 처리하는 매핑
	@Secured("ROLE_ADMIN")
	@PostMapping("/admin_notice_edit_page/{nno}")
	public String editNotice(@PathVariable Long nno, @RequestParam String noticeTitle,
			@RequestParam String noticeContent) {
		// NoticeService의 공지사항 수정 메서드를 호출
		boolean isSuccess = noticeService.updateNotice(nno, noticeTitle, noticeContent);

		if (isSuccess) {
			return "redirect:/customer_notice_read_page?nno=" + nno; // 공지사항 수정 성공 시 해당 공지사항 상세 페이지로 리다이렉트
		} else {
			// 실패한 경우 오류 처리를 수행
			return "?error";
		}
	}

	// 공지사항 삭제 요청하는 매핑
	@Secured("ROLE_ADMIN")
	@DeleteMapping("/admin_notice_delete/{nno}")
	@ResponseBody // JSON 형태의 응답을 반환하기 위해 @ResponseBody 어노테이션 추가
	public Map<String, Object> deleteNotice(@PathVariable Long nno) { // 응답 타입을 Map<String, Object>로 변경
		boolean isSuccess = noticeService.deleteNotice(nno);

		Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map 생성

		if (isSuccess) {
			response.put("success", true); // 성공 여부 정보 추가
		} else {
			response.put("success", false); // 실패 정보 추가
			response.put("message", "삭제 처리 중 오류 발생"); // 실패 메시지 추가
		}

		return response; // 응답 데이터 반환
	}

	// 관리자 공지사항 리스트 보여주는 매핑
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin_notice_list_page")
	public String list(@RequestParam(defaultValue = "1") Long pageno, Model model) {
		Long countOfNotices = noticeService.countNotices();
		Page page = noticeService.list(pageno);
		List<Notice> notices = page.getNotices();

		model.addAttribute("countOfNotices", countOfNotices);
		model.addAttribute("page", page);
		model.addAttribute("notices", notices);

		return "admin_notice_list_page";
	}

	// 공지사항 리스트 보여주는 매핑
	@GetMapping("/customer_notice_list_page")
	public String customerlist(@RequestParam(defaultValue = "1") Long pageno, Model model) {
		Long countOfNotices = noticeService.countNotices();
		Page page = noticeService.list(pageno);
		List<Notice> notices = page.getNotices();

		model.addAttribute("countOfNotices", countOfNotices);
		model.addAttribute("page", page);
		model.addAttribute("notices", notices);

		return "customer_notice_list_page";
	}

	// 고객센터 페이지 최신순 3개 보여주는 매핑
	@GetMapping("/customer_service_page")
	public String customer_service_page(Model model) {
		// 최신 공지사항 3개 가져오기
		List<Notice> notices = noticeDao.findTop3ByOrderByNoticeWritedayDesc();

		// 모델에 추가해서 JSP로 전달하기
		model.addAttribute("notices", notices);

		return "customer_service_page";
	}

	// footer 공지사항 최신 1개 보여주기
	@ModelAttribute("notice")
	public Notice getNotice() {
		return noticeService.findFirstByNotice();
	}
	/*
	 * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
	 * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
	 */
}
