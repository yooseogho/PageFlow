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
							<input type="text" placeholder="아이디를 입력해주세요">
						</div>
						<div class="login_check_pw">
							<input type="password" placeholder="비밀번호를 입력해주세요">
						</div>
					</div>
					<div class="login_btn_area">
						<button class="login_btn">로그인</button>
					</div>
					<div class="id_pw_info">
						<span class="save-id">
							<input type="checkbox">
							<label for="formSaveId" style="font-size: small;">
								아이디 저장
							</label>
							<a href="/find_id_page" style="font-size: small;">아이디/비밀번호 찾기</a>
						</span>
					</div>
					<div class="login_sns_box">
						예) 네이버 / 카카오 로그인 등등
						* 주의사항 등등
					</div>
					<div class="create_btn_area">
						<button class="create_btn">회원가입</button>
					</div>
					<div class="non_user_btn_area">
						<button class="non_user_btn">비회원 주문조회</button>
					</div>
				</div>
			</section>
		</main>
	</div>
</body>
</html>