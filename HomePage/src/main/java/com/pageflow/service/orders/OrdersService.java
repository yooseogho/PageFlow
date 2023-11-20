package com.pageflow.service.orders;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.pageflow.dao.cart.*;
import com.pageflow.dao.member.*;
import com.pageflow.dao.memberGrade.MemberGradeDao;
import com.pageflow.dao.orderDetails.*;
import com.pageflow.dao.orders.*;
import com.pageflow.dto.cart.*;
import com.pageflow.dto.orders.*;
import com.pageflow.entity.member.*;
import com.pageflow.entity.orderDetails.*;
import com.pageflow.entity.orders.*;

@Service
public class OrdersService {
	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private OrderDetailsDao orderDetailsDao;

	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private MemberGradeDao memberGradeDao;
	/*11-08 유석호 주문 하기 서비스 수정
	 * 
	 * 
	 * */
	// 주문추가
	public Boolean add(Orders orders, String memberId, List<CartDto.Select> cartList, Long pointUsed) {
	    Member member = memberDao.findById(memberId);
	    orders.setMemberId(member.getMemberId());
	    orders.setPointUsed(pointUsed);  // 사용할 포인트 설정

	    System.out.println("Point used: " + orders.getPointUsed());  // 로그 출력
	    System.out.println(orders);

	    // 포인트 사용 처리: 사용한 포인트만큼 회원의 보유 포인트를 차감
	    memberDao.updateMemberPoint(memberId, -pointUsed);

	    if(ordersDao.save(orders) != 1) {
	        return false;
	    }

	    // 회원 등급에 따른 적립률 가져오기
	    double pointRate = memberGradeDao.getPointRateByGradeCode(member.getGradeCode());
	    System.out.println(pointRate);
	    // 주문 생성시에는 pointEarn 필드를 0으로 설정
	    orders.setPointEarn(0L);

	    int totalPointEarn = 0;
	    // 사용자가 포인트를 사용했을 때 적립 포인트를 0으로 만듭니다.
	    if (pointUsed > 0) {
	        totalPointEarn = 0;
	    }

	    for(CartDto.Select cartItem : cartList) {
	        OrderDetails orderDetails = new OrderDetails();
	        orderDetails.setOno(orders.getOno());
	        orderDetails.setBno(cartItem.getBno());
	        orderDetails.setOrderCount(cartItem.getCartCount());
	        orderDetails.setOrderTotal(cartItem.getAmount());
	        orderDetails.setBookTitle(cartItem.getBookTitle());
	        orderDetails.setOrderStatus("주문 완료");
	        orderDetails.setBookImage(cartItem.getBookImage());
	        
	        System.out.println(orderDetails);
	        System.out.println(totalPointEarn);
	        System.out.println(pointUsed);

	        orderDetailsDao.save(orderDetails);
	    }

	    return true;
	}


	
	// 2. 주문 확인
	public Orders findOrder(Long ono) {
		return ordersDao.findByOno(ono);
	}

	// 3. 주문 목록
	public List<OrdersDto.OrdersList> getOrdersList(String memberId) {
		Member member = memberDao.findById(memberId);
		List<OrdersDto.OrdersList> orders = ordersDao.findAll(member.getMemberId());

		for (OrdersDto.OrdersList order : orders) {
			order.setMemberId(member.getMemberId());
			List<OrderDetails> details = orderDetailsDao.findAllByOno(order.getOno());
			order.setOrderDetails(details);
		}
		return orders;
	}

	// 4. 주문 읽기
	public OrdersDto.Read readOrders(Long ono, String memberId) {

		Orders orders = ordersDao.findByOno(ono);

		OrdersDto.Read read = ordersDao.read(orders.getOno());

		if (read != null) {
			List<OrderDetails> details = orderDetailsDao.findAllByOno(ono);
			read.setOrderDetails(details);
		}

		return read;

	}

	// 5. 주문 삭제
	public Boolean delete(Long ono) {
		orderDetailsDao.deleteByOno(ono);
		Long delete = ordersDao.deleteByOno(ono);
		return delete == 1;
	}
	
	/** pointEarn 필드 업데이트 */
	// 6.주문확정시 포인트 적립 업데이트
	public Boolean updatePointEarn(Long ono, Long totalPointEarn) {
	    return ordersDao.updatePointEarn(ono, totalPointEarn) == 1;
	}
	
	// 7. 주문취소 할 때 포인트 환불 
	public Orders readOrders(Long ono) {
	    System.out.println("Reading order with ono: " + ono);
	    Orders orders = ordersDao.findByOno(ono);
	    if (orders == null) {
	        System.out.println("No orders found with ono: " + ono);
	        throw new NoSuchElementException("No orders found with ono: " + ono);
	    }
	    System.out.println("Orders found: " + orders.toString());
	    return orders;
	}
	
	// 8. 포인트 페이지 
	public List<OrdersDto.Point> point(String memberId) {
		Member m = memberDao.findById(memberId);
		return ordersDao.point(m.getMemberId());
	}
	    
	    
	    
	    

}