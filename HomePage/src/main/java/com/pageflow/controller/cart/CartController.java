package com.pageflow.controller.cart;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.pageflow.entity.cart.*;
import com.pageflow.service.cart.*;

@Controller
@RequestMapping("/cart")
public class CartController {
  @Autowired
  private CartService cartService;

  // 장바구니 목록 조회
  @GetMapping
  public String viewCart(Model model, @RequestParam String memberId) {
    List<Cart> cartItems = cartService.getCartByMemberId(memberId);
    Long totalPrice = cartService.calculateTotalPrice(memberId);
    model.addAttribute("cartItems", cartItems);
    model.addAttribute("totalPrice", totalPrice);
    return "cart/view";
  }

  // 장바구니에 상품 추가
  @PostMapping("/add")
  public String addToCart(@ModelAttribute Cart cart) {
    boolean isSuccess = cartService.addCart(cart);
    if (isSuccess) {
      return "redirect:/cart?memberId=" + cart.getMemberId();
    } else {
      // 추가 실패 처리
      return "error";
    }
  }

  // 장바구니에서 상품 제거
  @PostMapping("/remove")
  public String removeFromCart(@RequestParam Long cno, @RequestParam String memberId) {
    boolean isSuccess = cartService.removeCartItem(cno, memberId);
    if (isSuccess) {
      return "redirect:/cart?memberId=" + memberId;
    } else {
      // 제거 실패 처리
      return "error";
    }
  }

  // 장바구니 상품 수량 변경
  @PostMapping("/update-count")
  public String updateCartItem(@RequestParam Long cartCount, @RequestParam Long cno, @RequestParam String memberId) {
    boolean isSuccess = cartService.updateCartItemCount(cartCount, cno, memberId);
    if (isSuccess) {
      return "redirect:/cart?memberId=" + memberId;
    } else {
      // 변경 실패 처리
      return "error";
    }
  }

  // 결제 페이지로 이동
  @GetMapping("/checkout")
  public String checkout(@RequestParam String memberId, Model model) {
    List<Cart> cartItems = cartService.getCartByMemberId(memberId);
    Long totalPrice = cartService.calculateTotalPrice(memberId);
    model.addAttribute("cartItems", cartItems);
    model.addAttribute("totalPrice", totalPrice);
    return "cart/checkout";
  }

  // 장바구니 상품 개수 추가
  @PostMapping("/increase")
  public String increaseCartItem(@RequestParam Long cno, @RequestParam String memberId) {
    boolean isSuccess = cartService.increaseCartItem(cno, memberId);
    if (isSuccess) {
      return "redirect:/cart?memberId=" + memberId;
    } else {
      // 추가 실패 처리
      return "error";
    }
  }

  // 장바구니 상품 개수 감소
  @PostMapping("/decrease")
  public String decreaseCartItem(@RequestParam Long cno, @RequestParam String memberId) {
    boolean isSuccess = cartService.decreaseCartItem(cno, memberId);
    if (isSuccess) {
      return "redirect:/cart?memberId=" + memberId;
    } else {
      // 감소 실패 처리
      return "error";
    }
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
