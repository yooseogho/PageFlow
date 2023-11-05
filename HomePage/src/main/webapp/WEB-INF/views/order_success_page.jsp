<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_order_success.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		const v = "${list}";
		console.log(v);
		const d = "${delivery}";
		console.log(d);
		const o = "${order}";
		console.log(o);
	})
</script>
<body>
	<div id="page">
        <header class="header_wrapper">
            <jsp:include page="/WEB-INF/views/include/header.jsp" />
        </header>
        <nav class="nav_wrapper">
        	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
        </nav>
        <main class="container_wrapper">
            <section class="contents_wrap">
                <div class="contents_inner">
                    <div class="cart_body payment">
                        <div class="payment_complete_inner">
                            <div class="payment_complete_header_wrap">주문이 완료되었습니다.</div>
                            <div class="title_wrap payment_complete">
                                <h2 class="title_heading">주문상품</h2>
                            </div>

                            <div class="fold_box_wrap type_box" data-type="multi">
                                <ul class="fold_box_list">
									<c:forEach items="${list}" var="list">                                
                                    <li class="fold_box expanded">
                                        <div class="fold_box_contents">
                                            <div class="tbl_prod_wrap ordering">
                                                <table class="tbl_prod">
                                                    <colgroup>
                                                        <col>
                                                        <col style="width: 150px;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <td class="prod">
                                                                <div class="prod_area horizontal">
                                                                    <div class="prod_thumb_box size_sm">
                                                                        <a href="/book/read?bno=${list.bno}" class="prod_link">
                                                                            <span class="img_box">
                                                                                <img src="${list.bookImage}" alt="${list.bookTitle}">
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                    <div class="prod_info_box size_sm">
                                                                        <span class="prod_info">
                                                                            <span class="prod_name">[국내도서] ${list.bookTitle}</span>
                                                                        </span>
                                                                        <div class="prod_price">
                                                                            <span class="price">
                                                                                <span class="val">${list.orderTotal}</span>
                                                                                <span class="unit">원</span>
                                                                            </span>
                                                                            <span class="count">/ ${list.orderCount}개</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="badge_box">
                                                                    <span class="badge_sm badge_pill badge_primary_ord">
                                                                        <span class="text">FageFlow 배송</span>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>

                            <div class="title_wrap payment_complete">
                                <h2 class="title_heading">결제정보</h2>
                            </div>

                            <div class="payment_box_wrap">
                                <div class="payment_body_wrap">
                                    <div class="tbl_row_wrap">
                                        <table class="tbl_row">
                                            <colgroup>
                                                <col style="width: 160px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">주문금액</th>
                                                    <td>
                                                        <div class="payment_complete_price_box">
                                                            <span class="price">
                                                                <span class="val" data-payment-order-amt="">
                                                                	<fmt:formatNumber type="number" pattern="#,##0" value="${order.orderPrice}"></fmt:formatNumber>
                                                                </span>
                                                                <span class="unit">원</span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">할인금액</th>
                                                    <td>
                                                        <div class="payment_complete_price_box">
                                                            <span class="price">
                                                                <span class="val">0</span>
                                                                <span class="unit">원</span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th scope="row">최종결제금액</th>
                                                    <td>
                                                        <div class="payment_complete_price_box">
                                                            <span class="price total">
                                                                <span class="val">
                                                                	<fmt:formatNumber type="number" pattern="#,##0" value="${order.orderPrice}"></fmt:formatNumber>
                                                                </span>
                                                                <span class="unit">원</span>
                                                            </span>
                                                            
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">결제정보</th>
                                                    <td>
                                                        <div class="payment_complete_price_box">
                                                            <span class="price_method">${order.payment}</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>	
                            </div>

                            <div class="title_wrap payment_complete">
                                <h2 class="title_heading">배송지 정보</h2>
                            </div>

                            <div class="payment_box_wrap">
                                <div class="payment_body_wrap">
                                    <div class="tbl_row_wrap">
                                        <table class="tbl_row">
                                            <colgroup>
                                                <col style="width: 160px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">받는 사람</th>
                                                    <td>
                                                        <div class="person_info">
                                                            <span class="name">${delivery.receiverName}</span>
                                                            <span class="gap">/</span>
                                                            <span class="phone_number">
                                                            	${delivery.receiverTel.substring(0,3)}-${delivery.receiverTel.substring(3,7)}-${delivery.receiverTel.substring(7)}
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">받는 주소</th>
                                                    <td >[${delivery.zipCode}] ${delivery.deliveryAddress}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">배송요청사항</th>
                                                    <td> ${delivery.deliveryRequest} </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn_wrap page_bottom">
                            <button type="button" class="btn_lg btn_line_primary" onclick="location.href=`/page`" style="cursor: pointer;">
                                <span class="text">쇼핑 계속</span>
                            </button>
                            <button type="button" class="btn_lg btn_primary" data-complete-order-detail-link-button="" value="001" onclick="location.href='/order/list'" style="cursor: pointer;">
                                <span class="text">주문내역상세</span>
                            </button>
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