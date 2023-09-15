<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_grade.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
        <header>
            <div id="rootpage">
                <a href="/page">루트페이지로</a>
            </div>

            <div class="h_button_area">
                <a href="/member_check_page"><button class="h_button">회원정보관리</button></a>
                <a href="/user_info_page"><button class="h_button">내정보 보기</button></a>
                <a href="/member_benefit_page"><button class="h_button">회원등급 혜택</button></a>
                <button class="h_button">로그아웃</button>
                <a href="#"><button class="h_button">고객센터</button></a>
            </div>
        </header>

        <main>
            <section class="contents_wrap">
                <div class="contents_inner">
                    <div class="inner_header">
                        <p class="header_text">회원등급 혜택</p>
                    </div>

                    <div class="inner_main_top">
                        <div class="main_top_top">
                            <p class="main_top_title">나의 회원등급 혜택</p>
                        </div>
                        <div class="my_grade_info">
                            <div class="grade_info_header">
                                <div class="left_area">
                                    <div class="user_img_box">
                                        <span class="ico_grade_friends"></span>
                                    </div>
                                </div>
                                <div class="right_area">
                                    <div class="grade_info_title">
                                        <span class="name">xxx</span>회원님의 이번 달 등급은
                                        <span class="grade">프렌즈</span> 등급입니다.
                                    </div>
                                    <dl class="grade_state_info_list">
                                        <dt class="state_info_title">등급 적용일</dt>
                                        <dd class="state_info_desc">xxxx.xx.xx</dd>

                                        <dt class="state_info_title">산정 기간</dt>
                                        <dd class="state_info_desc">xxxx.xx.xx ~ xxxx.xx.xx</dd>

                                        <dt class="state_info_title">구매금액</dt>
                                        <dd class="state_info_desc">x원</dd>

                                    </dl>
                                </div>
                            </div>
                            <div class="grade_info_contents">
                                <div class="state_gauge_wrap">
                                    <div class="state_guage_title">
                                        <span class="val">x월 xx일</span>까지
                                        <span class="val">xxx,xxx원</span>만 더 구매하면 xx 등급 달성!
                                    </div>
                                    <div class="state_guage_bar">
                                        <span class="state_bar">
                                            <span class="state_dot">
                                                <span class="dot">F</span>
                                                <span class="dot">S</span>
                                                <span class="dot">G</span>
                                                <span class="dot">V</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="title_wrap">
                        <h2 class="title_heading">등급별 혜택</h2>
                    </div>

                    <div class="tbl_grade_wrap">
                        <table class="tbl_col">
                            <colgroup>
                                <col style="width: 25%;">
                                <col style="width: 25%;">
                                <col style="width: 25%;">
                                <col style="width: auto;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="img_box">
                                            <span class="ico_grade_platinum"></span>
                                        </div>
                                        <div class="grade_title">플래티넘</div>
                                        <div class="grade_desc">최근 3개월 순수구매액<span class="val">30만원 초과</span></div>
                                    </th>
                                    <th scope="col">
                                        <div class="img_box">
                                            <span class="ico_grade_gold"></span>
                                        </div>
                                        <div class="grade_title">골드</div>
                                        <div class="grade_desc">최근 3개월 순수구매액<span class="val">21 ~ 30만원</span></div>
                                    </th>
                                    <th scope="col">
                                        <div class="img_box">
                                            <span class="ico_grade_silver"></span>
                                        </div>
                                        <div class="grade_title">실버</div>
                                        <div class="grade_desc">최근 3개월 순수구매액<span class="val">10 ~ 20만원</span></div>
                                    </th>
                                    <th scope="col" class="active">
                                        <div class="img_box">
                                            <span class="ico_grade_friends"></span>
                                        </div>
                                        <div class="grade_title">프렌즈</div>
                                        <div class="grade_desc">최근 3개월 순수구매액<span class="val">10만원 미만</span></div>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="vertical_middle">
                                        <div class="extra_rate_text">
                                            <span class="ico_point_plus"></span>포인트 적립률
                                            <span class="val">4%</span>
                                        </div>
                                        <div class="extra_rate_text">
                                            <span class="ico_point_plus"></span>포인트 적립률
                                            <span class="val">3%</span>
                                        </div>
                                        <div class="extra_rate_text">
                                            <span class="ico_point_plus"></span>포인트 적립률
                                            <span class="val">2%</span>
                                        </div>
                                        <div class="extra_rate_text">
                                            <span class="ico_point_plus"></span>포인트 적립률
                                            <span class="val">1%</span>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="title_wrap">
                        <h2 class="title_heading">등급 선정 기준</h2>
                    </div>
                    
                    <div class="tbl_row_wrap">
                        <table class="tbl_row">
                            <colgroup>
                                <col style="width: 12%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">혜택기간</th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row">선정기간</th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row">순수구매액</th>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </section>
        </main>
        <footer>
            <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </footer>
    </div>
</body>
</html>