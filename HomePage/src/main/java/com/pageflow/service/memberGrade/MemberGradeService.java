package com.pageflow.service.memberGrade;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.pageflow.dao.member.MemberDao;
import com.pageflow.dao.memberGrade.MemberGradeDao;
import com.pageflow.dto.memberGrade.MemberGradeDto;
import com.pageflow.entity.member.Member;
import com.pageflow.entity.memberGrade.MemberGrade;

@Service
public class MemberGradeService {
  @Autowired
  private MemberGradeDao gradeDao;
  @Autowired
  private MemberDao memberDao;

  public Integer saveMemberGrade(MemberGrade memberGrade) {
    Integer result = gradeDao.MemberGradeSave(memberGrade);
    // NULL 처리: insert 실패 시 null 반환
    return (result != null) ? result : null;
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

//10.oo----------------------------------------------------------------------------------------------
  // 유석호 :member_grade_page 에 활용 해야 할 작업들

// 회원의 누적을 조회하는 서비스
  public MemberGradeDto.Read getMemberGradeInfo(String memberId) {
    Member m = memberDao.findById(memberId);
    return new MemberGradeDto.Read(m.getMemberId(), m.getGradeCode(), m.getMemberName(), m.getMemberEmail(),
        m.getPassword(), m.getMemberProfile(), m.getMemberTel(), m.getMemberPoint(), m.getJoinday(), m.getBirthday());
  }

  // 등급 조회
  public MemberGrade findGradeByCode(Long gradeCode) {
    return gradeDao.findGradeByCode(gradeCode);
  }

  // 3달안에 구매 금액 조회
  public Long getPurchaseTotalForLastThreeMonths(String memberId) {
    // 3개월 전 날짜를 구합니다.
    LocalDateTime threeMonthsAgo = LocalDateTime.now().minusMonths(3);
    // 3개월 동안의 구매액을 조회합니다.
    return gradeDao.PurchaseTotalForLastThreeMonths(memberId, threeMonthsAgo);
  }
  

//다음 등급까지 얼마를 사용해야 등업이 되는지 알수있는 매서드
  public int calculatePurchaseRequired(int purchaseTotalForLastThreeMonths, int currentGradeCode) {
    int nextGradeRequirement;

    // 현재 등급에 따라 다음 등급의 요구 금액 설정
    switch (currentGradeCode) {
    case 1:
      nextGradeRequirement = 210000; // 실버에서 골드로 올라갈 때 필요한 구매액
      break;
    case 2:
      nextGradeRequirement = 300000; // 골드에서 플래티넘으로 올라갈 때 필요한 구매액
      break;
    case 4:
      nextGradeRequirement = 100000; // 프렌즈에서 실버로 올라갈 때 필요한 구매액
      break;
    default:
      return 0; // 이미 최고등급인 경우 또는 그 외의 경우
    }

    int additionalPurchaseRequired = nextGradeRequirement - purchaseTotalForLastThreeMonths;

    if (additionalPurchaseRequired < 0) {
      additionalPurchaseRequired = 0; // 필요 구매액이 음수가 되면, 그 값을 '0'으로 설정합니다.
    }

    return additionalPurchaseRequired; // 계산된 추가 구매 필요액을 반환합니다.
  }

  /*
   * 바로 등업을 원하면 매분 0초에 실행
   * 
   * @Scheduled(cron = "0 * * * * ?") 이걸로 바꾸면 됌. /유석호/ 10-31
   */

////매분 0초에 실행
//@Scheduled(cron = "0 * * * * ?")

////매월 1일 0시 0분에 실행
//	@Scheduled(cron = "0 0 0 1 * ?")

  @Scheduled(cron = "0 * * * * ?")
  public int updateAllGrades() {
    // 모든 회원의 ID와 구매금액을 가져와서 등급 업데이트
    List<Member> members = memberDao.getAllMembers();
    int updatedMembersCount = 0;
    for (Member member : members) {
      String memberId = member.getMemberId();
      LocalDateTime threeMonthsAgo = LocalDateTime.now().minusMonths(3);
      Long purchaseTotal = gradeDao.PurchaseTotalForLastThreeMonths(memberId, threeMonthsAgo);
      if (purchaseTotal != null) { // null 이 아닐 때만 등급 업데이트
        updateGrade(memberId, purchaseTotal);
        updatedMembersCount++;
      }
    }
    return updatedMembersCount;
  }

//등급 업데이트
  public Integer updateGrade(String memberId, Long purchaseTotal) {
    Long gradeCode;
    if (purchaseTotal > 300000) {
      gradeCode = 4L;
    } else if (purchaseTotal >= 210000) {
      gradeCode = 3L;
    } else if (purchaseTotal >= 100000) {
      gradeCode = 2L;
    } else {
      gradeCode = 1L;
    }

    // 등급 업데이트
    Integer updateResult = gradeDao.updateMemberGrade(memberId, gradeCode);

    // 등급에 따른 설명 반환
    String gradeDescription;
    if (gradeCode == 4L) {
      gradeDescription = "플래티넘\n최근 한달 순수구매액 30만원 초과";
    } else if (gradeCode == 3L) {
      gradeDescription = "골드\n최근 한달 순수구매액 21 ~ 30만원";
    } else if (gradeCode == 2L) {
      gradeDescription = "실버\n최근 한달 순수구매액 10 ~ 20만원";
    } else {
      gradeDescription = "프렌즈\n최근 한달 순수구매액 10만원 미만";
    }

    // 등급 설명 반환
    return updateResult;
  }

  // 회원의 현재 등급 이름 출력
  public String getMemberGrade(String memberId) {
    // memberId를 이용하여 gradeCode 정보를 가져옵니다.
    // 이 부분은 실제 사용하는 DB와 메소드에 맞게 수정해야 합니다.
    Long gradeCode = memberDao.getGradeCodeByMemberId(memberId);

    // gradeCode를 이용하여 gradeName 정보를 가져옵니다.
    String gradeName = gradeDao.findGradeNameByCode(gradeCode);

    return gradeName;
  }

  // 11-02 info_left_aside jsp에서 등급 이름 출력용
  public String getGradeNameByCode(Long gradeCode) {
    return gradeDao.findGradeNameByCode(gradeCode);
  }

}
