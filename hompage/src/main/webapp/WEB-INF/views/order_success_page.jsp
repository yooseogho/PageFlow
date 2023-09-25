<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_order_success.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
        <header>
            <div id="rootpage">
                <a href="/page">루트페이지로</a>
            </div>

            <div id="search">
                <input type="search" placeholder="입력....">
            </div>

            <div class="h_button_area">
                <a href="/cart_page"><button class="h_button">장바구니</button></a>
                <a href="/user_info_page"><button class="h_button">내정보 보기</button></a>
                <button class="h_button">로그아웃</button>
                <a href="/customer_service_page"><button class="h_button">고객센터</button></a>
            </div>
        </header>
        <main class="container_wrapper">
            <section class="contents_wrap">
                <div class="contents_inner">
                    <div class="cart_body payment">
                        <div class="payment_complete_inner">

                            <div class="payment_complete_header_wrap">
                                주문이 완료되었습니다.<br>
                                <span>주문번호 <span class="count">[주문번호]</span></span>
                            </div>

                            <div class="round_blue_box" data-online-box="">
                                <div class="box_title_group">
                                    <p class="text bank_info">
                                        입금계좌 : <span class="bank_account">xx은행 [계좌 번호]</span>
                                    </p>
                                    <p class="text desc">
                                        10일 이내 입금이 되지 않을 경우 주문이 자동취소됩니다.
                                    </p>
                                </div>
                            </div>

                            <div class="title_wrap payment_complete">
                                <h2 class="title_heading">주문상품</h2>
                            </div>

                            <div class="fold_box_wrap type_box" data-type="multi">
                                <ul class="fold_box_list">
                                    <li class="fold_box expanded">
                                        <div class="fold_box_header size_xs">
                                            <span class="header_text">
                                                <span class="title"><span>비밀의 보석 가게 마석관 4</span>
                                                    (총 상품 <span class="count" data-product-total-cnt="">1</span>개)</span>
                                            </span>
                                        </div>
                                        <div class="fold_box_contents">
                                            <div class="tbl_prod_wrap ordering">
                                                <table class="tbl_prod">
                                                    <colgroup>
                                                        <col>
                                                        <col style="width: 150px;">
                                                    </colgroup>
                                                    <tbody data-product-list="">
                                                        <tr>
                                                            <td class="prod">
                                                                <div class="prod_area horizontal">
                                                                    <div class="prod_thumb_box size_sm">
                                                                        <a target="_blank" href="https://product.kyobobook.co.kr/detail/S000209079614" class="prod_link">
                                                                            <span class="img_box">
                                                                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/82x120/pdt/9791164065608.jpg" alt="비밀의 보석 가게 마석관 4">
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                    <div class="prod_info_box size_sm">
                                                                        <span class="prod_info">
                                                                            <span class="prod_name">[국내도서] 비밀의 보석 가게 마석관 4</span>
                                                                        </span>
                                                                        <div class="prod_price">
                                                                            <span class="price">
                                                                                <span class="val">11,700</span>
                                                                                <span class="unit">원</span>
                                                                            </span>
                                                                            <span class="count">/ 1개</span>
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
                                                                <span class="val" data-payment-order-amt="">14,200</span>
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
                                                                <span class="val" data-payment-discount-amt="">0</span>
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
                                                                <span class="val" data-payment-amt="">14,200</span>
                                                                <span class="unit">원</span>
                                                            </span>
                                                            <span class="price_method fc_red" data-payment-method="">온라인입금 (입금대기)</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="title_wrap payment_complete" order-complete-multi-delivery-title="">
                                <h2 class="title_heading">배송지 정보</h2>
                            </div>

                            <div class="payment_box_wrap" order-complete-multi-delivery-list="">
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
                                                            <span class="name" data-delivery-recv-name="">원승언</span>
                                                            <span class="gap">/</span>
                                                            <span class="phone_number" data-delivery-recv-phone="">010-2572-4233</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">받는 주소</th>
                                                    <td data-delivery-recv-address="">[14921] 경기도 시흥시 수인로3247번길 112(은행동, 새천년빌라) 402호</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">배송요청사항</th>
                                                    <td data-delivery-message="">문 앞에 놔주세요
                                                    </td>
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
                            <button type="button" class="btn_lg btn_primary" data-complete-order-detail-link-button="" value="001" onclick="location.href='/order_list_page'" style="cursor: pointer;">
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