package com.example.demo.noticeDaoTest;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.notice.*;
import com.example.demo.dto.notice.*;
import com.example.demo.entity.notice.*;

@SpringBootTest
public class NoticeDaoTest {
	
	@Autowired
	private NoticeDao noticeDao;
	
	// 글 저장
	@Transactional
	@Test
	public void saveTest() {
		 
		Notice n = new Notice(null, "공지사항", "내일 점검", "고객센터", LocalDate.now());
		 Integer no =noticeDao.save(n);
		 assertNotEquals(0, no);
	}
	
	
	// 글 갯수 확인
	@Transactional
	@Test
	public void coustTest() {
		 Long cnt= noticeDao.count();
		 assertNotNull(cnt);
	}
	
	
	 // 글내용 확인
	 @Transactional
	 @Test
	    public void testFindRead() {
	        Long nno = 1L; 
	        Notice notice = noticeDao.findRead(nno);
	        assertNull(notice);
	        
	        // 글의 내용이 있을때
	        //assertEquals(nno, notice.getNno());
	        
	    }
	 
	   
	    // 글 제목과 내용 수정 하기 
	    @Transactional
	    @Test	
	    public void increaseTitleTest() {
	        Long nno = 6L; 
	        String newNoticeTitle = "나는야 글 제목";
	        String newNoticeContent = "나는야 글 내용"; 

	        Integer result = noticeDao.updateNotice(nno, newNoticeTitle, newNoticeContent);
	        assertNotNull(result);
	    }
	    
	    // 글 삭제
	    @Transactional
	    @Test
	    public void deleteByNnoTest() {
	        Long nno = 6L; 
	        Integer result = noticeDao.deleteByNno(nno);
	        assertNotNull(result);

	    }
	    
	    
	    // 페이징 쿼리
	    @Test
	    public void paginationTest() {
	        Long startRownum = 1L; // 1 페이지 부터
	        Long endRownum = 10L; // 10 페이지 까지
	        List<Notice> notices = noticeDao.findAll(startRownum, endRownum);
	        assertNotNull(notices);
	        assertEquals(1, notices.size());

	        
	        Long pageno = 2L;
//	        페이지 번호의 범위 : 1~페이지의 개수
	        Long count = noticeDao.count();
	        Long numberOfPage = (count-1)/10+1;
	        
//	        11~20번까지 notice 읽어오기
	        
//	        prev, start, end, next 계산
//	        pageno  prev  start end     next
//	        1~5     0     1     5       6
//	        6~10    5     6     10      11
//	        11~15   10    11    15=>13  16=>0
	        
	        Long prev = (pageno-1)/5*5;
	        Long start = prev+1;
	        Long end = prev+5;
	        Long next = end+1;
	        
	        if(end>=numberOfPage) {
	          end=numberOfPage;
	          next=0L;
	        }
	        System.out.println(new Page(prev, start, end, next, pageno, notices));

	    }
}
	

	
	


