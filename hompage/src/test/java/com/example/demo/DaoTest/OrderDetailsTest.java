package com.example.demo.DaoTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.dao.orderDetails.OrderDetailsDao;
import com.example.demo.entity.orderDetails.OrderDetails;




@SpringBootTest
public class OrderDetailsTest {

    @Autowired
    private OrderDetailsDao detailsDao;

//    @Transactional
//    @Test
    public void testFindDetailsByMemberId() {
        String memberId = "new_member";
        Long ono = 5L; // 테스트할 주문 번호를 지정해주세요.
        List<OrderDetails> detailsList = detailsDao.findDetailsByMemberId(memberId, ono);
        assertNotNull(detailsList);
    }    
    
//    @Transactional
//    @Test
    public void testInsertOrderDetails() {
        // 주문 상세 정보 생성에 필요한 데이터 설정
        OrderDetails orderDetail = new OrderDetails();
        orderDetail.setBno(2L);
        // ono는 SelectKey로 자동 생성됨.
        orderDetail.setOrderCount(1L);
        orderDetail.setOrderTotal(1023L);
        orderDetail.setBookTitle("유석호유석호0927");
        orderDetail.setOno(25L);

        // 주문 상세 정보 생성
        int result = detailsDao.saveOrderDetails(orderDetail);

       // 결과 확인 및 검증 
       assertEquals(1, result); // 1개의 행이 영향을 받았는지 확인
    
    }
//    @Test
    public void testSelectOrderDetailsByOno() {
        Long ono = 1L; // 주문 번호를 설정합니다.

        List<OrderDetails> orderDetailsList = detailsDao.selectOrderDetailsByOno(ono);

         //반환된 주문 상세 리스트가 비어있지 않음을 확인합니다.
        assertFalse(orderDetailsList.isEmpty());

        for (OrderDetails orderDetail : orderDetailsList) {
            // 모든 주문 상세의 ono가 요청한 ono와 동일한지 확인합니다.
            assertEquals(ono, orderDetail.getOno());
        }
    }
//    @Test
    public void testChangeStatus() {
        Long bno = 1L; // 책 번호 설정합니다.
        Long ono = 25L; // 주문 번호 설정합니다.

        Integer updatedRows = detailsDao.changeStatus(bno, ono);

        // 업데이트된 행의 수가 0보다 큼을 확인합니다. 
        assertNotEquals(0, updatedRows);
        
    }
    
//    @Test
    public void testGetAllOrderDetails() {
        List<OrderDetails> orderDetailsList = detailsDao.getAllOrderDetails();

        // 반환된 주문 상세 리스트가 비어있지 않음을 확인합니다.
        assertFalse(orderDetailsList.isEmpty());
    }
    
    
    
    
    
    
}
