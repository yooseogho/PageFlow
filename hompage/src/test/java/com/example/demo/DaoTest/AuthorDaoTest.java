package com.example.demo.DaoTest;




import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.author.AuthorDao;
import com.example.demo.entity.author.Author;
@SpringBootTest
public class AuthorDaoTest {
	
	@Autowired
	private AuthorDao authorDao;

	
	   @Test
	    public void saveTest() {
	        // Arrange: 테스트에 필요한 객체 및 값을 준비합니다.
	        Author author = new Author();
	        author.setAuthorCode(1L);
	        author.setAuthorName("작가");

	        // Act: 실제로 테스트하려는 메소드를 호출합니다.
	        Integer result = authorDao.save(author);

			assertEquals(1, result);
	    }

}
