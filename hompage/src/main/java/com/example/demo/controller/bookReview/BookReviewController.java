package com.example.demo.controller.bookReview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.example.demo.entity.bookReview.BookReview;
import com.example.demo.service.bookReview.BookReviewService;

import java.util.List;

@Controller
public class BookReviewController {
  @Autowired
  private BookReviewService reviewService;

  @GetMapping("/checkReview")
  public List<BookReview> getAllBookReviews() {
    return reviewService.getAllBookReviews();
  }

  @GetMapping("/bybno/{bno}")
  public List<BookReview> getBookReviewsByBno(@PathVariable Long bno) {
    return reviewService.findBookReviewsByBno(bno);
  }

  @Secured({"ROLE_ADMIN", "ROLE_USER", "ROLE_FAMILY", "ROLE_SILVER", "ROLE_GOLD", "ROLE_PLATINUM"})
  @PostMapping("/insert")
  public BookReview saveBookReview(@RequestBody BookReview bookReview) {
    // 새로운 리뷰를 저장하고 저장된 리뷰 객체를 반환
    return reviewService.saveBookReview(bookReview);
  }

  @Secured({"ROLE_ADMIN", "ROLE_USER", "ROLE_FAMILY", "ROLE_SILVER", "ROLE_GOLD", "ROLE_PLATINUM"})
  @PostMapping("/update")
  public Integer updateBookReview(@RequestBody BookReview bookReview) {
    // 리뷰글을 수정하고 수정된 행의 개수를 반환
    return reviewService.changeBookReviewContent(bookReview);
  }

  @Secured({"ROLE_ADMIN", "ROLE_USER", "ROLE_FAMILY", "ROLE_SILVER", "ROLE_GOLD", "ROLE_PLATINUM"})
  @PostMapping("/delete")
  public Integer deleteBookReview(@RequestParam Long rno, @RequestParam String reviewWriter) {
    // 리뷰를 삭제하고 삭제된 행의 개수를 반환
    return reviewService.deleteBookReviewByIdAndReviewWriter(rno, reviewWriter);
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
