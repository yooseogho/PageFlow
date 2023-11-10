package com.pageflow.controller.delivery;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.pageflow.dto.delivery.*;
import com.pageflow.dto.member.MemberDto.*;
import com.pageflow.dto.memberGrade.*;
import com.pageflow.entity.delivery.*;
import com.pageflow.service.delivery.*;
import com.pageflow.service.member.*;
import com.pageflow.service.memberGrade.*;

import ch.qos.logback.core.joran.spi.*;

@Secured("ROLE_USER")
@Controller
public class DeliveryController {
	@Autowired
	private DeliveryService deliveryService;
	
	@Autowired 
	private MemberGradeService gradeService;
	
	@Autowired
	private MemberService memberService;
	
	// 1-1. 배송주소록의 배송지 페이지
	@GetMapping("/delivery/list")
	public ModelAndView deliveryList(@RequestParam(defaultValue = "1") Long pageno, Principal principal) {
		// 기본 배송지를 가진 배송지 불러오기
		Delivery defaultDelivery = deliveryService.defaultDelivery(principal.getName());
		
		// 배송 목록 페이징
		DeliveryPage page = deliveryService.list(pageno, principal.getName());
		
		// 배송 개수
		Long count = deliveryService.deliveryCount(principal.getName());
		
		// 프로필 가져오기
		Profile memberProfile = memberService.MemberProfile(principal.getName());
		
	    // MemberGradeDto.MemberInfoDto 객체에서 gradeCode를 가져오기.
		MemberGradeDto.MemberInfoDto memberInfo = memberService.getMemberInfo(principal.getName());
		Long gradeCode = memberInfo.getGradeCode();
		
		// gradeCode를 이용해서 gradeName을 가져오기.
	    String gradeName = gradeService.getGradeNameByCode(gradeCode);
		
		return new ModelAndView("member_delivery_list_page").addObject("defaultDelivery", defaultDelivery)
				.addObject("page", page).addObject("count", count).addObject("gradeName", gradeName)
				.addObject("member", memberProfile);		
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
	public ModelAndView delete(Long dno, RedirectAttributes ra) {
        Boolean result = deliveryService.delete(dno);
        if (!result) {
            ra.addFlashAttribute("msg", "배송지 삭제는 주문 확정 혹은 취소 완료 혹은 주문을 하지 않은 배송지에 해당되는 경우에만 삭제가 가능합니다.");
            return new ModelAndView("redirect:/delivery/list");
        }
	    
	    return new ModelAndView("redirect:/delivery/list");
	}

}
