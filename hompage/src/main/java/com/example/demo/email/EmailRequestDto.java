package com.example.demo.email;

import javax.validation.constraints.*;

import lombok.*;

@Data
public class EmailRequestDto {
  @NotEmpty(message = "이메일을 입력해주세요")
  @Email
  private String email;
}

