package com.example.demo.controller.member;

import com.example.demo.dto.member.MemberDto;
import com.example.demo.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
  @Autowired
  private MemberService memberService;

//  1-1. 회원가입 페이지 보여줌
  @GetMapping("/join")
  public String getJoinForm() {
    return "joinForm"; // 회원가입 폼 페이지의 이름 (예: joinForm.html)
  }

//  1-2. 회원가입 처리
  @PostMapping("/join")
  public String join(MemberDto.Join joinDto) {
    Boolean result = memberService.join(joinDto);
    if (result) {
      return "redirect:/login"; // 회원가입 성공 시 로그인 페이지로 이동
    } else {
      return "redirect:/members/join?error"; // 회원가입 실패 시 오류 메시지와 함께 회원가입 폼 페이지로 다시 이동
    }
  }

//  2. 아이디 중복 확인
  @GetMapping("/checkId")
  @ResponseBody
  public Boolean checkId(@RequestParam String memberId) {
    return memberService.idAvailable(memberId);
  }

//  3. 전화번호 중복 확인
  @GetMapping("/checkTel")
  @ResponseBody
  public Boolean checkTel(@RequestParam String memberTel) {
    return memberService.telAvailable(memberTel);
  }

//  4. 내 정보 보기
  @GetMapping("/myInfo")
  public ModelAndView myInfo(@RequestParam String memberId) {
    ModelAndView modelAndView = new ModelAndView("myInfo");
    MemberDto.Read readDto = memberService.read(memberId);
    modelAndView.addObject("myInfo", readDto);
    return modelAndView;
  }

//  5. 비밀번호 변경
  @PostMapping("/changePass")
  public String changePassword(@RequestParam String newPassword, @RequestParam String memberId) {
    Boolean result = memberService.changePass(newPassword, memberId);
    if (result) {
      return "redirect:/members/myInfo?memberId=" + memberId;
    } else {
      return "redirect:/members/myInfo?memberId=" + memberId + "&error";
    }
  }

//  6. 이메일 변경
  @PostMapping("/changeEmail")
  public String changeEmail(@RequestParam String newEmail, @RequestParam String password,
      @RequestParam String memberId) {
    Boolean result = memberService.changeEmail(newEmail, password);
    if (result) {
      return "redirect:/members/myInfo?memberId=" + memberId;
    } else {
      return "redirect:/members/myInfo?memberId=" + memberId + "&error";
    }
  }

//  7. 전화번호 변경
  @PostMapping("/changeTel")
  public String changeTel(@RequestParam String newTel, @RequestParam String password, @RequestParam String memberId) {
    Boolean result = memberService.changeTel(newTel, password);
    if (result) {
      return "redirect:/members/myInfo?memberId=" + memberId;
    } else {
      return "redirect:/members/myInfo?memberId=" + memberId + "&error";
    }
  }

//  8. 프로필 사진 변경
  @PostMapping("/changeProfile")
  public String changeProfile(@RequestParam String newProfile, @RequestParam String memberId) {
    Boolean result = memberService.changeProfile(newProfile, memberId);
    if (result) {
      return "redirect:/members/myInfo?memberId=" + memberId;
    } else {
      return "redirect:/members/myInfo?memberId=" + memberId + "&error";
    }
  }

//  9. 회원 탈퇴
  @PostMapping("/quit")
  public String quit(@RequestParam String memberId, RedirectAttributes redirectAttributes) {
    Boolean result = memberService.quit(memberId);
    if (result) {
      redirectAttributes.addFlashAttribute("quitSuccess", true);
      return "redirect:/logout";
    } else {
      redirectAttributes.addFlashAttribute("quitError", true);
      return "redirect:/members/myInfo?memberId=" + memberId;
    }
  }
  /*
   * [참고]
   * 추후에 변동될 사항이 많으니, 기본 예로 볼 것
   * 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   * */
}
