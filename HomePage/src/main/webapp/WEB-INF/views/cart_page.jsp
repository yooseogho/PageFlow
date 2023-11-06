<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/cart.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/script/cart.js"></script>
<title>Insert title here</title>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginId"/>
</sec:authorize>
<script>
$(document).ready(function(){

    // 체크된 체크박스를 순회하고 AJAX 요청을 보내는 함수
    function sendAjaxIfChecked(onSuccess) {
        const cno = $("input[name='chkList']");
        const cnos = [];
        for(const element of cno) {
            const $element = $(element);
            if($element.prop('checked')) {
                cnos.push($element.val());
            }
        }
        console.log(cnos);

        // 체크된 cno 값들을 로컬 스토리지에 저장
        localStorage.setItem('cnos', JSON.stringify(cnos));

        // 체크된 체크박스가 있다면 AJAX 요청 보내기
        if (cnos.length > 0) {
            const formData = new FormData();
            formData.append('cnos', cnos);

            $.ajax({
                url: '/cart/select',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: onSuccess
            });
        }
    }

    // '전체' 라벨 클릭 이벤트
    $("#chkCartSelectAll").click(function() {
        // 라벨이 체크되어 있으면 모든 체크박스 체크, 아니면 체크 해제
        const isChecked = $(this).prop('checked');
        $("input[name='chkList']").prop('checked', isChecked);
        sendAjaxIfChecked();
    });

    // 체크박스 상태 변경 이벤트
    $("input[name='chkList']").change(function() {
        sendAjaxIfChecked();
    });

    // 'order_button' 클릭 이벤트
    $('#order_button').click(function() {
        sendAjaxIfChecked(function(data) {
            // AJAX 요청이 성공적으로 완료된 후 페이지 이동
        	window.location.href = "/order";
        });
    });

    // 페이지 로딩 완료 후 체크된 체크박스를 순회하고 AJAX 요청 보내기
    sendAjaxIfChecked();
});


</script>
</head>
<body>
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
                        <div class="cart_title_box has_order_type">
                            <div class="title_wrap title_size_lg" data-cart-totalcnt>
                                <h1 class="title_heading" id='totalCnt'>장바구니(${count})</h1>
                                
                                <div class="right_area">
                                    <ol class="step_round_text_list">
                                        <li class="step_item active"><span class="step_num">1</span>장바구니</li>
                                        <li class="step_item"><span class="step_num">2</span>주문/결제</li>
                                        <li class="step_item"><span class="step_num">3</span>주문완료</li>
                                    </ol>
                                </div>
                            </div>
                        </div>

                        <div class="util_btn_box">
                            <div class="left_area">
                                <span class="form_chk">
                                    <input id="chkCartSelectAll" type="checkbox" checked>
                                    <label for="chkCartSelectAll">전체</label>
                                </span>
                            </div>
                            <div class="right_area">
                                <button type="button" class="btn_delete"><span class="ico_delete"></span><span class="hidden">삭제</span></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cart_body">
                    <div class="cart_body_inner">
                        <div class="fold_box_wrap type_order">
                            <ul class="fold_box_list">
                                <!-- 상품 리스트-->
                                <li class="tab_content fold_box sps sps-abv expanded">
                                    <div class="fold_box_contents">
                                        <div class="tbl_prod_wrap">
                                            <table class="tbl_prod">
                                                <colgroup>
                                                    <col style="width: 42px;">
                                                    <col>
                                                    <col style="width: 140px;">
                                                    <col style="width: 222px;">
                                                </colgroup>
                                                <thead class="hidden">
                                                    <tr>
                                                        <th scope="col">상품선택</th>
                                                        <th scope="col">상품정보</th>
                                                        <th scope="col">금액, 수량</th>
                                                        <th scope="col">배송정보</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:choose>
	                                           	    <c:when test ="${not empty cartList}">
	                                                	<c:forEach var="cartList" items="${cartList}">
		                                                    <tr>
		                                                        <td class="only_chk">
		                                                            <span class="form_chk no_label">
		                                                                <input name="chkList" id="${cartList.cno}" type="checkbox" checked value="${cartList.cno}">
		                                                                <label for="${cartList.cno}">상품 선택</label>
		                                                            </span>
		                                                        </td>
		                                                        <td class="prod">
		                                                            <div class="prod_area horizontal">
		                                                                <div class="prod_thumb_box size_sm ">
		                                                                    <a href="/book/read?bno=${cartList.bno}" class="prod_link">
		                                                                        <span class="img_box">
		                                                                            <img src="${cartList.bookImage}" alt="국내도서도시와 그 불확실한 벽">
		                                                                        </span>
		                                                                    </a>
		
		                                                                </div>
		                                                                <div class="prod_info_box size_sm">
		                                                                    <a href="/book/read?bno=${cartList.bno}" class="prod_link">
		                                                                        <span class="prod_name">[국내도서] ${cartList.bookTitle}</span>
		                                                                    </a>
		                                                                    <div class="prod_price">
		                                                                        <span class="price">
		                                                                            <span class="val" id="priceValNaN">
		                                                                            	<fmt:formatNumber type="number" pattern="#,##0" value="${cartList.bookPrice }" />
		                                                                            </span>
		                                                                            <span class="unit">원</span>
		                                                                        </span>
		                                                                        <span class="unit"> (</span>
		                                                                        <span class="point" id="point${cartList.cno}">
		                                                                        <fmt:formatNumber type="number" pattern="#,##0" value="${cartList.pointEarnings }" />
																				</span>
																				<span class="unit"> P)</span>
		                                                                    </div>
		
		                                                                </div>
		                                                            </div>
		                                                        </td>
		                                                        <td id="price${cartList.cno}">
		                                                            <span class="price">
		                                                                <span class="val" id="amount${cartList.cno}"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList.amount}" /></span>
		                                                                <span class="unit">원</span>
		                                                            </span>
		                                                            <div class="form_spinner_box size_sm">
		                                                                <span class="ui-spinner ui-widget ui-widget-content ui-corner-all ui-spinner-right">
		                                                                    <button class="decrease ui-spinner-button ui-spinner-down ui-corner-br ui-button ui-widget dec" data-bno="${cartList.bno}" data-cno="${cartList.cno}">
		                                                                    	<span class="offscreen ui-icon ui-icon-triangle-1-s">상품 수량 한 개 줄이기</span>
		                                                                    </button>
		                                                                    <input type="number" id="prdNum${cartList.cno}" value="${cartList.cartCount}" class="form_spinner ui-spinner-input" title="수량" autocomplete="off">
		                                                                    <button class="increase ui-spinner-button ui-spinner-up ui-corner-tr ui-button ui-widget inc" data-bno="${cartList.bno}" data-cno="${cartList.cno}">
		                                                                    	<span class="offscreen ui-icon ui-icon-triangle-1-n">상품 수량 한 개 늘리기</span>
		                                                                    </button>
		                                                                </span>
		                                                            </div>
		                                                        </td>
		                                                        <td>
		                                                            <div class="delivery_info">
		                                                                <div class="info_inner" data-all-cart-list="">
		                                                                    <span class="badge_sm badge_pill badge_primary_ord"><span class="text">택배배송</span></span>
		                                                                    <p class="delivery_desc">
		                                                                        <span id="arrivalDate${cartList.cno}" class="fw_bold"><strong class="blue"></strong></span>
		                                                                    </p>
		                                                                </div>
																		<script>
																		var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
																		var cartList = '${cartList}';
																		for (var i = 0; i < cartList.length; i++) {
																		    var now = new Date();
																		    now.setDate(now.getDate() + 3);
																		    var year = now.getFullYear();
																		    var month = now.getMonth() + 1;
																		    var date = now.getDate();
																		    var day = dayNames[now.getDay()];
																		    var message = "(" + month + "/" + date + "," + day + ") 도착 예정";
																		    document.getElementById('arrivalDate${cartList.cno}').innerHTML = '<strong class="blue">' + message + '</strong>';
																		}
																		</script>
		                                                            </div>
		                                                            <button type="button" class="btn_delete_ord" data-cnos="${cartList.cno}"><span class="hidden">장바구니 삭제</span></button>
		                                                        </td>
		                                                    </tr>
														</c:forEach>
													</c:when>
		                                          <c:otherwise>
		                                          	<div class="no_data size_sm">
                            							<div class="no_data_desc">장바구니에 담긴 상품이 없어요.</div>
                        							</div>
		                                          </c:otherwise>
		                                          </c:choose>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="fold_box_wrap type_info_text">
                            <div class="fold_box expanded">
                                <div class="fold_box_header">장바구니 유의사항</div>
                                <div class="fold_box_contents">
                                    <ul class="bul_list">
                                        <li class="bul_item_dot font_size_xxs">택배 배송일정은 기본배송지 기준으로 예상일이 노출됩니다.</li>
                                        <li class="bul_item_dot font_size_xxs">배송지 수정시 예상일이 변경 될 수 있으며, 주문서에서 배송일정을 꼭 확인하시기 바랍니다.</li>
                                        <li class="bul_item_dot font_size_xxs">바로드림의 수령가능일은 나의 기본매장 기준으로 노출됩니다.</li>
                                        <li class="bul_item_dot font_size_xxs">쿠폰, 통합포인트, 교환권 사용시 적립예정포인트가 변동 될 수 있습니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="cart_info_wrap">
                        <div class="payments_info_area">
                            <div class="payments_info_box">
                                <ul class="payments_info_list">
                                    <li class="payments_info_item">
                                        <p class="label">상품금액</p>
                                        <div class="right_box">
                                            <span class="price">
                                                <c:if test="${not empty cartList}">
                                                	<span class="val" id="totalPrice"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList[cartList.size()- 1].totalAmount}" /></span>
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
                                </ul>
                            </div>
                            <div class="payments_info_box">
                                <ul class="payments_info_list">
                                    <li class="payments_info_item total">
                                        <p class="label">결제 예정 금액</p>
                                        <div class="right_box">
                                            <span class="price">
                                            <c:if test="${not empty cartList}">
                                                <span class="val" id="totalprice"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList[cartList.size()- 1].totalAmount}" /></span>
                                                <span class="unit">원</span>
                                            </c:if>
                                            </span>
                                        </div>
                                    </li>
                                    <li class="payments_info_item point">
                                        <p class="label">적립예정 포인트</p>
                                        <div class="right_box">
                                            <span class="price">
                                                <c:if test="${not empty cartList}">
                                                <span class="val" id="totalPointEarnings"><fmt:formatNumber type="number" pattern="#,##0" value="${cartList[cartList.size()- 1].totalPointEarnings}" /></span>
                                                <span class="unit">P</span>
                                            </c:if>
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn_wrap full">
                                <button id="order_button" class="btn_lg btn_primary"><span class="text">주문하기 (<span id="cart_count_val"></span>)</span></button>
                            </div>
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
