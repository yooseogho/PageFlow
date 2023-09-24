<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/login.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
		<header>
			<div class="header_inner">
				<a href="/page" class="logo">LogoImage</a>
			</div>
		</header>
		
		<main>
			<section>
				<div class="login_form">
					<div class="login_check">
						<div class="login_check_id">
							<input type="text" placeholder="아이디를 입력해주세요" class="input_check">
						</div>
						<div class="login_check_pw">
							<input type="password" placeholder="비밀번호를 입력해주세요" class="input_check">
						</div>
					</div>
					<div class="login_btn_area">
						<a href="/"><button class="login_btn" >로그인</button></a>
					</div>
					<div class="id_pw_info">
						<span class="save-id">
							<input type="checkbox" class="checkbox">
							아이디 저장
						</span>
						<a href="/member_find_id_page" style="font-size: small;">아이디/비밀번호 찾기</a>
					</div>
					<div class="login_sns_box">
						예) 네이버 / 카카오 로그인 등등
						* 주의사항 등등
					</div>
					<div class="create_btn_area">
						<a href="/member_create_page"><button class="create_btn">회원가입</button></a>
					</div>
					<div class="non_user_btn_area">
						<a href="/non_user_order_list_page"><button class="non_user_btn">비회원 주문조회</button></a>
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