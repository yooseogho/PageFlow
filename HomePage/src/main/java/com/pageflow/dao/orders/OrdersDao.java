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
	@Insert("INSERT INTO orders (ono, member_id, dno, order_date, order_price, payment, point_earn, orders_buyer, point_used) " +
	        "VALUES (#{ono}, #{memberId}, #{dno}, sysdate, #{orderPrice}, #{payment}, #{pointEarn}, #{ordersBuyer}, #{pointUsed, jdbcType=BIGINT})")
	public Integer save(Orders order);
	
	/** 주문페이지 성공 후 주문 Read */
	@Select("select * from orders where ono = #{ono}")
	public Orders findByOno(Long ono);
	
	/** 주문 목록 (orders-mapper에 있음) */
	public List<OrdersDto.OrdersList> findAll(String memberId);
	
	/** 주문 목록에서 주문 Read (orders-mapper에 있음) */
	public OrdersDto.OrdersList getOrdersByOno(Long ono);
	
	/** 주문 읽기 (orders-mapper에 있음) */
	public OrdersDto.Read read(Long ono);
	
	/** 주문 삭제 */
	@Delete("delete from orders where ono = #{ono}")
	public Long deleteByOno(Long ono);
	
	/** 배송지 dno를 가지고 와서 order 테이블 정보 리스트 */
	@Select("select * from orders where dno = #{dno}")
	public List<Orders> findAllByDno(Long dno);
	
	/** 배송지 dno를 가지고 와서 해당되는 것 삭제 */
	@Delete("delete from orders where dno = #{dno}")
	public Long deleteByDno(Long dno);
	
	/** 주문 번호로 포인트 적립금  업데이트*/
	// 11-14 주문확정시 포인트 적립 업데이트
	@Update("update orders set point_earn = #{pointEarn} where ono = #{ono}")
	public Long updatePointEarn(@Param("ono") Long ono, @Param("pointEarn") Long pointEarn);

	/** 포인트 페이지에서 적립 내용 확인 */
	@Select("SELECT o.ono, o.order_date, o.point_earn, o.point_used, od.order_status "
			+ "FROM orders o JOIN order_details od ON o.ono = od.ono WHERE o.member_id =#{memberId}  order by ono desc")
	public List<OrdersDto.Point> point(String memberId);

	
}
