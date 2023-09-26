package com.example.demo.dao.orderDetails;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.orderDetails.OrderDetails;

@Mapper
public interface OrderDetailsDao {
  // 주문 상세 생성
  @SelectKey(statement = "select order_details__seq.nextval from dual", before = true, resultType = long.class, keyProperty = "ono")
  @Insert("INSERT INTO order_details (bno, ono, order_count, order_total, book_title) VALUES (#{bno}, #{ono}, #{orderCount}, #{orderTotal}, #{bookTitle})")
  public Integer insertOrderDetails(OrderDetails orderDetails);

  // 특정 주문의 모든 주문 상세 조회
  @Select("SELECT * FROM order_details WHERE ono = #{ono}")
  public List<OrderDetails> selectOrderDetailsByOno(Long ono);

  // 회원이 주문한 상세 내역 조회 ex)ono를 기준으로 해서 주문내역 전체를 저장하는게 아닌 상세 내역 저장
  public List<OrderDetails> findDetailsByMemberId(String memberId, Long ono);

  // 취소 신청
  @Update("UPDATE order_details SET order_status = '주문취소' WHERE bno = #{bno} AND ono = #{ono}")
  public Integer changeStatus(Long bno, Long ono);
  
  // 주문 상세 전체 조회
  @Select("select * from order_details")
  public List<OrderDetails> getAllOrderDetails();

}
