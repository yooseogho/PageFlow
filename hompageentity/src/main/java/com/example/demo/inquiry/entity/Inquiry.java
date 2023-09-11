package com.example.demo.inquiry.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inquiry {
	private Long inno;
	private String memberId;
	private String content;
	private String inquiryType;
	
}
