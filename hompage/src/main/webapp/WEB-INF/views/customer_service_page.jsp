<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/customer_service.css">
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
                    <jsp:include page="/WEB-INF/views/include/customer_service_left_aside.jsp" />
                </aside>
                <section class="section_wrap" style="width: 984px;">
                    <div class="customer_wrap">
                        <div class="title_wrap title_size_lg">
                            <h1 class="title_heading">
                                <span class="fw_regular">무엇을 도와드릴까요?</span><br> FageFlow 고객센터<span class="fw_regular">입니다.</span>
                            </h1>
                        </div>
                        <div class="title_wrap title_size_md">
                            <h2 class="title_heading">자주 묻는 질문</h2>
                            <div class="right_area">
                                <a href="#" class="btn_more_view size_lg"><span class="text">더보기</span><span class="ico_arw"></span></a>
                            </div>
                        </div>
                        <div class="info_text_box size_lg type_purple customer_search_box">
                            <div class="input_btn_box">
                                <div class="form_ip_search">
                                    <input type="search" class="form_ip" title="자주 묻는 질문" data-input="onk-cscenter-search-input" placeholder="질문을 검색해 보세요.">
                                </div>
                                <button type="button" id="mainFaqSearchBtn" class="btn_ip btn_primary"><span class="text">검색</span></button>
                            </div>
                        </div>
                        <div class="asked_category_list">
                            <ul>
                                <li><a href="#">BEST 10</a></li>
                                <li><a href="#">반품/교환/환불</a></li>
                                <li><a href="#">주문/결제</a></li>
                                <li><a href="#">배송/수령일 안내</a></li>
                                <li><a href="#">eBook</a></li>
                                <li><a href="#">도서/상품정보/교과서</a></li>
                            </ul>
                        </div>
                        <div class="title_wrap title_size_md">
                            <h2 class="title_heading">1:1 문의</h2>
                        </div>
                        <div class="inquiry_box">
                            <div class="box bg">
                                <a href="/customer_inquiry_write_page" class="inquiry">
                                    <span class="ico_inquiry01"></span>
                                    <p class="name">1:1 문의 접수</p>
                                </a>
                                <a href="/customer_inquiry_list_page" class="inquiry">
                                    <span class="ico_inquiry02"></span>
                                    <p class="name">1:1 문의 내역</p>
                                </a>
                            </div>
                            <div class="box">
                                <p class="title">전화 상담</p>
                                <a class="tel">1544-1900</a>
                                <p class="desc">평일 09:00~18:00 (주말 및 공휴일 휴무)</p>
                            </div>
                        </div>
                        <div class="title_wrap title_size_md">
                            <h2 class="title_heading">공지사항</h2>
                            <div class="right_area">
                                <a href="/customer_notice_list_page" class="btn_more_view size_lg"><span class="text">더보기</span><span class="ico_arw"></span></a>
                            </div>
                        </div>
                        <div class="tbl_col_wrap">
                            <table class="tbl_col_line">
                                <colgroup>
                                    <col style="width: 75px">
                                    <col style="width: auto;">
                                    <col style="width: 130px;">
                                    <col style="width: 124px;">
                                </colgroup>
                                <tbody class="notice_tbody" id="notice_body">
                                    <tr>
                                        <td class="fc_light_gray">
                                            1
                                        </td>
                                        <td class="align_left">
                                            <a href="#" class="btn_text_link ellipsis"><span class="text">2023년 추석 연휴 배송일정 및 매장 휴무일 안내</span></a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.09.15</td>
                                    </tr>

                                    <tr>
                                        <td class="fc_light_gray">
                                            2
                                        </td>
                                        <td class="align_left">
                                            <a href="#" class="btn_text_link ellipsis"><span class="text">교보문고 개인정보 처리방침 변경 안내 (9/8)</span></a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.09.01</td>
                                    </tr>

                                    <tr>
                                        <td class="fc_light_gray">
                                            3
                                        </td>
                                        <td class="align_left">
                                            <a href="#" class="btn_text_link ellipsis"><span class="text">교보북클럽 회원 개인정보 이용내역 안내</span></a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.07.21</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="customer_content_area">
                            <div class="round_gray_box type_sub_sm company_tel">
                                <span class="name">출판사 연락처 안내</span>
                                <div class="form_search_box">
                                    <div class="form_ip_search">
                                        <input type="search" id="telInfoM" class="form_ip" data-input="onk-cscenterArs-search-input" placeholder="출판사명 또는 ISBN-13을 입력해 보세요" title="출판사 연락처 안내">
                                    </div>
                                    <button type="button" id="btnMainSearch" class="btn_ip_search"></button>
                                </div>
                            </div>
                        </div>
                        <div class="title_wrap title_size_md">
                            <h2 class="title_heading">서비스 바로가기</h2>
                        </div>
                        <div class="shortcut_service">
                            <ul>
                                <li>
                                    <a href="/member_check_page">
                                        <span class="ico_shortcut02"></span>
                                        <span class="text">회원정보 수정</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/member_grade_page">
                                        <span class="ico_shortcut07"></span>
                                        <span class="text">회원 등급별 혜택</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/find_id_page">
                                        <span class="ico_shortcut11"></span>
                                        <span class="text">아이디/비밀번호 찾기</span>
                                    </a>
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