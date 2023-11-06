package com.pageflow.service.cart;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.pageflow.dao.book.*;
import com.pageflow.dao.cart.*;
import com.pageflow.dao.member.*;
import com.pageflow.dao.memberGrade.*;
import com.pageflow.dto.cart.*;
import com.pageflow.entity.cart.*;
import com.pageflow.entity.member.*;

@Service
public class CartService {
  @Autowired
  private CartDao cartDao;

  @Autowired
  private BookDao bookDao;

  @Autowired
  private MemberGradeDao memberGradeDao;

  @Autowired
  private MemberDao memberDao;

  /** 1-1. Cart 생성 */
  public Boolean add(String memberId, Long bno, Long cartCount) {
    Cart cart = cartDao.findCartByMemberIdAndBno(bno, memberId);
    if (cart == null) {
      Long stock = bookDao.findByBno(bno).getStock();

      if (cartCount > stock) {
        return false;
      }
      cart = new Cart(null, bno, memberId, cartCount);
      return cartDao.save(cart) == 1;
    } else {

      Cart currentCart = cartDao.findByCno(cart.getCno());
      Long stock = bookDao.findByBno(bno).getStock();
      if (currentCart.getCartCount() + cartCount > stock) {
        return false;
      }
      return cartDao.multiIncrease(cart.getCno(), memberId, cartCount) == 1;
    }
  }

  /** 1-2. Cart 여러개 생성 */
  public Boolean multiadd(String memberId, CartDto.Add dto, Long cartCount) {
    List<Long> bnos = dto.getBnos();
    for (Long bno : bnos) {
      Cart cart = cartDao.findCartByMemberIdAndBno(bno, memberId);
      if (cart == null) {
        Long stock = bookDao.findByBno(bno).getStock();
        if (cartCount > stock) {
          return false;
        }
        cart = new Cart(null, bno, memberId, cartCount);
        if (cartDao.save(cart) != 1) {
          return false;
        }
      } else {
        Cart currentCart = cartDao.findByCno(cart.getCno());
        Long stock = bookDao.findByBno(bno).getStock();
        if (currentCart.getCartCount() + cartCount > stock) {
          return false;
        }
        if (cartDao.multiIncrease(cart.getCno(), memberId, cartCount) != 1) {
          return false;
        }
      }
    }
    return true;
  }

  /** 2. Cart Read 페이지 */
  @Transactional(readOnly = true)
  public List<CartDto.Read> read(String memberId, Long gradeCode) {
    Member member = memberDao.findById(memberId);
    gradeCode = member.getGradeCode();

    List<CartDto.Read> cartList = cartDao.findAllByMemberId(memberId, gradeCode);

    Long totalAmount = 0L;
    Long totalPointEarnings = 0L;
    for (CartDto.Read cart : cartList) {
      cart.setMemberId(memberId);
      Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
      Long bookPrice = cart.getBookPrice();
      Double pointEarningsDouble = bookPrice * pointRate * cart.getCartCount();
      Long pointEarnings = pointEarningsDouble.longValue();
      cart.setPointEarnings(pointEarnings);
      Long amount = bookPrice * cart.getCartCount();
      cart.setAmount(amount);
      totalAmount += amount;
      cart.setTotalAmount(totalAmount);
      totalPointEarnings += pointEarnings;
      cart.setTotalPointEarnings(totalPointEarnings);
    }

    return cartList;

  }

  public List<CartDto.Select> select(String memberId, Long gradeCode, List<Long> cnos) {
    Member member = memberDao.findById(memberId);

    gradeCode = member.getGradeCode();

    CartDto.Select dto = new CartDto.Select();
    dto.setMemberId(member.getMemberId());

    List<CartDto.Select> cartList = cartDao.selectFromCartList(dto, cnos, gradeCode, member.getMemberId());

    Long totalAmount = 0L;
    Long totalPointEarnings = 0L;

    for (CartDto.Select cart : cartList) {
      cart.setMemberId(memberId);
      cart.setGradeCode(gradeCode);
      Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
      Long bookPrice = cart.getBookPrice();
      Double pointEarningsDouble = bookPrice * pointRate * cart.getCartCount();
      Long pointEarnings = pointEarningsDouble.longValue();
      cart.setPointEarnings(pointEarnings);
      Long amount = bookPrice * cart.getCartCount();
      cart.setAmount(amount);
      totalAmount += amount;
      cart.setTotalAmount(totalAmount);
      totalPointEarnings += pointEarnings;
      cart.setTotalPointEarnings(totalPointEarnings);
    }

    return cartList;

  }

  /** 3. 장바구니 개수 증가 */
  public Boolean increase(Long bno, Long cno, String memberId) {
    Long stock = bookDao.findByBno(bno).getStock();
    Cart cart = cartDao.findByCno(cno);
    if (cart.getCartCount() >= stock) {
      return false;
    }
    return cartDao.increase(cno, memberId) == 1;
  }

  /** 4. 장바구니 개수 감소 */
  public Boolean decrease(Long cno, String memberId) {
    Cart cart = cartDao.findByCno(cno);
    if (cart.getCartCount() <= 1) {
      return false;
    }
    return cartDao.decrease(cno, memberId) == 1;
  }

  /** 5. 장바구니 개수 count */
  public Long count(String memberId) {
    return cartDao.cartCountBno(memberId);
  }

  /** 6. 장바구니 삭제 */
  public void delete(CartDto.Delete dto) {
    List<Long> cnos = dto.getCnos();
    for (Long cno : cnos)
      cartDao.delete(cno);
  }

}