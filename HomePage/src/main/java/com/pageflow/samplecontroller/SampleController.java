package com.pageflow.samplecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
	
	// 만화책 목록 페이지
	@GetMapping("/category/comicBook/comic_book")
	public void comic_book() {
	}
	
	// 요리 만화책 목록 페이지
	@GetMapping("/category/comicBook/cooking_comic_book")
	public void cooking_comic_book() {
	}
	
	// 웹툰 만화책 목록 페이지
	@GetMapping("/category/comicBook/webtoon_book")
	public void webtoon_book() {
	}
	
	// 판타지 소설 책 목록 페이지
	@GetMapping("/category/novel/fantasy_novel_book")
	public void fantasy_novel_book() {
	}
	
	// 공포/호러 소설 책 목록 페이지
	@GetMapping("/category/novel/horror_novel_book")
	public void horror_novel_book() {
	}
	
	// 소설 책 목록 페이지
	@GetMapping("/category/novel/novel_book")
	public void novel_book() {
	}
	
	// 드라마/영화 소설 책 목록 페이지
	@GetMapping("/category/novel/original_novel_book")
	public void original_novel_book() {
	}
	
	// 로맨스 소설 책 목록 페이지
	@GetMapping("/category/novel/romance_novel_book")
	public void romance_novel_book() {
	}
	
	// SF/과학 소설 책 목록 페이지
	@GetMapping("/category/novel/science_novel_book")
	public void science_novel_book() {
	}
	
	// 모든 책 목록 페이지
	@GetMapping("/category/book")
	public void book() {
	}
	
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
	
	// 관리자 상품 등록 페이지
	@GetMapping("/admin_product_add_page")
	public void admin_product_add() {
	}
	
	// 관리자 상품 관리 리스트 페이지
	@GetMapping("/admin_product_list_page")
	public void admin_product_list() {
	}
	
	// 장바구니 페이지
	@GetMapping("/cart_page")
	public void cart() {
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

	// 회원 가입 성공 페이지
	@GetMapping("member_create_success_page")
	public void member_create_success_page() {
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

	// 회원등급 페이지
	@GetMapping("/member_grade_page")
	public void member_grade_page() {
	}

	// 회원 포인트 확인하는 페이지
	@GetMapping("/member_point_page")
	public void pointpage() {
	}

	// 프로필 변경 페이지
	@GetMapping("/member_profile_page")
	public void profile_page() {
	}

	// 비회원 주문조회 페이지
	@GetMapping("/non_user_order_list_page")
	public void non_user_order_list() {
	}

	// 주문상세 및 배송지 확인하는 페이지
	@GetMapping("/order_detail_list_page")
	public void order_detail_page() {
	}

	// 주문/배송목록 확인하는 페이지
	@GetMapping("/order_list_page")
	public void order_list_page() {
	}

	// 주문/결제 페이지
	@GetMapping("/order_page")
	public void order_page() {
	}

	// 주문 완료 페이지
	@GetMapping("order_success_page")
	public void order_success_page() {
	}

	// 공지 사항 페이지
	@GetMapping("/notice_list_page")
	public void notice_list_page() {
	}
	
	// 검색 결과에 매칭되는 book 리스트 페이지
	@GetMapping("/product_search_list_page")
	public void product_search_list_page() {
	}
	
	@GetMapping("/mail_code_check_page")
	public ModelAndView mailCodeCheckPage() {
	  return new ModelAndView("mail_code_check_page");
	}

}
