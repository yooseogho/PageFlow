<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_create.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
        <header>
            <div class="header_inner">
                <a href="/page" class="logo">LogoImage</a>
            </div>
        </header>

        <main class="container_wrapper">
            <section class="contents_wrap">
                <div class="title_wrap title_size_md has_line">
                    <p class="title_heading">회원가입</p>
                </div>
                <div class="title_wrap title_size_def">
                    <h2 class="title_heading">회원정보 입력</h2>
                    <div class="right_area">
                        <span class="required">
                            <span class="text">필수 입력</span>
                        </span>
                    </div>
                </div>
                <div class="form_wrap">
                    <form action="">
                        <div id="join_form_insert">

                            <div class="form_box">
                                <div class="form_title">
                                    <label for="formJoin01" class="form_label">
                                        아이디
                                        <span class="required">
                                            <span class="hidden">필수입력</span>
                                        </span>
                                    </label>
                                </div>

                                <div class="form_cont">
                                    <div class="valid_check">
                                        <div class="awesomplete">
                                            <input type="text" class="form_ip" id="formJoin01" placeholder="아이디를 입력해 주세요." maxlength="50" data-autocomplete="" autocomplete="off" aria-expanded="false" aria-owns="awesomplete_list_1" role="combobox">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form_box">
                                <div class="form_title">
                                    <label for="formJoin02" class="form_label">
                                        비밀번호
                                        <span class="required">
                                            <span class="hidden">필수입력</span>
                                        </span>
                                    </label>
                                </div>

                                <div class="form_cont">
                                    <div class="form_ip_pw">
                                        <input type="password" class="form_ip" placeholder="비밀번호를 입력해 주세요." id="formJoin02" maxlength="15">
                                        <button type="button" class="btn_toggle_pw"></button>
                                    </div>
                                    <div class="pw_valid_wrap">
                                        <div class="valid_step_box">
                                            <ol class="valid_step_list">
                                                <li class="step_item"><span class="hidden">안전도 낮음</span></li>
                                                <li class="step_item"><span class="hidden">안전도 보통</span></li>
                                                <li class="step_item"><span class="hidden">안전도 높음</span></li>
                                            </ol>
                                            <div class="bubble_speech_box">
                                                <span class="valid_state">안전도</span>
                                            </div>
                                        </div>

                                        <ul class="pw_valid_list">
                                            <li class="pw_valid_item">영문, 숫자, 특수문자 3가지 조합 8자리 이상 또는<br>2가지 조합 10자리 이상</li>
                                            <li class="pw_valid_item">공백 및 3자 이상의 연속 또는 중복 문자는 사용 불가</li>
                                            <li class="pw_valid_item" style="display: none;">생일, 전화번호, 아이디 등 개인신상 정보 사용 불가</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="form_box">
                                <div class="form_title">
                                    <label for="formJoin03" class="form_label">
                                        비밀번호 확인
                                        <span class="required">
                                            <span class="hidden">필수입력</span>
                                        </span>
                                    </label>
                                </div>

                                <div class="form_cont">
                                    <div class="valid_check">
                                        <div class="form_ip_pw">
                                            <input type="password" class="form_ip" placeholder="비밀번호를 한 번 더 입력해 주세요." id="formJoin03" maxlength="15">
                                            <button type="button" class="btn_toggle_pw"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form_box">
                                <div class="form_title">
                                    <label for="formJoin04" class="form_label">
                                        이름
                                        <span class="required">
                                            <span class="hidden">필수입력</span>
                                        </span>
                                    </label>
                                </div>

                                <div class="form_cont">
                                    <div class="valid_check success">
                                        <input type="text" class="form_ip" id="formJoin04" placeholder="이름을 입력해 주세요.">
                                    </div>
                                </div>
                            </div>

                            <div class="form_box">
                                <div class="form_title">
                                    <label for="formJoin07" class="form_label">
                                        휴대폰번호
                                        <span class="required">
                                            <span class="hidden">필수입력</span>
                                        </span>
                                    </label>
                                </div>

                                <div class="form_cont">
                                    <div class="form_col_group">
                                        <div class="col_box">
                                            <div class="valid_check">
                                                <div class="input_btn_box">
                                                    <input type="text" maxlength="13" id="formJoin07" class="form_ip" placeholder="숫자만 입력해 주세요.">
                                                    <button type="button" class="btn_ip btn_light_gray" style="display: none;"><span class="text">인증번호 발송</span></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col_box">
                                            <div class="valid_check">
                                                <div class="input_btn_box">
                                                    <div class="time_limit">
                                                        <input type="number" class="form_ip" title="인증번호 입력" placeholder="인증번호 6자리">
                                                        <span class="time_count">03:00</span>
                                                    </div>
                                                    <button type="button" class="btn_ip btn_line_primary"><span class="text">인증번호 확인</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form_box">
                                <div class="form_title">
                                    <label for="formJoin08" class="form_label">
                                        이메일
                                        <span class="required">
                                            <span class="hidden">필수입력</span>
                                        </span>
                                    </label>
                                </div>

                                <div class="form_cont">
                                    <div class="form_col_group">
                                        <div class="col_box">
                                            <div class="valid_check success">
                                                <div class="input_btn_box">
                                                    <div class="awesomplete">
                                                        <input type="email" id="formJoin08" class="form_ip" placeholder="이메일을 입력해 주세요." data-autocomplete="85" autocomplete="off" aria-expanded="false" aria-owns="awesomplete_list_2" role="combobox">
                                                    </div>
                                                    <button type="button" data-email="formJoin08" class="btn_ip btn_primary"><span class="text">인증번호 발송</span></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col_box">
                                            <div class="valid_check">
                                                <div class="input_btn_box">
                                                    <div class="time_limit">
                                                        <input type="number" class="form_ip" title="인증번호 입력" placeholder="인증번호 6자리" maxlength="6">
                                                        <span class="time_count">10:00</span>
                                                    </div>
                                                    <button type="button" class="btn_ip btn_line_primary"><span class="text">인증번호 확인</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form_box">
                                <div class="form_title">
                                    <label for="formJoin06" class="form_label">
                                        생년월일/성별
                                        <span class="required">
                                            <span class="hidden">필수입력</span>
                                        </span>
                                    </label>
                                </div>

                                <div class="form_cont">
                                    <div class="valid_check">
                                        <div class="input_btn_box">
                                            <input type="text" maxlength="8" id="formJoin06" class="form_ip" placeholder="생년월일 8자리를 입력해 주세요.">
                                            <div class="form_filter_box">
                                                <span class="form_filter">
                                                    <input id="rdoFilter02" type="radio" name="rdoFilter">
                                                    <label for="rdoFilter02"><span class="text">남</span></label>
                                                </span>
                                                <span class="form_filter">
                                                    <input id="rdoFilter01" type="radio" name="rdoFilter">
                                                    <label for="rdoFilter01"><span class="text">여</span></label>
                                                </span>
                                            </div>
                                        </div>
                                        <span id="gender_valid" class="valid_desc">성별을 선택해 주세요.</span>
                                        <span class="valid_desc fir">생년월일 8자리를 입력해 주세요.</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
                <div class="btn_wrap justify page_bottom" id="joinComplete">
                	<a href="/member_create_success_page" style="width: 100%;">
	                    <button class="btn_lg btn_primary" style="width: 100%;">
	                        <span class="text">회원가입</span>
	                    </button>
	                </a>
                </div>
            </section>
        </main>
		<footer>
			<jsp:include page="/WEB-INF/views/include/copy_right_footer.jsp" />
		</footer>
	</div>
</body>
</html>