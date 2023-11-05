package com.pageflow.dto.book;

import java.util.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchListPage {
	private Long prev;
	private Long start;
	private Long end;
	private Long next;
	private Long pageno;
	private String keyword;
	private List<BookDto.BookList> books;
}



/*
 * 2023 - 10 - 20 (feat. 원승언)
 * 검색어와 일치하는 작가, 출판사, 책 제목을 가진 도서의 정보를 목록으로 보여주는 페이지
 * 작가 이름을 통해 작가의 도서 정보를 나열하여 목록을 만들어주는 페이지 
 * 출판사 이름을 통해 해당 출판사의 도서 정보를 나열하여 목록 만들어주는 페이지
 */
