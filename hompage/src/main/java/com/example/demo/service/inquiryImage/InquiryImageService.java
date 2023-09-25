package com.example.demo.service.inquiryImage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.InquiryImage.InquiryImageDao;
import com.example.demo.entity.inquiryImage.InquiryImage;

import java.util.List;

@Service
public class InquiryImageService {
  @Autowired
  private InquiryImageDao inquiryImageDao;

  public InquiryImage insertInquiryImage(InquiryImage inquiryImage) {
    InquiryImage insertedImage = inquiryImageDao.insertInquiryImage(inquiryImage);
//    insert 실패 시 NULL 처리
    if (insertedImage == null) {
      return null;
    }
    return insertedImage;
  }

  public Integer updateInquiryImage(InquiryImage inquiryImage) {
    Integer updatedRows = inquiryImageDao.updateInquiryImage(inquiryImage);
//    update 실패 시 NULL 처리
    if (updatedRows == null) {
      return null;
    }
    return updatedRows;
  }

  public Integer deleteInquiryImage(Long iino, String iiName) {
    Integer deletedRows = inquiryImageDao.deleteInquiryImage(iino, iiName);
//    delete 실패 시 NULL 처리
    if (deletedRows == null) {
      return null;
    }
    return deletedRows;
  }

  public InquiryImage getInquiryImage(Long iino, String iiName) {
    return inquiryImageDao.getInquiryImage(iino, iiName);
  }

  public List<InquiryImage> getInquiryImagesByInno(Long inno) {
    List<InquiryImage> inquiryImages = inquiryImageDao.getInquiryImagesByInno(inno);
//    이미지가 존재하지 않거나 파일명이 비어있는 경우 NULL 처리
    if (inquiryImages == null || inquiryImages.isEmpty()) {
      return null;
    }
    return inquiryImages;
  }

  // 전체 조회
  public List<InquiryImage> getAllInquiryImage() {
    return inquiryImageDao.getAllInquiryImage();
  }
}
