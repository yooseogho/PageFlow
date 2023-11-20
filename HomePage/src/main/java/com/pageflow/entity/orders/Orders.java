	package com.pageflow.entity.orders;
	
	import java.time.*;

import com.pageflow.entity.orderDetails.OrderDetails;

import lombok.*;
	
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public class Orders {
	  private Long ono;
	  private String memberId;
	  private Long dno;
	  private LocalDate orderDate;
	  private Long orderPrice;
	  private String payment;
	  private Long pointEarn;
	  private String ordersBuyer;
	  private Long pointUsed; // 포인트 사용 필드 추가 /*유석호 11-08 */
	}
		