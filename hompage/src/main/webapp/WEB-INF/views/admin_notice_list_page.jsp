<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/customer_notice_list.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<script>
	$(document).ready(function() {
	    $('.deleteBtn').click(function() {
	        var nno = $(this).data('nno');
	        if (confirm("정말로 삭제하시겠습니까?")) {
	            $.ajax({
	                url : '/admin_notice_delete/' + nno,
	                type : 'DELETE',
	                success : function(response) {
	                    // 공지사항 삭제가 성공했을 경우만 페이지 리다이렉트
	                    if (response.success) {
	                        alert("삭제 되었습니다."); // 여기에 메시지 추가
	                        window.location.href = "/admin_notice_list_page";
	                    } else {
	                        alert("삭제 실패: " + response.message);
	                    }
	                },
	                error : function(jqXHR, textStatus, errorThrown) {
	                    console.log(textStatus, errorThrown);
	                }
	            });
	        }
	    });
	});
	</script>
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
					<jsp:include page="/WEB-INF/views/include/admin_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
					<div class="customer_wrapper">
						<div class="title_wrap title_size_lg">
							<h1 class="title_heading">공지사항</h1>
						</div>

						<div class="info_text_box size_lg type_purple customer_search_box">
							<div class="input_btn_box">
								<div class="form_ip_search">
									<input type="search" class="form_ip" title="공지사항 검색어"
										placeholder="검색어를 검색해 보세요.">
									<button type="button" class="btn_ip_clear"></button>
								</div>
								<button type="button" class="btn_ip btn_primary"
									id="notice_search">
									<span class="text">검색</span>
								</button>
							</div>
						</div>

						<div class="customer_content_area">
							<div class="list_result_wrap">
								<p class="result_count">
									<span class="fc_green">${countOfNotices}</span>건
								</p>
							</div>
						</div>

						<div class="tbl_col_wrap">
							<table class="tbl_col_line">
								<colgroup>
									<col style="width: 75px;">
									<col style="width: auto;">
									<col style="width: 125px;">
									<col style="width: 125px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">NO</th>
										<th scope="col">공지제목</th>
										<th scope="col">작성자</th>
										<th scope="col">날짜</th>
										<th scope="col">수정/삭제</th>
									</tr>
								</thead>
								<tbody class="notice_body">
									<c:forEach var="notice" items="${notices}">
										<tr>
											<td class="fc_light_gray">${notice.nno}</td>
											<td class="align_left"><a
												href="/customer_notice_read_page?nno=${notice.nno}"
												class="btn_text_link ellipsis"> <span class="text">${notice.noticeTitle}</span></a></td>
											<td class="fc_light_gray">${notice.noticeWriter}</td>
											<td class="fc_light_gray">${notice.noticeWriteday}</td>

											<td class="fc_light_gray">
												<button
													onclick='location.href="/admin_notice_edit_page/${notice.nno}"'
													class="btn_ip btn_primary">수정</button> <!-- 공지사항 수정 페이지로 이동 -->

												<button class="deleteBtn btn_ip btn_primary"
													data-nno="${notice.nno}">삭제</button>
											</td>

										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="pagination">
							<div class="page_num">
								<!-- 이전 페이지 버튼: 이전 페이지가 없으면 disabled -->
								<a
									href="<c:if test='${page.prev != null}'>/admin_notice_list_page?pageno=${page.prev}</c:if>"
									class="btn_page prev"
									<c:if test="${page.prev == null}">onclick="event.preventDefault();"</c:if>></a>

								<c:forEach varStatus="status" begin="${1}"
									end="${page.totalPages}">
									<c:choose>
										<c:when test="${status.index == page.pageno}">
											<a href="/admin_notice_list_page?pageno=${status.index}"
												class="btn_page_num active">${status.index}</a>
										</c:when>
										<c:otherwise>
											<a href="/admin_notice_list_page?pageno=${status.index}"
												class="btn_page_num">${status.index}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 다음 페이지 버튼 : 다음페이지가 없으면 disabled -->
								<a
									href="<c:if test='${page.next != null}'>/admin_notice_list_page?pageno=${page.next}</c:if>"
									class="btn_page next"
									<c:if test="${empty page.next}">onclick="event.preventDefault();"</c:if>></a>
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