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
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function() {
	// 신규회원이 배송지 입력 버튼을 클릭했을 때
	$('#popup_btn').on('click', function() {
		$('#addressList').css('display','block');
	});
	
	// 배송지 목록에서 닫기 버튼을 눌렀을 때
	$('#address_popup_list_close').on('click', function(){
		$('#addressList').css('display','none');
		location.href=`/order`;
	})
	
	// 배송지 추가란에서 배송지 추가 버튼을 눌렀을 때
	$('#address_add_btn').on('click', function() {
		 $('#addressAdd').css('display','flex');
	})
	
	// 배송지 추가란에서 닫기 버튼을 눌렀을 때
	$('#address_popup_add_close').on('click',function(){
		$('#addressAdd').css('display','none');
	})
	
})
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
                                    <h1 class="title_heading">배송 목록</h1>
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
												<tr>
													<th scope="row">배송지 정보</th>
                                                    <td>
								                       <div class="address_item no_line" data-delivery-point-address-info="default-addr-message">
								                          <div class="address_info_box">
								                             
								                          </div>
								                       </div>
								                      
								                        <div class="btn_wrap full">
								                            <button type="button" class="btn_ip btn_line_gray" id="popup_btn"><span class="ico_write_black"></span><span class="text fw_medium">배송지 입력</span></button>
								                        </div>
								                    </td>
												</tr>
                                               

                                                <tr>
                                                    <th scope="row" class="has_ip">배송요청사항</th>
                                                    <td>
                                                        <div class="btn_wrap full">
                                                            <button type="button" class="btn_ip btn_line_gray">
                                                                <span class="ico_msg_black"></span>
                                                                <span class="text fw_medium">배송요청사항 메시지</span>
                                                            </button>
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
                                                        <span class="fc_payment_blue">
                                                            <strong class="blue">내일(10/28,토) 도착예정</strong>
                                                        </span>
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
                                                        <span class="val fc_spot" data-cash-voucher="total-have">0</span>
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
                                                                    <label for="rowTblIpPoint01_01">통합포인트</label>
                                                                </th>
                                                                <td>
                                                                    <div class="number_value_box size_def">
                                                                        <span class="point">
                                                                            <span class="val fc_spot">0</span>
                                                                            <span class="unit">원</span>
                                                                        </span>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="input_btn_price_box">
                                                                        <div class="input_price_box">
                                                                            <input type="number" id="rowTblIpPoint01_01" class="form_ip numericOnly">
                                                                            <span class="unit">원</span>
                                                                        </div>
                                                                        <button type="button" class="btn_ip btn_line_primary"><span class="text">전액사용</span></button>
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

                                            <a href="javascript:void(0);" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="text">신용카드</span>
                                            </a>

                                            <a href="javascript:void(0);" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="ico_payment_kbpay"><span class="hidden">KB페이</span></span>
                                            </a>

                                            <a href="javascript:void(0);" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="ico_payment_npay"><span class="hidden">네이버페이</span></span>
                                            </a>

                                            <a href="javascript:void(0);" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="ico_payment_kakaopay"><span class="hidden">카카오페이</span></span>
                                            </a>

                                            <a href="javascript:void(0);" class="btn_xl btn_line_gray btn_payment_etc">
                                                <span class="ico_payment_toss"><span class="hidden">토스페이</span></span>
                                            </a>
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
                                                    <span class="val">0</span>
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
	                                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList[cartList.size()- 1].totalAmount}" /></span>
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
                                    <button type="button" class="btn_lg btn_primary">
                                        <span class="text">결제하기</span>
                                    </button>
                                </div>
                            </div>
                            <div class="payment_order_agree_wrap">
                                <span class="text">위 주문내용을 확인하였으며, 결제에 동의합니다.</span>
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
    <!-- 배송지 목록 -->
    <div id="addressList" class="dialog_wrapper open" style="top: 0px; z-index: 1001;">
        <jsp:include page="/WEB-INF/views/include/order_address_popup_list.jsp" />
    </div>
    
    <!-- 배송지 추가 -->
    <div id="addressAdd" class="dialog_wrapper open" style="top: 0px; z-index: 1003; display:none;">
        <jsp:include page="/WEB-INF/views/include/order_address_popup_add.jsp" />
    </div>
</body>
</html>