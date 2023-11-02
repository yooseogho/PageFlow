<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/customer_notice_read.css">
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
					<jsp:include
						page="/WEB-INF/views/include/customer_service_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">

					<div class="customer_wrapper">

						<div class="view_detail_wrapper">

							<div class="title_wrap title_size_lg" id="notice_detail_header">
								<p class="title_heading">${notice.noticeTitle}</p>
								<div class="edit_info_case">
									<span class="desc">${notice.noticeWriter}</span> <span
										class="gap">|</span> <span class="date">${notice.noticeWriteday}</span>
								</div>
							</div>


							<div class="view_detail_body has_line" id="notice_detail_body">

								<div class="edit_write_case">
									<p>${notice.noticeContent}</p>
								</div>
							</div>

							<div class="view_detail_footer">
								<div class="board_item">
									<div class="prev_board">
										이전글 <i class="ico_board_prev"></i>
									</div>
									<c:choose>
										<c:when test="${empty prevNotice}">
											<div class="desc">이전 글이 없습니다.</div>
										</c:when>
										<c:otherwise>
											<a href="/customer_notice_read_page?nno=${prevNotice.nno}"
												class="board_title">${prevNotice.noticeTitle}</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="board_item">
									<div class="next_board">
										다음글<i class="ico_board_next"></i>
									</div>
									<c:choose>
										<c:when test="${empty nextNotice}">
											<div class="desc">다음 글이 없습니다.</div>
										</c:when>
										<c:otherwise>
											<!-- Change the link to your actual link for the next post -->
											<!-- You should replace 'nextPostId' with the actual ID of the next post -->
											<a href="/customer_notice_read_page?nno=${nextNotice.nno}"
												class="board_title">${nextNotice.noticeTitle}</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>

							<div class="btn_wrap">
								<a href="/customer_notice_list_page"
									class="btn_lg btn_line_primary"><span class="text">공지사항
										목록</span></a>
							</div>


						</div>

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