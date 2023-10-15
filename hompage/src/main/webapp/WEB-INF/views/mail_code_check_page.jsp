<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_create.css">
<title>Insert title here</title>
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
														<input type="number" class="form_ip" title="인증번호 입력"
															placeholder="인증번호 6자리" maxlength="6">
													</div>
													<button type="button" class="btn_ip btn_line_primary">
														<span class="text">인증번호 확인</span>
													</button>
												</div>
											</div>
											<p style="color: lightgrey;">
												입력하신 이메일로 발송된 인증 코드를 입력해 주세요.
											</p>
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