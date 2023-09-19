package com.example.demo.DaoTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.member.MemberDao;
import com.example.demo.demo.dao.memberGrade.MemberGradeDao;
import com.example.demo.entity.memberGrade.MemberGrade;

@SpringBootTest
public class MemberGreadDaoTest {

	@Autowired
	private MemberGradeDao gradeDao;

//	 @Transactional
//	 @Test
	public void testInsertMemberGrade() {
		MemberGrade memberGrade = new MemberGrade();
		memberGrade.setGradeCode(4L);
		memberGrade.setPointRate(0.05); // 0.04% rate
		memberGrade.setGradeName("Platinum");

		Integer result = gradeDao.MemberGradeSave(memberGrade);
		assertEquals(1, result);
	}

//    @Test
	public void selectMembergradeByCodeTest() {
		Long gradeCode = 1L; // 테스트할 등급 코드입니다. 실제 값으로 변경해야 합니다.

		// Dao의 메소드를 호출하여 결과를 가져옵니다.
		MemberGrade result = gradeDao.findGradeByCode(gradeCode);

		// 결과가 null이 아닌지 확인합니다.
		assertNotNull(result);

		// 결과의 grade_code가 요청한 grade_code와 같은지 확인합니다.
		assertEquals(gradeCode, result.getGradeCode());

	}

//	@Transactional
//	@Test
	public void findPointRateByGradeCodeTest() {
		Long gradeCode = 1L; // 테스트할 등급 코드입니다. 실제 값으로 변경해야 합니다.

		double expectedPointRate = 0.02; // 예상 포인트 적립률입니다. 실제 값으로 변경해야 합니다.

		double result = gradeDao.findPointRateByGradeCode(gradeCode);

		assertEquals(expectedPointRate, result);
	}

//	@Test
	public void testPurchaseTotal() {
		String memberId = "new_member";
		Long expectedTotal = 1000L;

		Long actualTotal = gradeDao.PurchaseTotal(memberId);

		assertEquals(expectedTotal, actualTotal);
	}
	
//	@Test
	public void updateMemberGradeTest() {
			String memberId = "new_member";  // 데이터베이스에 유효한 회원 ID로 변경해야 합니다.
		    
		    Long totalPurchase = gradeDao.PurchaseTotal(memberId);
		    
		    Long expectedGradeCode;
		    
		    if (totalPurchase >= 300000) {
		        expectedGradeCode = 4L; // 플레티넘 등급이 grade code 4에 해당한다고 가정합니다.
		    } else if (totalPurchase >= 200000) {
		        expectedGradeCode = 3L; // 골드 등급이 grade code 3에 해당한다고 가정합니다.
		    } else if (totalPurchase >= 100000) {
		        expectedGradeCode = 2L;  // 실버 등급이 grade code 2에 해당한다고 가정합니다.
		    } else {
		        expectedGradeCode = 1L; // 기본 등급은 FRIENDS  등급이 grade code 1에 해당한다고 가정합니다.
		    }
		    
		    Integer rowsAffected = gradeDao.updateMemberGrade(memberId, expectedGradeCode);
		    											// intValue : 래퍼클레스 타입을 int를 변환
		    assertEquals(1, rowsAffected.intValue()); ; // 정확히 한 개의 row가 업데이트되었음을 확인합니다
		    
	}
	
	
	
	

}
