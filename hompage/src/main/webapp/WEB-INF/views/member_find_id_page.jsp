<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/find_id.css">
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
				<div class="tab_form">
					<div class="tab_list">
						<ul class="tab_ul">
							<li class="tab_li" style="list-style-type: none;">
								<button class="find_li_btn">아이디찾기</button>
							</li>
							<li class="tab_li" style="list-style-type: none;">
								<button class="find_li_btn">비밀번호찾기</button>
							</li>
						</ul>
					</div>
					<div class="fold_box_header">
						<div class="span_text">
							<span class="form_span_name">휴대폰번호로 찾기</span>
						</div>
						<div class="form_box">
							<div class="form_input">
								<div class="span_area">
									<span class="form_span_name">이름</span>
								</div>
								<input type="text" placeholder="이름을 입력해주세요" class="input_check">
							</div>
							
							<div class="form_input">
								<div class="span_area">
									<span class="form_span_name">생년월일</span>
								</div>
								<input type="text" placeholder="생년월일 8자리를 입력해주세요" class="input_check">
							</div>
							
							<div class="form_input">
								<div class="span_area">
									<span class="form_span_name">휴대폰번호</span>
								</div>
								<input type="text" placeholder="숫자만 입력해주세요" class="input_check">
							</div>
						</div>
						<div class="check_btn_area">
							<a href="/member_find_id_result_page"><button class="check_btn" >확인</button></a>
						</div>
					</div>
					
					<div class="fold_box_btn">
						<a href="/"><button class="find_btn">이메일로 찾기</button></a>
					</div>
					
					<div class="fold_box_btn">
						<a href="/"><button class="find_btn">본인인증으로 찾기</button></a>
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