<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/buypage.css">
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
					<h2>구매내역</h2>
				</div>
				<div style="border: 1px solid red; height: 300px;">
					구매도서 목록
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