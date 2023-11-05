package com.pageflow.dto.book;

import java.time.*;

import org.springframework.format.annotation.*;
import org.springframework.web.multipart.*;

import com.pageflow.entity.book.*;

import lombok.*;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class BookDto {
	/** 상품 등록할 때 */
	@Data
	public static class Add {
		private Long categoryCode;
		private String bookTitle;
		private MultipartFile bookImage;
		private String bookIntro;
		private String bookContent;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private LocalDate publishDate;
		private Long bookPrice;
		private Long stock;
		private String translator;
		private String publisherName;
		private String authorName;

		public Book toEntity(String defaultbookImage) {
			return new Book(null, categoryCode, bookTitle, defaultbookImage, bookIntro, bookContent, publishDate,
					bookPrice, stock, translator, publisherName, authorName);
		}
	}

	/** 도서 페이지에 소설 / 만화/ 참고도서 최근순으로 5개 리스트 나열할 때 */
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class Recent {
		private Long bno;
		private String bookTitle;
		private String bookImage;
		private String authorName;
		private String publisherName;
		private Long bookPrice;
		private Double pointRate;
		private Long pointEarnings;
	}

	/** 책 상세정보 읽을 때 */
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class Read {
		private Long bno;
		private Long categoryCode;
		private String bookTitle;
		private String bookImage;
		private String bookIntro;
		private String bookContent;
		private String publishDate;
		private String authorName;
		private String publisherName;
		private String translator;
		private Long stock;
		private Long bookPrice;
		private Double pointRate;
		private Long pointEarnings;

	}

	/** 책 상세정보에서 책을 쓴 작가의 다른 작품을 볼 때 */
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class AuthorOtherBooks {
		private Long bno;
		private String bookTitle;
		private String bookImage;
		private String authorName;
	}

	/** 종류별로 책 리스트 페이지 */
	/** 장르별로 책 리스트 페이지 */
	/** 검색어를 입력한 후에 검색어에 맞는 책 리스트 페이지 */
	/** 작가 검색을 통해 만드는 도서 리스트 페이지 */
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class BookList {
		private Long bno;
		private String bookTitle;
		private String bookImage;
		private String bookIntro;
		private String authorName;
		private String publisherName;
		private String publishDate;
		private Long bookPrice;
		private Double pointRate;
		private Long pointEarnings;
	}

	
	/** 상품 수정할 때 */
	@Data
	public static class Update {
		private Long bno;
		private Long categoryCode;
		private String bookTitle;
		private MultipartFile bookImage;
		private String bookIntro;
		private String bookContent;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private LocalDate publishDate;
		private Long bookPrice;
		private Long stock;
		private String translator;
		private String publisherName;
		private String authorName;
	}

}
