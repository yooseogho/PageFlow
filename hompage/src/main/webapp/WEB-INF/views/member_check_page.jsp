<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_check.css">
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
                <a href="/member_info_page"><button class="h_button">내정보 보기</button></a>
                <a href="/member_grade_page"><button class="h_button">회원등급 혜택</button></a>
                <button class="h_button">로그아웃</button>
                <a href="#"><button class="h_button">고객센터</button></a>
            </div>
        </header>

        <main>
            <section class="contents_wrap">
                <div class="contents_inner">
                    <div class="inner_header">
                        <p class="header_text">회원정보 수정</p>
                    </div>

                    <div class="inner_main">
                        <div class="inner_main_top">
                            <p class="main_top_title">비밀번호 확인</p>
                            <span class="info_text">안전한 개인정보보호를 위해 비밀번호를 입력해 주세요.</span>
                        </div>
                        <div class="inner_main_mid">
                            <table class="tbl_row">
                                <colgroup>
                                    <col style="width: 112px">
                                    <col style="width: auto">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="password">비밀번호</label>
                                        </th>
                                        <td>
                                            <div class="valid_check">
                                                <div class="form_ip_pw">
                                                    <input type="password" placeholder="비밀번호를 입력해 주세요">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="inner_main_bottom">
                            <a href="member_edit_page"><button class="btn"><span class="text">확인</span></button></a>
                        </div>
                    </div>

                </div>
            </section>
        </main>
        <footer class="footer_wrapper">
            <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </footer>
    </div>
</body>
</html>