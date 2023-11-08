package com.pageflow.dao.delivery;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.dto.delivery.*;
import com.pageflow.entity.delivery.*;

@Mapper
public interface DeliveryDao {
  @SelectKey(statement = "select delivery_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "dno")

  /** 배송지 등록 */
  @Insert("insert into delivery values(#{dno}, #{memberId}, #{zipCode}, #{receiverName}, #{deliveryAddress}, #{receiverTel}, '조심히 와주세요', #{defaultAddress}, #{deliveryName})")
  public Long save(Delivery delivery);

  /* 기본 배송지 유무 확인 */
  @Select("select count(*) from delivery where member_id = #{memberId} and default_address=1")
  public Long findDefaultAddress(String memberId);

  /** 배송 목록 페이징 (delivery mapper에 있음) */
  public List<Delivery> findAll(Long startRownum, Long endRownum, String memberId);
  
  /** 사용자의 배송 목록 불러오기 */
  public Delivery findAllByMemberId(String memberId);

  /** 배송목록 카운트 */
  @Select("select count(*) from delivery where member_id = #{memberId}")
  public Long deliveryCount(String memberId);

  /** 배송지 선택 */
  @Select("select * from delivery where dno = #{dno} and member_id = #{memberId} and rownum=1")
  public Delivery read(Long dno, String memberId);

  /** 배송지 수정 */
  @Update("update delivery set delivery_name = #{deliveryName}, receiver_name = #{receiverName}, receiver_tel = #{receiverTel}, zip_code = #{zipCode}, delivery_address = #{deliveryAddress} "
      + "where dno = #{dno}")
  public Long update(Delivery delivery);

  /** 배송지 삭제 */
  @Delete("delete from delivery where dno = #{dno}")
  public Long delete(Long dno);

  /** 배송지 삭제할 때 주문상태가 주문 확정인지 보기 */
  @Select("select od.order_status, o.ono from delivery d inner join orders o on d.dno = o.dno "
  		+ "inner join order_details od on od.ono = o.ono where d.member_id=#{memberId} and d.dno = #{dno} and rownum=1")
  public DeliveryDto.Delete orderStatus(String memberId, Long dno);
  
  /** 기본배송지 해제 */
  @Update("update delivery set default_address = 0 where default_address = 1 and member_id = #{memberId}")
  public Long removeDefault(Long defaultAddress, String memberId);

  /** 기본배송지 설정 */
  @Update("update delivery set default_address = 1 where dno = #{dno} and default_address = 0 and member_id = #{memberId}")
  public Long settingDefault(Long dno, Long defaultAddress, String memberId);

  /** 기본 배송지로 설정되어 잇는 배송지 찾기 */
  @Select("select * from delivery where member_id= #{memberId} and default_address = 1 and rownum=1")
  public Delivery findSettingDefault(String memberId);

  /** 배송메세지 변경 */
  @Update("update delivery set delivery_request = #{deliveryRequest} where dno = #{dno}")
  public Long messageChange(Delivery delivery);
  

}