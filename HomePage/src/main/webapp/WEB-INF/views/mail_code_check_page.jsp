<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/check.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>PageFlow - 이메일 인증하기</title>
<script>
	function appearAuthCode() {
		document.getElementById('hasAuthcode').style.display = 'flex';
	}

	$(document).ready(function() {
		let authCode; // 서버에서 받은 인증코드 저장 변수

		// 인증 코드 전송 버튼 클릭 이벤트
		$("#sendEmail").click(function(e) {
			e.preventDefault();
			let email = $("input[name='email']").val(); // 이메일 값 가져오기
			let re = /\S+@\S+\.\S+/;

			if (email === "") {
				alert("이메일을 입력해주세요.");
				return;
			}

			if (!re.test(email)) {
				alert("유효한 이메일 주소를 입력해주세요.");
				return;
			}

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
					appearAuthCode();
				},
				error : function(err) {
					console.log(err);
					alert("이메일 전송 중 오류가 발생했습니다.");
				}
			});

			const Timer = document.getElementById('Timer'); //스코어 기록창-분
			let time = 180000;
			let min = 3;
			let sec = 60;

			Timer.value = min + ":" + '00';

			function TIMER() {
				PlAYTIME = setInterval(function() {
					time -= 1000;
					min = time / (60 * 1000);

					if (sec > 0) {
						sec -= 1;
						Timer.value = Math.floor(min) + ':' + sec;

					}

					if (sec === 0) {
						sec = 60;
						Timer.value = Math.floor(min) + ':' + '00'
					}

				}, 1000);
			}

			TIMER();

			setTimeout(function() {
				clearInterval(PlAYTIME);
			}, 180000);
		});

		// 인증 코드 확인 버튼 클릭 이벤트
		$("#emailConfirm").click(function(e) {
			e.preventDefault();
			let inputAuthCode = $("input[name='authCode']").val();

			if (inputAuthCode === authCode) {
				alert("인증에 성공했습니다.");
				isAuthCompleted = true; // 인증 완료 상태로 변경
				window.location.href = "/member_create_page";
			} else {
				alert("인증에 실패했습니다. 다시 시도해주세요.");
			}
		});

		let isAuthCompleted = false; // 인증 완료 여부를 저장하는 변수

		// 페이지를 벗어날 때 이벤트
		window.onbeforeunload = function(e) {
			// 인증이 완료되지 않은 상태에서만 요청
			if (!isAuthCompleted) {
				$.ajax({
					type : "POST",
					url : "/session/removeEmail",
					async : true
				});
			}
		};
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
													<div class="input_btn_top">
														<input type="email" class="form_ip" title="이메일 입력"
															placeholder="실제로 사용하는 이메일을 입력해 주세요." name="email">

														<button type="button" class="btn_lg btn_primary"
															id="sendEmail">
															<span class="text">인증 코드 전송</span>
														</button>
													</div>
													<div id="hasAuthcode" class="time_limit">
														<div class="has_time_limit">
															<input type="text" class="form_ip" title="인증 코드 입력"
																placeholder="영 대/소문자 + 숫자 포함 8자" maxlength="8"
																name="authCode"> <input id="Timer" class="timer"
																type="text" value="" readonly />
														</div>

														<button type="button" class="btn_ip btn_line_primary"
															id="emailConfirm">
															<span class="text">인증 코드 확인</span>
														</button>
													</div>
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