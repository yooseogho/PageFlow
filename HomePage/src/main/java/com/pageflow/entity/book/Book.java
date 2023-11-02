package com.pageflow.entity.book;

import java.time.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
	private Long bno;
	private String bookTitle;
	private String subTitle;
	private LocalDate publishDate;
	private Long bookPrice;
	private Long stock;
	private String translator;
	private Long publisherCode;
	private Long authorCode;
}
