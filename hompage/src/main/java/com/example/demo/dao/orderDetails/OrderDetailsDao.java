package com.example.demo.dao.orderDetails;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.orderDetails.OrderDetails;
@Mapper
public interface OrderDetailsDao {

    // 주문 상세 생성
    @Insert("INSERT INTO order_details (bno, ono, order_count, order_total, book_title) VALUES (#{bno}, #{ono}, #{orderCount}, #{orderTotal}, #{bookTitle})")
     public Integer insertOrderDetails(OrderDetails orderDetails);

    // 특정 주문의 모든 주문 상세 조회
    @Select("SELECT * FROM order_details WHERE ono = #{ono}")
    public List<OrderDetails> selectOrderDetailsByOno(Long ono);

    // 특정 주문 상세 조회
    @Select("SELECT * FROM order_details WHERE bno = #{bno} AND ono = #{ono}")
    public OrderDetails selectOrderDetailByBnoAndOno(Long bno, Long ono);


}
