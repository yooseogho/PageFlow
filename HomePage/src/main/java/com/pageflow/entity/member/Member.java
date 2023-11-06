package com.pageflow.entity.member;

import java.time.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
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
