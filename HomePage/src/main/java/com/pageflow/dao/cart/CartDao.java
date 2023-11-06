package com.pageflow.dao.cart;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.dto.cart.*;
import com.pageflow.entity.cart.*;

@Mapper
public interface CartDao {

  /** Cart 일련번호 */
  @SelectKey(statement = "select cart_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "cno")

  /** Cart 생성 */
  @Insert("insert into cart values(#{cno}, #{bno}, #{memberId}, #{cartCount})")
  public Long save(Cart cart);

  /** 사용자의 장바구니 리스트 보기 (cart-mapper에 있음) */
  public List<CartDto.Read> findAllByMemberId(String memberId, Long gradeCode);

  /** bno와 memberId를 통해 장바구니에 담겼는지 알아보기 */
  @Select("select * from cart where bno=#{bno} and member_id = #{memberId}")
  public Cart findCartByMemberIdAndBno(Long bno, String memberId);

  /** 이미 담겨져있는 장바구니에 다시 담을 때 사용 */
  @Select("select * from cart where cno=#{cno} and rownum=1")
  public Cart findByCno(Long cno);

  /** 장바구니 수량 여러개 증가 (read 페이지에서 장바구니 담을 때 사용) */
  @Update("update cart set cart_count = cart_count + #{count} where cno = #{cno} and member_id = #{memberId}")
  public Long multiIncrease(Long cno, String memberId, Long count);

  /** 장바구니 수량 증가 */
  @Update("update cart set cart_count = cart_count + 1 where cno = #{cno} and member_id = #{memberId}")
  public Long increase(Long cno, String memberId);

  /** 장바구니 수량 감소 */
  @Update("update cart set cart_count = cart_count - 1 where cno = #{cno} and member_id = #{memberId}")
  public Long decrease(Long cno, String memberId);

  /** 장바구니에 담은 서로 다른 도서들이 몇개 있는지 따로따로 count */
  @Select("select count(*) from cart where member_id = #{memberId}")
  public Long cartCountBno(String memberId);

  /** 장바구니 삭제 */
  @Delete("delete from cart where cno=#{cno}")
  public Long delete(Long cno);

  /** 장바구니 수량 체크 */
  @Select("select cart_count from cart where cno = #{cno}")
  public Long cartCount(Long cno);

  /** cart 리스트에서 선택하기 */
  public List<CartDto.Select> selectFromCartList(CartDto.Select dto, List<Long> cnos, Long gradeCode, String memberId);
}