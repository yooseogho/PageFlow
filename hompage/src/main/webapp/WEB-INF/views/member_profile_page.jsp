<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_profile.css">
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
					<jsp:include page="/WEB-INF/views/include/member_info_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
                    <div class="title_wrap title_size_md">
                        <p class="title_heading">프로필 설정</p>
                    </div>
                    <div class="tbl_row_wrap">
                        <table class="tbl_row">
                            <colgroup>
                                <col style="width: 130px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="has_ip">
                                        <label for="nickname">기본</label>
                                        <span class="required"></span>
                                    </th>
                                    <td>
                                        <div class="valid_check">
                                            <div class="byte_check_wrap type_ip">
                                                <input type="text" id="nickname" class="form_ip" maxlength="10" oninput="this.value = this.value.replace(/[^ㄱ-ㅎ가-힣a-zA-Z0-9]/g, '').replace(/(\..*)\./g, '$1');" placeholder="2~10자 이내의 닉네임을 입력해주세요.">
                                                <div class="byte_check">
                                                    <span class="count">0</span>
                                                    <span class="total">10</span>
                                                </div>
                                            </div>
                                            <span class="valid_desc"></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        프로필 이미지
                                        <span class="required"></span>
                                    </th>
                                    <td>
                                        <div class="profile_thumb_box no_img" onclick="ga360.GA_Event('click_마이룸_PC', '상단', '', '프로필설정', '');">
                                            <div class="thumb_box">
                                            </div>
                                        </div>
                                        <div class="btn_wrap">
                                            <span class="btn_attach">
                                                <input type="file" id="uploadFileImg">
                                                <label for="uploadFileImg"><span class="ico_picture"></span>이미지 변경</label>
                                            </span>
                                            <button type="button" class="btn_sm btn_line_gray" id="deleteImg"><span class="ico_delete"></span><span class="text">삭제</span></button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p class="bul_item_dot font_size_xxs">
                        회원기본정보는 회원정보수정에서 변경 가능합니다.
                        <br><a href="https://mmbr.kyobobook.co.kr/member-info" class="btn_more_view fc_black"><span class="text">회원정보 수정으로 이동</span><span class="ico_arw"></span></a>
                    </p>
                    <div class="btn_wrap page_bottom">
                        <button type="button" class="btn_md btn_primary" id="regBtn"><span class="text">저장</span></button>
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