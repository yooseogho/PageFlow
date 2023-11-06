package com.pageflow.entity.orderDetails;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetails {
  private Long odno;
  private Long bno;
  private Long ono;
  private Long orderCount;
  private Long orderTotal;
  private String bookTitle;
  private String orderStatus;
  private String bookImage;
}
