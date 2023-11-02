package com.pageflow.service.cart;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.pageflow.dao.cart.*;
import com.pageflow.entity.cart.*;

@Service
public class CartService {
  @Autowired
  private CartDao cartDao;
  
//장바구니 추가
 public Boolean addCart(Cart cart) {
   Integer result = cartDao.add(cart);
   return result == 1;
 }
 
 // 특정 사용자의 장바구니 목록 가져오기
 public List<Cart> getCartByMemberId(String memberId) {
   return cartDao.findByUsername(memberId);
 }
 
 // 장바구니에서 특정 상품 제거
 public Boolean removeCartItem(Long cno, String memberId) {
   int result = cartDao.deleteByCnoAndMemberId(cno, memberId);
   return result > 0;
 }
 
 // 장바구니 내 특정 상품 수량 변경
 public Boolean updateCartItemCount(Long cartCount, Long cno, String memberId) {
   int result = cartDao.updateCartCountByCnoAndMemberId(cartCount, cno, memberId);
   return result > 0;
 }
 
 // 장바구니 내 특정 상품 조회
 public Cart getCartItemById(Long cno) {
   return cartDao.findById(cno);
 }
 
 // 사용자의 장바구니에 있는 책들의 총 가격 계산
 public Long calculateTotalPrice(String memberId) {
   Long totalPrice = cartDao.sumByUsername(memberId);
   return totalPrice != null ? totalPrice : 0L;
 }
 
 // 장바구니 상품 개수 추가
 public Boolean increaseCartItem(Long cno, String memberId) {
   Integer result = cartDao.increase(cno, memberId);
   return result != null && result > 0;
 }
 
 // 장바구니 상품 개수 감소
 public Boolean decreaseCartItem(Long cno, String memberId) {
   Integer result = cartDao.decrease(cno, memberId);
   return result != null && result > 0;
 }
}
