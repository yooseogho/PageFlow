package com.pageflow.controller.member;

import java.io.File;
import java.nio.file.Files;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pageflow.dto.member.MemberDto;
import com.pageflow.dto.member.MemberDto.Login;
import com.pageflow.dto.member.MemberDto.Profile;
import com.pageflow.dto.member.MemberDto.Read;
import com.pageflow.dto.memberGrade.MemberGradeDto;
import com.pageflow.entity.member.Member;
import com.pageflow.service.member.MemberService;
import com.pageflow.service.memberGrade.MemberGradeService;

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
  @Autowired
  private MemberGradeService gradeService;

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

  // 1-2 현재 로그인된 사용자의 정보를 보여주는 페이지를 반환합니다.
  @Secured("ROLE_USER")
  @GetMapping("/member_info_page")
  public ModelAndView myInfo(Principal principal, HttpSession session) {
    Profile memberProfile = memberService.MemberProfile(principal.getName());

    // MemberGradeDto.MemberInfoDto 객체에서 gradeCode를 가져옵니다.
    MemberGradeDto.MemberInfoDto memberInfo = memberService.getMemberInfo(principal.getName());
    Long gradeCode = memberInfo.getGradeCode();

    // gradeCode를 이용해서 gradeName을 가져옵니다.
    String gradeName = gradeService.getGradeNameByCode(gradeCode);

    // ModelAndView에 memberProfile과 gradeName을 추가합니다.
    ModelAndView modelAndView = new ModelAndView("/member_info_page");
    modelAndView.addObject("member", memberProfile);
    modelAndView.addObject("gradeName", gradeName);

    return modelAndView;
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

  // 1-5 프로필 변경 페이지
  @Secured("ROLE_USER")
  @GetMapping("/member_profile_page")
  public ModelAndView profilePage(Principal principal, Model model, HttpSession session) {
    Profile memberProfile = memberService.MemberProfile(principal.getName());

    // MemberGradeDto.MemberInfoDto 객체에서 gradeName를 가져옵니다.
    MemberGradeDto.MemberInfoDto memberInfo = memberService.getMemberInfo(principal.getName());
    String gradeName = memberInfo.getGradeName();

    // 모델에 현재 등급 이름 추가
    model.addAttribute("gradeName", gradeName);

    return new ModelAndView("/member_profile_page").addObject("member", memberProfile);
  }

  // 1-6 회원 가입 성공 페이지
  @GetMapping("member_create_success_page")
  public void member_create_success_page() {
  }

  // 1-7 회원 포인트 확인하는 페이지
  @Secured("ROLE_USER")
  @GetMapping("/member_point_page")
  public String pointpage(Model model, Principal principal) {
    // 로그인한 사용자의 ID를 얻습니다.
    String memberId = principal.getName();

    // 데이터베이스에서 회원 정보를 조회합니다.
    Profile memberProfile = memberService.MemberProfile(memberId);

    // 모델에 회원 정보를 추가합니다.
    model.addAttribute("member", memberProfile);

    // MemberGradeDto.MemberInfoDto 객체에서 gradeName를 가져옵니다.
    MemberGradeDto.MemberInfoDto memberInfo = memberService.getMemberInfo(memberId);
    String gradeName = memberInfo.getGradeName();

    // 모델에 현재 등급 이름 추가
    model.addAttribute("gradeName", gradeName);

    Long purchaseTotal = gradeService.getPurchaseTotal(memberId);
    model.addAttribute("purchaseTotal", purchaseTotal);

    return "/member_point_page";
  }

  // 11-01 회원등급 업데이트
  // 1-8 회원등급 페이지 (누적 금액을 알 수 있음)
  @GetMapping("/member_grade_page")
  public String member_grade_page(@RequestParam(value = "memberId", required = false) String memberId,
      @RequestParam(value = "purchaseTotal", required = false) Long purchaseTotal, Principal principal, Model model) {
    // memberId와 purchaseTotal이 null이 아닐 때
    if (memberId != null && purchaseTotal != null) {
      // 회원 등급 업데이트 로직 수행
      Integer result = gradeService.updateGrade(memberId, purchaseTotal);

      // 모델에 memberId와 purchaseTotal 추가
      model.addAttribute("memberId", memberId);
      model.addAttribute("purchaseTotal", purchaseTotal != null ? purchaseTotal : 0);

      // 등급 업데이트가 실패했을 경우 에러 메시지를 모델에 추가
      if (result == null) {
        model.addAttribute("error", "There was an error updating the grade.");
      }
    } else { // memberId나 purchaseTotal 중 하나라도 null일 때
      if (principal != null) {
        // 로그인한 사용자의 정보를 가져옴
        // 기존 로직 수행
        memberId = principal.getName();
        // 최근 3개월간의 구매 총액 계산
        Long purchaseTotalForLastThreeMonths = gradeService.getPurchaseTotalForLastThreeMonths(memberId);

        // 구매 총액이 null일 경우 기본값 설정 (예: 0)
        if (purchaseTotalForLastThreeMonths == null) {
          purchaseTotalForLastThreeMonths = 0L;
        }
        // 사용자 프로필 정보 가져오기
        Profile member = memberService.MemberProfile(memberId);
        // 사용자의 현재 등급 가져오기
        String memberGrade = gradeService.getMemberGrade(memberId);

        if (memberGrade == null) {
          memberGrade = "FRIENDS"; // 등급 정보가 없는 경우 기본값 설정
        }

        int currentGradeCode; // 현재 등급 코드를 저장할 변수 선언

        switch (memberGrade.toLowerCase()) { // 소문자로 변환하여 등급 비교

        case "silver":
          currentGradeCode = 1;
          break;
        case "gold":
          currentGradeCode = 2;
          break;
        case "platinum":
          currentGradeCode = 3;
          break;
        default:
          currentGradeCode = 4; // 그 외의 경우(등급이 없거나 다른 문자열인 경우)
          break;
        }

        String nextGrade; // 다음 달성 가능한 등급을 저장할 변수 선언

        switch (memberGrade.toLowerCase()) {

        case "friends":
          nextGrade = "실버";
          break;

        case "silver":
          nextGrade = "골드";
          break;

        case "gold":
          nextGrade = "플래티넘";
          break;

        default:
          nextGrade = null; // 이미 최고등급인 경우
        }
        // 모델에 다음 달성 가능한 등급 추가
        model.addAttribute("nextGrade", nextGrade);

        // 다음 등급까지 필요한 추가 구매액 계산
        int additionalPurchaseRequired = gradeService
            .calculatePurchaseRequired(purchaseTotalForLastThreeMonths.intValue(), currentGradeCode);

        // 모델에 추가 구매액, 최근 3개월간의 구매 총액, 사용자 프로필 정보, 현재 등급 추가
        model.addAttribute("additionalPurchaseRequired", additionalPurchaseRequired);
        model.addAttribute("purchaseTotalForLastThreeMonths", purchaseTotalForLastThreeMonths);
        model.addAttribute("member", member);
        model.addAttribute("memberGrade", memberGrade);

      } else {
        // 로그인하지 않은 사용자는 로그인 페이지로 리다이렉트
        return "redirect:/member_login_page";
      }
    }
    return "/member_grade_page"; // 회원 등급 페이지 반환
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

//8. 프로필 사진 변경
  @Secured("ROLE_USER")
  @PostMapping("/changeProfile")
  public String changeProfile(@RequestParam(required = false) MultipartFile newProfile, @RequestParam String memberId) {
    Boolean result = memberService.changeProfile(newProfile, memberId);

    if (result) {
      return "redirect:/member_profile_page?memberId=" + memberId;
    } else {
      return "redirect:/member_profile_page?memberId=" + memberId + "&error";
    }
  }

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

  // check_page.jsp 활용
  // 7. 비빌번호 확인(내 정보 보기를 했을 때 먼저 이동) (입력 받은 비밀번호가 일치하는지 확인하고, 일치한다면 세션 설정 등 필요한 작업
  // 수행 후 응답을 보냅니다.)
  // check
  @Secured("ROLE_USER")
  @PostMapping("/member_check_page")
  public ResponseEntity<?> checkPassword(@RequestParam String password, @RequestParam(required = false) String referrer,
      Principal principal, HttpSession session) {
    if (password.isEmpty()) {
      return ResponseEntity.badRequest().body("※비밀번호가 입력되지 않았습니다.");
    }

    Boolean result = memberService.checkPass(password, principal.getName());

    if (result == false || password.trim().isEmpty()) {
      return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("※입력하신 정보가 일치하지 않습니다.\r\n다시 확인해 주세요..");
    }

    session.setAttribute("checkPassword", true);

    if ("/member_info_page".equals(referrer)) {
      return ResponseEntity.ok().body("/member_info_page"); // 내정보보기 눌렀을때
    } else {
      return ResponseEntity.ok().body("/member_edit_page"); // 회정정보관리 눌렀을때
    }
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
  @PostMapping("/api/login")
  public ResponseEntity<?> login(@RequestBody Login request) {
// Print out the received request body
    System.out.println(request.toString());
    try {
      System.out.println("Received login request: " + request.toString()); // 로그인 요청 로그 출력

      if (request.getMemberId() == null || request.getPassword() == null) {
        return ResponseEntity.status(400).body("아이디와 비밀번호를 모두 입력해주세요.");
      }

      Member loggedInMember;
      if (request.getMemberId().equals("admin")) {
        if (!encoder.matches(request.getPassword(), encoder.encode("1234"))) {
          throw new BadCredentialsException("입력하신 정보가 일치하지 않습니다.");
        }
        loggedInMember = new Member(); // create a Member instance for admin user here.
        loggedInMember.setMemberId(request.getMemberId()); // 'memberId' 필드 설정
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

      System.out.println("Authentication object created: " + auth.toString());

// Security Context에 Authentication 객체 저장
      SecurityContextHolder.getContext().setAuthentication(auth);

      Authentication authInContext = SecurityContextHolder.getContext().getAuthentication();
      System.out.println("Authentication object in Security Context: " + authInContext.toString());

      return ResponseEntity.ok(loggedInMember); // 로그인 성공 시 사용자 정보 반환

    } catch (UsernameNotFoundException e) {
      return ResponseEntity.status(401).body("일치하는 아이디가 없습니다."); // 아이디 불일치

    } catch (BadCredentialsException e) {
      return ResponseEntity.status(401).body("입력하신 정보가 일치하지 않습니다."); // 비밀번호 불일치
    }
  }

//회원 이미지 보여주기 위한 설정
  @GetMapping("/profiles/{imageName}")
  public ResponseEntity<byte[]> viewProfile(@PathVariable String imageName) {
    File file = new File("c:/upload/profiles", imageName);
    try {
      byte[] bytes = Files.readAllBytes(file.toPath());
      String contentType = Files.probeContentType(file.toPath());
      MediaType type = MediaType.parseMediaType(contentType);
      return ResponseEntity.ok().contentType(type).body(bytes);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */

}
