package com.pageflow.dto.book;

import java.util.*;

import com.pageflow.entity.book.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminSearchPage {
	private Long prev;
	private Long start;
	private Long end;
	private Long next;
	private Long pageno;
	private String keyword;
	private List<Book> books;
}



/*
 * 2023 - 10 - 20 (feat. 원승언)
 * 관리자 페이지에서 관리자가 검색어와 일치하는 작가, 출판사, 책 제목을 가진 도서의 정보를 목록으로 볼 수 있는 페이지
 */
