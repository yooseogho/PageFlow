<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 100px;">
		<h1>안녕하세요.</h1>
		<h1>최고의 도서 쇼핑몰(이 되고싶은) PageFlow 입니다.</h1>
		<br>
		<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요.</p>
		<br>
		<div align="center"
			style="border: 1px solid black; font-family: verdana;">
			<h3 style="color: blue">회원가입 인증 코드 입니다.</h3>
			<div style="font-size: 130%" th:text="${code}"></div>
		</div>
		<br />
	</div>
</body>
</html>