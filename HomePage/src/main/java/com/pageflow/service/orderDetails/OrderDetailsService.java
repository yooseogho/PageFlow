package com.pageflow.service.orderDetails;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.pageflow.dao.orderDetails.*;
import com.pageflow.entity.orderDetails.*;

@Service
public class OrderDetailsService {
  @Autowired
  private OrderDetailsDao orderDetailsDao;

  /** 주문 번호를 통해서 주문 상세 목록보기 */
  public List<OrderDetails> list(Long ono) {
    return orderDetailsDao.findAllByOno(ono);
  }
  
  /** 주문 취소로 변경 */
  public Boolean updateCancel(Long odno) {
	  OrderDetails od = orderDetailsDao.findByOdno(odno);
	  od.setOrderStatus("취소 완료");
	  return orderDetailsDao.orderCancelByOdno(od) == 1;
  }
  
  /** 주문 확정으로 변경 */
  public Boolean updateConfirm(Long odno) {
	  OrderDetails od = orderDetailsDao.findByOdno(odno);
	  od.setOrderStatus("주문 확정");
	  return orderDetailsDao.orderConfirmByOdno(od) == 1;
  }
  
  /** 주문 상세보기 */
  public OrderDetails read(Long odno) {
	  return orderDetailsDao.findByOdno(odno);
  }
  
  /** 주문 완료 상태보기 */
  public Long orderCompleteCount(String memberId) {
	  return orderDetailsDao.orderDetailsCompleteCount(memberId);
  }
  
  /** 취소 완료 상태보기 */
  public Long orderCancelCount(String memberId) {
	  return orderDetailsDao.orderDetailsCancelCount(memberId);
  }
  
  /** 구매 확정 상태보기 */
  public Long orderConfirmCount(String memberId) {
	  return orderDetailsDao.orderDetailsConfirmCount(memberId);
  }
  
}
