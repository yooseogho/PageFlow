package com.example.demo.dao.orders;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.dto.orders.*;
import com.example.demo.entity.orders.*;

@Mapper
public interface OrdersDao {
	// 주문내역 저장
	@Insert("INSERT INTO orders (ono, member_id, dno, order_date, order_request, order_price, order_status, payment, point_earn) "
			+ "VALUES (#{ono}, #{memberId}, #{dno}, #{orderDate}, #{orderRequest}, #{orderPrice}, #{orderStatus}, #{payment}, #{pointEarn})")
	public Integer save(Orders orders);

	// 주문내역 전체 보기(주문/배송 목록)
	public List<OrdersDto> findAllOrders(@Param("memberId") String memberId);

	// 주문내역 상세 보기
	// 주문 상세 정보 조회
	OrdersDto findByOrderDetails(@Param("memberId") String memberId, @Param("ono") Long ono);

	// 주문내역 삭제
	@Delete("DELETE FROM orders WHERE ono=#{ono}")
	public Integer deleteByOrders(String memberId);
}
