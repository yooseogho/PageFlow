<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/customer_inquiry_list.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
		<header class="header_wrapper">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav class="nav_wrapper">
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>
		<main class="main_wrapper">
            <div class="main_inner">
				<aside class="aside_wrapper">
					<jsp:include page="/WEB-INF/views/include/member_info_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
					<div id="title">
						<h2>1:1 문의</h2>
					</div>
					<div id="inquiry_check">
						<div id="inquiry_check_box">
							<div id="date_select">
								<select id="date_select_box">
									<option>3개월</option>
									<option>6개월</option>
									<option>1년</option>
									<option>3년</option>
									<option>직접설정</option>
								</select>
							</div>
							<div class="date_arrange_box">
								<input type="date">
							</div>
							<span id="gap">~</span>
							<div class="date_arrange_box">
								<input type="date">
							</div>
							<div>
								<button id="check">조회하기</button>
							</div>
						</div>
						<div id="right_area">
							<a href="/customer_inquiry_write_page"><button>1:1 문의하기</button></a>
						</div>
					</div>
					<ul style="padding: 5px;">
						<li id="inquiry_text"><span>1:1 문의내역 조회는 최대 3년까지 가능합니다.</span></li>
					</ul>
					<div id="inquiry_list_btn">
						<ul>
							<li>
								<button class="list_btn">전체</button>
							</li>
							<li>
								<button class="list_btn">준비중</button>
							</li>
							<li>
								<button class="list_btn">처리중</button>
							</li>
							<li>
								<button class="list_btn">답변완료</button>
							</li>
						</ul>
						<hr>
					</div>
					<div id="inquiry_content_list">
						<div>문의결과</div>
					</div>
				</section>
			</div>	
		</main>
		<footer class="footer_wrapper">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>