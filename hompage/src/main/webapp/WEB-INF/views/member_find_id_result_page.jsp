<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/find_id_result.css">
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
				<div class="ico_and_info">
					<div class="ico_img_box">
						사용자 이미지
					</div>
					<div class="ico_text_box">
						<div class="ico_title">입력하신 정보와 일치하는 결과입니다.</div>
					</div>
				</div>
				<div class="id_result_info_container">
					<div class="id_result_info_box">
						<div class="id_result_title">
							<span class="result_title_header">온라인 가입 정보</span>
							<p class="info_text" style="font-size: small;">본인인증을 통해 아이디 전체 확인이 가능합니다.</p>	
						</div>
						<div class="id_result_item">
							<div class="left_area" style="width:26vh;">
								<div class="id_info_name">
									아이디 : xxxxxx
								</div>
								<div class="id_info_text">
									<span class="text_info_inner" style="font-size: small;">가입일<span class="date">xxxx년 xx월</span></span>
									<span class="gap">|</span>
									<span class="text_info_inner" style="font-size: small;">인터넷 PageFlow</span>
								</div>							
							</div>
							<div class="right_area" >
								<button class="right_area_btn"><span>아이디 확인</span></button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="page_move_area">
					<a href="/member_find_id_page"><button class="page_move_btn"><span>비밀번호 찾기</span></button></a>
					<a href="/member_login_page"><button class="page_move_btn"><span>로그인</span></button></a>
				</div>
			</section>
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/include/copy_right_footer.jsp" />
		</footer>
	</div>
</body>
</html>