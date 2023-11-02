package com.pageflow.controller.member;

import java.security.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.core.authority.*;
import org.springframework.security.core.context.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.pageflow.dto.member.*;
import com.pageflow.dto.member.MemberDto.*;
import com.pageflow.entity.member.*;
import com.pageflow.service.member.*;

/*
 * 10-24 유석호 
 * 컨트롤러 순서 정리
 * GetMapping은 다위로
 * 그아래 PostMapping 
 */

/*
 * 10/31 16:38
 * 수정자 : 갈현
 * 수정 내용 : 네이버 로그인 OpenAPI 포기로 인한 컨트롤러 메서드 삭제
 * */

@Controller
public class MemberController {
  @Autowired
  private MemberService memberService;
  @Autowired
  private PasswordEncoder encoder;

  // 1.회원가입 페이지를 반환
  @PreAuthorize("isAnonymous()")
  @GetMapping("/member_create_page")
  public ModelAndView getJoinForm() {
    return new ModelAndView("member_create_page");
  }

  // 1-1 회원 정보 수정 전 비밀번호 확인 페이지를 보여줍니다
  @GetMapping("/member_check_page")
  public void member_check_page() {
  }

  // 아직 사용안함.
//  1-2 현재 로그인된 사용자의 정보를 보여주는 페이지를 반환합니다.
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

  // 1-3.회원 정보 수정 페이지 보기 ( 현재 로그인된 사용자의 정보를 수정하는 페이지를 반환합니다.)
  @Secured("ROLE_USER")
  @GetMapping("/member_edit_page")
  public ModelAndView edit(Principal principal) {
    Read dto = memberService.read(principal.getName());
    return new ModelAndView("member_edit_page").addObject("member", dto);
    // addObject("member", dto) 부분이 그 역할을 합니다.
    // 이렇게 하면 dto 객체가 "member"라는 이름으로 뷰에 전달되며, JSP 페이지에서 ${member}로 접근할 수 있습니다.

  }

//		1-4 로그인 처리(로그인 페이지를 보여줍니다.)
  @PreAuthorize("isAnonymous()")
  @GetMapping("/member_login_page")
  public void login() {
  }

  // 2. 회원가입 처리( 새로운 회원을 생성하고, 성공 시 로그인 페이지로 리다이렉트하며, 실패 시 오류 메시지와 함께 회원 가입 페이지로
  // 다시 이동합니다.)
  @PreAuthorize("isAnonymous()")
  @PostMapping("/member_create_page")
  public String join(MemberDto.Join joinDto, HttpServletRequest request) {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("email");

    if (email == null || email.isEmpty()) {
//		  예외 던지기
      throw new IllegalStateException("세션에 이메일이 없습니다.");
//		  에러 처리(예외 처리가 더 좋을 것 같아 throw 사용)
      // return "redirect:/member_create_page?error=noEmail";
    }

    joinDto.setMemberEmail(email);

    Boolean result = memberService.join(joinDto);
    if (result) { // result == true 와 같음
      // 회원가입 성공시 memberName을 꺼내와서 ~~ 님 반갑습니다.를 가져오기 위해
      // joinDto.getMemberName()을 호출하여 'memberName' 필드의 값을 가져옴
      String memberId = joinDto.getMemberId();
      String memberName = joinDto.getMemberName();

      session.setAttribute("memberId", memberId);
      session.setAttribute("memberName", memberName);

      /* -------------------------------------------- */
//			이메일 값 날리기
      session.removeAttribute("email");
      return "redirect:/member_create_success_page"; // 회원가입 성공 시 로그인 페이지로 이동
    } else {
      return "redirect:/member_create_page?error"; // 회원가입 실패 시 오류 메시지와 함께 회원가입 페이지로 다시 이동
    }

  }

//  3. 비밀번호 변경(현재 로그인 된 사용자의 비밀번호 변경 처리 후 결과에 따라 해당 경로로 리다이렉트 합니다.)
  @Secured("ROLE_USER")
  @PostMapping("/changePass")
  public String changePassword(@RequestParam("password") String password, @RequestParam("memberId") String memberId) {
    Boolean result = memberService.changePass(password, memberId);
    if (result) {
      return "redirect:/member_edit_page?memberId=";
    } else {
      return "redirect:/member_edit_page?memberId=" + "&error";
    }
  }

//  4. 이메일 변경(현재 로그인 된 사용자의 이메일 변경 처리 후 결과에 따라 해당 경로로 리다이렉트 합니다.)
  @Secured("ROLE_USER")
  @PostMapping("/changeEmail")
  public ModelAndView changeEmail(@RequestParam String newEmail, Principal principal) {
    Boolean result = memberService.changeEmail(principal.getName(), newEmail);
    if (result) {
      return new ModelAndView("redirect:/member_edit_page");
    } else {
      return new ModelAndView("redirect:/member_edit_page?error");
    }
  }

//  5. 전화번호 변경( 현재 로그인 된 사용자의 전화번호 변경 처리 후 결과에 따라 해당 경로로 리다이렉트 합니다.)
  @Secured("ROLE_USER")
  @PostMapping("/changeTel")
  public ModelAndView changeTel(@RequestParam String newTel) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String memberId = authentication.getName();

    Boolean result = memberService.changeTel(memberId, newTel);
    if (result) {
      return new ModelAndView("redirect:/member_edit_page");
    } else {
      return new ModelAndView("redirect:/member_edit_page?error");
    }
  }

  // 추후 할 예정
//  8. 프로필 사진 변경
//  @Secured("ROLE_USER")
//  @PostMapping("/changeProfile")
//  public String changeProfile(@RequestParam MultipartFile newProfile, @RequestParam String memberId) {
//    Boolean result = memberService.changeProfile(newProfile, memberId);
//    if (result) {
//      return "redirect:/members/myInfo?memberId=" + memberId;
//    } else {
//      return "redirect:/members/myInfo?memberId=" + memberId + "&error";
//    }
//  }

//  6 회원 탈퇴	edit_page에서 활용(현재 세션을 종료하고, 탈퇴처리 후 루트페이지('/')으로 리다이렉트 합니다.)
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

  // 7. 비빌번호 확인(내 정보 보기를 했을 때 먼저 이동) (입력 받은 비밀번호가 일치하는지 확인하고, 일치한다면 세션 설정 등 필요한 작업
  // 수행 후 응답을 보냅니다.)
  @Secured("ROLE_USER")
  @PostMapping("/member_check_page")
  public ResponseEntity<?> checkPassword(@RequestParam String password, Principal principal) {
    if (password.isEmpty()) {
      return ResponseEntity.badRequest().body("※비밀번호가 입력되지 않았습니다.");
    }

    Boolean result = memberService.checkPass(password, principal.getName());

    if (result == false || password.trim().isEmpty()) {
      return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("※입력하신 정보가 일치하지 않습니다.\r\n" + "다시 확인해 주세요..");
    }
    return ResponseEntity.ok().build();
  }

  // 8. 회원 비밀번호 변경 처리
  @Secured("ROLE_USER")
  @PostMapping("/member_change_password")
  public String changePassword(@RequestParam String newPassword, Principal principal) {
    Boolean result = memberService.changePass(newPassword, principal.getName());
    if (result) {
      return "redirect:/member_info_page";
    } else {
      return "redirect:/member_change_password?error";
    }
  }

  // 9. 회원 로그아웃 처리 (현재 세션을 종료하고, 루트페이지('/')으로 리다이렉트 합니다.)
  @Secured("ROLE_USER")
  @PostMapping("/logout")
  public ModelAndView logout(HttpSession session) {
//    현재 세션 날리기
    session.invalidate();
    return new ModelAndView("redirect:/");
  }

  // 10. 로그인 처리( 입력 받은 ID와 비밀번호가 유효한 경우 인증 객체 생성 및 저장 후, 정상적으로 응답을 보내며 실패시 에러 메시지와
  // 함께 응답을 보냅니다.)
  @PreAuthorize("isAnonymous()")
  @PostMapping("/login")
  public ResponseEntity<?> login(Login request) {
    try {
      Member loggedInMember;
      if (request.getMemberId().equals("admin")) {
        if (!encoder.matches(request.getPassword(), encoder.encode("1234"))) {
          throw new BadCredentialsException("입력하신 정보가 일치하지 않습니다.");
        }
        loggedInMember = new Member(); // create a Member instance for admin user here.
      } else {
        loggedInMember = memberService.login(request.getMemberId(), request.getPassword());
      }

      List<GrantedAuthority> authorities = new ArrayList<>();
      if (request.getMemberId().equals("admin")) {
        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
      } else {
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
      }

      Authentication auth = new UsernamePasswordAuthenticationToken(loggedInMember.getMemberId(),
          loggedInMember.getPassword(), authorities);

      // Security Context에 Authentication 객체 저장
      SecurityContextHolder.getContext().setAuthentication(auth);

      return ResponseEntity.ok(loggedInMember); // 로그인 성공 시 사용자 정보 반환

    } catch (UsernameNotFoundException e) {
      return ResponseEntity.status(401).body("일치하는 아이디가 없습니다."); // 아이디 불일치

    } catch (BadCredentialsException e) {
      return ResponseEntity.status(401).body("입력하신 정보가 일치하지 않습니다."); // 비밀번호 불일치
    }
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */

}
