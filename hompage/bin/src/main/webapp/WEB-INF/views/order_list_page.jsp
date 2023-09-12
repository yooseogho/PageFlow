<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/orderlist.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav>
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>
		<main>
		<aside>
			<jsp:include page="/WEB-INF/views/include/left_aside.jsp" />
		</aside>
			<section>
				<div id="title">
					<h2>주문/배송목록</h2>
					<button>상세조회</button>
				</div>
				<div id="order_history">
					<div id="history_val"><span style="line-height: 70px;">주문내역</span></div>
					<div class="history_box">
						<button>준비중</button>
					</div>
					<div class="history_box">
						<button>배송중</button>
					</div>
					<div class="history_box">
						<button>배송완료</button>
					</div>
					<div class="history_box">
						<button>취소</button>
					</div>
					<div class="history_box">
						<button>교환/반품</button>
					</div>
				</div>
				<div style="border: 1px solid red; height: 300px;">
					도서 목록
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