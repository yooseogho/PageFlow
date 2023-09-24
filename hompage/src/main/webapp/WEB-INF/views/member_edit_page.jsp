<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_edit.css">
<title>Insert title here</title>
</head>
<body>
	 <div id="page">
        <header>
         	<jsp:include page="/WEB-INF/views/include/non_nav_header.jsp" />
        </header>

        <main>
            <section class="contents_wrap">
                <div class="contents_inner">
                    <div class="inner_header">
                        <p class="header_text">회원정보 수정</p>
                    </div>

                    <div class="inner_main">
                        <div class="inner_main_top">
                           <div class="main_top_top">    
                               <p class="main_top_title">회원정보 수정</p>
                           </div>
                           <div class="main_top_bottom">    
                               <p class="main_top_title">기본 정보</p>
                           </div>
                           
                            
                        </div>
                        <div class="inner_main_mid">
                            <table class="tbl_row">
                                <colgroup>
                                    <col style="width: 264px">
                                    <col style="width: auto">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <label for="id">아이디</label>
                                        </th>
                                        <td>
                                            <span class="black_text">아이디명</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="newPw">
                                                <span>새 비밀번호</span>
                                            </label>
                                        </th>
                                        <td>
                                            <div class="valid_check">
                                                <div class="form_ip_pw">
                                                    <input type="password" placeholder="새 비밀번호를 입력해주세요." class="form_input">
                                                </div>
                                                <div class="pw_valid_wrap">
                                                    <div class="valid_step_box">
                                                        <ol class="valid_step_list">
                                                            <li class="step_item"></li>
                                                            <li class="step_item"></li>
                                                            <li class="step_item"></li>
                                                        </ol>
                                                        <div class="bubble_speech_box">
                                                            <span class="valid_state">안전도</span>
                                                        </div>
                                                    </div>
                                                    <ul class="pw_valid_list">
                                                        <li class="pw_valid_item">영문, 숫자, 특수문자 3가지 조합 8자리 이상 또는 2가지 조합 10자리 이상</li>
                                                        <li class="pw_valid_item">공백 및 3자 이상의 연속 또는 중복 문자는 사용 불가</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="newPwConfirm">새 비밀번호 확인</label>
                                        </th>
                                        <td>
                                            <div class="valid_check">
                                                <div class="form_ip_pw">
                                                    <input type="password" placeholder="새 비밀번호를 입력해주세요." class="form_input">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_btn_sm">
                                            <label for="name">이름</label>
                                        </th>
                                        <td>
                                            <div class="btn_text_box">
                                                <span class="black_text">이름</span>
                                                <button class="btn_text"><span class="text">변경</span></button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
        
                            <table class="tbl_row">
                                <colgroup>
                                    <col style="width: 264px">
                                    <col style="width: auto">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">생년월일/성별</th>
                                        <td><span class="black_text">생년월일/성별</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_btn_sm">이메일</th>
                                        <td>
                                            <div class="btn_text_box">
                                                <span class="black_text">이메일@naver.com</span>
                                                <button class="btn_text"><span class="text">변경</span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_btn_sm">휴대폰번호</th>
                                        <td>
                                            <div class="btn_text_box">
                                                <span class="black_text">010-xxxx-xxxx</span>
                                                <button class="btn_text"><span class="text">변경</span></button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table></table>
                        </div>
                        <ul class="list">
                            <li class="list_items">
                                <span>회원탈퇴 후 동일 아이디로 재가입이 불가합니다.</span>
                                <a href="/탈퇴"><button class="quit_btn">회원탈퇴</button></a>
                            </li>
                        </ul>
                        <div class="inner_main_bottom">
                            <a href="/member_check_page"><button class="cancel_btn"><span class="bottom_text">취소</span></button></a>
                            <a href="/"><button class="confirm_btn"><span class="bottom_text">확인</span></button></a>
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