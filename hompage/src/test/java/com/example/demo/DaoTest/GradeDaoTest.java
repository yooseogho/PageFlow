package com.example.demo.DaoTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.memberGrade.MemberGradeDao;
@SpringBootTest
public class GradeDaoTest {

    @Autowired
    private MemberGradeDao gradeDao;

    @Test
    public void testPurchaseTotalForLastThreeMonths() {
        // 테스트 데이터 준비
        String memberId = "yoosuckho00";

        // 이 값은 테스트를 실행하는 시점에서의 memberId에 해당하는 유저의 최근 3개월 동안의 구매 총액을 반영해야 합니다.
        Long expectedTotal = 10000L; 

        // 메서드 테스트
        LocalDateTime threeMonthsAgo = LocalDateTime.now().minusMonths(3);
        Long actualTotal = gradeDao.PurchaseTotalForLastThreeMonths(memberId, threeMonthsAgo);

        // null 값 처리
        if (actualTotal == null) {
            actualTotal = 0L;
        }

        // 결과 검증
        assertEquals(expectedTotal, actualTotal);
    }
    
    
    
    
}

