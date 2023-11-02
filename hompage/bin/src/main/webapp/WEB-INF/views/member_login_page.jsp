<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>로그인</title>
<script src="script/login.js"></script>

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
					<form action="/member_login_page" method="post">
						<div class="login_check">
							<div class="login_check_id">
								<input type="text" name="memberId" placeholder="아이디를 입력해주세요"
									class="input_check">
							</div>
							<div class="login_check_pw">
								<input type="password" name="password"
									placeholder="비밀번호를 입력해주세요" class="input_check">
							</div>
						</div>
						<span id="login-msg"></span><br>
							<span id="login-msg1"></span>
						<div class="login_btn_area">
							<button type=submit class="login_btn" id="login">로그인</button>
						</div>
					</form>
					<div class="id_pw_info">
						<span class="save-id"> <input type="checkbox"
							class="checkbox"> 아이디 저장
						</span> <a href="/member_find_id_page" style="font-size: small;">아이디/비밀번호찾기</a>
					</div>
					<div class="login_sns_box">예) 네이버 / 카카오 로그인 등등 * 주의사항 등등</div>
					<div class="create_btn_area">
						<a href="/member_create_page"><button class="create_btn">회원가입</button></a>
					</div>
					<div class="non_user_btn_area">
						<a href="/non_user_order_list_page"><button
								class="non_user_btn">비회원 주문조회</button></a>
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