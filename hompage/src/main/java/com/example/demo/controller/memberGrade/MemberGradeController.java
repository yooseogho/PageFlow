package com.example.demo.controller.memberGrade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.entity.memberGrade.MemberGrade;
import com.example.demo.service.memberGrade.MemberGradeService;

import java.util.List;

@Controller
public class MemberGradeController {
  @Autowired
  private MemberGradeService gradeService;

  @GetMapping("/memberGrades/add")
  @Secured("ROLE_ADMIN")
  public ModelAndView showAddMemberGradeForm() {
    ModelAndView modelAndView = new ModelAndView("add-member-grade");
    return modelAndView;
  }

  @PostMapping("/memberGrades/add")
  @Secured("ROLE_ADMIN")
  public ModelAndView addMemberGrade(@ModelAttribute MemberGrade memberGrade) {
    ModelAndView modelAndView = new ModelAndView();
    Integer result = gradeService.saveMemberGrade(memberGrade);
    if (result != null) {
      modelAndView.setViewName("redirect:/memberGrades");
    } else {
      modelAndView.setViewName("add-member-grade");
    }
    return modelAndView;
  }

  @GetMapping("/memberGrades/{gradeCode}/edit")
  @Secured("ROLE_ADMIN")
  public ModelAndView showEditMemberGradeForm(@PathVariable Long gradeCode) {
    ModelAndView modelAndView = new ModelAndView("edit-member-grade");
    MemberGrade memberGrade = gradeService.findGradeByCode(gradeCode);
    if (memberGrade != null) {
      modelAndView.addObject("memberGrade", memberGrade);
    } else {
      modelAndView.setViewName("redirect:/memberGrades?error");
    }
    return modelAndView;
  }

  @PostMapping("/memberGrades/{gradeCode}/edit")
  @Secured("ROLE_ADMIN")
  public ModelAndView editMemberGrade(@PathVariable Long gradeCode, @ModelAttribute MemberGrade memberGrade) {
    ModelAndView modelAndView = new ModelAndView();
    Integer result = gradeService.saveMemberGrade(memberGrade);
    if (result != null) {
      modelAndView.setViewName("redirect:/memberGrades");
    } else {
      modelAndView.setViewName("edit-member-grade");
    }
    return modelAndView;
  }

  @GetMapping("/memberGrades/{gradeCode}/delete")
  @Secured("ROLE_ADMIN")
  public ModelAndView deleteMemberGrade(@PathVariable Long gradeCode) {
    ModelAndView modelAndView = new ModelAndView();
    // 삭제 로직 추가
    // 삭제 성공 시 리다이렉트, 실패 시 에러 페이지로 리다이렉트
    modelAndView.setViewName("redirect:/memberGrades");
    return modelAndView;
  }

  @GetMapping("/memberGrades")
  public ModelAndView getAllMemberGrades() {
    ModelAndView modelAndView = new ModelAndView("member-grade-list");
    List<MemberGrade> memberGrades = gradeService.getAllMemberGrade();
    modelAndView.addObject("memberGrades", memberGrades);
    return modelAndView;
  }
  /*
   * [참고]
   * 추후에 변동될 사항이 많으니, 기본 예로 볼 것
   * 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   * */
}
