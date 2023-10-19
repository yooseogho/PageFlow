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
<script>
	$(document).ready(function() {
		let authCode; // 서버에서 받은 인증코드 저장 변수

		// 인증 코드 전송 버튼 클릭 이벤트
		$("#sendEmail").click(function(e) {
			e.preventDefault();
			let email = $("input[name='email']").val(); // 이메일 값 가져오기

			$.ajax({
				type : "POST",
				url : "/login/mailConfirm",
				data : JSON.stringify({
					email : email
				}),
				contentType : "application/json",
				success : function(data) {
					authCode = data; // 서버에서 받은 인증 코드 저장
					alert("인증 코드가 발송되었습니다. 이메일을 확인해주세요.");
				},
				error : function(err) {
					console.log(err);
					alert("이메일 전송 중 오류가 발생했습니다.");
				}
			});
		});

		// 인증 코드 확인 버튼 클릭 이벤트
		$("#emailConfirm").click(function(e) {
			e.preventDefault();
			let inputAuthCode = $("input[name='authCode']").val(); // 입력한 인증코드 값 가져오기

			if (inputAuthCode === authCode) { // 입력한 인증코드와 서버에서 받은 인증코드 비교
				alert("인증에 성공했습니다.");

				// /member_create_page 로 리다이렉션
				window.location.href = "/member_create_page";

			} else {
				alert("인증에 실패했습니다. 다시 시도해주세요.");
			}

		});
	});
</script>

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
				<form action="/login/mailConfirm" method="post" id="join-form">
					<div class="title_wrap title_size_md has_line">
						<p class="title_heading">이메일 인증하기</p>
					</div>
					<div class="form_cont">
						<div class="form_col_group">

							<!-- 이메일 부분 -->

							<div class="form_box">
								<div class="form_cont">
									<div class="form_col_group">
										<div class="col_box">
											<div class="valid_check">
												<div class="input_btn_box">
													<div class="time_limit">
														<input type="email" class="form_ip" title="이메일 입력"
															placeholder="실제로 사용하는 이메일을 입력해 주세요." name="email">
													</div>
													<span id='email-msg' class="small-text"></span>
													<button type="button" class="btn_lg btn_primary"
														id="sendEmail" style="width: 100%;">
														<span class="text">인증 코드 전송</span>
													</button>
													<div class="time_limit">
														<input type="text" class="form_ip" title="인증 코드 입력"
															placeholder="영 대/소문자 + 숫자 포함 8자" maxlength="8"
															name="authCode">
													</div>
													<button type="button" class="btn_ip btn_line_primary"
														id="emailConfirm">
														<span class="text">인증 코드 확인</span>
													</button>
												</div>
											</div>
											<p style="color: lightgrey;">입력하신 이메일로 발송된 인증 코드를 입력해
												주세요.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
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