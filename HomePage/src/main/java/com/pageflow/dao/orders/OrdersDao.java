package com.pageflow.dao.orders;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.entity.orders.*;

@Mapper
public interface OrdersDao {
	// 1. 주문내역 저장
	@Insert("INSERT INTO orders (ono, member_id, dno, order_date, order_request, order_price, payment, point_earn) "
			+ "VALUES (#{ono}, #{memberId}, #{dno}, #{orderDate}, #{orderRequest}, #{orderPrice}, #{payment}, #{pointEarn})")
	public Integer save(Orders orders);

	// 2. 전체 조회
	@Select("select * from orders")
	public List<Orders> getAllOrders();

	// 3. 장바구니 - 결제예정금액
	public Orders getCartInfoByTotalPay(String memberId);

	// 4. 주문/결제 - 결제예정금액
	public Orders getOrderInfoByTotalPay(String memberId);

	// 5. 주문내역 삭제
	@Delete("DELETE FROM orders WHERE ono=#{ono} and member_id=#{memberId}")
	public Integer deleteByOrders(Long ono, String memberId);

	// 6. 사용자 주문/배송 목록 리스트
	@Select("select o.ono, bi.image_name, b.book_title, od.order_count, (sum(od.order_count * b.book_price), od.order_status)"
			+ " from orders o inner join order_details od on o.ono=od.ono inner join member m on m.member_id=o.member_id inner join book b on b.bno=od.bno inner join book_image bi on bi.bno=b.bno group by  o.ono, bi.image_name, b.book_title, od.order_count, od.order_count, b.book_price, od.order_status")
	List<Orders> findAllOrders(String memberId);

	

}
