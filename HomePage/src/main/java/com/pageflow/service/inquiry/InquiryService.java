package com.pageflow.service.inquiry;

import java.time.*;
import java.util.*;
import java.util.stream.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.pageflow.dao.inquiry.*;
import com.pageflow.dto.inquiry.*;
import com.pageflow.entity.inquiry.*;

@Service
public class InquiryService {
	@Autowired
	private InquiryDao inquiryDao;

	public List<Inquiry> getAllInquiries() {
		return inquiryDao.getAllInquiries();
	}

	// 1. 문의사항 상태 필터링
	public List<InquiryDto.Read> getInquiriesByStatusAndMemberId(String status, String memberId) {
		List<Inquiry> inquiries = inquiryDao.findByMemberId(memberId);
		return inquiries.stream().filter(inquiry -> {
			if ("전체".equals(status)) {
				return true;
			} else if ("준비중".equals(status)) {
				return inquiry.getInquiryAnswer() == null || inquiry.getInquiryAnswer().isEmpty();
			} else if ("답변완료".equals(status)) {
				return inquiry.getInquiryAnswer() != null && !inquiry.getInquiryAnswer().isEmpty()
						&& !inquiry.getInquiryAnswer().equals("완료");
			} else if ("답변완료".equals(status)) {
				return "완료".equals(inquiry.getInquiryAnswer());
			} else {
				return false;
			}
		}).map(inquiry -> {
			// 날짜와 상태 설정
			String inquiryStatus;
			if (inquiry.getInquiryAnswer() == null || inquiry.getInquiryAnswer().isEmpty()) {
				inquiryStatus = "준비중";
			} else if (!"완료".equals(inquiry.getInquiryAnswer())) {
				inquiryStatus = "답변완료";
			} else {
				inquiryStatus = "처리중";
			}

			// Read 객체 생성
			return new InquiryDto.Read(inquiry.getInno(), inquiry.getInquiryTitle(), inquiry.getContent(),
					inquiry.getInquiryType(), LocalDate.now(), inquiry.getInquiryAnswer(), LocalDate.now(),
					inquiryStatus, memberId);
		}).collect(Collectors.toList());
	}

	// 2. 문의사항 조회
	public Inquiry getInquiryByInno(Long inno) {
		return inquiryDao.findByInno(inno);
	}

	// 3. 특정 회원이 작성한 모든 문의사항 조회
	public List<InquiryDto.Read> getInquiriesByMemberId(String memberId) {
		List<Inquiry> inquirys = inquiryDao.findByMemberId(memberId);

		List<InquiryDto.Read> inquiryDtos = new ArrayList<>();
		for (Inquiry inquiry : inquirys) {
			// inquiryStatus를 임의로 설정합니다.
			// 예를 들어, inquiryAnswer가 null이 아니면 '답변 완료', null이면 '답변 대기'로 설정합니다.
			String inquiryStatus = inquiry.getInquiryAnswer() != null ? "답변완료" : "준비중";

			// isReadByAdmin을 임의로 설정합니다.
			// 예를 들어, 현재 시간과 createdDate를 비교하여 일정 시간이 지났으면 읽었다고 가정하고 true로 설정합니다.

			InquiryDto.Read inquiryDto = new InquiryDto.Read(inquiry.getInno(), inquiry.getInquiryTitle(),
					inquiry.getContent(), inquiry.getInquiryType(), LocalDate.now(), inquiry.getInquiryAnswer(),
					LocalDate.now(), inquiryStatus, memberId // inquiryStatus 값을 설정합니다.
			);
			inquiryDtos.add(inquiryDto);
		}

		return inquiryDtos;
	}

	// 4. 문의사항 작성
	@Transactional
	public Boolean createInquiry(Inquiry inquiry) {
		if (inquiry.getContent() == null || inquiry.getContent().trim().isEmpty()) {
			throw new IllegalArgumentException("문의 내용이 비어 있습니다.");
		}

		Integer result = inquiryDao.save(inquiry);

		if (result == null || result <= 0) {
			throw new IllegalArgumentException("문의사항 저장에 실패했습니다.");
		}

		return result != null && result > 0;
	}

	// 5. 문의사항 내용 수정
	@Transactional
	public Boolean updateInquiryContent(Long inno, String inquiryType, String inquiryTitle, String content) {
		if (inno == null)
			return false;

		// 수정 결과를 확인하여 성공 여부 반환
		return inquiryDao.updateContent(inno, inquiryType, inquiryTitle, content) == 1;
	}

	// 6. 문의사항 삭제
	@Transactional
	public Boolean deleteInquiry(Long inno) {
		// 문의사항 삭제
		Integer result = inquiryDao.deleteByInNo(inno);

		// 삭제 결과를 확인하여 성공 여부 반환
		return result != null && result > 0;
	}

	// 7. 관리자 답변 작성
	@Transactional
	public boolean createAnswer(Long inno, String inquiryAnswer) {
		String answerWithDate = inquiryAnswer;
		return inquiryDao.createAnswer(inno, answerWithDate) == 1;
	}
}
