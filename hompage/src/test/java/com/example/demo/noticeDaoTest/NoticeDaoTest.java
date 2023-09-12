package com.example.demo.noticeDaoTest;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.notice.dao.NoticeDao;
import com.example.demo.notice.entity.Notice;

@SpringBootTest
public class NoticeDaoTest {
	
	@Autowired
	private NoticeDao noticeDao;
	
//	@Transactional
//	@Test
	public void saveTest() {
		 
		Notice n = new Notice(null, "공지사항", "내일 점검", "고객센터", LocalDate.now());
		 Integer no =noticeDao.save(n);
		 assertNotEquals(0, no);
	}
	
//	@Transactional
//	@Test
	public void coustTest() {
		 Long cnt= noticeDao.count();
		 assertNotNull(cnt);
	}
	

	
	
	
	
	
	
	
	
	
	

}
