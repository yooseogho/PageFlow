package com.pageflow.service.orders;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.pageflow.dao.member.*;
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
	
	// 1. 주문 추가
	public Boolean add(Orders orders, String memberId, List<CartDto.Select> cartList) {
		Member member = memberDao.findById(memberId);
		orders.setMemberId(member.getMemberId());
		if(ordersDao.save(orders) != 1) {
			return false;
		}
		
		    for(CartDto.Select cartItem : cartList) {
		        OrderDetails orderDetails = new OrderDetails();
		        orderDetails.setOno(orders.getOno());
		        orderDetails.setBno(cartItem.getBno());
		        orderDetails.setOrderCount(cartItem.getCartCount());  // 주문 수량 설정
		        orderDetails.setOrderTotal(cartItem.getAmount());  // 주문 총액 설정
		        orderDetails.setBookTitle(cartItem.getBookTitle());  // 책 제목 설정
		        orderDetails.setOrderStatus("주문 완료");  // 주문 상태 설정
		        orderDetails.setBookImage(cartItem.getBookImage());
		          
		        orderDetailsDao.save(orderDetails); 
		    }

		return true;
	}
	
	// 2. 주문 확인
	public Orders findOrder(Long ono) {
		return ordersDao.findByOno(ono);
	}
	
	// 3-1. 주문 목록
	public List<OrdersDto.OrdersList> getOrdersList(String memberId) {
		Member member = memberDao.findById(memberId);
        List<OrdersDto.OrdersList> orders = ordersDao.findAll(member.getMemberId());
        
        for(OrdersDto.OrdersList order : orders) {
        	order.setMemberId(member.getMemberId());
            List<OrderDetails> details = orderDetailsDao.findAll(order.getOno());
            order.setOrderDetails(details);
        }
        return orders;
    }
	
    
	// 3-3. 주문 상세 내역 목록 
    public OrdersDto.OrdersList getOrdersByOno(Long ono) {
    	Orders order = ordersDao.findByOno(ono);
        OrdersDto.OrdersList orders = ordersDao.getOrdersByOno(order.getOno());
        List<OrderDetails> details = orderDetailsDao.findAll(order.getOno());
        orders.setOrderDetails(details);
        return orders;
    }
	
	
}