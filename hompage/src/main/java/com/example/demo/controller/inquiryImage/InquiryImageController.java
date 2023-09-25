package com.example.demo.controller.inquiryImage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.entity.inquiryImage.InquiryImage;
import com.example.demo.service.inquiryImage.InquiryImageService;

import java.util.List;

@Controller
@RequestMapping("/inquiryImages")
public class InquiryImageController {
  @Autowired
  private InquiryImageService imageService;

  @GetMapping("/add")
  @Secured("ROLE_ADMIN")
  public String showAddInquiryImageForm(Model model) {
    // 문의 이미지 등록 폼을 표시하는 로직 추가 (뷰 이름 리턴)
    return "add-inquiry-image";
  }

  @PostMapping("/add")
  @Secured("ROLE_ADMIN")
  public String addInquiryImage(@ModelAttribute InquiryImage inquiryImage) {
    InquiryImage insertedImage = imageService.insertInquiryImage(inquiryImage);
    if (insertedImage != null) {
      // 등록 성공
      return "redirect:/inquiryImages";
    } else {
      // 등록 실패
      return "redirect:/inquiryImages?error";
    }
  }

  @GetMapping("/{iino}/edit")
  @Secured("ROLE_ADMIN")
  public String showEditInquiryImageForm(@PathVariable Long iino, Model model) {
    InquiryImage inquiryImage = imageService.getInquiryImage(iino, "");
    if (inquiryImage != null) {
      model.addAttribute("inquiryImage", inquiryImage);
      return "edit-inquiry-image";
    } else {
      // 이미지가 없을 경우 에러 페이지로 리다이렉트
      return "redirect:/inquiryImages?error";
    }
  }

  @PostMapping("/{iino}/edit")
  @Secured("ROLE_ADMIN")
  public String editInquiryImage(@PathVariable Long iino, @RequestParam String iiName, @RequestParam Long inno) {
    InquiryImage inquiryImage = new InquiryImage();
    inquiryImage.setIino(iino);
    inquiryImage.setIiName(iiName);
    inquiryImage.setInno(inno);
    Integer updatedRows = imageService.updateInquiryImage(inquiryImage);
    if (updatedRows != null) {
      // 수정 성공
      return "redirect:/inquiryImages";
    } else {
      // 수정 실패
      return "redirect:/inquiryImages?error";
    }
  }

  @GetMapping("/{iino}/delete")
  @Secured("ROLE_ADMIN")
  public String deleteInquiryImage(@PathVariable Long iino) {
    Integer deletedRows = imageService.deleteInquiryImage(iino, "");
    if (deletedRows != null) {
      // 삭제 성공
      return "redirect:/inquiryImages";
    } else {
      // 삭제 실패
      return "redirect:/inquiryImages?error";
    }
  }

  @GetMapping
  public String getAllInquiryImages(Model model) {
    List<InquiryImage> inquiryImages = imageService.getAllInquiryImage();
    model.addAttribute("inquiryImages", inquiryImages);
    return "inquiry-image-list";
  }
  /*
   * [참고]
   * 추후에 변동될 사항이 많으니, 기본 예로 볼 것
   * 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   * */
}
