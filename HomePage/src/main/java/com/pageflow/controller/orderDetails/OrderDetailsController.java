package com.pageflow.controller.orderDetails;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.pageflow.entity.orderDetails.*;
import com.pageflow.service.orderDetails.*;

@Controller
public class OrderDetailsController {
//  @Autowired
//  private OrderDetailsService detailService;
//
//  @GetMapping("/orderDetails/add")
//  public String showAddOrderDetailsForm() {
//    return "add-order-details";
//  }
//
//  @PostMapping("/orderDetails/add")
//  public String addOrderDetails(@ModelAttribute OrderDetails orderDetails) {
//    return "redirect:/orderDetails";
//  }
//
//  @GetMapping("/orderDetails/{ono}")
//  public List<OrderDetails> getOrderDetailsByOno(@PathVariable Long ono) {
//    // 특정 주문의 모든 주문 상세 정보 조회
//    List<OrderDetails> orderDetails = detailService.selectOrderDetailsByOno(ono);
//    if (orderDetails == null || orderDetails.isEmpty()) {
//      return null;
//    }
//    return orderDetails;
//  }
//
//  @GetMapping("/orderDetails/member/{memberId}")
//  public List<OrderDetails> getOrderDetailsByMemberId(@PathVariable String memberId, Long ono) {
//    // 회원의 주문 내역 조회
//    List<OrderDetails> orderDetails = detailService.findDetailsByMemberId(memberId, ono);
//    if (orderDetails == null || orderDetails.isEmpty()) {
//      return null;
//    }
//    return orderDetails;
//  }
//
//  @PostMapping("/orderDetails/{bno}/cancel")
//  public String cancelOrderDetails(@PathVariable String bno, @RequestParam String memberId) {
//    // 주문 취소
//    return "redirect:/orderDetails";
//  }
//
//  @GetMapping("/orderDetails")
//  public List<OrderDetails> getAllOrderDetails(String memberId, Long ono) {
//    // 전체 주문 상세 정보 조회
//    List<OrderDetails> orderDetails = detailService.getAllOrderDetails(memberId, ono);
////    주문 상세가 없거나 비어있다면 NULL 반환
//    if (orderDetails == null || orderDetails.isEmpty()) {
//      return null;
//    }
//    return orderDetails;
//  }
  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
