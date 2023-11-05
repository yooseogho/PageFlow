package com.pageflow.dto.book;

import java.util.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryParentPage {
	private Long prev;
	private Long start;
	private Long end;
	private Long next;
	private Long pageno;
	private Long categoryParent;
	private List<BookDto.BookList> books;
}



/*
 * 2023 - 10 - 18 (feat. 원승언)
 * 도서 홈페이지의 소설 / 만화 / 참고도서 페이지를 각각의 장르와는 상관없이 상품 등록된 순서대로 나열해주는 리스트 페이지 
 */
