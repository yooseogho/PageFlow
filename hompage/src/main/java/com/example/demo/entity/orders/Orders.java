package com.example.demo.entity.orders;

import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {
	private Long ono;
	private String memberId;
	private Long dno;
	private LocalDate orderDate;
	private String orderRequest;
	private Long orderPrice;
	private Long payment;
	private Long pointEarn;
}
