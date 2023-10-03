package com.example.demo.service.orderDetails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.orderDetails.OrderDetailsDao;
import com.example.demo.entity.orderDetails.OrderDetails;

import java.util.List;

@Service
public class OrderDetailsService {
  @Autowired
  private OrderDetailsDao detailsDao;

  // 주문 상세 정보 생성 (insert)
  public Integer insertOrderDetails(OrderDetails orderDetails) {
    Integer result = detailsDao.saveOrderDetails(orderDetails);
    // insert 실패 시 null 반환
    return (result != null) ? result : null;
  }

  // 특정 주문의 모든 주문 상세 정보 조회
  public List<OrderDetails> selectOrderDetailsByOno(Long ono) {
    return detailsDao.selectOrderDetailsByOno(ono);
  }

  // 회원의 주문 내역 조회
  public List<OrderDetails> findDetailsByMemberId(String memberId, Long ono) {
    List<OrderDetails> orderDetails = detailsDao.findDetailsByMemberId(memberId, ono);
    // 조회 결과가 null이면 null 반환
    return (orderDetails != null) ? orderDetails : null;
  }

  // 주문 상태 변경 (update)
  public Integer changeStatus(Long bno, Long ono) {
    Integer result = detailsDao.changeStatus(bno, ono);
    // update 실패 시 null 반환
    return (result != null) ? result : null;
  }

  // 전체 주문 상세 정보 조회
  public List<OrderDetails> getAllOrderDetails(String memberId, Long ono) {
    return detailsDao.getAllOrderDetails(memberId, ono);
  }
}
