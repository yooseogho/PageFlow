package com.pageflow.service.bookReview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pageflow.dao.bookReview.*;
import com.pageflow.entity.bookReview.*;

import java.util.List;

@Service
public class BookReviewService {
  @Autowired
  private BookReviewDao reviewDao;

  // 리뷰 작성하기
  public BookReview saveBookReview(BookReview bookReview) {
    // 리뷰를 저장하고 저장된 리뷰 객체를 반환
    return reviewDao.save(bookReview);
  }

  // 페이징 - 리뷰글의 총 개수
  public Long countBookReviews() {
    return reviewDao.count();
  }

  // 페이징 쿼리
  public List<BookReview> findBookReviewPaging(Long startRownum, Long endRownum) {
    return reviewDao.findBookReviewPaging(startRownum, endRownum);
  }

  // 상품 리뷰들의 개수
  public Long countBookReviewsByRno(Long rno) {
    return reviewDao.countByrno(rno);
  }

  // 상품을 삭제할 때 상품의 리뷰들을 모두 삭제
  public Integer deleteBookReviewsByBno(Long bno) {
    Integer delete = reviewDao.deleteBybno(bno);
    if (delete == null) {
      return null;
    } else {
      return reviewDao.deleteBybno(bno);
    }
  }

  // 리뷰 1개 삭제
  public Integer deleteBookReviewByIdAndReviewWriter(Long rno, String reviewWriter) {
    return reviewDao.deleteByIdAndReviewWriter(rno, reviewWriter);
  }

  // 리뷰글 수정
  public Integer changeBookReviewContent(BookReview bookReview) {
    return reviewDao.changeReviewContent(bookReview);
  }

  // 특정 상품의 리뷰들을 출력
  public List<BookReview> findBookReviewsByBno(Long bno) {
    return reviewDao.findBybno(bno);
  }

  // 모든 리뷰 조회
  public List<BookReview> getAllBookReviews() {
    return reviewDao.getAllBookReviews();
  }
}
