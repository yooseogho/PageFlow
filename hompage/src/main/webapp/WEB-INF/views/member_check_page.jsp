<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_check.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(function() {
    $('form').on('submit', function(event) {
        event.preventDefault();

        const password = $('[name="password"]').val();

        $.ajax({
            url: '/member_check_page',
            method: 'POST',
            data: { password: password },
            success: function(response) {
                window.location.href = '/member_edit_page';
            },
            error: function(jqXHR) {  // 에러 응답 객체인 jqXHR을 인자로 받음
                $('#password-msg')
                    .text(jqXHR.responseText)  // 서버에서 반환한 에러 메시지 출력
                    .css('color', 'red')  // 텍스트 색상을 빨간색으로 변경
                    .css('font-size','12px'); // 폰트 크기를 줄임	
            }

        });
    });
});


</script>

</head>
<body>
	<div id="page">
		<header class="header_wrapper">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav class="nav_wrapper">
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>
	<form action="member_check_page" method="post">
		<main>
			<section class="contents_wrap">
				<div class="contents_inner">
					<div class="inner_header">
						<p class="header_text">회원정보 수정</p>
					</div>

					<div class="inner_main">
						<div class="inner_main_top">
							<p class="main_top_title">비밀번호 확인</p>
							<span class="info_text">안전한 개인정보보호를 위해 비밀번호를 입력해 주세요.</span>
						</div>
							
							<div class="inner_main_mid">
								<table class="tbl_row">
									<colgroup>
										<col style="width: 112px">
										<col style="width: auto">
									</colgroup>

									<tbody>

										<tr>
											<th scope="row" class="has_ip"><label for="password">비밀번호</label>
											</th>
											<td>
												<div class="valid_check">
													<div class="form_ip_pw">
														<input type="password" name="password"
															placeholder="비밀번호를 입력해 주세요">
													</div>
													<span id="password-msg">
												
													</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="inner_main_bottom">
								<a href="member_edit_page"><button class="btn">
										<span class="text">확인</span>
									</button></a>
							</div>
					</div>
				</div>
			</section>
		</main>
		</form>
		<footer class="footer_wrapper">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>