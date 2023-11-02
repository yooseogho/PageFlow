package com.example.demo.Service.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.memberGrade.MemberGradeDao;
import com.example.demo.service.memberGrade.MemberGradeService;

@SpringBootTest
public class memberGradeServiceTest {

    @Autowired
    private MemberGradeService gradeService;

    @Autowired
    private MemberGradeDao gradeDao;

//    @Test
    public void testUpdateGrade() {
        // Prepare test data
        String memberId = "yoosuckho00";
        // 구매금액이 100000 미만일 경우
        Long purchaseTotal1 = 99999L;
        gradeService.updateGrade(memberId, purchaseTotal1);
        Long actualGrade1 = gradeDao.getGradeByMemberId(memberId);
        assertEquals(1L, actualGrade1);

        // 구매금액이 100000 이상, 200000 미만일 경우
        Long purchaseTotal2 = 100000L;
        gradeService.updateGrade(memberId, purchaseTotal2);
        Long actualGrade2 = gradeDao.getGradeByMemberId(memberId);
        assertEquals(2L, actualGrade2);

        // 구매금액이 200000 이상, 300000 미만일 경우
        Long purchaseTotal3 = 200000L;
        gradeService.updateGrade(memberId, purchaseTotal3);
        Long actualGrade3 = gradeDao.getGradeByMemberId(memberId);
        assertEquals(3L, actualGrade3);

        // 구매금액이 300000 이상일 경우
        Long purchaseTotal4 = 300000L;
        gradeService.updateGrade(memberId, purchaseTotal4);
        Long actualGrade4 = gradeDao.getGradeByMemberId(memberId);
        assertEquals(4L, actualGrade4);
    }
}
