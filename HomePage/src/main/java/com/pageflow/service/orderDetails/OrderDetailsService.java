package com.pageflow.service.orderDetails;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pageflow.dao.orderDetails.OrderDetailsDao;
import com.pageflow.dao.orders.OrdersDao;
import com.pageflow.dto.orderDetails.OrderDetailsDto;
import com.pageflow.entity.orderDetails.OrderDetails;
import com.pageflow.entity.orders.Orders;

@Service
public class OrderDetailsService {
  @Autowired
  private OrderDetailsDao orderDetailsDao;
  @Autowired
  private OrdersDao ordersDao;

  
  /** 주문 번호를 통해서 주문 상세 목록보기 */
  public List<OrderDetails> list(Long ono) {
    return orderDetailsDao.findAllByOno(ono);
  }
  
  /** 주문 취소로 변경 */
  public Boolean updateCancel(Long odno) {
	    OrderDetails od = orderDetailsDao.findByOdno(odno);
	    if (od == null) {
	        System.out.println("No order details found with odno: " + odno);
	        return false;
	    }
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
  
  /** 주문 순 나열 */
  public List<OrderDetailsDto.ManyOrder> manyOrder() {
	  return orderDetailsDao.manyOrder();
  }
  
  /** 
   * 주어진 주문 상세 번호(odno)에 해당하는 주문 상세 정보를 조회합니다.
   * 11-17  유석호 주문취소 시 포인트 반환시 활용  */
  public OrderDetails readOrderDetails(Long odno) {
	    return orderDetailsDao.findByOdno(odno);
	}
  
}
