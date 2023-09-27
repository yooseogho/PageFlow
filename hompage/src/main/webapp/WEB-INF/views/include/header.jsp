<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/include/header.css">
<meta charset="UTF-8">
</head>
<body>
	<div class="service_mall_wrap">
		<div class="service_mall_inner">
			<div class="customer_service_box">
				<ul class="customer_service_list">
					<li class="customer_service_item"><a
						href="/member_create_page" class="util_link">회원가입</a></li>
					<li class="customer_service_item"><a class="util_link"
						href="member_login_page">로그인</a></li>
					<li class="customer_service_item member_benefit">
						<button type="button" class="btn_member_benefit"
							onclick="location.href=`/member_grade_page`">
							<span class="text">회원혜택</span>
						</button>
					</li>
					<li class="customer_service_item"><a
						href="/customer_service_page" class="util_link">고객센터</a></li>
					<li class="customer_service_item"><a
						href="/admin_page" class="util_link">관리자 페이지</a></li>	
				</ul>
			</div>
		</div>
	</div>
</body>
</html>