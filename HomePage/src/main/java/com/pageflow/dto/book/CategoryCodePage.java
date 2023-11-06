package com.pageflow.dto.book;

import java.util.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryCodePage {
  private Long prev;
  private Long start;
  private Long end;
  private Long next;
  private Long pageno;
  private Long categoryParent;
  private Long categoryCode;
  private List<BookDto.BookList> books;
}

/*
 * 2023 - 10 - 18 (feat. 원승언) 도서 홈페이지의 소설 / 만화 / 참고도서 페이지를 각각의 장르별로 상품 등록된 순서대로
 * 나열해주는 리스트 페이지 ex) 도서 - 판타지소설(111) // 호러/공포소설(112) // 드라마/영화소설(113) //
 * SF/과학소설(114) // 로맨스소설(115) 별로 다 리스트로 나열해서 출력해줌
 */