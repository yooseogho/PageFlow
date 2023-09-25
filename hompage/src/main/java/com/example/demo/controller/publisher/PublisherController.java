package com.example.demo.controller.publisher;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.entity.publisher.*;
import com.example.demo.service.publisher.*;

@Controller
@RequestMapping("/publishers")
public class PublisherController {
  @Autowired
  private PublisherService publisherService;

  // 출판사 등록 페이지로 이동
  @GetMapping("/register")
  public String showRegisterPublisherForm(Model model) {
    // 출판사 등록 폼을 렌더링하는 뷰를 반환
    return "publisher/register";
  }

  // 출판사 등록 처리
  @PostMapping("/register")
  public String registerPublisher(@ModelAttribute Publisher publisher, Model model) {
    // 출판사 등록 로직 수행
    boolean isSuccess = publisherService.registerPublisher(publisher);

    if (isSuccess) { // (isSuccess == true)와 같은 효과
      // 출판사 등록 성공 시
      return "redirect:/publishers";
    } else {
      // 출판사 등록 실패 시
      model.addAttribute("error", "출판사 등록에 실패했습니다.");
      return "publisher/register";
    }
  }

  // 전체 출판사 목록 조회
  @GetMapping
  public String listPublishers(Model model) {
    // 전체 출판사 목록을 조회하고 뷰로 전달
    List<Publisher> publishers = publisherService.getAllPublishers();
    model.addAttribute("publishers", publishers);
    return "publisher/list";
  }

  // 출판사 정보 상세 조회
  @GetMapping("/{publisherCode}")
  public String viewPublisher(@PathVariable Long publisherCode, Model model) {
    // 출판사 코드를 사용하여 출판사 정보를 조회하고 뷰로 전달
    Publisher publisher = publisherService.getPublisherById(publisherCode);
    model.addAttribute("publisher", publisher);
    return "publisher/view";
  }

  // 출판사 이름 변경 페이지로 이동
  @GetMapping("/{publisherCode}/edit")
  public String showEditPublisherForm(@PathVariable Long publisherCode, Model model) {
    // 출판사 이름 변경 폼을 렌더링하는 뷰를 반환
    Publisher publisher = publisherService.getPublisherById(publisherCode);
    model.addAttribute("publisher", publisher);
    return "publisher/edit";
  }

  // 출판사 이름 변경 처리
  @PostMapping("/{publisherCode}/edit")
  public String editPublisherName(@PathVariable Long publisherCode,
      @RequestParam("newPublisherName") String newPublisherName, Model model) {
    // 출판사 이름 변경 로직 수행
    boolean isSuccess = publisherService.changePublisherName(publisherCode, newPublisherName);

    if (isSuccess) {
      // 출판사 이름 변경 성공 시
      return "redirect:/publishers/" + publisherCode;
    } else {
      // 출판사 이름 변경 실패 시
      model.addAttribute("error", "출판사 이름 변경에 실패했습니다.");
      return "publisher/edit";
    }
  }

  // 출판사 삭제 처리
  @PostMapping("/{publisherCode}/delete")
  public String deletePublisher(@PathVariable Long publisherCode, Model model) {
    // 출판사 삭제 로직 수행
    boolean isSuccess = publisherService.deletePublisher(publisherCode);

    if (isSuccess) {
      // 출판사 삭제 성공 시
      return "redirect:/publishers";
    } else {
      // 출판사 삭제 실패 시
      model.addAttribute("error", "출판사 삭제에 실패했습니다.");
      return "publisher/view";
    }
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
