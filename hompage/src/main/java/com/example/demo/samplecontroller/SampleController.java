package com.example.demo.samplecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {

	// 장바구니 페이지
	@GetMapping("/cart_page")
	public void cart() {
	}

	// 1:1 문의 내역 페이지
	@GetMapping("/customer_inquiry_list_page")
	public void inquiry() {
	}

	// 1:1 문의하기 페이지
	@GetMapping("customer_qna_page")
	public void customer_qna_page() {
	}

	// 고객센터 페이지
	@GetMapping("/customer_service_page")
	public void customer_service_page() {
	}

	// 회원 정보 수정 전 비밀번호 확인 페이지
	@GetMapping("/member_check_page")
	public void member_check_page() {
	}

	// 회원 가입 페이지
	@GetMapping("/member_create_page")
	public void member_create_page() {
	}

	// 회원 가입 성공 페이지
	@GetMapping("member_create_success_page")
	public void member_create_success_page() {
	}

	// 배송주소록 페이지
	@GetMapping("/member_delivery_list_page")
	public void member_delivery_list_page() {
	}

	// 회원 정보 수정 페이지
	@GetMapping("/member_edit_page")
	public void member_edit_page() {
	}

	// 아이디 찾기 & 비밀번호 찾기 페이지
	@GetMapping("/member_find_id_page")
	public void find_id_page() {
	}

	// 아이디 찾기 결과 페이지
	@GetMapping("/member_find_id_result_page")
	public void find_id_result_page() {
	}

	// 회원등급 페이지
	@GetMapping("/member_grade_page")
	public void member_grade_page() {
	}

	// 내정보보기 페이지
	@GetMapping("/member_info_page")
	public void member_info_page() {
	}
	
	// 로그인 페이지
	@GetMapping("/member_login_page")
	public void login() {
	}

	// 회원 포인트 확인하는 페이지
	@GetMapping("/member_point_page")
	public void pointpage() {
	}
	
	// 비회원 주문조회 페이지
	@GetMapping("/non_user_order_list_page")
	public void non_user_order_list() {
	}
	
	// 주문/배송목록 페이지
	@GetMapping("/order_list_page")
	public void orderpage() {
	}
	
	// 주문/결제 페이지
	@GetMapping("/order_page")
	public void order_page() {
	}
	
	// 주문 완료 페이지
	@GetMapping("order_success_page")
	public void order_success_page() {
	}
	
	// 루트 페이지
	@GetMapping({ "/", "/page" })
	public ModelAndView page() {
		return new ModelAndView("welcome_page");
	}
	
	// 공지 사항 페이지
	@GetMapping("/notice_list_page")
	public void notice_list_page() {
	}


}
