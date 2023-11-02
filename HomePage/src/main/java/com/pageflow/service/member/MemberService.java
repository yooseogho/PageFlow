package com.pageflow.service.member;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pageflow.dao.member.*;
import com.pageflow.dto.member.*;
import com.pageflow.dto.member.MemberDto.*;
import com.pageflow.entity.member.*;

@Service
public class MemberService {
  @Autowired
  MemberDao memberDao;
  @Autowired
  private PasswordEncoder encoder;
  
  @Value("${profileFolder}")
  private String profileFolder;
  @Value("${defaultProfile}")
  private String defaultProfile;
  @Value("${profileUrl}")
  private String profileUrl;
  
//  1. 아이디 중복 확인 (SELECT 문)
  @Transactional(readOnly=true) // readOnly 속성은 SELECT 문만 사용하겠다고 선언, 큰 의미 없음
  public Boolean idAvailable(String memberId) {
    return memberDao.findById(memberId)==null;  
  }
  
//  2. 회원가입 (INSERT 문)
  public Boolean join(MemberDto.Join dto) {
    MultipartFile profile = dto.getProfile();
    String profileName = defaultProfile;

    
//  dtf 객체에 날짜 형식을 지정

    // 프로필 사진이 존재하고 비어있지 않다면
    if(profile != null && !profile.isEmpty()) {
        // 파일의 확장자를 추출하고
        String extension = FilenameUtils.getExtension(profile.getOriginalFilename());
        // 파일 이름을 아이디.확장자로 설정하고
        profileName = dto.getMemberId() + "." + extension;
        // 파일의 폴더를 profileFolder 객체로,
        // 파일의 이름을 위 profileName 변수로 설정하고
        File file = new File(profileFolder, profileName);
        
        try {
            // profile의 내용을 file로 이동시키고 예외 처리함
            profile.transferTo(file);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
    }
//    프로필 사진을 넣지 않았다면
//    입력된 비밀번호를 암호화하여 변수에 담고
//    (BCryptPasswordEncoder 사용)
    String encodedPassword = encoder.encode(dto.getPassword());
//    member 객체에 기본 프로필 사진과 위에서 암호화한 비밀번호를 담고
//    (DTO의 toEntity 메서드 사용)
    Member member = dto.toEntity(defaultProfile, encodedPassword);
//    INSERT 문을 반환하여 행을 추가함
    return memberDao.save(member)==1;
  }
  
  //------------------------------------------------------------------------------------------------------------
  //10-24 유석호
  // 2-1 member 정보 가져오기 위한 매서드
  public MemberDto.Profile MemberProfile(String memberId) {
	    Member member = memberDao.findById(memberId);

	    if (member == null) {
	        throw new UsernameNotFoundException("User not found: " + memberId);
	    }

	    return new MemberDto.Profile(member.getMemberId(), member.getMemberName(), member.getMemberProfile());
	}


  //------------------------------------------------------------------------------------------------------------
  //2-2 프사변경
  @Secured("ROLE_USER")
  @Transactional
  public Boolean changeProfile(MultipartFile newProfile, String memberId) {
      Member member = memberDao.findById(memberId);

      if (member == null) {
          throw new UsernameNotFoundException("User not found: " + memberId);
      }

      String newProfileName;
      if (newProfile != null && !newProfile.isEmpty()) {
          newProfileName = memberId + "_" + newProfile.getOriginalFilename();

          try {
              // 파일을 저장
              newProfile.transferTo(new File(profileFolder + newProfileName));
          } catch (IOException e) {
              // 파일 저장 실패
              e.printStackTrace();
              return false;
          }
      } else {
          // newProfile가 null이거나 비어 있을 때 기본 이미지로 변경
          newProfileName = "defaultProfile.png";
      }

      memberDao.changeProfile(newProfileName, memberId);

      return true;
  }

  
//3. 전화번호 중복 확인 (SELECT 문)
public Boolean telAvailable(String memberTel) {
//  전화번호가 겹치면 false, 그렇지 않으면 true 반환
  return memberDao.findByTel(memberTel)==null;
}

//  3-1 이메일 중복 확인
  public Boolean checkEmailAvailable(String memberEmail) {
      return memberDao.findByEmail(memberEmail) == null;
  }
  
  // 3-2 로그인 
  public Member login(String memberId, String password) {
	    // 아이디로 사용자 정보를 조회합니다.
	    Member member = memberDao.findById(memberId);

	    // 사용자 정보가 없으면
	    if (member == null) {
	        throw new UsernameNotFoundException("일치하는 아이디가 없습니다.");
	    }
	    // 비밀번호가 일치하지 않으면
	    if (!encoder.matches(password, member.getPassword())) {
	        throw new BadCredentialsException("입력하신 정보가 일치하지 않습니다.");
	    }
	    return member;  // 로그인 성공 시 사용자 정보를 반환합니다.
	}

  
//  4. 내 정보 보기 (SELECT 문)
  public Read read(String memberId) {
    Member m = memberDao.findById(memberId);
    
//    dtf 객체에 날짜 형식을 지정
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
   
    String birthday = dtf.format(m.getBirthday());
    String joinday = dtf.format(m.getJoinday());
 
    
//    days에 입력되어 있는 가입일~현재 날짜 사이를 계산하여
//    가입한 지 얼마나 되었는지를 담음
    Long days = ChronoUnit.DAYS.between(m.getJoinday(), LocalDate.now());
    
    String profile = profileUrl + m.getMemberProfile();
    // DTO에서 전화번호 및 이름 추가 수정10-15 유석호
    return new MemberDto.Read(m.getMemberId(), m.getMemberEmail(), birthday, joinday, days, profile,m.getMemberName(),m.getMemberTel());
  }
  
//  5. 비밀번호 변경 (UPDATE 문)
  public Boolean changePass(String password, String memberId) {
	  String newpassword = encoder.encode(password);
    return memberDao.changePassword(newpassword, memberId)==1;
    
  }
  
  // 5.5 비밀번호 중복확인	 //10-17 유석호 
  public Boolean passwordAvailable(String memberId, String newPassword) {
      Member member = memberDao.findById(memberId);
      if (member == null) {
          throw new UsernameNotFoundException("User not found with username: " + memberId);
      }

      // 현재 비밀번호와 새로운 비밀번호가 같은지 확인
      return !encoder.matches(newPassword, member.getPassword());
  }

  
//  6. 이메일 변경 (UPDATE 문)
public Boolean changeEmail(String memberId, String memberEmail) {
   return memberDao.changeMemberEmail(memberId, memberEmail)==1;
}
//  7. 전화번호 변경 (UPDATE 문)
public Boolean changeTel(String memberId, String memberTel) {
    Integer result = memberDao.changeMemberTel(memberId, memberTel);
    
    // Update 문은 성공적으로 실행되면 affected row의 수를 반환합니다.
    // 따라서 결과가 0보다 크다면 업데이트가 성공적으로 이루어진 것입니다.
    return (result > 0);
}



  
//  9. 회원 탈퇴 (DELETE 문)
  public Boolean quit(String memberId) {
//    아이디를 기준으로 조회를 하고
    Member m = memberDao.findById(memberId);
//    변수 f에 파일 폴더와 파일 이름을 담고
    File f = new File(profileFolder, m.getMemberProfile());
//    파일 이름이 기본 파일이 아니면서 파일이 존재한다면
    if(!(m.getMemberProfile().equals(defaultProfile))&&f.exists()) {
//      파일을 지우고
      f.delete();
    }
//    DELETE 문을 실행함
    return memberDao.deleteById(memberId)==1;
  }
  
//  10-1. 아이디 찾기 (SELECT 문 - member_email 컬럼으로)
  public String findUsernameByEmail(String memberEmail) {
//    member 객체에 SELECT 문을 실행하는
//    쿼리를 담음
    Member member = memberDao.findIdByEmail(memberEmail);
//    아이디가 없으면 NULL을,
//    있으면 member에서 아이디를 받아와 반환
    return member==null? null : member.getMemberId();
  }
  
//  10-2. 아이디 찾기 (SELECT 문 - member_tel 컬럼으로)
  public String findUsernameByTel(String memberTel) {
    Member member = memberDao.findIdByTel(memberTel);
    return member==null? null : member.getMemberId();
  }
  
//  11. 비빌번호 확인
  public Boolean checkPass(String password, String memberId) {
    Member m = memberDao.findById(memberId);
    if(m==null) {
      return false;
    }else {
      return encoder.matches(password, m.getPassword());
    }
  }
}