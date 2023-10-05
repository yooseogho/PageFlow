package com.example.demo.service.member;

import java.io.*;
import java.time.*;
import java.time.format.*;
import java.time.temporal.*;

import org.apache.commons.io.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

import com.example.demo.dao.member.*;
import com.example.demo.dto.member.*;
import com.example.demo.dto.member.MemberDto.*;
import com.example.demo.entity.member.*;

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
  
//  2. 회원가입 (INSERT 문)															// profile 객체가 null인 경우에 대한 처리를 추가해야 합니다:
  public Boolean join(MemberDto.Join dto) {
	    MultipartFile profile = dto.getProfile();
	    String profileName = defaultProfile;
	        
//	    프로필 사진이 제공되었으며 비어있지 않다면
	    if(profile != null && !profile.isEmpty()) {
//	      파일의 확장자를 추출하고
	        String extension = FilenameUtils.getExtension(profile.getOriginalFilename());
//	      파일 이름을 아이디.확장자로 설정하고
	        profileName = dto.getMemberId() + "." + extension;
//	      파일의 폴더를 profileFolder 객체로,
//	      파일의 이름을 위 profileName 변수로 설정하고
	        File file = new File(profileFolder, profileName);
//	      profile의 내용을 file로 이동시키고
//	      예외 처리(try-catch 문, transferTo() 메서드를 사용하면
//	      자동으로 생성됨)를 수행함
	        try {
	            profile.transferTo(file);
	        } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	            return false; // If file transfer fails return false early.
	        }
	    }

	    // If the user uploaded a photo update the filename.
	    if (profile != null && !profile.isEmpty()) {
	       defaultProfile = profileName;
	    }

//	    입력된 비밀번호를 암호화하여 변수에 담고 (BCryptPasswordEncoder 사용)
	    String encodedPassword = encoder.encode(dto.getPassword());
	    
	//  member 객체에 기본 프로필 사진과 위에서 암호화한 비밀번호를 담고(DTO의 toEntity 메서드 사용)
	   Member member = dto.toEntity(defaultProfile, encodedPassword);
	    
	   // INSERT 문을 반환하여 행을 추가함 
	   return memberDao.save(member)==1;
	}

  
  
//  3. 전화번호 중복 확인 (SELECT 문)
  public Boolean telAvailable(String memberTel) {
//    전화번호가 겹치면 false, 그렇지 않으면 true 반환
    return memberDao.findByTel(memberTel)==null;
  }
  
//  4. 내 정보 보기 (SELECT 문)
  public Read read(String logonId) {
    Member m = memberDao.findById(logonId);
    
//    dtf 객체에 날짜 형식을 지정
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
    String birthday = dtf.format(m.getBirthday());
    String joinday = dtf.format(m.getJoinday());
    
//    days에 입력되어 있는 가입일~현재 날짜 사이를 계산하여
//    가입한 지 얼마나 되었는지를 담음
    Long days = ChronoUnit.DAYS.between(m.getJoinday(), LocalDate.now());
    
    String profile = profileUrl + m.getMemberProfile();
    
    return new MemberDto.Read(m.getMemberId(), m.getMemberEmail(), birthday, joinday, days, profile);
  }
  
//  5. 비밀번호 변경 (UPDATE 문)
  public Boolean changePass(String password, String memberId) {
    return memberDao.changePassword(password, memberId)==1;
  }
  
//  6. 이메일 변경 (UPDATE 문)
  public Boolean changeEmail(String memberEmail, String password) {
    return memberDao.changeMemberEmail(memberEmail, password)==1;
  }
  
//  7. 전화번호 변경 (UPDATE 문)
  public Boolean changeTel(String memberTel, String password) {
    return memberDao.changeMemberTel(memberTel, password)==1;
  }
  
//  8. 프로필 사진 변경 (UPDATE 문)
  public Boolean changeProfile(MultipartFile memberProfile, String memberId) {
    return memberDao.changeProfile(memberProfile, memberId)==1;
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
