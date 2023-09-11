package com.example.demo.notice.entity;

import java.time.LocalDate;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private Long nno;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private LocalDate noticeWriteday;
}
