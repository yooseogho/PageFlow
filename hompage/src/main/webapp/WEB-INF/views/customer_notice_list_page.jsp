<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/customer_notice_list.css">
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
                <section class="section_wrapper">
                     <div class="customer_wrapper">

                        <div class="title_wrap title_size_lg">
                            <h1 class="title_heading">공지사항</h1>
                        </div>

                        <div class="info_text_box size_lg type_purple customer_search_box">
                            <div class="input_btn_box">
                                <div class="form_ip_search">
                                    <input type="search" class="form_ip" title="공지사항 검색어" placeholder="검색어를 검색해 보세요.">
                                    <button type="button" class="btn_ip_clear"></button>
                                </div>
                                <button type="button" class="btn_ip btn_primary" id="notice_search"><span class="text">검색</span></button>
                            </div>
                        </div>

                        <div class="customer_content_area">
                            <div class="list_result_wrap">
                                <p class="result_count"><span class="fc_green">297</span>건
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
                                        <th scope="col">유형</th>
                                        <th scope="col">날짜</th>
                                    </tr>
                                </thead>
                                <tbody class="notice_body">
                                    <tr>
                                        <td class="fc_light_gray">1</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">북앤라이프 문화상품권 결제서비스 일시 중단 안내 (9/21~)
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.09.21</td>
                                    </tr>

                                    <tr>
                                        <td class="fc_light_gray">2</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">교보문고 시스템 점검 안내 (9/24)
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.09.21</td>
                                    </tr>

                                    <tr>
                                        <td class="fc_light_gray">3</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">컬쳐캐쉬 결제 서비스 일시 중단의 건
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">교보문고</td>
                                        <td class="fc_light_gray">2023.09.20</td>
                                    </tr>
                                    <tr>
                                        <td class="fc_light_gray">4</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">일부 신용카드 및 카카오페이 결제 시스템 점검 안내 (~9/30)
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.09.15</td>
                                    </tr>
                                    <tr>
                                        <td class="fc_light_gray">5</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">2023년 추석 연휴 배송일정 및 매장 휴무일 안내
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.09.15</td>
                                    </tr>

                                    <tr>
                                        <td class="fc_light_gray">6</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">교보문고 개인정보 처리방침 변경 안내 (9/8)
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.09.01</td>
                                    </tr>
                                    <tr>
                                        <td class="fc_light_gray">7</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">교보북클럽 회원 개인정보 이용내역 안내
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.07.21</td>
                                    </tr>
                                    <tr>
                                        <td class="fc_light_gray">8</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">교보문고 개인정보 처리방침 변경 안내 (7/1)
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.06.23</td>
                                    </tr>
                                    <tr>
                                        <td class="fc_light_gray">9</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">교보북클럽 멤버십 회원혜택 변경 안내 (7/1)
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.05.31</td>
                                    </tr>
                                    <tr>
                                        <td class="fc_light_gray">10</td>
                                        <td class="align_left">
                                            <a href="/customer_notice_read_page" class="btn_text_link ellipsis">
                                                <span class="text">교보문고 이용약관 개정 안내 (7/1)
                                                </span>
                                            </a>
                                        </td>
                                        <td class="fc_light_gray">고객센터</td>
                                        <td class="fc_light_gray">2023.05.31</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="pagination">
                            <button class="btn_page prev"></button>
                            <div class="page_num">
                                <a href="#" class="btn_page_num active" data-index="0" data-role="first" title="현재페이지">1</a>
                                <a href="#" class="btn_page_num" data-index="2" data-role="middle">2</a>
                                <a href="#" class="btn_page_num" data-index="3" data-role="middle">3</a>
                                <a href="#" class="btn_page_num" data-index="4" data-role="middle">4</a>
                                <a href="#" class="btn_page_num" data-index="5" data-role="middle">5</a>
                            </div>
                            <button class="btn_page next"></button>
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