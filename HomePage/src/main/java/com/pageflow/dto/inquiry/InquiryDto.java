package com.pageflow.dto.inquiry;

import java.time.*;

import org.springframework.format.annotation.*;

import com.pageflow.entity.inquiry.*;

import lombok.*;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class InquiryDto {
	@Data
	public static class Create {
		private Long inno;
		private String memberId;
		private String inquiryTitle;
		private String content;
		private String inquiryType;
		private String inquiryAnswer;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private LocalDateTime createdDate;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private LocalDateTime answeredDate;
		private Boolean isReadByAdmin;
		private String inquiryStatus;

		public Inquiry toEntity(String memberId) {
			return new Inquiry(inno, memberId, content, inquiryType, inquiryTitle, inquiryAnswer);
		}

	}

	@Data
	@AllArgsConstructor
	public static class Read {
		private Long inno;
		private String inquiryTitle;
		private String content;
		private String inquiryType;
		private LocalDate createdDate;
		private String inquiryAnswer;
		private LocalDate answeredDate;
		private String inquiryStatus;
		private String memberId;
	}

	@Data
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	@AllArgsConstructor
	public static class Update {
		private Long inno;
		private String inquiryType;
		private String inquiryTitle;
		private String content;
		private String inquiryAnswer;
		private Boolean isReadByAdmin;
		private String inquiryStatus;
	}
}
