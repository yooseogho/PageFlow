package com.pageflow.dao.orderDetails;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.dto.orderDetails.*;
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
	
	/** 주문 상세 목록 삭제 */
	@Delete("delete from order_details where ono = #{ono}")
	public Long deleteByOno(Long ono);
	
	/** 취소 신청 */
	@Update("update order_details set order_status = '취소 완료' where odno = #{odno}")
	public Long orderCancelByOdno(OrderDetails orderDetails);
	
	/** 구매확정 신청 */
	@Update("update order_details set order_status = '주문 확정' where odno = #{odno}")
	public Long orderConfirmByOdno(OrderDetails orderDetails);
	
	/** 주문 상세보기 */
	@Select("select * from order_details where odno = #{odno} and rownum = 1")
	public OrderDetails findByOdno(Long odno);
	
	/** 주문 완료 상태 count */
	@Select("select count(*) from order_details inner join orders on order_details.ono =orders.ono where member_id =#{memberId} and order_status='주문 완료'")
	public Long orderDetailsCompleteCount(String memberId);
	
	/** 주문 취소 상태 count */
	@Select("select count(*) from order_details inner join orders on order_details.ono =orders.ono where member_id =#{memberId} and order_status='취소 완료'")
	public Long orderDetailsCancelCount(String memberId);
	
	/** 주문 확정 상태 count */
	@Select("select count(*) from order_details inner join orders on order_details.ono =orders.ono where member_id =#{memberId} and order_status='주문 확정'")
	public Long orderDetailsConfirmCount(String memberId);
	
	/** 주문 많은 순으로 리스트 */
	public List<OrderDetailsDto.ManyOrder> manyOrder();
	
}
