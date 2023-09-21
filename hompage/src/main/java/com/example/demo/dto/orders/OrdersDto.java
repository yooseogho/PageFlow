package com.example.demo.dto.orders;

import lombok.*;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Data
@AllArgsConstructor
public class OrdersDto {
	private Long ono;
	private String bookTitle;
	private String imageName;
	private Long orderTotal;
	private Long totalBookPrice;
	private Long totalOrderCount;
	private String zipCode;
	private String receiverName;
	private String memberId;
}