package com.pageflow;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.security.access.*;
import org.springframework.security.web.access.*;
import org.springframework.stereotype.*;

@Component
public class MyAccessDenialHandler implements AccessDeniedHandler {
  @Override
  public void handle(HttpServletRequest request, HttpServletResponse response,
      AccessDeniedException accessDeniedException) throws IOException, ServletException {
    String ajax = request.getHeader("X-Requested-With");

    Boolean isAjax = ajax != null && ajax.equals("XMLHttpRequest");
    if (isAjax) {
      response.sendError(403);
    } else {
      response.sendRedirect("/?error");
    }
  }
}
