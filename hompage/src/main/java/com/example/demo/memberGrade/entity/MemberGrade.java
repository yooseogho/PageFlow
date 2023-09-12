package com.example.demo.memberGrade.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberGrade {
	private Long gradeCode;
	private String gradeName;
	private Integer pointRate;
}
