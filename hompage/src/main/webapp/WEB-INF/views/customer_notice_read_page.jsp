<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                   	<jsp:include page="/WEB-INF/views/include/customer_service_left_aside.jsp" />
                </aside>
                <section class="section_wrapper">
                     
                    <div class="customer_wrapper">

                        <div class="view_detail_wrapper">

                            <div class="view_detail_header">
                                <div class="title_wrap title_size_lg" id="notice_detail_header">
                                    <p class="title_heading">북앤라이프 문화상품권 결제서비스 일시 중단 안내 (9/21~)</p>
                                    <div class="edit_info_case"><span class="desc">고객센터</span>
                                        <span class="gap">|</span>
                                        <span class="date">2023.09.21</span>
                                    </div>
                                </div>
                            </div>

                            <div class="view_detail_body has_line" id="notice_detail_body">
                                <div class="edit_write_case">
                                    <p>안녕하세요.</p>
                                    <p>꿈을 키우는 세상 교보문고입니다.</p>
                                    <p>&nbsp;</p>
                                    <p>결제사의 요청으로 아래 기간동안 해당 서비스가 제한됩니다.&nbsp;</p>
                                    <p>서비스 이용 시 참고 부탁드립니다.&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p><b>○ 작업일시 : 2023.09.21 (목) 16:30 ~ 조치 완료시까지<br></b></p>
                                    <p><b>○ 작업내용 : '북앤라이프' 도서문화상품권 결제수단 비노출<br></b></p>
                                    <p><b>○ 작업대상 : PC, Web, Mobile &amp; app (e캐시, 교보캐시 포함)</b></p>
                                    <p><b>○ 사유 : 서비스 안전점검으로 인한 일시중단</b>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>서비스 이용에 불편을 드려 죄송합니다.</p>
                                    <p>감사합니다.</p>
                                    <p>&nbsp;</p>
                                </div>
                            </div>

                            <div class="view_detail_footer">
                                <div class="board_item">
                                    <div class="prev_board">이전글 <i class="ico_board_prev"></i> </div>
                                    <div class="desc">이전 글이 없습니다.</div>
                                </div>
                                <div class="board_item">
                                    <div class="next_board">다음글 <i class="ico_board_next"></i></div><a href="#" class="board_title">컬쳐캐쉬 결제 서비스 일시 중단의 건</a>
                                </div>
                            </div>

                            <div class="btn_wrap">
                                <a href="/customer_notice_list_page" class="btn_lg btn_line_primary"><span class="text">공지사항 목록</span></a>
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