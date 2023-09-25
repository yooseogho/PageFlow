<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/delivery_list.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
        <header class="header_wrapper">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
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
                    <div class="title_wrap">
                    <h1 class="title_heading">배송주소록</h1>
                </div>

                <div class="round_gray_box">
                    <div class="address_item">
                        <div class="address_info_box">
                            <div class="address_name">
                                <span class="name">이름 : xxx</span>
                                <span class="badge_sm">
                                    <span class="text">기본배송지</span>
                                </span>
                            </div>
                            <div class="address_person">
                                <span class="name">이름 : xxx /</span>
                                <span class="phone_number">010-xxxx-xxxx</span>
                            </div>
                            <div class="address">[우편번호] xx도 xx시 xx동 xxxx xxxx아파트 xxx호</div>
                        </div>
                    </div>
                    <div class="right_area">
                        <button class="btn_sm" type="button">
                            <span class="ico_edit"></span>
                            <span class="text">수정</span>
                        </button>
                    </div>
                </div>

                <ul class="bul_list">
                    <li class="bul_item">* 기본배송지 기준으로 배송일자가 안내됩니다.</li>
                    <li class="bul_item">* 기본배송지는 삭제 불가합니다.</li>
                </ul>

                <div class="list_result_wrap">
                    <p class="result_count">
                        <span class="fc_green">x</span>개
                    </p>
                    <div class="right_area">
                        <p class="bul_item_asterisk">* 배송지는 최대 3개까지 등록 가능합니다.</p>
                        <button class="btn_sm">
                            <span class="ico_plus_primary"></span>
                            <span class="text">새 배송지 등록</span>
                        </button>
                    </div>
                </div>

                <div class="tbl_col_wrap">
                    <table class="tbl_col_line">
                        <colgroup>
                            <col>
                            <col style="width: 174px;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td class="align_left">
                                    <div class="address_item">
                                        <div class="address_chk_box">
                                            <span class="form_rdo">
                                                <input type="radio" class="ip_rdo">
                                            </span>
                                        </div>
                                        <div class="address_info_box">
                                            <div class="address_name">
                                                <span class="name">이름 : xxx</span>
                                                <span class="badge_sm">
                                                    <span class="text">기본배송지</span>
                                                </span>
                                            </div>
                                            <div class="address_person">
                                                <span class="name">이름 : xxx /</span>
                                                <span class="phone_number">010-xxxx-xxxx</span>
                                            </div>
                                            <div class="address">[우편번호]xx도 xx시 xx동 xxxx xxxx아파트 xxx호</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="btn_wrap">
                                        <button class="btn_sm">
                                            <span class="ico_edit"></span>
                                            <span class="text">수정</span>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="delivery_btn_wrap">
                    <button class="btn_lg">
                        <span class="text">기본 배송지로 설정</span>
                    </button>
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