package com.example.demo.service.bookImage;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.dao.bookImage.*;

@Service
public class BookImageService {
  @Autowired
  private BookImageDao imageDao;

  // 책 이미지 등록
  public Boolean registerBookImage(String imageName, Long bno) {
    Integer result = imageDao.save(imageName, bno);
    return result == 1;
  }

  // 책 이미지 조회
  public List<String> getBookImages(Long bino) {
    return imageDao.findByBino(bino);
  }

  // 책 이미지 삭제
  public Boolean deleteBookImage(Long bino) {
    Long result = imageDao.deleteByBino(bino);
    return result != null && result > 0;
  }
}
