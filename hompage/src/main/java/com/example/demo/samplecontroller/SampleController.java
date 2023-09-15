package com.example.demo.samplecontroller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class SampleController {

	@GetMapping("/buy_page")
	public void buypage() {
	}

	@GetMapping("/cart_page")
	public void cart() {
	}
	
	@GetMapping("/order_list_page")
	public void orderpage() {
	}
	
	@GetMapping({"/","/page"})
	public ModelAndView page() {
		return new ModelAndView("root_page");
	}
	
	@GetMapping("/point_page")
	public void pointpage() {
	}
	
	@GetMapping("/user_info_page")
	public ModelAndView userinfo() {
		return new ModelAndView("user_info_page");
	}
		
	@GetMapping("/inquiry_page")
	public void inquiry() {
	}
	
	@GetMapping("/login_page")
	public void login() {
	}
	
	@GetMapping("/non_user_order_list")
	public void non_user_order_list() {
	}
	
	@GetMapping("/find_id_page")
	public void find_id_page() {
	}
	
	@GetMapping("/find_id_result_page")
	public void find_id_result_page() {
	}
	
	@GetMapping("/order_page")
	public void order_page() {
	}

	@GetMapping("/member_check_page")
	public void member_check_page() {
	}
	
	@GetMapping("/member_edit_page")
	public void member_edit_page() {
	}
	
	@GetMapping("/member_delivery_list_page")
	public void member_delivery_list_page() {
	}



}
