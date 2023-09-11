package com.example.demo.book.entity;

import java.time.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
	private Long bno;
	private String bookTitle;
	private String subtitle;
	private LocalDate publishDate;
	private Long bookPrice;
	private Long stock;
	private String translator;
	private Long publisherCode;
	private Long authorCode;
}
