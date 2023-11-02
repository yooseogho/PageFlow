package com.example.demo.dto.memberGrade;


import java.time.LocalDate;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class MemberGradeDto {
	
	
	// member_point_page 에 사용
	// 회원의 등급 조회 필요함
	@Data
	@AllArgsConstructor
	public  static class MemberInfoDto {
	    private String memberId;
	    private Long gradeCode;
	    private String gradeName;
	}
	
	// member_point_page 에 사용
	@Data
	@AllArgsConstructor
	public static class Read {
	    private String memberId;
	    private Long gradeCode;
	    private String memberName;
	    private String memberEmail;
	    private String password;
	    private String memberProfile;
	    private String memberTel;
	    private Long memberPoint;
	    private LocalDate joinday;
	    private LocalDate birthday;

	}
	
	
	
}
