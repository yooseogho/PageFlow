package com.example.demo.service.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.delivery.DeliveryDao;
import com.example.demo.entity.delivery.Delivery;

@Service
public class DeliveryService {
  @Autowired
  private DeliveryDao deliveryDao;

  // 1. 모든 배송 정보 조회
  public List<Delivery> findAll() {
    return deliveryDao.findAll();
  }

  // 2. 특정 회원의 배송 정보 조회
  public List<Delivery> findByMemberId(String memberId) {
    return deliveryDao.findByMemberId(memberId);
  }

  // 3. 배송 번호와 일치하는 배송 정보 조회
  public Delivery findByDno(Long dno) {
    return deliveryDao.findByDno(dno);
  }

  // 4. 배송 정보 추가
  public Boolean add(Long dno, String memberId, Long zipCode, String receiverName, String deliveryAddress,
      String secondAddress, String thirdAddress, String receiverTel) {
    // Delivery 객체 생성
    Delivery delivery = new Delivery();
    delivery.setDno(dno);
    delivery.setMemberId(memberId);
    delivery.setZipCode(zipCode);
    delivery.setReceiverName(receiverName);
    delivery.setDeliveryAddress(deliveryAddress);
    delivery.setSecondAddress(secondAddress);
    delivery.setThirdAddress(thirdAddress);
    delivery.setReceiverTel(receiverTel);

    // DAO의 save 메서드를 호출하여 Delivery 객체를 저장
    Integer result = deliveryDao.save(delivery);

    // 저장 결과를 확인하고 성공 여부를 반환
    return result == 1;
  }

  // 5. 배송 정보 수정
  public Boolean update(Delivery delivery) {
    Integer result = deliveryDao.update(delivery);
    return result == 1;
  }

  // 6. 특정 배송 정보 삭제
  public Boolean deleteByDno(Long dno) {
    Integer result = deliveryDao.deleteByDno(dno);
    return result == 1;
  }
}
