package com.pageflow.dao.orders;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.dto.orders.*;
import com.pageflow.entity.orders.*;

@Mapper
public interface OrdersDao {
	/** Orders 일련번호 */
	@SelectKey(statement = "select orders_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "ono")
	
	/** 주문 추가 */
	@Insert("insert into orders values(#{ono}, #{memberId}, #{dno}, sysdate, #{orderPrice}, #{payment}, #{pointEarn})")
	public Long save(Orders orders);
	
	/** 주문페이지 성공 후 주문 Read */
	@Select("select * from orders where ono = #{ono}")
	public Orders findByOno(Long ono);
	
	/** 주문 목록 */
	public List<OrdersDto.OrdersList> findAll(String memberId);
	
	/** 주문 목록에서 주문 Read */
	public OrdersDto.OrdersList getOrdersByOno(Long ono);
	
	
}
