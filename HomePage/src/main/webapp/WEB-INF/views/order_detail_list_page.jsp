<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/order_detail_list.css">
<title>Insert title here</title>
</head>
<script>
	const c = '${read}';
	console.log(c);
</script>
<body>
	<div id="page">
		<header class="header_wrapper">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav class="nav_wrapper">
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>
		<main class="main_wrapper">
            <div class="main_inner">
                <aside class="aside_wrapper">
                    <jsp:include page="/WEB-INF/views/include/member_info_left_aside.jsp" />
                </aside>
                
               <section class="section_wrapper">
                    <div class="title_wrap title_size_md has_btn">
                        <p class="title_heading">주문/배송 조회 상세</p>
                    </div>
                    <div class="order_summary_box">
                        <div class="box_header">
                            <div class="label">
                                <span class="order_date" data-order-date="">${read.orderDate}</span>
                                <span class="gap">|</span>
                                <span class="order_num">주문번호 <span class="num" data-order-id="">${read.ono}</span></span>
                            </div>
                        </div>


                        <div class="box_body" >
                            <ul class="order_summary_list">
                                <li class="order_summary_item">
                                    <p class="label">입금금액</p>
                                    <div class="right_box">
                                        <span class="price">
                                            <span class="val">
                                            	<fmt:formatNumber type="number" pattern="#,##0" value="${read.orderPrice}" />
                                            </span>
                                            <span class="unit">원</span>
                                        </span>
                                    </div>
                                </li>
                                <li class="order_summary_item">
                                    <p class="label">예금주명</p>
                                    <div class="right_box">㈜PageFlow
                                    </div>
                                </li>
                                <li class="order_summary_item">
                                    <p class="label">입금자명</p>
                                    <div class="right_box" data-online-deposit-depositor="">${read.ordersBuyer}</div>
                                </li>
                                <li class="order_summary_item">
                                    <p class="label">결제은행</p>
                                    <div class="right_box">
                                        <span data-online-deposit-bank-name="">${read.payment}</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="tbl_prod_wrap type_myroom" id="commodityList" style="">
                        <h3 class="tbl_summary" data-order-detail-commodity-group-name="">배송</h3>
                        <table class="tbl_prod">
                            <colgroup>
                                <col>
                                <col style="width: 164px;">
                                <col style="width: 180px;">
                                <col style="width: 130px;">
                            </colgroup>
                            <thead class="hidden">
                                <tr>
                                    <th scope="col">상품정보</th>
                                    <th scope="col">금액</th>
                                    <th scope="col">배송정보</th>
                                    <th scope="col">취소</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${read.orderDetails}" var="details">
                                <tr>
                                    <td class="prod">
                                        <div class="prod_area horizontal">
                                            <div class="prod_thumb_box size_sm">
                                                <a href="/book/read?bno=${details.bno}" class="prod_link">
                                                    <span class="img_box">
                                                        <img src="${details.bookImage }" alt="${details.bookTitle }">
                                                    </span>
                                                </a>
                                            </div>
                                            <div class="prod_info_box size_sm">
                                                <span class="badge_sm badge_kyobo">

                                                    <span class="text">교보문고 배송</span>
                                                </span>
                                                <a href="#" class="prod_info">
                                                    <span class="prod_name ellipsis_none">[국내도서] ${details.bookTitle } </span>
                                                </a>
                                                <ul class="prod_option_list">
                                                    <li class="option_item">
                                                        <span class="text">수량 : </span><span class="val">${details.orderCount}</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="price">

                                            <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${details.orderTotal}" /></span>
                                            <span class="unit">원</span>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="delivery_info">
                                            <span class="delivery_state ">주문접수</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="btn_wrap full">
                                            <button type="button" class="btn_sm btn_line_gray"><span class="text">취소신청</span></button>
                                        </div>
                                    </td>
                                </tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div style="margin-top: 50px;" >
                        <div class="title_wrap title_size_md" >
                            <h2 class="title_heading">배송정보</h2>
                        </div>

                        <div class="tbl_row_wrap" >
                            <table class="tbl_row">
                                <colgroup>
                                    <col style="width: 140px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody >
                                    <tr >
                                        <th scope="row">기본정보</th>
                                        <td>
                                            <div class="address_item no_line">
                                                <div class="address_info_box" >
                                                    <div class="address_person">
                                                        <span class="name"><span >${read.receiverName }</span> / </span>
                                                        <span class="phone_number">${read.receiverTel.substring(0,3)}-${read.receiverTel.substring(3,7)}-${read.receiverTel.substring(7)}</span>
                                                        <button type="button" class="btn_xxs btn_line_gray"><span class="text">변경</span><span class="ico_arw"></span></button>
                                                    </div>
                                                    <div class="address" >
                                                    	[${read.zipCode }] ${read.deliveryAddress}
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                  		<th scope="row" class="has_ip">배송요청사항</th>
                                       	<td>
		                        			<div class="form_info_single" style="display:flex; align-items: center;">
			                            		<span class="default_text">${read.deliveryRequest}</span>
			                            		<a href="/order/delivery/message/${read.dno}">
	                                            	<button type="button" class="btn_ip btn_line_gray">
	                                                	<span class="ico_msg_black"></span>
	                                                	<span class="text fw_medium" style="margin-left: 5px;">배송요청사항 메시지 변경</span>
	                                                </button>
	                                            </a>  
		                        			</div>
		                    			</td>
                                   </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="title_wrap title_size_md" id="settlementInfoTitle">
                        <h2 class="title_heading">결제정보</h2>
                    </div>

                    <div class="payment_info_wrap" id="settlementInfoContents">
                        <div class="payment_info_area">
                            <div class="payment_total_item">
                                <div class="payment_info_box">
                                    <p class="label">주문금액</p>
                                    <div class="right_box">
                                        <span class="price">
                                            <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${read.orderPrice}" /></span>
                                            <span class="unit">원</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <ul class="payment_info_list">
                                <li class="payment_info_item">
                                    <div class="payment_info_box">
                                        <p class="label">상품금액</p>
                                        <div class="right_box">
                                            <span class="price">
                                                <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${read.orderPrice}" /></span>
                                                <span class="unit">원</span>
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="payment_info_area">
                            <div class="payment_total_item">
                                <div class="payment_info_box">
                                    <p class="label">할인/포인트 금액</p>
                                    <div class="right_box">
                                        <span class="price">
                                            <span class="val">0</span>
                                            <span class="unit">원</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <ul class="payment_info_list">
                            </ul>
                        </div>
                        <div class="payment_info_area">
                            <div class="payment_total_item">
                                <div class="payment_info_box">
                                    <p class="label">결제금액</p>
                                    <div class="right_box">
                                        <span class="price">
                                            <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${read.orderPrice}" /></span>
                                            <span class="unit">원</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <ul class="payment_info_list">
                                <li class="payment_info_item">
                                    <div class="payment_info_box">
                                        <p class="label"><span class="fc_black">${read.payment} 결제</span></p>
                                        <div class="right_box">
                                            <span class="price">
                                                <span class="val">
													<span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${read.orderPrice}" /></span>
												</span>
                                                <span class="unit">원</span>
                                            </span>
                                            <span class="payment_method"></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="title_wrap title_size_md">
                        <h2 class="title_heading">적립정보</h2>
                    </div>

                    <div class="payment_info_wrap">
                        <div class="payment_info_area">
                            <div class="payment_total_item">
                                <div class="payment_info_box">
                                    <p class="label">통합포인트 적립 예정</p>
                                    <div class="right_box">
                                        <span class="price">
                                            <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${read.pointEarn}" /></span>
                                            <span class="unit">P</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <ul class="payment_info_list">
                                <li class="payment_info_item">
                                    <div class="payment_info_box">
                                        <p class="label">기본적립</p>
                                        <div class="right_box">

                                            <span class="price">
                                                <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${read.pointEarn}" /></span>
                                                <span class="unit">P</span>
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <ul class="bul_list" style="" data-accumulation-information-zone="">
                        <li class="bul_item_dot font_size_xxs fc_light_gray">적립금은 결제이후 예상적립금이 안내됩니다. 결제 사용금액과 적립시점에 따라 최종적립이 완료 되면 [적립완료]로 안내가 변경됩니다.</li>
                        <li class="bul_item_dot font_size_xxs fc_light_gray">제휴포인트의 경우 적립완료 금액은 각 제휴사페이지에서 확인 가능합니다.</li>
                    </ul>

                    <div class="btn_wrap page_bottom">
                        <a href="/order_list_page" class="btn_lg btn_primary" data-order-list-move-button=""><span class="text">주문/배송 목록</span></a>
                    </div>
                    
                </section>
            </div>
        </main>
		<footer class="footer_wrapper">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>