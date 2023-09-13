package com.example.demo.entity.notice;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private Long nno;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate noticeWriteday;
}
	