package com.example.demo.service.orders;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.dao.orders.*;
import com.example.demo.entity.orders.*;

@Service
public class OrdersService {
  @Autowired
  private OrdersDao ordersDao;
  

  // 1. 주문내역 저장
  public Boolean saveOrder(Orders orders) {
    if (orders == null) {
      return false;
    }
    Integer savedRows = ordersDao.save(orders);
    return savedRows == 1;
  }

  // 2. 주문내역 전체 보기 (특정 회원의 주문 목록)
  public List<Orders> getAllOrdersForMember(String memberId) {
    if (memberId == null) {
      return null;
    }
    return ordersDao.findAllOrders(memberId);
  }

  // 3. 주문내역 상세 보기
//  public Orders getOrderDetails(String memberId, Long ono) {
//    if (ono == null) {
//      return null;
//    }
//    return ordersDao.findByOrderDetails(memberId, ono);
//  }

  // 4. 주문 정보 삭제
  public Boolean deleteOrder(Long ono, String memberId) {
    if (ono == null) {
      return false;
    }
    
    Integer deletedRows = ordersDao.deleteByOrders(ono, memberId);
    return deletedRows == 1;
  }

  // 5. 모든 주문내역 조회
  public List<Orders> getAllOrders() {
    return ordersDao.getAllOrders();
  }
}
