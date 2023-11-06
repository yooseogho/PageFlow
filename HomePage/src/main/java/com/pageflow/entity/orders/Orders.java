package com.pageflow.entity.orders;

import java.time.*;

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
}
