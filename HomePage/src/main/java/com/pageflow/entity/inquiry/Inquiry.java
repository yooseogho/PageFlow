package com.pageflow.entity.inquiry;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inquiry {
	private Long inno;
	private String memberId;
	private String content;
	private String inquiryType;
	private String inquiryTitle;
	
}
