<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/customer_inquiry_list.css">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		// 페이지 로드시에도 문의 목록 필터링
		filterInquiries('전체');

		// 필터링 버튼 클릭 이벤트 처리
		$('.tab_item').on('click', function() {
			var value = $(this).data('value');
			$('.tab_item').removeClass('ui-state-active');
			$(this).addClass('ui-state-active');

			// 필터링 버튼 클릭시에도 문의 목록 필터링
			filterInquiries(value);
		});

		$(document).ready(function() {
		    $('.fold_box').not('.expanded').find('.question_content').hide();
		    $('.fold_box').not('.expanded').find('.answer_content').hide();

		    $(document).on('click', '.fold_box_header', function() {
		        var $foldBox = $(this).parent();
		        if ($foldBox.hasClass('expanded')) {
		            $foldBox.find('.question_content').slideUp(200);
		            if ($foldBox.data('status') != '준비중') {
		                $foldBox.find('.answer_content').slideUp(200);
		            }
		        } else {
		            $foldBox.find('.question_content').slideDown(200);
		            if ($foldBox.data('status') != '준비중') {
		                $foldBox.find('.answer_content').slideDown(200);
		            }
		        }
		        $foldBox.toggleClass('expanded');
		    });
		});

		// 삭제 버튼 클릭 이벤트 처리
		$('body').on('click', '.delete_button', function() {
			var $foldBox = $(this).closest('.fold_box');
			var inno = $foldBox.data('inno');

			if (confirm("정말로 삭제하시겠습니까?")) {
				$.ajax({
					url : '/customer_inquiry_delete/' + inno,
					type : 'DELETE',
					success : function(response) {
						alert(response);
						location.reload();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("삭제 실패 : " + jqXHR.responseText);
						console.log('문의 삭제 실패:', textStatus, errorThrown);
						console.log('서버로부터 받은 응답:', jqXHR.responseText);
					}
				});
			}
		});
	});

	function filterInquiries(status) {
		// 모든 문의 숨기기
		$('.fold_box').hide();

		if (status === '전체') {
			// 전체 상태일 경우 모든 문의 보이기
			$('.fold_box').not('#noData').show(); // 'noData'를 제외하고 모든 문의를 보여줍니다.
		} else {
			// 특정 상태일 경우 해당 상태의 문의만 보이기
			// 상태 값을 소문자로 변환하여 비교
			$('.fold_box[data-status="' + status.toLowerCase() + '"]').show();
		}

		// 필터링 후 문의가 없는지 확인
		if ($('.fold_box:visible').length == 0) {
			// 문의가 없을 경우 메시지 보이기
			$('#noData').show();
		}
	}

	const v = '${inquirys}';
	console.log(v);
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
					<jsp:include
						page="/WEB-INF/views/include/member_info_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
					<div id="title">
						<h2>1:1 문의</h2>
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
						<a href="/customer_inquiry_write_page" class="inquiry_btn"
							style="padding-left: 260px;"><button type="button"
								class="btn_ip btn_line_primary">1:1 문의하기</button></a>
					</div>
					<ul style="padding: 5px;">
						<li id="inquiry_text"><span>1:1 문의내역 조회는 최대 3년까지
								가능합니다.</span></li>
					</ul>
					<div id="inquiry_list_btn">
						<div class="tab_wrap type_line" data-type-btn="">
							<div class="tab_list_wrap">
								<ul id="FilterList" class="tabs">
									<li class="tab_item ui-state-active" data-value="전체"><button
											class="tab_link">
											<span class="tab_text"><span>전체</span></span>
										</button></li>
									<li class="tab_item" data-value="준비중"><button
											class="tab_link">
											<span class="tab_text"><span>준비중</span></span>
										</button></li>
									<li class="tab_item" data-value="처리중"><button
											class="tab_link">
											<span class="tab_text"><span>처리중</span></span>
										</button></li>
									<li class="tab_item tab_disabled" data-value="답변완료"><button
											class="tab_link">
											<span class="tab_text"><span>답변완료</span></span>
										</button></li>
								</ul>
							</div>
						</div>
					</div>

					<div id="ListWrap" class="fold_box_wrap type_inquiry no_top_line">
						<ul class="fold_box_list">

							<c:forEach var="inquiry" items="${inquirys}">
								<li class="fold_box expanded" data-id=""
									data-inno="${inquiry.inno}"
									data-status="${inquiry.inquiryStatus.replace(' ', '')}">
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
									<div class="fold_box_contents question_content">
										<div class="inquiry_content">
											<div class="inquiry_content_area">
												<p>${inquiry.content}</p>
											</div>
											<div class="inquiry_content_footer">
												<div class="func_group">
													<c:if test="${inquiry.inquiryStatus.trim() ne '답변완료'}">
														<a href="/customer_inquiry_edit_page/${inquiry.inno}">
															<button class="btn_text_link edit_button" type="button">
																<span class="text">수정&nbsp;/</span>
															</button>
														</a>
													</c:if>
													<button class="btn_text_link delete_button" type="button">
														<span class="text">&nbsp;삭제</span>
													</button>
												</div>
											</div>
										</div>
									</div> <c:if test="${inquiry.inquiryStatus != '준비중'}">
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
							</c:forEach>
							<li class="fold_box expanded" id="noData" data-status="처리중"
								style="display: none;">
								<div id="NoDataWrap" class="no_data no_top_line has_desc_lg"
									style="">
									<div class="no_data_desc_lg">해당 기간 문의 내역이 없습니다.</div>
								</div>
							</li>
						</ul>
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