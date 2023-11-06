package com.pageflow.entity.cart;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
  private Long cno;
  private Long bno;
  private String memberId;
  private Long cartCount;
}
