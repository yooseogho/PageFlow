package com.pageflow.service.notice;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.pageflow.dao.notice.*;
import com.pageflow.dto.notice.*;
import com.pageflow.entity.notice.*;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao noticeDao;

	@Value("20")
	private Long numberOfNoticesPerPage;

	@Value("5")
	private Long numberOfPagePerPagination;

//  1. 공지사항 등록 (INSERT 문)
	public Boolean insertNotice(String noticeTitle, String noticeContent) {

		Notice notice = new Notice();
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);

		// save 메서드의 반환 값을 검증하는 대신, 예외 처리를 통해 문제 발생 시 알림
		try {
			noticeDao.save(notice);
			return true; // 저장이 성공적으로 완료되면 true 반환
		} catch (Exception e) {
			return false; // 예외 발생 시 false 반환
		}

	}

//  2. 공지사항 삭제 (DELETE 문)
	public Boolean deleteNotice(Long nno) {
		if (nno == null) {
			return false;
		}
		Integer deleteRows = noticeDao.deleteByNno(nno);
		return deleteRows == 1;
	}

//  3. 공지사항 수정 (UPDATE 문)
	public Boolean updateNotice(Long nno, String noticeTitle, String noticeContent) {
		if (nno == null) {
			return false;
		}
		return noticeDao.updateNotice(nno, noticeTitle, noticeContent) == 1;
	}

//  4. 공지사항 보기 (SELECT 문)
	public Notice checkNotice(Long nno) {
		if (nno == null) {
			return null;
		}
		return noticeDao.findRead(nno);
	}

// 5. 페이지네이션
	@Transactional(readOnly = true)
	public Page list(Long pageno) {

		try {
			Long startRownum = (pageno - 1) * numberOfNoticesPerPage + 1;
			Long endRownum = startRownum + numberOfNoticesPerPage - 1;
			Long countOfNotices = noticeDao.count();

			// 총 페이지 수 계산
			Long totalPages = (long) Math.ceil((double) countOfNotices / numberOfNoticesPerPage);

			// prev와 next 계산
			Long prevPageNum = pageno > 1 ? pageno - 1 : null;
			Long nextPageNum = pageno < totalPages ? pageno + 1 : null;

			List<Notice> notices = noticeDao.findAll(startRownum, endRownum);

			return new Page(prevPageNum, nextPageNum, pageno, totalPages, notices);
		} catch (Exception e) {
			// 로그 출력 등으로 에러 상황 파악 가능
			e.printStackTrace();
			// 필요시 커스텀 Exception 생성하여 사용자 정의 에러 메시지 전달 가능
			throw new RuntimeException("Notice listing failed.", e);
		}
	}

//  6. 공지사항 모두 불러오기 (SELECT 문)
	public List<Notice> getAllNotices() {
		return noticeDao.getAllNotices();
	}

	public Long countNotices() {
		return noticeDao.count();
	}

// 7. 고객센터 공지사항 3개 보여주기
	public List<Notice> getTop3Notices() {
		return noticeDao.findTop3ByOrderByNoticeWritedayDesc();
	}

//	8. 공지사항 이전글 보여주기
	public Notice findPrev(Long currentNno) {
		return noticeDao.findPrev(currentNno);
	}

// 9. 공지사항 다음글 보여주기
	public Notice findNext(Long currentNno) {
		return noticeDao.findNext(currentNno);
	}

// 10. 공지사항 최신글 보여주기
	public Notice findFirstByNotice() {
	  return noticeDao.findFirstByNotice(); 
	}
}
