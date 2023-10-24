package com.example.demo.service.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.inquiry.InquiryDao;
import com.example.demo.entity.inquiry.Inquiry;

import java.util.List;

@Service
public class InquiryService {
	@Autowired
	private InquiryDao inquiryDao;

	// 1. 문의사항 조회
	public Inquiry getInquiryByInno(Long inno) {
		return inquiryDao.findByInno(inno);
	}

	// 2. 특정 회원이 작성한 모든 문의사항 조회
	public List<Inquiry> getInquiriesByMemberId(String memberId) {
		return inquiryDao.findByMemberId(memberId);
	}

	// 3. 새로운 문의사항 등록
	public Boolean createInquiry(Inquiry inquiry) {
		// 문의사항 저장
		Integer result = inquiryDao.save(inquiry);

		// 저장 결과를 확인하여 성공 여부 반환
		return result != null && result > 0;
	}

	// 4. 문의사항 내용 수정
	@Transactional
	public Boolean updateInquiryContent(Long inno, String newContent) {
		// 문의사항 내용 수정
		Integer result = inquiryDao.updateContent(newContent, inno);

		// 수정 결과를 확인하여 성공 여부 반환
		return result != null && result > 0;
	}

	// 5. 문의사항 삭제
	@Transactional
	public Boolean deleteInquiry(Long inno) {
		// 문의사항 삭제
		Integer result = inquiryDao.deleteByInNo(inno);

		// 삭제 결과를 확인하여 성공 여부 반환
		return result != null && result > 0;
	}
}
