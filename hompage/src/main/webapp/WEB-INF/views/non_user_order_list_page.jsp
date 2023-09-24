<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/non_user_order_list.css">
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
					<div class="form-box">
						<div class="form-name">
							<span class="form_span_name">주문자명</span>
							<input type="text" placeholder="주문자명을 입력해주세요" class="input_check">
						</div>
						
						<ul class="check_list">
							<li class="check_item">
								<span class="check-radio">
									<input type="radio" id="radioTypeEmail" name="radioType">
									<label for="radioTypeEmail">이메일</label>
								</span>
							</li>
							<li class="check_item">
								<span class="check-radio">
									<input type="radio" id="radioTypePhone" name="radioType">
									<label for="radioTypePhone">휴대폰 번호</label>
								</span>
							</li>
						</ul>
						
						<div class="form_check_group">
							<div class="email_check">
								<input type="email" placeholder="이메일을 입력해주세요" class="input_check">
							</div>
						</div>
						
						<div class="form_check_group">
							<span>비밀번호</span>
							<input type="password" placeholder="비밀번호를 입력해주세요" class="input_check">
						</div>
						</div>
					<div class="check_btn_area">
						<a href="/"><button class="check_btn" >확인</button></a>
					</div>
					
					<hr>
					
					<div class="create_question">
						<p style="text-align: center;">회원가입을 하시겠습니까?</p>
						<p style="font-size: small; text-align: center; ">회원가입 하고 PageFlow의 다양한 혜택을 누려보세요.</p>
					</div>
					
					<div class="create_btn_area">
						<a href="/member_create_page"><button class="create_btn">회원가입</button></a>
					</div>
					
				</div>
			</section>
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/include/copy_right_footer.jsp" />
		</footer>
	</div>
</body>
</html>