/*
 * 2023-09-27 pm|19:20
 * 최근 수정자: 갈현
 * 수정 내용:
 * memer_create => mem_cre
 * 전화번호 인증 코드 추가 구현 완료
 * 비밀번호 암복호화 코드 수정 확인 바람
 * */

package com.example.demo.controller.member;

import com.example.demo.dto.member.MemberDto;
import com.example.demo.service.member.MemberService;

import java.security.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
  @Autowired
  private MemberService memberService;

//  1-1. 회원가입 페이지 보여줌
  @PreAuthorize("isAnonymous()")
  @GetMapping("/member_create_page")
  public ModelAndView getJoinForm() {
    return new ModelAndView("member_create_page");
  }

//  1-2. 회원가입 처리
  @PreAuthorize("isAnonymous()")
  @PostMapping("/member_create_page")
  public String join(MemberDto.Join joinDto) {
    Boolean result = memberService.join(joinDto);
    if (result) { // result == true 와 같음
      return "redirect:/member_create_success_page"; // 회원가입 성공 시 로그인 페이지로 이동
    } else {
      return "redirect:/members/member_create_page?error"; // 회원가입 실패 시 오류 메시지와 함께 회원가입 페이지로 다시 이동
    }
  }

//  2. 아이디 중복 확인
  @PostMapping("/checkId")
  public Boolean checkId(@RequestParam String memberId) {
    return memberService.idAvailable(memberId);
  }

//  3. 전화번호 중복 확인
  @PostMapping("/checkTel")
  public Boolean checkTel(@RequestParam String memberTel) {
    return memberService.telAvailable(memberTel);
  }

//  4. 내 정보 보기
  @Secured("ROLE_USER")
  @GetMapping("/member_info_page")
  public ModelAndView myInfo(Principal principal, HttpSession session) {
    if (session.getAttribute("checkPassword") == null) {
      return new ModelAndView("redirect:/member_check_page");
    } else {
      MemberDto.Read dto = memberService.read(principal.getName());
      return new ModelAndView("/member_info_page").addObject("member", dto);
    }
  }

//  5. 비밀번호 변경
  @Secured("ROLE_USER")
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
  @Secured("ROLE_USER")
  @PostMapping("/changeEmail")
  public ModelAndView changeEmail(@RequestParam String newEmail, @RequestParam Principal principal) {
    memberService.changeEmail(newEmail, principal.getName());
    return new ModelAndView("redirect:/read");
  }

//  7. 전화번호 변경
  @Secured("ROLE_USER")
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
  @Secured("ROLE_USER")
  @PostMapping("/changeProfile")
  public String changeProfile(@RequestParam MultipartFile newProfile, @RequestParam String memberId) {
    Boolean result = memberService.changeProfile(newProfile, memberId);
    if (result) {
      return "redirect:/members/myInfo?memberId=" + memberId;
    } else {
      return "redirect:/members/myInfo?memberId=" + memberId + "&error";
    }
  }

//  9. 회원 탈퇴	
  @Secured("ROLE_USER")
  @PostMapping("/quit")
  public ModelAndView quit(Principal principal, HttpSession session) {
//    세션 날림
    session.invalidate();
//    로그인 되어있던 정보를 바탕으로 quit() 메서드 호출
    memberService.quit(principal.getName());
//    루트 페이지로 이동시킴
    return new ModelAndView("redirect:/");
  }

//  10. 비빌번호 확인(내 정보 보기를 했을 때 먼저 이동)
  @Secured("ROLE_USER")
  @PostMapping("/member_check")
  public ModelAndView checkPassword(@RequestParam String password, Principal principal, HttpSession session) {
    String checkPass = "redirect:/member_check";
    String checkPassErr = checkPass + "?error";
//    비밀번호 확인이 되어있는 상태가 아니라면
    if (password.isEmpty()) {
//      checkPassword 페이지로 이동
      return new ModelAndView(checkPass);
    }
    Boolean result = memberService.checkPass(password, principal.getName());
//    checkPass() 메서드가 실패했거나 공백을 없앤 비밀번호도 비어있다면
    if (result == false || password.trim().isEmpty()) {
//      에러 페이지로 이동
      return new ModelAndView(checkPassErr);
    } else {
      session.setAttribute("checkPassword", true);
      return new ModelAndView("redirect:/member_info_page");
    }
  }

  // 11. 회원 정보 수정 페이지 보기
  @Secured("ROLE_USER")
  @GetMapping("/member_edit_page")
  public ModelAndView editProfile(Principal principal, HttpSession session) {
    if (session.getAttribute("checkPassword") == null) {
      return new ModelAndView("redirect:/member_check_page");
    } else {
      MemberDto.Read dto = memberService.read(principal.getName());
      return new ModelAndView("/member_edit_page").addObject("member", dto);
    }
  }

  // 12. 회원 정보 수정 처리
  @Secured("ROLE_USER")
  @PostMapping("/member_edit_page")
  public String updateProfile(@ModelAttribute MultipartFile newProfile, Principal principal) {
    Boolean result = memberService.changeProfile(newProfile, principal.getName());
    if (result) {
      return "redirect:/member_info_page";
    } else {
      return "redirect:/member_edit_page?error";
    }
  }
  /*
   * 추후 수정 및 추가할 부분임(updateProfile)
   * 건들지 않기
   * */

  // 13. 회원 비밀번호 변경 페이지 보기
  @Secured("ROLE_USER")
  @GetMapping("/member_change_password_page")
  public ModelAndView changePasswordPage(Principal principal, HttpSession session) {
    if (session.getAttribute("checkPassword") == null) {
      return new ModelAndView("redirect:/member_check_page");
    } else {
      return new ModelAndView("/member_change_password_page");
    }
  }

  // 14. 회원 비밀번호 변경 처리
  @Secured("ROLE_USER")
  @PostMapping("/member_change_password")
  public String changePassword(@RequestParam String newPassword, Principal principal) {
    Boolean result = memberService.changePass(newPassword, principal.getName());
    if (result) {
      return "redirect:/member_info_page";
    } else {
      return "redirect://member_change_password?error";
    }
  }

  // 15. 회원 로그아웃 처리
  @Secured("ROLE_USER")
  @PostMapping("/logout")
  public ModelAndView logout(HttpSession session) {
//    현재 세션 날리기
    session.invalidate();
    return new ModelAndView("redirect:/");
  }
  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
