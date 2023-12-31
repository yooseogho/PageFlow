package com.pageflow;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling // 이 어노테이션이 있어야 스케줄링을 쓸수 있음
@SpringBootApplication
public class HomePageApplication {
  public static void main(String[] args) {
    SpringApplication.run(HomePageApplication.class, args);
  }
}

/*
 * 11/01 19:39 수정자 : 갈현 수정 내용 : Hompage => Homepage(Application) (오타 수정)
 */
