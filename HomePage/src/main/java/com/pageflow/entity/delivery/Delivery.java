package com.pageflow.entity.delivery;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Delivery {
  private Long dno;
  private String memberId;
  private Long zipCode;
  private String receiverName;
  private String deliveryAddress;
  private String receiverTel;
  private String deliveryRequest;
  private Long defaultAddress;
  private String deliveryName;
}
