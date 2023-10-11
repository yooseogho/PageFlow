package com.example.demo;

import org.springframework.context.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.*;
import org.thymeleaf.templatemode.*;
import org.thymeleaf.templateresolver.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {

//  JSP 파일 사용을 위한 뷰 템플릿 리졸버(Revolver)
  @Bean
  public ViewResolver jspViewResolver() {
    InternalResourceViewResolver resolver = new InternalResourceViewResolver();
    resolver.setPrefix("/WEB-INF/views/");
    resolver.setSuffix(".jsp");
    return resolver;
  }

//  HTML 파일 사용을 위한 뷰 리졸버 (for use Thymeleaf)
  @Bean
  public ITemplateResolver thymeleafTemplateResolver() {
    ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
    templateResolver.setPrefix("templates/");
    templateResolver.setSuffix(".html");
    templateResolver.setTemplateMode(TemplateMode.HTML);
    return templateResolver;
  }
}
