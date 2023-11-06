package com.pageflow.controller.cart;

import java.security.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.pageflow.dto.cart.*;
import com.pageflow.service.cart.*;

@Secured("ROLE_USER")
@Controller
public class CartController {
  @Autowired
  private CartService cartService;

  // 1-1. 장바구니 등록
  @PostMapping("/cart/add")
  public ModelAndView add(Long bno, Principal principal, Long cartCount, RedirectAttributes ra,
      HttpServletRequest request) {
    Boolean result = cartService.add(principal.getName(), bno, cartCount);

    if (Boolean.FALSE.equals(result)) {
      ra.addFlashAttribute("msg", "현재 재고량보다 더 많이 장바구니에 담을 수 없습니다.");
      return new ModelAndView("redirect:/book/read?bno=" + bno);
    }

    String referer = request.getHeader("Referer");
    return new ModelAndView("redirect:" + referer);

  }

  // 1-2 여러 도서 장바구니 등록
  @PostMapping("cart/multiAdd")
  public ModelAndView multiadd(Principal principal, CartDto.Add dto, Long cartCount, RedirectAttributes ra,
      HttpServletRequest request) {
    cartService.multiadd(principal.getName(), dto, cartCount);

    String referer = request.getHeader("Referer");
    return new ModelAndView("redirect:" + referer);
  }

  // 2-1. 장바구니 목록
  @GetMapping("/cart/list")
  public ModelAndView list(HttpServletRequest request) {

    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    Long gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    Long count = cartService.count(memberId);
    List<CartDto.Read> cartList = cartService.read(memberId, gradeCode);
    return new ModelAndView("cart_page").addObject("cartList", cartList).addObject("count", count);
  }

  // 2-2 장바구니 목록에서 선택
  @PostMapping("/cart/select")
  @ResponseBody
  public ResponseEntity<List<CartDto.Select>> select(CartDto.Select dto, HttpServletRequest request) {
    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    Long gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체

    Principal principal = request.getUserPrincipal();
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    List<Long> cnos = dto.getCnos();

    if (cnos == null) {
      cnos = new ArrayList<>(); // 또는 다른 기본값 할당
    }

    List<CartDto.Select> cartList = cartService.select(memberId, gradeCode, cnos);

    session.setAttribute("cartList", cartList);
    return ResponseEntity.ok(cartList);
  }

  // 3. 장바구니 개수 증가
  @PostMapping("/cart/increase")
  @ResponseBody
  public ResponseEntity<List<CartDto.Read>> increase(Long bno, Long cno, Principal principal) {
    Boolean result = cartService.increase(bno, cno, principal.getName());
    if (!result) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).build(); // 재고량 초과 시 400 Bad Request 응답
    }

    List<CartDto.Read> cartList = cartService.read(principal.getName(), cno);
    return ResponseEntity.ok(cartList);
  }

  // 4. 장바구니 개수 감소
  @PostMapping("/cart/decrease")
  @ResponseBody
  public ResponseEntity<List<CartDto.Read>> decrease(Long cno, Principal principal, RedirectAttributes ra) {
    Boolean result = cartService.decrease(cno, principal.getName());
    if (!result) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).build(); // 재고량 초과 시 400 Bad Request 응답
    }

    List<CartDto.Read> cartList = cartService.read(principal.getName(), cno);
    return ResponseEntity.ok(cartList);
  }

  // 5. 장바구니 삭제
  @PostMapping("/cart/delete")
  public ModelAndView delete(CartDto.Delete dto) {
    cartService.delete(dto);
    return new ModelAndView("redirect:/cart/list");
  }

}
