package com.example.demo.dao.cart;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.example.demo.entity.cart.Cart;

@Mapper
public interface CartDao {

	// 장바구니 추가
  @SelectKey(statement = "select cart_seq.nextval from dual",before = true, resultType = long.class,keyProperty="cno")
	@Insert("INSERT INTO cart (cno, bno, member_id, cart_count) VALUES (#{cno}, #{bno}, #{memberId}, #{cartCount})")
	public Integer add(Cart cart);

	// 어떤 사용자의 장바구니 목록 가져오기
	@Select("select * from cart where memberid=#{memberId}")
	public List<Cart> findByUsername(String memberId);

	// 장바구니에서 특정 책(상품) 제거하기
	@Delete("DELETE FROM cart WHERE cno=#{cno} AND member_id=#{memberId}")
	public int deleteByCnoAndMemberId(Long cno, String memberId);

	// 장바구니 내 특정 상품 수량 변경하기
	@Update("UPDATE cart SET cart_count=#{cartCount} WHERE cno=#{cno} AND member_id=#{memberId}")
	public int updateCartCountByCnoAndMemberId(Long cartCount, Long cno, String memberId);

	// 장바구니 내 상품 정보 가져오기: 특정 상품의 구체적인 정보(예: 가격, 이름 등)
	// 필요한 경우, 먼저 findById(cno)로 해당 상품이 포함된 장바구니 항목을 가져온 후 필요한 정보를 추가로 조회할 수도 있다.
	// 장바구니 번호로 장바구니 조회 상품번호,회원 아이디,카트 내 상품의 개수 등
	@Select("select * from cart where cno=#{cno} ")
	public Cart findById(Long cno);

	// 사용자의 장바구니에 있는 책들을 총 합산 한 가격을 알준다
	// 이 쿼리를 호출하면 해당 사용자의 장바구니에 있는 책들의 총 가격을 얻을 수 있다.
	public Long sumByUsername(String memberId);

	// 장바구니의 상품 개수 추가
	public Integer increase(Long cno, String memberId);
	
	// 장바구니 상품 개수 감소
	public Integer decrease(Long cno, String memberId);
	
}
