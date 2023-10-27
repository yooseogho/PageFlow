package com.example.demo.entity.orderDetails;


import javax.servlet.http.*;

import com.github.scribejava.core.model.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NaverLoginDto {
  private String code;
  private String state;
  private HttpSession session;

  public OAuth2AccessToken getAccessToken(HttpSession session, String state, String code) {
    return null;
  }

  public String getUserProfile(OAuth2AccessToken oauthToken) {
    return null;
  }
}
