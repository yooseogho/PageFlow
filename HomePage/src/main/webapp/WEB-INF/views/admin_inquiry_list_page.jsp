<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_inquiry_list.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$('.fold_box_header').on('click', function() {
			var parent = $(this).parent('.fold_box');

			if (parent.hasClass('expanded')) {
				parent.removeClass('expanded');
			} else {
				parent.addClass('expanded');
			}
		});
	});

	$(document).ready(function() {
		$('.tab_item').on('click', function() {
			// 모든 tab_item에서 ui-state-active 클래스를 제거
			$('.tab_item').removeClass('ui-state-active');

			// 클릭한 tab_item에 ui-state-active 클래스를 추가
			$(this).addClass('ui-state-active');

			var status = $(this).data('value');

			// 모든 문의 및 noData 메시지 숨기기
			$('.fold_box').hide();

			if (status === '') {
				// 전체 상태일 경우 모든 문의 보이기
				$('.fold_box').not('#noData').show();
			} else {
				// 특정 상태일 경우 해당 상태의 문의만 보이기
				$('.fold_box[data-status="' + status + '"]').show();
			}

			// 필터링 후 문의가 없는지 확인
			if ($('.fold_box:visible').length == 0) {
				// 문의가 없을 경우 메시지 보이기
				$('#noData').show();
			}
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
		<main class="main_wrapper">
			<div class="main_inner">
				<aside class="aside_wrapper">
					<jsp:include page="/WEB-INF/views/include/admin_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
					<div class="admin_wrap">
						<div class="title_wrap title_size_lg">
							<p class="title_heading">관리자님 환영합니다.</p>
						</div>

						<div class="title_wrap title_size_md">
							<p class="title_heading">1:1 문의 사항 목록</p>
						</div>

						<div class="list_sort_wrap type_purple">
							<div class="date_picker_box">
								<!-- form_sel -->
								<div class="form_sel">
									<select title="기간 선택" id="monthFilterInput">
										<option value="3">3개월</option>
										<option value="6">6개월</option>
										<option value="12">1년</option>
										<option value="36">3년</option>
										<option value="self">직접설정</option>
									</select>

								</div>
								<!-- //form_sel -->
								<div class="date_box">
									<input type="date" class="form_ip hasDatepicker" title="시작일 선택"
										id="startDate" maxlength="10">
								</div>
								<span class="gap">~</span>
								<div class="date_box">
									<input type="date" class="form_ip hasDatepicker" title="종료일 선택"
										id="endDate" maxlength="10">
								</div>
								<button type="button" class="btn_ip btn_line_primary"
									data-button="submit">
									<span class="text">조회</span>
								</button>
							</div>

						</div>

						<div class="tab_wrap type_line" data-type-btn="">
							<div class="tab_list_wrap">
								<ul id="FilterList" class="tabs">
									<li class="tab_item ui-state-active" data-value=""><button
											class="tab_link">
											<span class="tab_text"><span>전체</span></span>
										</button></li>
									<li class="tab_item" data-value="준비중"><button
											class="tab_link">
											<span class="tab_text"><span>준비중</span></span>
										</button></li>
									<li class="tab_item tab_disabled" data-value="답변완료"><button
											class="tab_link">
											<span class="tab_text"><span>답변완료</span></span>
										</button></li>
								</ul>
							</div>
						</div>
						<div id="ListWrap" class="fold_box_wrap type_inquiry no_top_line">
							<ul class="fold_box_list">
								<c:forEach var="inquiry" items="${inquirys}">
									<li class="fold_box expanded" data-id=""
										data-inno="${inquiry.inno}"
										data-status="${inquiry.inquiryStatus}">
										<div class="fold_box_header">
											<div class="inquiry_info">
												<span class="badge_sm badge_pill badge_primary"><span
													class="text">${inquiry.inquiryStatus}</span></span> <span
													class="gap"><span class="hidden">/</span></span> <span
													class="category"><span class="category_item">${inquiry.inquiryType}</span></span>
											</div>
											<div class="inquiry_title">
												<div class="faq_q">
													<span class="faq_circle" aria-hidden="true">Q</span><span
														class="hidden">질문</span>
												</div>
												<span class="title">${inquiry.inquiryTitle}</span> <span
													class="right_area"><span class="date">${inquiry.createdDate}</span></span>

											</div>
											<button class="btn_fold" type="button">
												<span class="hidden">컨텐츠 열기</span>
											</button>
										</div>
										<div class="fold_box_contents">
											<div class="inquiry_content">
												<div class="inquiry_content_area">
													<p>${inquiry.content}</p>
												</div>
												<div class="inquiry_content_footer">
													<div class="func_group">
														<c:if test="${inquiry.inquiryStatus ne '답변완료'}">
															<button class="btn_text_link" type="button"
																onclick="location.href='/admin_inquiry_answer_page/${inquiry.inno}'">
																<span class="text">답변하기</span>
															</button>
														</c:if>
													</div>
												</div>
											</div>
										</div> <c:if test="${not empty inquiry.inquiryAnswer}">
											<div class="fold_box_contents answer_content">
												<div class="inquiry_content">
													<div class="inquiry_answer_area">
														<p>${inquiry.inquiryAnswer}</p>
													</div>
													<div class="inquiry_content_footer">
														<div class="func_group">
															<span class="right_area"><span class="date">${inquiry.answeredDate}</span></span>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</li>
									<li class="fold_box expanded" id="noData"
										style="display: none;">
										<div id="NoDataWrap" class="no_data no_top_line has_desc_lg">
											<div class="no_data_desc_lg">해당 기간 문의 내역이 없습니다.</div>
										</div>
									</li>
								</c:forEach>
							</ul>
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