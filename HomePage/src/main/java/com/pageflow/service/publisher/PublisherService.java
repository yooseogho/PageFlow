package com.pageflow.service.publisher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pageflow.dao.publisher.*;
import com.pageflow.entity.publisher.*;

import java.util.List;

@Service
public class PublisherService {
  @Autowired
  private PublisherDao publisherDao;

  // 1. 출판사 등록
  @Transactional
  public Boolean registerPublisher(Publisher publisher) {
    // 출판사 저장
    Integer result = publisherDao.save(publisher);

    // 저장 결과를 확인하여 성공 여부 반환
    return result != null && result > 0;
  }

  // 2. 전체 출판사 조회
  public List<Publisher> getAllPublishers() {
    return publisherDao.findAll();
  }

  // 3. 출판사 코드로 출판사 조회
  public Publisher getPublisherById(Long publisherCode) {
    return publisherDao.findById(publisherCode);
  }

  // 4. 출판사 이름으로 출판사 조회
  public Publisher getPublisherByName(String publisherName) {
    return publisherDao.findByName(publisherName);
  }

  // 5. 출판사 이름 변경
  @Transactional
  public Boolean changePublisherName(Long publisherCode, String newPublisherName) {
    // 출판사 이름 변경
    Integer result = publisherDao.changPublisherName(newPublisherName, publisherCode);

    // 변경 결과를 확인하여 성공 여부 반환
    return result != null && result > 0;
  }

  // 6. 출판사 삭제
  @Transactional
  public Boolean deletePublisher(Long publisherCode) {
    // 출판사 삭제
    Integer result = publisherDao.deleteById(publisherCode);

    // 삭제 결과를 확인하여 성공 여부 반환
    return result != null && result > 0;
  }
}
