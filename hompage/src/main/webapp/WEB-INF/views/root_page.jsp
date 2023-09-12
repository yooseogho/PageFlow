<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/page.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
		<header>
			<div id="logo">
				<p id="p_logo">ImageLogo</p>
			</div>
			
			<div id="h_button">	
				<button class="h_button"><a href="/member_create_page">회원가입</a></button>
				<button class="h_button"><a href="/login_page">로그인</a></button>
				<button class="h_button"><a href="/customer_service_page">고객센터</a></button>
			</div>		
		</header>
		<nav>
			<div id="nav_div">
				<div id="rootpage">
					<a href="/page">루트페이지로</a>
				</div>
				
				<div id="search">
					<input type="search" placeholder="입력....">
				</div>
				<div>
					<div>
						<button><a href="/cart_page">장바구니</a></button>
						<button><a href="/user_info_page">내정보 보기</a></button>
					</div>
				</div>
			</div>
			<ul>
				<li>만화</li>
				<li>소설</li>
				<li>중 / 고등용 교재</li>
				<li>어린이용 교재</li>
			</ul>
		</nav>
		<main>
			<aside></aside>
			<section>
				<p>판매 관련</p>
			</section>
			<aside></aside>		
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>