package com.pageflow.dto.cart;

import java.util.*;

import lombok.*;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class CartDto {
  @Data
  @AllArgsConstructor
  @NoArgsConstructor
  public static class Read {
    private Long cno;
    private Long bno;
    private String memberId;
    private String bookImage;
    private String bookTitle;
    private Long bookPrice;
    private Long pointEarnings;
    private Double pointRate;
    private Long cartCount;
    private Long amount;
    private Long totalAmount;
    private Long totalPointEarnings;
  }

  @Data
  @AllArgsConstructor
  @NoArgsConstructor
  public static class Delete {
    private List<Long> cnos;
  }

  @Data
  @AllArgsConstructor
  @NoArgsConstructor
  public static class Add {
    private List<Long> bnos;
  }

  @Data
  @AllArgsConstructor
  @NoArgsConstructor
  public static class Select {
    private List<Long> cnos;
    private Long bno;
    private Long gradeCode;
    private String memberId;
    private String bookImage;
    private String bookTitle;
    private Long bookPrice;
    private Long pointEarnings;
    private Double pointRate;
    private Long cartCount;
    private Long amount;
    private Long totalAmount;
    private Long totalPointEarnings;
  }
}
