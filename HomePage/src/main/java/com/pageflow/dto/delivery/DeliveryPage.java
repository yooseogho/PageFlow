package com.pageflow.dto.delivery;

import java.util.*;

import com.pageflow.entity.delivery.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryPage {
	private Long prev;
	private Long start;
	private Long end;
	private Long next;
	private Long pageno;
	private List<Delivery> delivery;
}

/** 
 * 2023-10-31 : 배송지 리스트 페이징
 */ 
 