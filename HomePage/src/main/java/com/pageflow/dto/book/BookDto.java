package com.pageflow.dto.book;

import java.time.*;

import org.springframework.web.multipart.*;

import com.pageflow.entity.book.*;

import lombok.*;

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class BookDto {
  @Data
  @AllArgsConstructor
  @NoArgsConstructor
  public static class Registration {
    private String bookTitle;
    private String subTitle;
    private LocalDate publishDate;
    private Long bookPrice;
    private Long stock;
    private String translator;
    private Long publisherCode;
    private Long authorCode;
    private MultipartFile bookImage;
    
    public Book toEntity(String imagePath) {
      Book book = new Book();
      book.setBookTitle(this.bookTitle);
      book.setSubTitle(this.subTitle);
      book.setPublishDate(this.publishDate);
      book.setBookPrice(this.bookPrice);
      book.setStock(this.stock);
      book.setTranslator(this.translator);
      book.setPublisherCode(this.publisherCode);
      book.setAuthorCode(this.authorCode);
      return book;
  }
  }
  
  @Data
  @AllArgsConstructor
  public static class Read {
    private String bookTitle;
    private String subTitle;
    private LocalDate publishDate;
    private Long bookPrice;
    private Long stock;
    private String translator;
  }
}
