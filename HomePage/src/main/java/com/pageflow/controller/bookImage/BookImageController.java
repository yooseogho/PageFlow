package com.pageflow.controller.bookImage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.pageflow.service.bookImage.*;

@Controller
@RequestMapping("/bookImages")
public class BookImageController {
  @Autowired
  private BookImageService imageService;

  // 책 이미지 등록 페이지 (GET 방식)
  @Secured("ROLE_ADMIN")
  @GetMapping("/register")
  public ModelAndView showImageRegistrationForm() {
    ModelAndView modelAndView = new ModelAndView("bookImageRegistration"); // 책 이미지 등록 페이지의 이름 (예:
                                                                           // bookImageRegistration.html)
    return modelAndView;
  }

  // 책 이미지 등록 처리 (POST 방식)
  @Secured("ROLE_ADMIN")
  @PostMapping("/register")
  public ModelAndView registerBookImage(@RequestParam("imageName") String imageName,
      @RequestParam("imageNumber") Long bino) {
    ModelAndView modelAndView = new ModelAndView("redirect:/books/{bino}"); // 책 상세 정보 페이지로 리다이렉트
    Boolean isRegistered = imageService.registerBookImage(imageName, bino); // 책 이미지 등록 시도
    if (!isRegistered) {
      // 책 이미지 등록 실패 시 처리
      // 예: 오류 메시지 추가
      modelAndView.addObject("error", "책 이미지 등록에 실패했습니다.");
    }
    return modelAndView;
  }

  // 책 이미지 조회 페이지
  @GetMapping("/{bino}/images")
  public ModelAndView getBookImages(@PathVariable Long bino) {
    ModelAndView modelAndView = new ModelAndView("bookImageList"); // 책 이미지 목록 페이지의 이름 (예: bookImageList.html)
    modelAndView.addObject("images", imageService.getBookImages(bino)); // 모델에 책 이미지 목록 추가
    return modelAndView;
  }

  // 책 이미지 삭제 처리
  @Secured("ROLE_ADMIN")
  @PostMapping("/{bino}/images/delete")
  public ModelAndView deleteBookImage(@PathVariable Long bino) {
    ModelAndView modelAndView = new ModelAndView("redirect:/books/{bino}"); // 책 상세 정보 페이지로 리다이렉트
    Boolean isDeleted = imageService.deleteBookImage(bino); // 책 이미지 삭제 시도
    if (!isDeleted) {
      // 책 이미지 삭제 실패 시 처리
      // 예: 오류 메시지 추가
      modelAndView.addObject("error", "책 이미지 삭제에 실패했습니다.");
    }
    return modelAndView;
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
