package com.pageflow.samplecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
	
	// 관리자 1:1 문의사항 답변 페이지
	@GetMapping("/admin_inquiry_answer_page")
	public void admin_inquiry_answer() {
	}
	
	// 관리자 1:1 문의사항 리스트 페이지
	@GetMapping("/admin_inquiry_list_page")
	public void admin_inquiry_list() {
	}
	
	// 관리자 페이지
	@GetMapping("/admin_page")
	public void admin_page() {
	}
	
	// 1:1 문의 내역 페이지
	@GetMapping("/customer_inquiry_list_page")
	public void inquiry_list() {
	}

	// 1:1 문의하기 페이지
	@GetMapping("customer_inquiry_write_page")
	public void customer_inquiry_write_page() {
	}
	
	// 루트 페이지
	@GetMapping({"/", "/page"})
	public ModelAndView page() {
		return new ModelAndView("index");
	}

	// 배송주소록 페이지
	@GetMapping("/member_delivery_list_page")
	public void member_delivery_list_page() {
	}

	// 아이디 찾기 & 비밀번호 찾기 페이지
	@GetMapping("/member_find_id_page")
	public void find_id_page() {
	}

	// 아이디 찾기 결과 페이지
	@GetMapping("/member_find_id_result_page")
	public void find_id_result_page() {
	}

	// 비회원 주문조회 페이지
	@GetMapping("/non_user_order_list_page")
	public void non_user_order_list() {
	}

	// 주문상세 및 배송지 확인하는 페이지
	@GetMapping("/order_detail_list_page")
	public void order_detail_page() {
	}

	// 공지 사항 페이지
	@GetMapping("/notice_list_page")
	public void notice_list_page() {
	}
	
	@GetMapping("/mail_code_check_page")
	public ModelAndView mailCodeCheckPage() {
	  return new ModelAndView("mail_code_check_page");
	}

}
