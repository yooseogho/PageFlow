package com.example.demo.DaoTest;



import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.publisher.PublisherDao;
import com.example.demo.entity.publisher.Publisher;

@SpringBootTest
public class PublisherDaoTest {
	
	@Autowired
	private PublisherDao publisherDao;

	
	
    @Test
    public void saveTest() {
        // Arrange: 테스트에 필요한 객체 및 값을 준비합니다.
        Publisher publisher = new Publisher();
        publisher.setPublisherCode(1L);
        publisher.setPublisherName("출판");

        // Act: 실제로 테스트하려는 메소드를 호출합니다.
        Integer result = publisherDao.save(publisher);

		assertEquals(1, result);
    }
}
