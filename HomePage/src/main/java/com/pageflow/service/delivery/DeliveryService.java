package com.pageflow.service.delivery;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.pageflow.dao.delivery.*;
import com.pageflow.dao.member.*;
import com.pageflow.dao.orderDetails.*;
import com.pageflow.dao.orders.*;
import com.pageflow.dto.delivery.*;
import com.pageflow.entity.delivery.*;
import com.pageflow.entity.member.*;
import com.pageflow.entity.orderDetails.*;
import com.pageflow.entity.orders.*;

@Service
public class DeliveryService {
	@Autowired
	private DeliveryDao deliveryDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private OrderDetailsDao orderDetailsDao;

	@Autowired
	private OrdersDao ordersDao;

	@Value("${numberOfProductsPerPage}")
	private Long numberOfProductsPerPage;

	@Value("${sizeOfPagination}")
	private Long sizeOfPagination;

	// 1. 배송지 추가
	public Boolean deliveryAdd(String memberId, DeliveryDto.Create dto) {
		Long count = deliveryDao.findDefaultAddress(memberId);
		if (count == null) {
			count = 0L;
		}

		Long defaultAddress = (count == 0) ? 1L : 0L;

		Delivery delivery = new Delivery(null, memberId, dto.getZipCode(), dto.getReceiverName(),
				dto.getDeliveryAddress(), dto.getReceiverTel(), null, defaultAddress, dto.getDeliveryName());
		return deliveryDao.save(delivery) == 1;
	}

	// 2. 배송지 선택
	public DeliveryDto.Read read(Long dno, String memberId) {
		Member member = memberDao.findById(memberId);
		Delivery delivery = deliveryDao.read(dno, member.getMemberId());
		return new DeliveryDto.Read(dno, delivery.getReceiverName(), delivery.getDeliveryName(),
				delivery.getDefaultAddress(), delivery.getReceiverTel(), delivery.getZipCode(),
				delivery.getDeliveryAddress(), delivery.getDeliveryRequest(), delivery.getDeliveryName());
	}

	// 3. 배송지 리스트
	public DeliveryPage list(Long pageno, String memberId) {
		Member member = memberDao.findById(memberId);
		Long count = deliveryDao.deliveryCount(member.getMemberId());

		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;
		Long endRownum = pageno * numberOfProductsPerPage;
		List<Delivery> delivery = deliveryDao.findAll(startRownum, endRownum, member.getMemberId());

		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;
		Long prev = start - 1;
		Long end = prev + sizeOfPagination;
		Long next = end + 1;

		// end가 numberOfPage보다 같거나 크다면...처리
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}
		return new DeliveryPage(prev, start, end, next, pageno, delivery);
	}

	// 4. 배송지 수정
	public Boolean update(DeliveryDto.Update dto, String memberId) {
		Member member = memberDao.findById(memberId);
		Delivery delivery = deliveryDao.read(dto.getDno(), member.getMemberId());
		delivery.setDeliveryAddress(dto.getDeliveryAddress());
		delivery.setDeliveryName(dto.getDeliveryName());
		delivery.setReceiverName(dto.getReceiverName());
		delivery.setReceiverTel(dto.getReceiverTel());
		delivery.setZipCode(dto.getZipCode());

		return deliveryDao.update(delivery) == 1;
	}

	// 5. 배송지 삭제
	@Transactional
	public Boolean delete(Long dno) {

		// 배송지에 연결된 주문 정보 조회
		List<Orders> orders = ordersDao.findAllByDno(dno);
		List<Long> onoList = new ArrayList<>();
		
		System.out.println(orders);
		System.out.println(onoList);
		// 각 주문에 대해 주문 상세 정보를 확인하고, 주문 완료 상태인 경우 예외 처리
		for (Orders order : orders) {
			List<OrderDetails> orderDetails = orderDetailsDao.findAllByOno(order.getOno());
			System.out.println(orderDetails);
			Boolean result = true;

			for (OrderDetails orderDetail : orderDetails) {
				if (orderDetail.getOrderStatus().equals("주문 완료")) {
					System.out.println(orderDetail);
					result = false;
					break;
				}
			}
			System.out.println(result);

			// 주문 완료 상태가 아닌 경우, 주문 상세, 배송지 정보 삭제
			if (result) {
				orderDetailsDao.deleteByOno(order.getOno());
				onoList.add(order.getOno());
				
			} else {
				return false;

			}
		}
		
		// 주문 삭제
		for (Long ono : onoList) {
	        ordersDao.deleteByOno(ono);
	    }

		return deliveryDao.delete(dno) == 1;
	}

	// 6. 기본배송지 변경
	public Boolean change(Long dno, String memberId) {
		Member member = memberDao.findById(memberId);
		Delivery delivery = deliveryDao.findSettingDefault(member.getMemberId());
		if (delivery.getDefaultAddress() == 1L) {
			deliveryDao.removeDefault(delivery.getDefaultAddress(), delivery.getMemberId());
		}

		Delivery d = deliveryDao.read(dno, member.getMemberId());
		return deliveryDao.settingDefault(dno, d.getDefaultAddress(), member.getMemberId()) == 1;

	}

	// 7. 배송 메세지 수정
	public Boolean changeMessage(DeliveryDto.Message dto, String memberId) {
		Member member = memberDao.findById(memberId);
		Delivery delivery = deliveryDao.read(dto.getDno(), member.getMemberId());
		delivery.setDeliveryRequest(dto.getDeliveryRequest());
		return deliveryDao.messageChange(delivery) == 1;
	}

	// 8. 기본배송지 설정된 것 정보 가져오기
	public Delivery defaultDelivery(String memberId) {
		return deliveryDao.findSettingDefault(memberId);
	}

	// 9. 배송지 리스트에서 등록된 배송지가 몇개인지 카운트
	public Long deliveryCount(String memberId) {
		return deliveryDao.deliveryCount(memberId);
	}

}