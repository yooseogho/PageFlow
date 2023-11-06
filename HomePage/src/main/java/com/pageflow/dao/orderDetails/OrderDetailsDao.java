package com.pageflow.dao.orderDetails;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.entity.orderDetails.*;

@Mapper
public interface OrderDetailsDao {
  /** Orders 일련번호 */
  @SelectKey(statement = "select order_details_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "odno")

  @Insert("insert into order_details values(#{odno}, #{bno}, #{ono}, #{orderCount}, #{orderTotal}, #{bookTitle}, #{orderStatus}, #{bookImage})")
  public Long save(OrderDetails orderdetails);

  /* 주문 목록에서 주문 상세 목록 보여주기 */
  @Select("select * from order_details where ono = #{ono}")
  public List<OrderDetails> findAllByOno(Long ono);

}
