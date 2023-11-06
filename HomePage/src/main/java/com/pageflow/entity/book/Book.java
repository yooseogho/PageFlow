package com.pageflow.entity.book;

import java.time.*;

import org.springframework.format.annotation.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
  private Long bno;
  private Long categoryCode;
  private String bookTitle;
  private String bookImage;
  private String bookIntro;
  private String bookContent;
  @DateTimeFormat(pattern = "yyyy년 MM월 dd일")
  private LocalDate publishDate;
  private Long bookPrice;
  private Long stock;
  private String translator;
  private String publisherName;
  private String authorName;

}
