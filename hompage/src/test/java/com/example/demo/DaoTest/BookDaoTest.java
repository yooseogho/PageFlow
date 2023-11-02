package com.example.demo.DaoTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.book.BookDao;
import com.example.demo.entity.book.Book;

@SpringBootTest
public class BookDaoTest {
	
	@Autowired
	private BookDao bookDao;
	
	@Test
	public void saveTest() {
	    // Arrange: 테스트에 필요한 객체 및 값을 준비합니다.
	    Book book = new Book();
	    book.setBookTitle("코딩은 재밌다");
	    book.setSubTitle("하이하이하이");
	    book.setPublishDate(LocalDate.now());
	    book.setBookPrice(10000L);
	    book.setStock(100L);
	    book.setTranslator("옮긴이	");
	    book.setPublisherCode(1L);
	    book.setAuthorCode(1L);

	    // Act: 실제로 테스트하려는 메소드를 호출합니다.
	    Integer result = bookDao.save(book);

	   assertEquals(1, result);
	}


}
