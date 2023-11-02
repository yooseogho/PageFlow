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
		<header>
			<div id="rootpage">
				<a href="/page">루트페이지로</a>
			</div>
			
			<div id="search">
				<input type="search" placeholder="입력....">
			</div>
			
			<div id="h_button">	
				<button class="h_button"><a href="/cart_page">장바구니</a></button>
				<button class="h_button"><a href="/user_info_page">내정보 보기</a></button>
				<button class="h_button">로그아웃</button>
				<button class="h_button">고객센터</button>
			</div>		
		</header>
		
		<main>
			<aside></aside>
			<section>
				<div style="font-size: large; font-weight: bold;">장바구니</div>
				<div id="cart_body">
					<div id="cart_body_inner">
						<div id="cart_inner_list">
							<p>책 구매 목록</p>
						</div>
					</div>	
				
					<div id="cart_info">
						<div id="payment_info">
							<div class="payment_info_box">
								<ul style="list-style-type: none;">
									<li><p>상품금액</p></li>
									<li><p>배송비</p></li>
								</ul>
							</div>
							<hr>
							<div class="payment_info_box">
								<ul style="list-style-type: none;">
									<li><p>결제 예정 금액</p></li>
									<li><p>적립 예정 포인트</p></li>
								</ul>
							</div>
							<button id="order">주문하기</button>
						</div>
					</div>
				</div>
			</section>
			<aside></aside>			
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>