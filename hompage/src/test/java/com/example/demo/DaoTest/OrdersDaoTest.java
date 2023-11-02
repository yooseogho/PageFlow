package com.example.demo.DaoTest;



import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.orders.OrdersDao;
import com.example.demo.entity.orders.Orders;

@SpringBootTest
public class OrdersDaoTest {

    @Autowired
    private OrdersDao ordersDao;

    @Test
    public void saveTest() {
        // Arrange: 테스트에 필요한 객체 및 값을 준비합니다.
        Orders orders = new Orders();
        orders.setMemberId("spring");
        orders.setOrderDate(LocalDate.now());
        orders.setOrderRequest("조심히 와주세요");
        orders.setOrderPrice(10000L);
        orders.setPayment(1L);
		orders.setPointEarn(200L);
		orders.setDno(1L);

	    // Act: 실제로 테스트하려는 메소드를 호출합니다.
	    Integer result = ordersDao.save(orders);

	   assertEquals(1, result);
	}
}