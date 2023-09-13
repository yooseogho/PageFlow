package com.example.demo.service.member;

import java.time.*;
import java.time.format.*;
import java.time.temporal.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

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
  
//  2. 회원가입 (INSERT 문)
  public Boolean join(MemberDto.Join dto) {
//    입력된 비밀번호를 암호화하여 변수에 담음
    String encodedPassword = encoder.encode(dto.getPassword());
//    member 객체에 기본 프로필 사진과 위에서 암호화한 비밀번호를 담음
    Member member = dto.toEntity(defaultProfile, encodedPassword);
//    INSERT 문을 반환하여 행을 추가함
    return memberDao.save(member)==1;
  }
  
//  3. 전화번호 중복 확인 (SELECT 문)
  public Boolean telAvailable(String memberTel) {
    return memberDao.findByTel(memberTel)==null;
  }
  
//  4. 내 정보 보기 (SELECT 문)
  public Read read(String logonId) {
    Member m = memberDao.findById(logonId);
    
//    dtf 객체에 날짜 형식을 지정
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
    String birthday = dtf.format(m.getBirthday());
    String joinday = dtf.format(m.getJoinday());
    
//    days 변수에 입력되어 있는 가입일~현재 날짜 사이를 계산하여
//    가입한 지 얼마나 되었는지를 담음
    Long days = ChronoUnit.DAYS.between(m.getJoinday(), LocalDate.now());
    
    String profile = profileUrl + m.getMemberProfile();
    
    System.out.println(profile);
    
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
  public Boolean changeProfile(String memberProfile, String memberId) {
    return memberDao.changeProfile(memberProfile, memberId)==1;
  }
  
//  9. 회원 탈퇴 (DELETE 문)
  public Boolean quit(String memberId) {
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
}
