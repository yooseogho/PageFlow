package com.example.demo.dao.orderDetails;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.orderDetails.OrderDetails;
@Mapper
public interface OrderDetailsDao {

     // 주문 상세 생성
	 @SelectKey(statement = "select order_details__seq.nextval from dual",before = true, resultType = long.class,keyProperty="ono")
     @Insert("INSERT INTO order_details (bno, ono, order_count, order_total, book_title) VALUES (#{bno}, #{ono}, #{orderCount}, #{orderTotal}, #{bookTitle})")
     public Integer insertOrderDetails(OrderDetails orderDetails);

    // 특정 주문의 모든 주문 상세 조회
    @Select("SELECT * FROM order_details WHERE ono = #{ono}")
    public List<OrderDetails> selectOrderDetailsByOno(Long ono);

    // 주문상세 전체조회
    @Select("SELECT * FROM order_details")
    public List<OrderDetails> findAll();
    
    
	// 회원의 주문 내역 조회
	public List<OrderDetails> findDetailsByMemberId(String memberId);
	
	
	// 취소 신청 
	@Update("UPDATE order_details SET order_status = '주문취소' WHERE bno = #{bno} AND member_id = #{memberId}")
	public Integer changeStatus(String bno, String memberId);

	
	
	
	
	
	
	

    
    
    
    
    
    
    
    
    
}
