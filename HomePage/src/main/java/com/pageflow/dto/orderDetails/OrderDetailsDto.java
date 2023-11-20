package com.pageflow.dto.orderDetails;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class OrderDetailsDto {

  // 장바구니에서 상품 주문하고 결제하는 확인 페이지 에서 쓸 DTO
  @Data
  @AllArgsConstructor
  public static class OrderDetailsWithBookInfo {
    private String imageName;
    private String bookTitle;
    private Integer bookPrice;
    private Integer cartCount;
    private Integer totalPrice;

  }
  
  @Data
  @AllArgsConstructor
  @NoArgsConstructor
  public static class ManyOrder {
	  private Long bno;
	  private Long orderCount;
	  private String bookTitle;
	  private String categoryName;
	  private String bookImage;
	  private String authorName;
	  private String publisherName;
	  private Long categoryCode;
	  private Long categoryParent;
  }
  
  @Data
  @AllArgsConstructor
  @NoArgsConstructor
  public static class Status {
	  private String orderStatus;
  }
  
}
