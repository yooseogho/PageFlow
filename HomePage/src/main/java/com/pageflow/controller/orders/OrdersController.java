package com.pageflow.controller.orders;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pageflow.dao.delivery.DeliveryDao;
import com.pageflow.dao.member.MemberDao;
import com.pageflow.dao.memberGrade.MemberGradeDao;
import com.pageflow.dao.orders.OrdersDao;
import com.pageflow.dto.cart.CartDto;
import com.pageflow.dto.delivery.DeliveryDto;
import com.pageflow.dto.delivery.DeliveryPage;
import com.pageflow.dto.member.MemberDto;
import com.pageflow.dto.member.MemberDto.Profile;
import com.pageflow.dto.memberGrade.MemberGradeDto;
import com.pageflow.dto.orders.OrdersDto;
import com.pageflow.entity.delivery.Delivery;
import com.pageflow.entity.member.Member;
import com.pageflow.entity.orderDetails.OrderDetails;
import com.pageflow.entity.orders.Orders;
import com.pageflow.service.delivery.DeliveryService;
import com.pageflow.service.member.MemberService;
import com.pageflow.service.memberGrade.MemberGradeService;
import com.pageflow.service.orderDetails.OrderDetailsService;
import com.pageflow.service.orders.OrdersService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Secured("ROLE_USER")
@Controller
public class OrdersController {
	@Autowired
	private DeliveryService deliveryService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private DeliveryDao deliveryDao;

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private OrderDetailsService orderDetailsService;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private MemberGradeService gradeService;;
	@Autowired
	private MemberGradeDao memberGradeDao;
	


	// 1. 주문결제 페이지 보여주기
	@GetMapping("/order")
	public ModelAndView order(HttpServletRequest request, Principal principal, Long dno) {
		HttpSession session = request.getSession();
		
		List<CartDto.Select> cartList = (List<CartDto.Select>) session.getAttribute("cartList");
		DeliveryDto.Read delivery = (DeliveryDto.Read) session.getAttribute("delivery");
		MemberDto.Read memberId = memberService.read(principal.getName());

		Long point = memberService.findPoint(principal.getName());

		return new ModelAndView("order_page").addObject("cartList", cartList).addObject("point", point)
				.addObject("delivery", delivery).addObject("memberId", memberId);
	}

	// 1-2. 주문하기
		@PostMapping("/order")
		@ResponseBody
		public ResponseEntity<Orders> order(@RequestBody Orders order, Principal principal, HttpSession session) {

		    List<CartDto.Select> cartList = (List<CartDto.Select>) session.getAttribute("cartList");
		    DeliveryDto.Read delivery = deliveryService.read(order.getDno(), principal.getName());
		    session.setAttribute("delivery", delivery);
		    Long pointUsed = (order.getPointUsed() != null) ? order.getPointUsed() : 0L;
		    System.out.println(pointUsed);
		    Boolean result = ordersService.add(order, principal.getName(), cartList, pointUsed);

		    if (!result) {
		        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
		    }

		    return ResponseEntity.ok(order);
		}
	// 1-3 주문결제 페이지에서 배송지 목록 페이지 보여주기
	@GetMapping("/order/delivery/list")
	public ModelAndView deliveryList(@RequestParam(defaultValue = "1") Long pageno, Principal principal) {
		DeliveryPage page = deliveryService.list(pageno, principal.getName());
		return new ModelAndView("order_delivery_page").addObject("page", page);
	}

	// 1-4 주문결제 페이지에서 배송지 선택해주기
	@PostMapping("order/delivery/list")
	public ModelAndView deliveryRead(Long dno, Principal principal, HttpSession session) {
		DeliveryDto.Read delivery = deliveryService.read(dno, principal.getName());
		session.setAttribute("delivery", delivery);
		return new ModelAndView("redirect:/order");
	}

	// 1-5. 주문결제 페이지에서 배송지 목록 추가하기
	@PostMapping("/order/delivery/add")
	public ModelAndView deliveryAdd(Principal principal, DeliveryDto.Create dto) {
		deliveryService.deliveryAdd(principal.getName(), dto);
		return new ModelAndView("redirect:/order/delivery/list");
	}

	// 1-6. 주문결제 페이지에서 배송지 수정 페이지
	@GetMapping("/order/delivery/update/{dno}")
	public ModelAndView update(@PathVariable Long dno, Principal principal) {
		Delivery delivery = deliveryDao.read(dno, principal.getName());
		return new ModelAndView("order_delivery_update_page").addObject("delivery", delivery);
	}

	// 1-7. 주문결제 페이지에서 배송지 수정
	@PostMapping("/order/delivery/update/{dno}")
	public ModelAndView update(@PathVariable Long dno, DeliveryDto.Update dto, Principal principal) {
		deliveryService.update(dto, principal.getName());
		return new ModelAndView("redirect:/order/delivery/list");
	}

	// 1-8. 주문 결제 페이지에서 배송지 삭제
	@PostMapping("/order/delivery/delete")
	public ModelAndView delete(Long dno) {
		try {
			deliveryService.delete(dno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/order/delivery/list");
	}

	// 1-9. 주문 결제 페이지에서 기본 배송지 변경
	@PostMapping("/order/defaultAddress/change")
	public ModelAndView change(Long dno, Principal principal, HttpSession session) {
		deliveryService.change(dno, principal.getName());
		DeliveryDto.Read delivery = deliveryService.read(dno, principal.getName());
		session.setAttribute("delivery", delivery);
		return new ModelAndView("redirect:/order");
	}

	// 1-10. 주문 결제 페이지에서 배송 메세지 페이지
	@GetMapping("/order/delivery/message/{dno}")
	public ModelAndView message(@PathVariable Long dno, Principal principal, DeliveryDto.Message dto) {
		Delivery delivery = deliveryDao.read(dno, principal.getName());
		return new ModelAndView("order_message_update_page").addObject("delivery", delivery);
	}

	// 1-11. 주문 결제 페이지에서 배송 메세지 변경
	@PostMapping("/order/delivery/message/{dno}")
	public ModelAndView message(@PathVariable Long dno, DeliveryDto.Message dto, Principal principal,
			HttpSession session) {
		deliveryService.changeMessage(dto, principal.getName());
		DeliveryDto.Read delivery = deliveryService.read(dno, principal.getName());
		session.setAttribute("delivery", delivery);
		return new ModelAndView("redirect:/order");
	}

	// 2. 주문 성공 페이지
	@GetMapping("order/success")
	public ModelAndView orderSuccess(@RequestParam Long ono, HttpSession session) {
	    List<OrderDetails> list = orderDetailsService.list(ono);
	    Orders order = ordersService.findOrder(ono);
	    DeliveryDto.Read delivery = (DeliveryDto.Read) session.getAttribute("delivery");
	    return new ModelAndView("order_success_page")
	            .addObject("list", list)
	            .addObject("delivery", delivery)
	            .addObject("order", order)
	            .addObject("pointUsed", order.getPointUsed()); // pointUsed 추가
	}


	// 3. 주문 목록 페이지
	@GetMapping("/order/list")
	public ModelAndView orderList(Principal principal) {
		// 주문 목록
		List<OrdersDto.OrdersList> orderList = ordersService.getOrdersList(principal.getName());
		
		// 주문 완료 개수
		Long completeCount = orderDetailsService.orderCompleteCount(principal.getName());
		
		// 취소 완료 개수
		Long cancelCount = orderDetailsService.orderCancelCount(principal.getName());
		
		// 주문 확정 개수 
		Long confirmCount = orderDetailsService.orderConfirmCount(principal.getName());
		
		// 프로필 가져오기
		Profile memberProfile = memberService.MemberProfile(principal.getName());
		
	    // MemberGradeDto.MemberInfoDto 객체에서 gradeCode를 가져오기.
		MemberGradeDto.MemberInfoDto memberInfo = memberService.getMemberInfo(principal.getName());
		Long gradeCode = memberInfo.getGradeCode();
		
		// gradeCode를 이용해서 gradeName을 가져오기.
	    String gradeName = gradeService.getGradeNameByCode(gradeCode);
		
		return new ModelAndView("order_list_page").addObject("orderList", orderList)
				.addObject("cancelCount", cancelCount).addObject("completeCount", completeCount)
				.addObject("confirmCount", confirmCount).addObject("member", memberProfile)
				.addObject("gradeName", gradeName);
	}

	// 4. 주문 읽기
	@GetMapping("/order/read")
	public ModelAndView read(@RequestParam(required = false) Long ono, Principal principal, HttpSession session) {
		OrdersDto.Read read = ordersService.readOrders(ono, principal.getName());
		session.setAttribute("orderRead", read);
		Profile memberProfile = memberService.MemberProfile(principal.getName());

	    // MemberGradeDto.MemberInfoDto 객체에서 gradeCode를 가져옵니다.
	    MemberGradeDto.MemberInfoDto memberInfo = memberService.getMemberInfo(principal.getName());
	    Long gradeCode = memberInfo.getGradeCode();

	    // gradeCode를 이용해서 gradeName을 가져옵니다.
	    String gradeName = gradeService.getGradeNameByCode(gradeCode);

		return new ModelAndView("order_detail_list_page").addObject("read", read)
				.addObject("member", memberProfile).addObject("gradeName", gradeName);
	}

	// 5. 주문 삭제
	@PostMapping("/order/delete")
	public ModelAndView orderDelete(Long ono) {
		ordersService.delete(ono);
		return new ModelAndView("redirect:/order/list");
	}

	/*주문 취소시에 포인트 반환 유석호 11-17
	 * 
	 * */
			// 6. 주문 취소
	@PostMapping("/order/cancel")
	@ResponseBody
	public ResponseEntity<OrderDetails> orderCancel(@RequestBody Map<String, Long> map) {
	    Long odno = map.get("odno");
	    OrderDetails orderDetails = orderDetailsService.readOrderDetails(odno);
	    
	    if (orderDetails == null) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	    }

	    Long ono = orderDetails.getOno(); // ono 초기화
	    Orders orders = ordersService.findOrder(ono);

	    // 주문 취소
	    Boolean cancelResult = orderDetailsService.updateCancel(odno);

	    // 포인트 환불
	    Boolean refundResult = memberService.refundPoints(orders.getMemberId(), orders.getPointUsed());

	    if (!cancelResult || !refundResult) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
	    }

	    return ResponseEntity.ok(orderDetails);
	}



	/*
	 * 유석호 11-09 주문확정 누를시 포인트가 적립되게 수정
	 * */
	@PostMapping("/order/confirm")
	@ResponseBody
	public ResponseEntity<OrderDetails> orderConfirm(@RequestBody Map<String, Long> map) {
	    Long odno = map.get("odno");

	    // 주문 상태를 "확정"으로 변경
	    Boolean result = orderDetailsService.updateConfirm(odno);
	    if (!result) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
	    }

	    OrderDetails orderDetails = orderDetailsService.read(odno);
	    if (orderDetails == null) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();  // orderDetails 객체가 null이면 요청을 거부합니다.
	    }

	    // OrderDetails 객체에서 ono를 사용해 Orders 객체를 가져옵니다.
	    // 이 부분은 null 체크를 추가했습니다.
	    Orders orders = ordersDao.findByOno(orderDetails.getOno());
	    if (orders == null) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();  // orders 객체가 null이면 요청을 거부합니다.
	    }

	    // 포인트를 사용하여 구매한 경우에는 포인트 적립을 하지 않습니다.
	    if (orders.getPointUsed() > 0) {
	        return ResponseEntity.ok(orderDetails);
	    }

	    // 포인트가 아직 적립되지 않은 경우에만 적립을 진행합니다.
	    if (orders.getPointEarn() == 0) {
	        // 회원의 포인트 적립
	        String memberId = orders.getMemberId();  // Orders 객체에서 회원 아이디를 가져옵니다.
	        Member member = memberDao.findById(memberId);  // 회원 아이디로 회원 정보를 가져옵니다.

	        // 적립률 가져오기
	        double pointRate = memberGradeDao.getPointRateByGradeCode(member.getGradeCode());
	        
	     // 적립 포인트 계산 (가격 * 적립률)
	        long totalPointEarn = (long) Math.round(orders.getOrderPrice() * pointRate);

	        // 회원의 포인트를 먼저 업데이트합니다. (기존 포인트 + 적립될 포인트)
	        memberDao.updateMemberPoint(member.getMemberId(), totalPointEarn);

	        // 이후에 적립 포인트를 Orders 객체에 저장하고 DB에 업데이트합니다.
	        orders.setPointEarn(totalPointEarn);
	        ordersDao.updatePointEarn(orders.getOno(), totalPointEarn);
	    }
	    return ResponseEntity.ok(orderDetails);
	}

}
