package com.pageflow.service.orders;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.pageflow.dao.member.*;
import com.pageflow.dao.orderDetails.*;
import com.pageflow.dao.orders.*;
import com.pageflow.dto.cart.*;
import com.pageflow.dto.orders.*;
import com.pageflow.entity.member.*;
import com.pageflow.entity.orderDetails.*;
import com.pageflow.entity.orders.*;

@Service
public class OrdersService {
  @Autowired
  private OrdersDao ordersDao;

  @Autowired
  private MemberDao memberDao;

  @Autowired
  private OrderDetailsDao orderDetailsDao;

  // 1. 주문 추가
  public Boolean add(Orders orders, String memberId, List<CartDto.Select> cartList) {
    Member member = memberDao.findById(memberId);
    orders.setMemberId(member.getMemberId());
    if (ordersDao.save(orders) != 1) {
      return false;
    }

    for (CartDto.Select cartItem : cartList) {
      OrderDetails orderDetails = new OrderDetails();
      orderDetails.setOno(orders.getOno());
      orderDetails.setBno(cartItem.getBno());
      orderDetails.setOrderCount(cartItem.getCartCount()); // 주문 수량 설정
      orderDetails.setOrderTotal(cartItem.getAmount()); // 주문 총액 설정
      orderDetails.setBookTitle(cartItem.getBookTitle()); // 책 제목 설정
      orderDetails.setOrderStatus("주문 완료"); // 주문 상태 설정
      orderDetails.setBookImage(cartItem.getBookImage());

      orderDetailsDao.save(orderDetails);
    }

    return true;
  }

  // 2. 주문 확인
  public Orders findOrder(Long ono) {
    return ordersDao.findByOno(ono);
  }

  // 3. 주문 목록
  public List<OrdersDto.OrdersList> getOrdersList(String memberId) {
    Member member = memberDao.findById(memberId);
    List<OrdersDto.OrdersList> orders = ordersDao.findAll(member.getMemberId());

    System.out.println(orders);
    for (OrdersDto.OrdersList order : orders) {
      order.setMemberId(member.getMemberId());
      List<OrderDetails> details = orderDetailsDao.findAllByOno(order.getOno());
      order.setOrderDetails(details);
      System.out.println(orders);
    }
    return orders;
  }

  // 4. 주문 읽기
  public OrdersDto.Read readOrders(Long ono, String memberId) {

    Orders orders = ordersDao.findByOno(ono);

    OrdersDto.Read read = ordersDao.read(orders.getOno());

    if (read != null) {
      List<OrderDetails> details = orderDetailsDao.findAllByOno(ono);
      read.setOrderDetails(details);
    }

    return read;

  }

}