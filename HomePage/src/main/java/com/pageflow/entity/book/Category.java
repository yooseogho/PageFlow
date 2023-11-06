package com.pageflow.entity.book;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
  private Long level;
  private Long categoryCode;
  private String categoryName;
  private Long categoryParent;
}
