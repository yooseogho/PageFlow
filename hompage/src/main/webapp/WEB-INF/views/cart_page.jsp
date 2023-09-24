<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/cart.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
        <header class="header_wrapper">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav class="nav_wrapper">
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>

        <main>
            <section class="section">
                <div class="contents_inner">
                    <div class="inner_top" style="font-size: large; font-weight: bold;">
                        <p class="inner_top_title">장바구니</p>
                    </div>
                    <div class="order_inner_payment">
                        <div class="payment_left">
                            <div class="product_info_area">
                                <div class="product_info_header">
                                    <div class="table_head_area">
                                        <table class="table_head">
                                            <colgroup class="colgroup">
                                                <col style="width: 210px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">장바구니 (총개수)</th>
                                                    <td>
                                                        <div class="order_count">
                                                            <span class="label">총</span>
                                                            <span class="count">1 <span class="order_unit">개</span></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="product_info_middle">
                                    <table class="table_middle">
                                        <colgroup class="colgroup">
                                            <col>
                                            <col style="width: 150px;">
                                            <col style="width: 100px;">
                                            <col style="width: 148px;">
                                        </colgroup>
                                        <thead class="title">
                                            <tr>
                                                <th scope="col">상품정보</th>
                                                <th scope="col">수량</th>
                                                <th scope="col">금액</th>
                                                <th scope="col">배송방법</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product">
                                                    <div class="product_area">
                                                        <div class="product_img">
                                                            이미지
                                                        </div>
                                                        <div class="product_title">
                                                            <span class="product_name">책 제목</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="product_td"><span class="product_num">x개</span></td>
                                                <td class="product_td">
                                                    <span class="product_price">
                                                        <span class="product_val">xxx</span>
                                                        <span class="unit">원</span>
                                                    </span>
                                                </td>
                                                <td class="product_td">
                                                    <div class="product_delivery_way"><span>PageFlow 배송</span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="cart_caution_area">
                                <div class="cart_caution_header">
                                    장바구니 유의사항
                                </div>
                                <div class="cart_caution_body">
                                    <ul class="cart_caution_list">
                                        <li class="cart_caution_items"><span class="cart_caution_text">택배 배송일정은 기본배송지 기준으로 예상일이 노출됩니다.</span></li>
                                        <li class="cart_caution_items"><span class="cart_caution_text">상품별 배송일정이 서로 다를시 가장 늦은 일정의 상품 기준으로 모두 함께 배송됩니다.</span></li>
                                        <li class="cart_caution_items"><span class="cart_caution_text">배송지 수정시 예상일이 변경 될 수 있으며, 주문서에서 배송일정을 꼭 확인하시기 바랍니다.</span></li>
                                        <li class="cart_caution_items"><span class="cart_caution_text">포인트 사용시 적립예정포인트가 변동 될 수 있습니다.</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="payment_right">
                            <div class="payment_info_area">
                                <div class="payment_info_box">
                                    <ul style="list-style-type: none;">
                                        <li>
                                            <p class="label">상품금액</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="label">배송비</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="payment_last_box">
                                    <ul style="list-style-type: none;">
                                        <li>
                                            <p class="label">결제 예정 금액</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="label">적립예정포인트</p>
                                            <div class="label_right">
                                                <span class="price">
                                                    <span>xxx</span>
                                                    <span class="unit"> P</span>
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="payment_btn_area">
                                    <a href="/order_page"><button class="payment_btn"><span class="btn_text">주문하기 (총개수)</span></button></a>
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