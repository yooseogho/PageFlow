	package com.pageflow.dto.orders;

import java.util.*;

import com.pageflow.entity.delivery.*;
import com.pageflow.entity.orderDetails.*;
import com.pageflow.entity.orders.*;

import lombok.*;

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class OrdersDto {
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class OrdersList {
		private Long ono;
		private String orderDate;
		private String memberId;
		private List<OrderDetails> orderDetails;
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class Read {
		private Long ono;
		private String memberId; 
		private Long dno;
		private String orderDate;
		private Long orderPrice;
		private String payment;
		private Long pointEarn;
		private String ordersBuyer;
		private Long zipCode;
		private String receiverName;
		private String deliveryAddress;
		private String receiverTel;
		private String deliveryRequest;
		private List<OrderDetails> orderDetails;
	}
}

