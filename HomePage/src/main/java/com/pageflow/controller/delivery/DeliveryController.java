package com.pageflow.controller.delivery;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.pageflow.entity.delivery.*;
import com.pageflow.service.delivery.*;

@Controller
public class DeliveryController {
//  @Autowired
//  private DeliveryService deliveryService;
//
////  1. 관리자 권한으로서 모든 배송 정보를 조회
//  @Secured("ROLE_ADMIN")
//  @GetMapping("/listOfDelivery")
//  public ModelAndView listOfDelivery() {
//    List<Delivery> list = deliveryService.findAll();
//
//    ModelAndView modelAndView = new ModelAndView("deliveryList"); // 배송 정보 목록 페이지의 이름 (예: deliveryList.jsp)
//    modelAndView.addObject("deliveries", list); // 모델에 배송 정보 목록 추가
//    return modelAndView;
//  }
//
////  2. 특정 회원으로서 본인의 배송 정보를 조회
//  @GetMapping("/deliveries/{memberId}")
//  public ModelAndView deliveriesForMember(@PathVariable String memberId) {
//    List<Delivery> list = deliveryService.findByMemberId(memberId);
//
//    ModelAndView modelAndView = new ModelAndView("memberDeliveryList"); // 회원별 배송 정보 목록 페이지의 이름 (예:
//                                                                        // memberDeliveryList.jsp)
//    modelAndView.addObject("deliveries", list); // 모델에 회원별 배송 정보 목록 추가
//    return modelAndView;
//  }
//
////  3. 배송 상세 정보 조회
//  @GetMapping("/delivery/{dno}")
//  public ModelAndView getDeliveryDetail(@PathVariable Long dno) {
//    Delivery delivery = deliveryService.findByDno(dno);
//
//    ModelAndView modelAndView = new ModelAndView("deliveryDetail"); // 배송 정보 상세 페이지의 이름 (예: deliveryDetail.jsp)
//    modelAndView.addObject("delivery", delivery); // 모델에 배송 정보 추가
//    return modelAndView;
//  }
//
////  4. 배송 정보 추가
//  @PostMapping("/addDelivery")
//  public ModelAndView addDelivery(@RequestParam Long dno, @RequestParam String memberId, @RequestParam Long zipCode,
//      @RequestParam String receiverName, @RequestParam String deliveryAddress, @RequestParam String secondAddress,
//      @RequestParam String thirdAddress, @RequestParam String receiverTel) {
//
//    Boolean isAdded = deliveryService.add(dno, memberId, zipCode, receiverName, deliveryAddress, secondAddress,
//        thirdAddress, receiverTel);
//
//    ModelAndView modelAndView = new ModelAndView("redirect:/listOfDelivery"); // 배송 정보 목록 페이지로 리다이렉트
//    if (!isAdded) {
//      modelAndView.addObject("error", "배송 정보 추가에 실패했습니다.");
//    }
//    return modelAndView;
//  }
//
////  5. 배송 정보 변경
//  @PostMapping("/updateDelivery")
//  public ModelAndView updateDelivery(@ModelAttribute Delivery delivery) {
//    Boolean isUpdated = deliveryService.update(delivery);
//
//    ModelAndView modelAndView = new ModelAndView("redirect:/listOfDelivery"); // 배송 정보 목록 페이지로 리다이렉트
//    if (!isUpdated) {
//      modelAndView.addObject("error", "배송 정보 수정에 실패했습니다.");
//    }
//    return modelAndView;
//  }
//
////  6. 주문 취소
//  @PostMapping("/deleteDelivery/{dno}")
//  public ModelAndView deleteDelivery(@PathVariable Long dno) {
//    Boolean isDeleted = deliveryService.deleteByDno(dno);
//
//    ModelAndView modelAndView = new ModelAndView("redirect:/listOfDelivery"); // 배송 정보 목록 페이지로 리다이렉트
//    if (!isDeleted) {
//      modelAndView.addObject("error", "배송 정보 삭제에 실패했습니다.");
//    }
//    return modelAndView;
//  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
