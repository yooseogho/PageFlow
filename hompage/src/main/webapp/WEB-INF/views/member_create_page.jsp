<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_create.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
<script src="/script/join.js"></script>

<style>
#memberTel-msg.true, #checkPassword-msg.true, #memberName-msg.true,
	#memberId-msg.true, #password-msg.true, #email-msg.true, #birthday-msg.true
	{
	color: green;
}

#memberTel-msg.fail, #checkPassword-msg.fail, #memberName-msg.fail,
	#memberId-msg.fail, #password-msg.fail, #email-msg.fail, #birthday-msg.fail
	{
	color: red;
}

.small-text {
	font-size: 12px;
}
</style>
</head>
<body>
	<div id="page">
		<header>
			<div class="header_inner">
				<a href="/page" class="logo">LogoImage</a>
			</div>
		</header>

		<main class="container_wrapper">

			<section class="contents_wrap">
				<form action="/member_create_page" method="post" id="join-form">
					<div class="title_wrap title_size_md has_line">
						<p class="title_heading">회원가입</p>
					</div>
					<div class="title_wrap title_size_def">
						<h2 class="title_heading">회원정보 입력</h2>
						<div class="right_area">
							<span class="required"> <span class="text">필수 입력</span>
							</span>
						</div>
					</div>
					<div class="form_wrap">
						<div id="join_form_insert">

							<div class="form_box">
								<div class="form_title">
									<label for="formJoin01" class="form_label"> 아이디 <span
										class="required"> <span class="hidden">필수입력</span>
									</span>
									</label>
								</div>


								<div class="form_cont">
									<div class="valid_check">
										<div class="awesomplete">
											<input type="text" class="form_ip" id="memberId"
												placeholder="아이디를 입력해 주세요." maxlength="50"
												data-autocomplete="" autocomplete="off"
												aria-expanded="false" name="memberId"
												aria-owns="awesomplete_list_1" role="combobox">
										</div>
										<span id="memberId-msg" class="small-text"></span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="form_box">
						<div class="form_title">
							<label for="formJoin02" class="form_label"> 비밀번호 <span
								class="required"> <span class="hidden">필수입력</span>
							</span>
							</label>
						</div>

						<div class="form_cont">
							<div class="form_ip_pw">
								<input type="password" class="form_ip" name="password"
									placeholder="비밀번호를 입력해 주세요." id="password" maxlength="15">
								<button type="button" class="btn_toggle_pw" id="password_icon"></button>
								<span id='password-msg' class="small-text"></span>
							</div>
							<div class="pw_valid_wrap">

								<ul class="pw_valid_list">
									<li class="pw_valid_item">영문, 숫자, 특수문자 3가지 조합 8자리 이상 <br>
									</li>
									<li class="pw_valid_item">공백 및 3자 이상의 연속 또는 중복 문자는 사용 불가</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="form_box">
						<div class="form_title">
							<label for="formJoin03" class="form_label"> 비밀번호 확인 <span
								class="required"> <span class="hidden">필수입력</span>
							</span>
							</label>
						</div>

						<div class="form_cont">
							<div class="valid_check">
								<div class="form_ip_pw">
									<input type="password" class="form_ip" name="confirmPassword"
										placeholder="비밀번호를 한 번 더 입력해 주세요." id="checkPassword"
										maxlength="15">
									<button type="button" class="btn_toggle_pw" id="password_icon1"></button>
								</div>
								<span id='checkPassword-msg'></span>
							</div>
						</div>
					</div>

					<div class="form_box">
						<div class="form_title">
							<label for="formJoin04" class="form_label"> 이름 <span
								class="required"> <span class="hidden">필수입력</span>
							</span>
							</label>
						</div>

						<div class="form_cont">
							<div class="valid_check success">
								<input type="text" class="form_ip" id="memberName"
									name="memberName" placeholder="이름을 입력해 주세요.">
							</div>
							<span id='memberName-msg' class="small-text"></span>
						</div>
					</div>
					<div class="form_box">
						<div class="form_title">
							<label for="formJoin07" class="form_label"> 휴대폰번호 <span
								class="required"> <span class="hidden">필수입력</span>
							</span>
							</label>
						</div>
					</div>
					<div class="form_cont">
						<div class="form_col_group">
							<div class="col_box">
								<div class="valid_check">
									<div class="input_btn_box">
										<input type="text" maxlength="13" id="memberTel"
											class="form_ip" placeholder="숫자만 입력해 주세요." name="memberTel">

										<button type="button" class="btn_ip btn_light_gray"
											style="display: none;">

											<span class="text">인증번호 발송</span>
										</button>
									</div>
									<span id='memberTel-msg' class="small-text"></span>
								</div>
							</div>

							<!-- 이메일 부분 -->

							<div class="form_box">
								<div class="form_title">
									<label for="formJoin08" class="form_label"> 이메일 <span
										class="required"> <span class="hidden">필수입력</span>
									</span>
									</label>
									<!-- 이메일 입력란(#memberEmail로 호출) -->
									<input type="email" name="memberEmail" id="memberEmail" value="${email}" disabled>
								</div>

								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check success">
												<div class="input_btn_box">
													<!-- 인증번호 발송 부분 -->
													<button type="button" data-email="formJoin08"
														class="btn_ip btn_primary"
														onclick="location.href='mail_code_check_page'"
														id="sendEmail">
														<span class="text">이메일 인증하러 가기</span>
													</button>
												</div>
												<span id="email-msg" class="small-text"></span>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_title">
									<label for="formJoin06" class="form_label"> 생년월일 <span
										class="required"> <span class="hidden">필수입력</span>
									</span>
									</label>
								</div>

								<div class="form_cont">
									<div class="valid_check">
										<div class="input_btn_box1">
											<div class="input_btn_box">
												<input type="date" id="birthday" name="birthday"
													class="form_ip">
											</div>
										</div>
										<span id='birthday-msg' class="small-text"></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="btn_wrap justify page_bottom" id="joinComplete">
						<button type="button" class="btn_lg btn_primary" id="join"
							style="width: 100%;">
							<span class="text">회원가입</span>
						</button>

					</div>
				</form>
			</section>


		</main>

		<footer>


			<jsp:include page="/WEB-INF/views/include/copy_right_footer.jsp" />

		</footer>
	</div>


</body>
</html>