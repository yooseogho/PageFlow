package com.pageflow.dao.delivery;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.entity.delivery.*;

@Mapper
public interface DeliveryDao {
	// 모든 배송 정보 조회
	@Select("select * from delivery")
	public List<Delivery> findAll();

	// 특정 회원의 배송 정보 조회
	@Select("select * from delivery where member_id=#{memberId} and rownum=1")
	public List<Delivery> findByMemberId(String memberId);

	// 특정 배송 정보 조회
	@Select("select * from delivery where dno=#{dno} and rownum=1")
	public Delivery findByDno(Long dno);

	// 새로운 배송 정보 추가
	@Insert("insert into delivery(dno, member_id, zip_code, receiver_name, delivery_address, second_address, third_address, receiver_tel)"
			+ " values(#{dno}, #{memberId}, #{zipCode}, #{receiverName}, #{deliveryAddress}, #{secondAddress}, #{thirdAddress}, #{receiverTel})")
	public Integer save(Delivery delivery);

	// 배송 정보 수정
	@Update("update delivery set member_id=#{memberId}, zip_code=#{zipCode}, receiver_name=#{receiverName}, delivery_address=#{deliveryAddress} "
			+ ", second_address=#{secondAddress} , third_address=#{thirdAddress} , receiver_tel=#{receiverTel} where dno= #{dno}")
	public Integer update(Delivery delivery);

	// 특정 배송 정보 삭제
	@Delete("delete from delivery where dno=#{dno}")
	public Integer deleteByDno(Long dno);
}
