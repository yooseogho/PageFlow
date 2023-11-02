package com.example.demo.DaoTest;





import static org.junit.jupiter.api.Assertions.assertEquals;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.delivery.DeliveryDao;
import com.example.demo.entity.delivery.Delivery;
@SpringBootTest
public class DeliveryDaoTest {
	
	@Autowired
	private DeliveryDao deliveryDao;
	
	 @Test
	    public void saveTest() {
	        // Arrange: 테스트에 필요한 객체 및 값을 준비합니다.
	        Delivery delivery = new Delivery();
	        delivery.setDno(1L);
	        delivery.setMemberId("spring");
	        delivery.setZipCode(1L);
	        delivery.setReceiverName("유석호");
	        delivery.setDeliveryAddress("학익동");
			delivery.setReceiverTel("010-1234-5678");

		    // Act: 실제로 테스트하려는 메소드를 호출합니다.
		    Integer result = deliveryDao.save(delivery);

		   assertEquals(1, result);
		}


}
