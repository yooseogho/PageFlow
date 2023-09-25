package com.example.demo.controller.orders;

import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.orders.*;
import com.example.demo.entity.orders.*;
import com.example.demo.service.orders.*;

@Controller
@RequestMapping("/orders")
public class OrdersController {
  @Autowired
  private OrdersService ordersService;

  // 1. 주문내역 저장
  @PostMapping("/save")
  public String saveOrder(@ModelAttribute Orders orders) {
    boolean isSuccess = ordersService.saveOrder(orders);

    if (isSuccess) {
      return "redirect:/orders"; // 주문내역 저장 성공 시 주문내역 목록 페이지로 리다이렉션
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 2. 주문내역 전체 보기 (특정 회원의 주문 목록)
  @GetMapping("/all/{memberId}")
  public String getAllOrdersForMember(@PathVariable String memberId, Model model) {
    List<OrdersDto> orders = ordersService.getAllOrdersForMember(memberId);

    if (orders != null) {
      model.addAttribute("orders", orders); // 모델에 주문내역 목록을 추가
      return "order-list"; // 주문내역 목록을 표시하는 템플릿 반환
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 3. 주문내역 상세 보기
  @GetMapping("/{ono}")
  public String getOrderDetails(@PathVariable Long ono, Model model, Principal principal) {
    Orders order = ordersService.getOrderDetails(principal.getName(), ono);

    if (order != null) {
      model.addAttribute("order", order); // 모델에 주문내역 상세 정보를 추가
      return "order-details"; // 주문내역 상세 정보를 표시하는 템플릿 반환
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 4. 주문 정보 삭제
  @PostMapping("/{ono}/delete")
  public String deleteOrder(@PathVariable Long ono, Principal principal) {
    boolean isSuccess = ordersService.deleteOrder(ono, principal.getName());

    if (isSuccess) {
      return "redirect:/orders"; // 주문 정보 삭제 성공 시 주문내역 목록 페이지로 리다이렉션
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }

  // 5. 모든 주문내역 조회
  @GetMapping
  public String getAllOrders(Model model) {
    List<Orders> orders = ordersService.getAllOrders();

    if (orders != null) {
      model.addAttribute("orders", orders); // 모델에 주문내역 목록을 추가
      return "order-list"; // 주문내역 목록을 표시하는 템플릿 반환
    } else {
      // 실패한 경우 오류 처리를 수행
      return "?error";
    }
  }
}
