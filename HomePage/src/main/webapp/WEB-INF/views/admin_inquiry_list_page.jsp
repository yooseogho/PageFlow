<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_inquiry_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>(관리자)문의사항 답변 목록</title>
<script>
	$(document).ready(function(){
		$('.fold_box_header').on('click', function() {
	        var parent = $(this).parent('.fold_box');
	        
	        if (parent.hasClass('expanded')) {
	            parent.removeClass('expanded');
	        } else {
	            parent.addClass('expanded');
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
                                    <input type="date" class="form_ip hasDatepicker" title="시작일 선택" id="startDate" maxlength="10">
                                </div>
                                <span class="gap">~</span>
                                <div class="date_box">
                                    <input type="date" class="form_ip hasDatepicker" title="종료일 선택" id="endDate" maxlength="10">
                                </div>
                                <button type="button" class="btn_ip btn_line_primary" data-button="submit"><span class="text">조회</span></button>
                            </div>

                        </div>

                        <div class="tab_wrap type_line" data-type-btn="">
                            <div class="tab_list_wrap">
                                <ul id="FilterList" class="tabs">
                                    <li class="tab_item ui-state-active" data-value=""><button class="tab_link"><span class="tab_text"><span>전체</span></span></button></li>
                                    <li class="tab_item" data-value=""><button class="tab_link"><span class="tab_text"><span>준비중</span></span></button></li>
                                    <li class="tab_item tab_disabled" data-value=""><button class="tab_link"><span class="tab_text"><span>답변완료</span></span></button></li>
                                </ul>
                            </div>
                        </div>

                        <div id="ListWrap" class="fold_box_wrap type_inquiry no_top_line">
                            <ul class="fold_box_list">
                                <li class="fold_box expanded" data-id="">
                                    <div class="fold_box_header">
                                        <div class="inquiry_info">
                                            <span class="badge_sm badge_pill badge_primary"><span class="text">준비중</span></span>
                                            <span class="gap"><span class="hidden">/</span></span>
                                            <span class="category"><span class="category_item">도서/상품정보</span></span>
                                        </div>
                                        <div class="inquiry_title">
                                            <div class="faq_q"><span class="faq_circle" aria-hidden="true">Q</span><span class="hidden">질문</span></div>
                                            <span class="title">절판된 상품 언제 나와요?</span>
                                            <span class="right_area"><span class="date">2023.10.04</span></span>
                                        </div>
                                        <button class="btn_fold" type="button"><span class="hidden">컨텐츠 열기</span></button>
                                    </div>
                                    <div class="fold_box_contents">
                                        <div class="inquiry_content">
                                            <div class="inquiry_content_area">
                                                <p>미쉘 페이버의 늑대형제 책이 절판되었던데 이제는 아예 안나오나요?</p>
                                            </div>
                                            <div class="inquiry_content_footer">
                                                <div class="func_group">
                                                    <button class="btn_text_link" type="button" onclick="location.href=`/admin_inquiry_answer_page`"><span class="text">답변하기</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="fold_box" data-id="">
                                    <div class="fold_box_header">
                                        <div class="inquiry_info">
                                            <span class="badge_sm badge_pill badge_primary">
                                                <span class="text">준비중</span>
                                            </span>

                                            <span class="gap"><span class="hidden">/</span></span>

                                            <span class="category">
                                                <span class="category_item">도서/상품정보</span>
                                            </span>
                                        </div>
                                        <div class="inquiry_title">
                                            <div class="faq_q">
                                                <span class="faq_circle" aria-hidden="true">Q</span><span class="hidden">질문</span>
                                            </div>
                                            <span class="title">절판된 도서</span>
                                            <span class="right_area"><span class="date">2023.10.04</span></span>
                                        </div>
                                        <button class="btn_fold" type="button"><span class="hidden">컨텐츠 열기</span></button>
                                    </div>
                                    <div class="fold_box_contents">
                                        <div class="inquiry_content">
                                            <div class="inquiry_content_area">
                                                <p>절판된 도서는 언제 나오나요?<br>절판된 도서명은 [국내도서] 영혼을 먹는 자들 1: 고대 소년 토락의 모험 제3부 입니다.</p>
                                            </div>
                                            <div class="inquiry_content_footer">
                                                <div class="func_group">
                                                    <button class="btn_text_link" type="button" onclick="location.href=`/admin_inquiry_answer_page`"><span class="text">답변하기</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
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