<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/order.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="/script/order.js"></script>
<title>Insert title here</title>  
</head>
<body>
<script>
$(document).ready(function() {
	/** 결제할 때 필요한 요소들 */	
	var IMP = window.IMP;
	IMP.init("imp16376821");

	var today = new Date();

	var hours = today.getHours(); // 시

	var minutes = today.getMinutes();  // 분

	var seconds = today.getSeconds();  // 초
	
    var inputElem = document.getElementById('myNumberInput');  // 포인트 입력란 요소를 가져옵니다.
    var inputVal = parseInt(inputElem.value);  // 입력란의 값을 숫자로 변환하여 저장합니다.

	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;
	var dno = '${delivery.dno}';
	var pointEarn = "${cartList[cartList.size()- 1].totalPointEarnings}";
	$('#all_point_btn').on('click', function() {
	    const point = '${point}';
	    $('#all_point_text').text(point);
	    $('#myNumberInput').val(point);  // 이 부분을 추가했습니다.
	    $('#all_point_btn').css('display', 'none');
	    $('#cancel_point_btn').css('display', 'block');
	    updatePoint();  // 이 부분을 추가했습니다. 포인트 값이 변경되었으므로 updatePoint 함수를 호출하여 최종 결제 금액을 갱신합니다.
	})

		
	$('#cancel_point_btn').on('click', function() {
	    $('#all_point_text').text(0);
	    $('#myNumberInput').val(0);  // 이 부분을 추가했습니다.
	    $('#cancel_point_btn').css('display', 'none');
	    $('#all_point_btn').css('display', 'block');
	    updatePoint();  // 이 부분을 추가했습니다. 포인트 값이 변경되었으므로 updatePoint 함수를 호출하여 최종 결제 금액을 갱신합니다.
	})
	/** 나이스 페이 결제할 때 */
	function nicePay() {
		IMP.request_pay({
			pg: 'nice',
			pay_method: 'card',
			merchant_uid: makeMerchantUid,
			name: 'PageFlow 결제',
			amount: '${cartList[cartList.size()- 1].totalAmount}',
			buyer_email: '${memberId.memberEmail}',
			buyer_tel: '${delivery.receiverTel}',
			buyer_addr: '${delivery.deliveryAddress}',
			buyer_name : "${memberId.memberName}"
		}, function(rsp) { // callback
			if (rsp.success) {
				
				alert(rsp);
				let msg = "결제가 완료되었습니다.";
				
				
				  var pointUsed = parseInt($('#myNumberInput').val(), 10) || 0;  // 사용한 포인트 금액을 숫자로 변환하고, 값이 없으면 0을 설정합니다.
		            var orderPrice = rsp.paid_amount - pointUsed;  // 주문 금액에서 사용한 포인트 금액을 뺍니다.
				let result = {
					"memberId": "${memberId.memberId}",
					"dno": dno,
					  "orderPrice": orderPrice,  // 최종 결제 금액을 수정합니다.
					"pointEarn": 0,
					"payment": rsp.pg_provider,
					"ordersBuyer": rsp.buyer_name,
					 "pointUsed": $('#myNumberInput').val()  // 사용자가 입력한 포인트 사용량을 추가합니다.
				}
				alert(msg);
				

				$.ajax({
				    url: '/order',
				    type: 'POST',
				    contentType: 'application/json',
				    data: JSON.stringify({
				        ...result,
				        orderPrice: finalPrice,
				        pointUsed: $('#myNumberInput').val(),
				        pointEarn: $('#myNumberInput').val() > 0 ? 0 : '${cartList[cartList.size()- 1].totalPointEarnings}'
				    }),
				    success: function(order) {   
				        location.replace('/order/success?ono=' + order.ono);
				    },
				    error: function(err){
				        console.log(err);
				    }
				})

			}
		});

	}
	
	$('#order_btn').on('click', nicePay);
	
	/** 카카오페이 결제 */
	function kakaoPay() {
		IMP.request_pay({
			pg: 'kakaopay',
			pay_method: 'card',
			merchant_uid: makeMerchantUid,
			name: 'PageFlow 결제',
			amount: '${cartList[cartList.size()- 1].totalAmount}',
			buyer_email: '${memberId.memberEmail}',
			buyer_tel: '${delivery.receiverTel}',
			buyer_addr: '${delivery.deliveryAddress}',
			buyer_name : "${memberId.memberName}"
		}, function(rsp) { // callback
			if (rsp.success) {
				let msg = "결제가 완료되었습니다.";
				  var pointUsed = parseInt($('#myNumberInput').val(), 10) || 0;  // 사용한 포인트 금액을 숫자로 변환하고, 값이 없으면 0을 설정합니다.
		            var orderPrice = rsp.paid_amount - pointUsed;  // 주문 금액에서 사용한 포인트 금액을 뺍니다.
				let result = {
					"memberId": "${memberId.memberId}",
					"dno": dno,
					  "orderPrice": orderPrice,  // 최종 결제 금액을 수정합니다.
					"pointEarn": 0,
					"payment": rsp.pg_provider,
					"ordersBuyer": rsp.buyer_name,
					 "pointUsed": $('#myNumberInput').val()  // 사용자가 입력한 포인트 사용량을 추가합니다.
				}
				alert(msg);

				$.ajax({
					url: '/order',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(result),
					success: function(order) {
						location.replace('/order/success?ono=' + order.ono);
						console.log(order);
					},
					error: function(err) {
						console.log(err);
					}
				})


			}
		});

	}
	
	$('#kakaoPay-btn').on('click', kakaoPay);
	
	/** 토스페이 결제 */
	function tossPay() {
		IMP.request_pay({
			pg: 'tosspay',
			pay_method: 'card',
			merchant_uid: makeMerchantUid,
			name: 'PageFlow 결제',
			amount: '${cartList[cartList.size()- 1].totalAmount}',
			buyer_email: '${memberId.memberEmail}',
			buyer_tel: '${delivery.receiverTel}',
			buyer_addr: '${delivery.deliveryAddress}',
		}, function(rsp) { // callback
			if (rsp.success) {

				let msg = "결제가 완료되었습니다.";
				  var pointUsed = parseInt($('#myNumberInput').val(), 10) || 0;  // 사용한 포인트 금액을 숫자로 변환하고, 값이 없으면 0을 설정합니다.
		            var orderPrice = rsp.paid_amount - pointUsed;  // 주문 금액에서 사용한 포인트 금액을 뺍니다.
				let result = {
					"memberId": "${memberId.memberId}",
					"dno": dno,
					  "orderPrice": orderPrice,  // 최종 결제 금액을 수정합니다.
					"pointEarn": 0,
					"payment": rsp.pg_provider,
					"ordersBuyer": "${memberId.memberName}",
						 "pointUsed": $('#myNumberInput').val()  // 사용자가 입력한 포인트 사용량을 추가합니다.
				}
				alert(msg);

				$.ajax({
					url: '/order',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(result),
					success: function(order) {
						location.replace('/order/success?ono=' + order.ono);
					},
					error: function(err) {
						console.log(err);
					}
				})


			}
		});

	}
	
	$('#tossPay-btn').on('click', tossPay);
	
	/** 페이코페이 결제 */
	function paycoPay() {
		IMP.request_pay({
			pg: 'payco',
			pay_method: 'card',
			merchant_uid: makeMerchantUid,
			name: 'PageFlow 결제',
			amount: '${cartList[cartList.size()- 1].totalAmount}',
			buyer_email: '${memberId.memberEmail}',
			buyer_tel: '${delivery.receiverTel}',
			buyer_addr: '${delivery.deliveryAddress}',
		}, function(rsp) { // callback
			if (rsp.success) {

				let msg = "결제가 완료되었습니다.";
				  var pointUsed = parseInt($('#myNumberInput').val(), 10) || 0;  // 사용한 포인트 금액을 숫자로 변환하고, 값이 없으면 0을 설정합니다.
		            var orderPrice = rsp.paid_amount - pointUsed;  // 주문 금액에서 사용한 포인트 금액을 뺍니다.
				let result = {
					"memberId": "${memberId.memberId}",
					"dno": dno,
				    "orderPrice": orderPrice,  // 최종 결제 금액을 수정합니다.
					"pointEarn": 0,
					"payment": rsp.pg_provider,
					"ordersBuyer": "${memberId.memberName}",
					"pointUsed": pointUsed  // 사용한 포인트 금액을 추가합니다.
					
				}
				alert(msg);


            	$.ajax({
            	    url: '/order',
            	    type: 'POST',
            	    contentType: 'application/json',
            	    data: JSON.stringify({
            	        ...result,
            	        orderPrice: finalPrice,  // 최종 결제 금액을 추가합니다.
            	        pointUsed: $('#myNumberInput').val(),  // 사용자가 입력한 포인트 사용량을 추가합니다.
            	        pointEarn: !isNaN(inputVal) && inputVal > 0 ? 0 : '${cartList[cartList.size()- 1].totalPointEarnings}'  // 포인트를 사용하면 적립예정포인트를 0으로 설정하고, 그렇지 않으면 원래 값으로 설정합니다.
            	    }),
            	    success: function(order) {   
            	        location.replace('/order/success?ono=' + order.ono);
            	    },
            	    error: function(err){
            	        console.log(err);
            	    }
            	})

			}
		});

	}
	$("#paycoPay-btn").on('click', paycoPay);
	
})//document 끝마침.

// 상품 가격을 저장하는 변수를 선언하고 초기화합니다.
var initialProductPrice = parseInt('${cartList[cartList.size()- 1].totalAmount}'); // 적절한 값을 사용하세요.

var finalPrice = 0; // 전역 변수로 선언

function updatePoint() {
    var inputVal = parseInt(document.getElementById("myNumberInput").value);
    var maxPoint = parseInt('${point}');  // 사용자의 보유 포인트를 가져옵니다.

    // 입력된 포인트 사용량이 없거나 유효하지 않으면 0으로 설정
    if (isNaN(inputVal)) {
        inputVal = 0;
        document.getElementById("myNumberInput").value = 0;  // 입력 필드의 값을 0으로 재설정합니다.
    }

    if (inputVal > maxPoint) {
        alert("입력하신 포인트가 보유 포인트를 초과합니다.");
        document.getElementById("myNumberInput").value = maxPoint;  // 입력 필드의 값을 보유 포인트로 재설정합니다.
        inputVal = maxPoint;
    }

    document.getElementById("all_point_text").innerText = inputVal;
    var pointUseItems = document.querySelectorAll('.payments_info_item .price .val'); // 모든 .payments_info_item 요소를 가져옵니다.
    pointUseItems[2].innerText = inputVal.toLocaleString() ;  // 세 번째 요소(포인트 사용 부분)만 변경

    finalPrice = initialProductPrice - inputVal;  // 상품의 금액에서 포인트 사용 금액을 빼서 최종 금액을 계산합니다.

    // 최종 결제금액이 0보다 작으면 상품 금액 그대로 표시
    if (finalPrice < 0) {
        finalPrice = initialProductPrice;
    }
    
    // 최종 결제 금액 부분을 변경
    document.getElementById('finalPrice').innerText = finalPrice.toLocaleString()  ;
    
    var expectedPointElem = document.querySelector('.payments_info_item.point .val');  // 예정 포인트를 표시하는 요소를 가져옵니다.

    if (!isNaN(inputVal) && inputVal > 0) {
        expectedPointElem.innerText = '0';  // 포인트를 사용하면 예정 포인트를 0으로 설정합니다.
    } else {
        // 포인트 사용 입력란이 비어있으면 예정 포인트를 원래 값으로 복원합니다.
        // 원래 값은 서버에서 받아온 값이나 다른 적절한 값으로 설정해야 합니다.
        var originalExpectedPoint = '${cartList[cartList.size()- 1].totalPointEarnings}';
        expectedPointElem.innerText = originalExpectedPoint;
    }
}

</script>

    <div id="page">
        <header class="header_wrapper">
        	<jsp:include page="/WEB-INF/views/include/header.jsp" />
        </header>
        <nav class="nav_wrapper">
        	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
        </nav>

        <main class="container_wrapper" style="position: relative;">
            <section id="contents" class="contents_wrap">
                <div class="contents_inner">
                    <div class="cart_top_wrap sps">
                        <div class="cart_top_inner">
                            <div class="cart_title_box">
                                <div class="title_wrap title_size_lg">
                                    <h1 class="title_heading">주문/결제</h1>
                                    <div class="right_area">
                                        <ol class="step_round_text_list">
                                            <li class="step_item"><span class="step_num">1</span>장바구니</li>
                                            <li class="step_item active"><span class="step_num">2</span>주문/결제</li>
                                            <li class="step_item"><span class="step_num">3</span>주문완료</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="cart_body_payment">
                        <div class="cart_body_inner">
                            <div class="payment_box_wrap" style="display:block;">
                                <div class="payment_body_wrap">
                                    <div class="tbl_row_wrap">
                                        <table class="tbl_row">
                                            <colgroup>
                                                <col style="width: 210px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
												<c:choose>
												  <c:when test="${empty delivery}">
												    <tr>
												      <th scope="row">배송지 정보</th>
												      <td>
												        <div class="address_item no_line" data-delivery-point-address-info="default-addr-message">
												          <div class="address_info_box">
												          </div>
												        </div>
												
												        <div class="btn_wrap full">
												          <button type="button" class="btn_ip btn_line_gray" id="popup_btn" onclick="location.href='/order/delivery/list';"><span class="ico_write_black"></span><span class="text fw_medium">배송지 입력</span></button>
												        </div>
												      </td>
												    </tr>
												  </c:when>
												  <c:otherwise>
												    <tr>
	                                                	<th scope="row">배송지 정보</th>
	                                                    <td>
	                                                        <div class="address_item no_line">
	                                                            <div class="address_info_box">
	                                                                <div class="address_name">
	                                                                    <span class="name"><i class="ico_location_primary"></i><span class="text">${delivery.addressName}</span></span>
	                                                                    <c:if test="${delivery.defaultAddress eq 1}">
	                                                                    	<span class="badge_sm badge_payment_line_purple"><span class="text">기본배송지</span></span>
																		</c:if>
	                                                                    <button type="button" class="btn_xs btn_line_gray" onclick="location.href=`/order/delivery/list`"><span class="text">변경</span></button>
	                                                                </div>
	                                                                <div class="address_person">
	                                                                    <span class="name">${delivery.receiverName}</span>
	                                                                    <span class="gap">/</span>
	                                                                    <span class="phone_number">${delivery.receiverTel.substring(0,3)}-${delivery.receiverTel.substring(3,7)}-${delivery.receiverTel.substring(7)}</span>
	                                                                </div>
	                                                                <div class="address">
	                                                                    <span class="address_text">[${delivery.zipCode}] ${delivery.deliveryAddress}</span>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </td>
                                               		</tr>
												  </c:otherwise>
												</c:choose>
                                                <tr>
                                                	<th scope="row" class="has_ip">배송요청사항</th>
                                                	<td>
								                        <div class="form_info_single">
								                            <span class="default_text" data-delivery-point-message="message">${delivery.deliveryRequest}</span>
								                            <a href="/order/delivery/message/${delivery.dno}">
                                                            <button type="button" class="btn_ip btn_line_gray">
                                                                <span class="ico_msg_black"></span>
                                                                <span class="text fw_medium">배송요청사항 메시지 변경</span>
                                                            </button>
                                                        	</a>  
								                        </div>
								                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="fold_box_wrap type_box">
                                <div class="fold_box_list">

                                    <div class="fold_box expanded">
                                        <div class="fold_box_header">
                                            <div class="tbl_row_wrap">
                                                <table class="tbl_row">
                                                    <colgroup>
                                                        <col style="width: 210px;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">주문상품</th>
                                                            <td>
                                                                <div class="number_value_box size_def">
                                                                    <span class="label">총</span>
                                                                    <span class="point">
                                                                        <span class="val fc_spot">${cartList.size()}</span>
                                                                        <span class="unit">개</span>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <button type="button" class="btn_fold"><span class="hidden">컨텐츠 닫기</span></button>
                                        </div>
                                        <div class="fold_box_contents">
                                            <div class="tbl_prod_wrap ordering">
                                                <table class="tbl_prod">
                                                    <colgroup>
                                                        <col>
                                                        <col style="width: 150px;">
                                                        <col style="width: 100px;">
                                                        <col style="width: 148px;">
                                                    </colgroup>
                                                    <thead class="hidden">
                                                        <tr>
                                                            <th scope="col">상품정보</th>
                                                            <th scope="col">배송방법</th>
                                                            <th scope="col">수량</th>
                                                            <th scope="col">금액</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    	<c:forEach var="cartList" items="${cartList}">
	                                                        <tr>
	                                                            <td class="prod">
	                                                                <div class="prod_area horizontal">
	                                                                    <div class="prod_thumb_box  size_sm">
	                                                                        <a href="/book/read?bno=${cartList.bno}" class="prod_link">
	                                                                            <span class="img_box">
	                                                                                <img src="${cartList.bookImage}" alt="${cartList.bookTitle}">
	                                                                            </span>
	                                                                        </a>
	                                                                    </div>
	                                                                    <div class="prod_info_box size_sm">
	                                                                        <span class="prod_info">
	                                                                            <span class="prod_name">[국내도서] ${cartList.bookTitle}</span>
	                                                                        </span>
	                                                                    </div>
	                                                                </div>
	                                                            </td>
	                                                            <td>
	                                                                <div class="badge_box">
	                                                                    <span class="badge_sm badge_pill badge_primary_ord"><span class="text">PageFlow배송</span></span>
	                                                                </div>
	                                                            </td>
	                                                            <td>
	                                                                <span class="prd_num"> ${cartList.cartCount}개 </span>
	                                                            </td>
	                                                            <td>
	                                                                <span class="price">
	                                                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList.amount}" /></span>
	                                                                    <span class="unit">원</span>
	                                                                </span>
	                                                            </td>
	                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="fold_box no_fold no_overflow">
                                        <div class="fold_box_fixed">
                                            <ul class="delivery_info_list">
                                                <li class="delivery_info_item">
                                                    <span class="label">
                                                        <span class="text">PageFlow배송</span>
                                                    </span>
                                                    <span class="text_body">
                                                        <span id="delivery_dateText" class="fc_payment_blue">
                                                            <strong class="blue"></strong>
                                                        </span>
                                                        <script>
															var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
															    var now = new Date();
															    now.setDate(now.getDate() + 3);
															    var year = now.getFullYear();
															    var month = now.getMonth() + 1;
															    var date = now.getDate();
															    var day = dayNames[now.getDay()];
															    var message = "(" + month + "/" + date + "," + day + ") 도착 예정";
															    document.getElementById('delivery_dateText').innerHTML = '<strong class="blue">' + message + '</strong>';
														</script>
                                                    </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="fold_box_wrap type_box" data-type="multi" data-cash-voucher="area">
                                <div class="fold_box_list">
                                    <div class="fold_box expanded">
                                        <div class="fold_box_header">
                                            <div class="point_header_box">
                                                <div class="header_text">포인트</div>
                                                <div class="number_value_box size_def">
                                                    <span class="label">보유</span>
                                                    <span class="point">
                                                        <span class="val fc_spot" data-cash-voucher="total-have"><fmt:formatNumber type="number" pattern="#,##0" value="${point}" /></span>
                                                        <span class="unit">원</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <button type="button" class="btn_fold"><span class="hidden">컨텐츠 열기</span></button>
                                        </div>
                                        <div class="fold_box_contents">
                                            <div class="point_used_box">
                                                <div class="tbl_row_wrap form_xs">
                                                    <table class="tbl_row">
                                                        <colgroup>
                                                            <col style="width: 146px;">
                                                            <col style="width: 150px;">
                                                            <col style="width: auto;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row" class="has_ip">
                                                                                    <label for="rowTblIpPoint01_01">포인트</label>
                                                                </th>
                                                                <td>
                                                                    <div class="number_value_box size_def">
                                                                        <span class="point">
                                                                            <span id="all_point_text" class="val fc_spot">0</span>
                                                                            <span class="unit">원</span>
                                                                        </span>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="input_btn_price_box">
                                                                        <div class="input_price_box">
                           <input type="number" id="myNumberInput" class="form_ip numericOnly" maxlength="7" max="${point}" onkeyup="updatePoint()">
                                                                            <span class="unit">원</span>
                                                                        </div>
                                                                        <button id="all_point_btn" type="button" class="btn_ip btn_line_primary"><span class="text">전액사용</span></button>
                                                                        <button id="cancel_point_btn" type="button" class="btn_ip btn_light_gray" style="display : none;"><span class="text">사용취소</span></button>
                                                                    </div>	
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="payment_box_wrap">
                                <div class="payment_header_wrap">
                                    <div class="payment_header_inner">
                                        <span class="header_text">결제수단</span>
                                    </div>
                                </div>

                                <div class="payment_body_wrap no_top_line" id="settlementMethodWrapper">
                                    <div class="payment_etc_wrap">
                                        <div class="payment_item_row_group">
                                            <button id="paycoPay-btn" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="ico_payment_payco"><span class="hidden">PAYCO</span></span>
                                            </button>

                                            <button id="kakaoPay-btn" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="ico_payment_kakaopay"><span class="hidden">카카오페이</span></span>
                                            </button>

                                            <button id="tossPay-btn" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="ico_payment_toss"><span class="hidden">토스페이</span></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      <div class="cart_info_wrap" style="top: 0px;">
                            <div class="payments_info_area">
                                <div class="payments_info_box">
                                    <h2 class="hidden">결제금액</h2>
                                    <ul class="payments_info_list">
                                        <li class="payments_info_item">
                                            <p class="label">상품금액</p>
                                            <div class="right_box">
                                                <span class="price">
                                                	<c:if test="${not empty cartList}">
	                                                    <span class="val spot"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList[cartList.size()- 1].totalAmount}" /></span>
	                                                    <span class="unit">원</span>
                                                    </c:if>
                                                </span>
                                            </div>
                                        </li>
                                        <li class="payments_info_item">
                                            <p class="label">배송비</p>
                                            <div class="right_box">
                                                <span class="price">
                                                    <span class="val">0</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                        <li class="payments_info_item">
                                            <p class="label">포인트 사용</p>
                                            <div class="right_box">
                                                <span class="price">
                                                    <span class="val"></span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="payments_info_box">
                                    <ul class="payments_info_list">
	                                        <li class="payments_info_item total">
	                                            <p class="label">최종결제금액</p>
	                                            <div class="right_box">
	                                                <span class="price">
	                                                	<c:if test="${not empty cartList}">
		                                                    <span class="val" id="finalPrice" data-final-price="${cartList[cartList.size()- 1].totalAmount}">
    <fmt:formatNumber type="number" pattern="#,##0" value="${cartList[cartList.size()- 1].totalAmount}" />
</span>

		                                                    <span class="unit">원</span>
	                                                    </c:if>
	                                                </span>
	                                            </div>
	                                        </li>
                                        <li class="payments_info_item point">
                                            <p class="label">적립예정포인트</p>
                                            <div class="right_box">
                                                <span class="price">
                                                	<c:if test="${not empty cartList}">
	                                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList[cartList.size()- 1].totalPointEarnings}" /></span>
	                                                    <span class="unit">P</span>
                                                    </c:if>
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="btn_wrap full">
                                    <button type="button" class="btn_lg btn_primary" id="order_btn">
                                        <span class="text">결제하기</span>
                                    </button>
                                </div>
                            </div>
                            <div class="payment_order_agree_wrap">
                                <span class="text" style="margin-bottom : 10px; display : block;">위 주문내용을 확인하였으며, 결제에 동의합니다.</span><br>
                                <span class="text">밑의 결제수단에서 결제할 수 없는 경우 결제하기 버튼을 누르면 결제창으로 넘어갑니다.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <footer class="footer_wrapper">
            <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </footer>
    </div>
</body>
</html>