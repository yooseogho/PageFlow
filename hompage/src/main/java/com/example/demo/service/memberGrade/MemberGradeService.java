package com.example.demo.service.memberGrade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.memberGrade.MemberGradeDao;
import com.example.demo.entity.memberGrade.MemberGrade;

import java.util.List;

@Service
public class MemberGradeService {
  @Autowired
  private MemberGradeDao gradeDao;

  public Integer saveMemberGrade(MemberGrade memberGrade) {
    Integer result = gradeDao.MemberGradeSave(memberGrade);
    // NULL 처리: insert 실패 시 null 반환
    return (result != null) ? result : null;
  }

  public MemberGrade findGradeByCode(Long gradeCode) {
    return gradeDao.findGradeByCode(gradeCode);
  }

  public Double findPointRateByGradeCode(Long gradeCode) {
    Double pointRate = gradeDao.findPointRateByGradeCode(gradeCode);
    // NULL 처리: 조회 결과가 null이면 null 반환
    return (pointRate != null) ? pointRate : null;
  }

  public Long getPurchaseTotal(String memberId) {
    Long total = gradeDao.PurchaseTotal(memberId);
    // NULL 처리: 조회 결과가 null이면 null 반환
    return (total != null) ? total : null;
  }

  public Integer updateMemberGrade(String memberId, Long gradeCode) {
    Integer result = gradeDao.updateMemberGrade(memberId, gradeCode);
    // NULL 처리: update 실패 시 null 반환
    return (result != null) ? result : null;
  }

  public List<MemberGrade> getAllMemberGrade() {
    List<MemberGrade> grades = gradeDao.getAllMemberGrade();
    // NULL 처리: 조회 결과가 null이면 null 반환
    // 모든 정보 조회라서 사실 필요는 없을 확률이 큼
    return (grades != null) ? grades : null;
  }
}
