package com.pageflow.controller.delivery;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.pageflow.dto.delivery.*;
import com.pageflow.entity.delivery.*;
import com.pageflow.service.delivery.*;

@Secured("ROLE_USER")
@Controller
public class DeliveryController {
	@Autowired
	private DeliveryService deliveryService;
	
	// 1-1. 배송주소록의 배송지 페이지
	@GetMapping("/delivery/list")
	public ModelAndView deliveryList(@RequestParam(defaultValue = "1") Long pageno, Principal principal) {
		Delivery defaultDelivery = deliveryService.defaultDelivery(principal.getName());
		DeliveryPage page = deliveryService.list(pageno, principal.getName());
		Long count = deliveryService.deliveryCount(principal.getName());
		return new ModelAndView("member_delivery_list_page").addObject("defaultDelivery", defaultDelivery)
				.addObject("page", page).addObject("count", count);		
	}
	
	// 1-2. 배송지 추가
	@PostMapping("/delivery/add")
	public ModelAndView deliveryAdd(Principal principal, DeliveryDto.Create dto) {
		deliveryService.deliveryAdd(principal.getName(), dto);
		return new ModelAndView("redirect:/delivery/list");
	}
	
	// 2. 기본 배송지 변경
	@PostMapping("/delivery/default/change")
	public ModelAndView chaangeDefault(Long dno, Principal principal) {
		deliveryService.change(dno, principal.getName());
		return new ModelAndView("redirect:/delivery/list");
	}
	
	// 3-1. 배송지 수정 페이지
	@GetMapping("/delivery/update/{dno}")
	public ModelAndView update(@PathVariable Long dno, Principal principal) {
		DeliveryDto.Read delivery = deliveryService.read(dno, principal.getName());
		return new ModelAndView("member_delivery_update_page").addObject("delivery", delivery);
	}

	// 3-2. 배송지 수정
	@PostMapping("/delivery/update/{dno}")
	public ModelAndView update(@PathVariable Long dno, DeliveryDto.Update dto, Principal principal) {
		deliveryService.update(dto, principal.getName());
		return new ModelAndView("redirect:/delivery/list");
	}
	
	// 4. 배송지 삭제
	@PostMapping("/delivery/delete")
	public ModelAndView delete(Long dno, Principal principal, RedirectAttributes ra) {
		Boolean result = deliveryService.delete(dno);
		System.out.println(result);
		if(!result) {
			ra.addFlashAttribute("msg", "배송지 삭제는 주문 확정 혹은 주문을 하지 않은 배송지에 해당되는 경우에만 삭제가 가능합니다.");
			return new ModelAndView("redirect:/delivery/list");
		}
		return new ModelAndView("redirect:/delivery/list");
	}
}
