package com.example.demo.entity.bookReview;

import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookReview {
	private Long rno;
	private String reviewContent;
	private String reviewWriter;
	private LocalDateTime reviewDate;
	private Long bno;
	private Long ono;
	
}
	