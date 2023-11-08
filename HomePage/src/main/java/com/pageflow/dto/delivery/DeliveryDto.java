package com.pageflow.dto.delivery;

import lombok.*;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class DeliveryDto {

  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public static class Create {
    private String receiverName;
    private String deliveryName;
    private String receiverTel;
    private Long zipCode;
    private String deliveryAddress;
  }

  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public static class Read {
    private Long dno;
    private String receiverName;
    private String addressName;
    private Long defaultAddress;
    private String receiverTel;
    private Long zipCode;
    private String deliveryAddress;
    private String deliveryRequest;
    private String deliveryName;
  }

  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public static class Update {
    private Long dno;
    private String receiverName;
    private String deliveryName;
    private String receiverTel;
    private Long zipCode;
    private String deliveryAddress;
  }

  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public static class Message {
    private Long dno;
    private String deliveryRequest;
  }
  
  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public static class Delete {
	  private Long dno;
	  private Long ono;
	  private String memberId;
	  private String orderStatus;
  }
}
