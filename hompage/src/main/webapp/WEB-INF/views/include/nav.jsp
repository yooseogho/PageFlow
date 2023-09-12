<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
	<div id="nav_div">
		<div id="rootpage">
			<a href="/page">루트페이지로</a>
		</div>
		<div id="search">
			<input type="search" placeholder="입력....">
		</div>
		<div>
				<button>
					<a href="/cart_page">장바구니</a>
				</button>
				<button>
					<a href="/user_info_page">내정보 보기</a>
				</button>
		</div>
	</div>
	<ul>
		<li>만화</li>
		<li>소설</li>
		<li>중 / 고등용 교재</li>
		<li>어린이용 교재</li>
	</ul>
</body>
</html>



