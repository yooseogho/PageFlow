package com.pageflow.entity.orderDetails;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetails {
	private Long bno;
	private Long ono;
	private Long orderCount;
	private Long orderTotal;
	private String bookTitle;
	private String orderStatus;
	
}
