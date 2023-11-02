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
		private  LocalDate birthday; 
		private MultipartFile profile;
		
		public Member toEntity(String profileName, String pwd) {
			return new Member(memberId, 1L, memberName, memberEmail, pwd,  profileName, memberTel, memberPoint, LocalDate.now(), birthday);
		}
	}
	
	//Read 에서 이름,번호 추가
	
	@Data
	@AllArgsConstructor
	public static class Read {
		private String memberId;
		private String memberEmail;
		private String birthday;
		private String joinday;
		private Long days;
		private String memberProfile;	
		private String memberName;
		private String memberTel;
	}
	
		// profile_page에서 사용
		@Data
		@AllArgsConstructor
		@NoArgsConstructor
		public static class Profile {
		    private String memberId;
		    private String memberName;
		    private String memberProfile;
		}
		
		
	
		
	
	// 로그인할 때 팔요함 10-20 유석호
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class Login {
	     private String memberId; 
	     private String password;

	}
	
	
	
	
}
