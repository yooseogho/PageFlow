	package com.pageflow.dto.orders;

import java.util.*;

import com.pageflow.entity.orderDetails.*;

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
	
}

