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

  /* 주문 번호를 통해서 주문 상세 목록보기 */
  public List<OrderDetails> list(Long ono) {
    return orderDetailsDao.findAllByOno(ono);
  }
}
