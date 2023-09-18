package com.example.demo.service.book;

import java.io.*;
import java.nio.file.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.book.*;
import com.example.demo.dto.book.*;
import com.example.demo.dto.book.BookDto.*;
import com.example.demo.entity.book.*;

@Service
public class BookService {
  @Autowired
  BookDao bookDao;
  @Value("${defaultBookImage}")
  private String defaultBookImage;
  @Value("${bookImageFolder}")
  private String bookImageFolder;
  
//  0. 전체 조회
  public List<Book> getAllBooks(Long startRownum, Long endRownum) {
    return bookDao.findAll(startRownum, endRownum);
  }

//  1. 도서 등록(이미지 포함) 처리
  public Boolean registerBook(BookDto.Registration dto) {
    MultipartFile image = dto.getBookImage();

    // UUID를 사용하여 이미지 파일의 랜덤한 이름 생성
    String imageName = UUID.randomUUID().toString() + getFileExtension(image.getOriginalFilename());

    // 이미지를 저장할 경로 설정
    String imagePath = bookImageFolder + "/" + imageName;

    // 이미지를 저장
    if (!saveImage(image, imagePath)) {
      return false; // 이미지 저장 실패
    }

    // 도서 정보 저장
    Book book = dto.toEntity(imagePath);

    // 도서 정보를 데이터베이스에 저장
    if (bookDao.save(book) == 1) {
      return true; // 도서 등록 성공
    } else {
      // 도서 등록 실패 처리
      // 여기에서 롤백 또는 추가 처리를 수행할 수 있음
      // 예: 이미지 삭제, 기타 처리
      return false; // 도서 등록 실패
    }
  }

  // 파일 확장자를 반환하는 메서드
  private String getFileExtension(String fileName) {
    int lastDotIndex = fileName.lastIndexOf('.');
    if (lastDotIndex != -1) {
      return fileName.substring(lastDotIndex);
    }
    return "";
  }

  // 이미지를 저장 (파일 시스템에 저장)
  private Boolean saveImage(MultipartFile image, String imagePath) {
    try {
      // 이미지를 지정된 경로에 저장
      Files.write(Paths.get(imagePath), image.getBytes());
      return true; // 이미지 저장 성공
    } catch (IOException e) {
      // 이미지 저장 실패 처리
      e.printStackTrace();
      return false; // 이미지 저장 실패
    }
  }

//  2. 페이징
  public Long count() {
    Long count = bookDao.count();
//    COUNT 절이 NULL을 반환하면 NULL 처리
    if (count == null) {
      return null;
    } else {
      return count;
    }
  }

//  3. 상품 조회를 위한 bno를 통한 선택
  public Boolean inquiry(Long bno) {
    return bookDao.findById(bno) == 1;
  }

//  4. 상품 삭제
  public Boolean deleteBook(Long bno) {
    Long deletingBno = (long) bookDao.findById(bno);
    Integer deleteOneBook = (int) bookDao.deleteById(deletingBno);
    return deleteOneBook == 1;
  }

//  5. 상품 재고(STOCK) 확인(장바구니 등에서 상품의 개수를
//                      증가시킬 때에
//                      재고량 이하만 되도록)
  public Boolean checkStock(Long bno) {
    Long findingBno = (long) bookDao.findById(bno);
    return bookDao.findStockById(findingBno) == 1;
  }

//  6. 상품 정보(제목, 부제, 가격, 엮은이(옮긴이)) 변경
  public Boolean updateBook(Long bno) {
    Long updatingBno = (long) bookDao.findById(bno);
    return bookDao.updateBook(updatingBno) == 1;
  }

  public Read getBookDetail(Long bno) {
    return bookDao.selectAll();
  }

}
