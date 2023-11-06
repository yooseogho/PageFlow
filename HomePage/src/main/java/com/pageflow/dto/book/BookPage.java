package com.pageflow.dto.book;

import java.util.*;

import com.pageflow.entity.book.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookPage {
  private Long prev;
  private Long start;
  private Long end;
  private Long next;
  private Long pageno;
  private List<Book> books;
}

/*
 * 2023 - 10 - 20 (feat. 원승언) 관리자가 모든 도서 목록을 나열해서 볼 수 있는 페이지
 */