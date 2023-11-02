package com.example.demo;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class HompageApplication {
  public static void main(String[] args) {
    SpringApplication.run(HompageApplication.class, args);
  }
}
