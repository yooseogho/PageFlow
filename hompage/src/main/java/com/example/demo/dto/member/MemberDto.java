package com.example.demo.dto.member;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.member.Member;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class MemberDto {
	@Data
	public static class Join {
		private String memberId;
		private String password;
		private String memberEmail;
		private String memberName;
		private String memberTel;
		private Long memberPoint;
		
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private LocalDate birthday;
		private MultipartFile profile;
		
		public Member toEntity(String profileName, String pwd) {
			return new Member(memberId, 1L, memberName, memberEmail, pwd,  profileName, memberTel, memberPoint, LocalDate.now(), birthday);
		}
	}
	
	@Data
	@AllArgsConstructor
	public static class Read {
		private String memberId;
		private String memberEmail;
		private String birthday;
		private String joinday;
		private Long days;
		private String memberProfile;	
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class Update {
	  private String memberId;
	  private String memeberName;
	  private String memberEmail;
	  private String memberTel;
	}
}
