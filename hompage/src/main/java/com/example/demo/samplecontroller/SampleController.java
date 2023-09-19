package com.example.demo.samplecontroller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class SampleController {
	
	// 장바구니 페이지
	@GetMapping("/cart_page")
	public void cart() {
	}
	
	// 주문/배송목록 페이지
	@GetMapping("/order_list_page")
	public void orderpage() {
	}
	
	// 루트 페이지
	@GetMapping({"/","/page"})
	public ModelAndView page() {
		return new ModelAndView("root_page");
	}
	
	// 회원 포인트 확인하는 페이지
	@GetMapping("/point_page")
	public void pointpage() {
	}
	
	// 내정보보기 페이지
	@GetMapping("/user_info_page")
	public ModelAndView userinfo() {
		return new ModelAndView("user_info_page");
	}
	
	// 1:1 문의 내역 페이지
	@GetMapping("/inquiry_list_page")
	public void inquiry() {
	}
	
	// 로그인 페이지
	@GetMapping("/login_page")
	public void login() {
	}
	
	// 비회원 주문조회 페이지
	@GetMapping("/non_user_order_list")
	public void non_user_order_list() {
	}
	
	// 아이디 찾기 & 비밀번호 찾기 페이지
	@GetMapping("/find_id_page")
	public void find_id_page() {
	}
	
	// 아이디 찾기 결과 페이지
	@GetMapping("/find_id_result_page")
	public void find_id_result_page() {
	}
	
	// 주문/결제 페이지
	@GetMapping("/order_page")
	public void order_page() {
	}

	// 회원 정보 수정 전 비밀번호 확인 페이지
	@GetMapping("/member_check_page")
	public void member_check_page() {
	}
	
	// 회원 정보 수정 페이지
	@GetMapping("/member_edit_page")
	public void member_edit_page() {
	}
	
	// 배송주소록 페이지
	@GetMapping("/member_delivery_list_page")
	public void member_delivery_list_page() {
	}
	
	// 회원등급 페이지
	@GetMapping("/member_grade_page")
	public void member_grade_page() {
	}
	
	// 고객센터 페이지
	@GetMapping("/customer_service_page")
	public void customer_service_page() {
	}
	
	// 1:1 문의하기 페이지
	@GetMapping("customer_qna_page")
	public void customer_qna_page() {
	}
	
	// 회원 가입 페이지
	@GetMapping("/member_create_page")
	public void member_create_page(){
	}
	
	// 공지 사항 페이지
	@GetMapping("/notice_list_page")
	public void notice_list_page() {
	}

}
