package com.example.demo.DaoTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.demo.dao.member.MemberDao;
import com.example.demo.entity.member.Member;
import com.example.demo.service.member.MemberService;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
public class MemberDaoTest {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private MemberService memberService;

//	@Test
	public void testSaveMember() {

		// 새로운 회원 생성
		Member newMember = new Member();
		newMember.setGradeCode(1L); // or any appropriate value
		newMember.setPassword(encoder.encode("1234"));
		newMember.setMemberTel("1234567890");
		newMember.setMemberProfile("defaultprofile.png");
		newMember.setMemberPoint(0L); // or any appropriate value

		// 회원 저장
		Integer result = memberDao.save(newMember);
		assertEquals(1, result);

	}

//	@Test
	public void 회원가입_테스트() {
		// 새로운 Member 객체 생성 및 필드 설정
		// Arrange: 테스트에 필요한 객체 및 값을 준비합니다.
		Member member = new Member();
		member.setMemberId("testId");
		member.setGradeCode(1L);
		member.setMemberName("Test User");
		member.setMemberEmail("test@example.com");
		member.setPassword("password123");

		// 나머지 필드 설정
		member.setMemberTel(null); // 전화번호는 null로 설정 (예시)
		member.setMemberProfile("defaultprofile.png"); // 프로필 이미지 이름 설정
		member.setMemberPoint(0L); // 포인트는 초기값으로 0을 설정
		member.setJoinday(LocalDate.now()); // 가입일은 현재 날짜로 설정
		member.setBirthday(LocalDate.of(1990, 1, 1)); // 생일은 임의의 날짜로 설정

		// Act: 실제 동작을 수행합니다.
		Integer result = memberDao.save(member);

		// Assert: 결과를 검증합니다.
		assertEquals(1, result);
	}


//	@Test
	public void memberDao_존재_테스트() {
	    assertNotNull(memberDao, "memberDao가 null입니다. Spring이 제대로 주입되지 않았습니다.");
	}
	
//    @Test
    public void findById_테스트() {
        String memberId = "yoosuckho00";
        Member foundMember = memberDao.findById(memberId);

        assertNotNull(foundMember, "멤버가 null입니다. 멤버가 존재하지 않거나 DB 조회에 문제가 있을 수 있습니다.");
        assertEquals(memberId, foundMember.getMemberId(), "조회된 멤버의 ID가 예상과 다릅니다.");
    }
    
    @Test
    public void login_테스트() {
        String memberId = "yoosuckho00";
        String password = "tlr58641!";  // 실제 비밀번호로 대체하세요.

        Member loggedInMember = memberService.login(memberId, password);

        assertNotNull(loggedInMember, "로그인 실패. 반환된 멤버가 null입니다.");
        assertEquals(memberId, loggedInMember.getMemberId(), "로그인된 멤버의 ID가 예상과 다릅니다.");
    }

	
	
	


}
