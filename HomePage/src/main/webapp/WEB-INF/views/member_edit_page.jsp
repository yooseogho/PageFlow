
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/css/member_edit.css">
<title>PageFlow</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="script/member_edit.js"></script>
<style>
.hidden {
	display: none;
}
</style>
</head>

<body>
	<div id="page">
		<header class="header_wrapper">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav class="nav_wrapper">
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>

		<main>
			<form action="changePass" method="post">
				<section class="contents_wrap">


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
										<th scope="row"><label for="id">아이디</label></th>
										<td><input type="hidden" id="memberId"
											value="${member.memberId}"> <span>${member.memberId}</span>

										</td>


									</tr>

									<tr>
										<th scope="row" class="has_btn_sm"><label for="newPw">
												<span>새 비밀번호</span>
										</label></th>
										<td>
											<div class="valid_check">
												<div class="form_ip_pw">
													<input type="password" placeholder="새 비밀번호를 입력해주세요."
														class="form_input" id="password" name="password">
												</div>
												<div class="pw_valid_wrap">
													<div class="valid_step_box"></div>
													<ul class="pw_valid_list">
														<li class="pw_valid_item1">영문, 숫자, 특수문자 3가지 조합 8자리 이상</li>
														<li class="pw_valid_item2">공백 및 3자 이상의 연속 또는 중복 문자는
															사용 불가</li>
													</ul>
													<span id="password-msg"></span>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" class="has_btn_sm"><label
											for="newPwConfirm">새 비밀번호 확인</label></th>
										<td>
											<div class="valid_check">
												<div class="form_ip_pw">
													<input type="password" placeholder="새 비밀번호를 입력해주세요."
														class="form_input" id="passwordCheck">
												</div>
												<span id="passwordCheck-msg"></span>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" class="has_btn_sm"><label for="name">이름</label>
										</th>
										<td>
											<div class="btn_text_box">
												<span class="black_text">${member.memberName }</span>
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
										<th scope="row">생년월일</th>
										<td><span class="black_text">${member.birthday }</span></td>
									</tr>
									<tr>
										<th scope="row" class="has_btn_sm">이메일</th>
										<td>
											<div class="btn_text_box">
												<span class="black_text">${member.memberEmail }</span>
												<button class="btn_text btn_ip" id="emailChangeButton">
													<span class="text">변경</span>
												</button>

												<div class="changeEmail_passwordCheck hidden">

													<input type="password" id="passwordEmaill"
														class="form_input" placeholder="비밀번호를 입력해 주세요.">
													<button type="button"
														class="btn_ip btn_line_primary mbr_event btn_light_gray"
														id="emailPasswordCheck">
														<span class="text">비밀번호 확인</span>
													</button>
													<br> <span id="emailPasswordCheck-msg"></span>
												</div>

												<div class="changeEmail hidden">
													<input type="email" id="changeEmail" class="form_input"
														placeholder="변경하실 이메일을 입력하세요">
													<button type="button"
														class="btn_ip btn_line_primary mbr_event btn_light_gray"
														id="changeEmail_btn">
														<span class="text">이메일 변경</span>
													</button>
													<br> <span id="changeEmail-msg"></span>
												</div>





											</div>


										</td>
									</tr>
									<tr>
										<th scope="row" class="has_btn_sm">휴대폰번호</th>
										<td>
											<div class="btn_text_box">
												<span class="black_text">${member.memberTel}</span>
												<button class="btn_text btn_ip" id="telChange_btn">
													<span class="text">변경</span>
												</button>
											</div>

											<div class="changeTel_passwordCheck hidden">
												<input type="password" id="passwordTel" class="form_input"
													placeholder="비밀번호를 입력해 주세요.">
												<button type="button" class="changeTelPassword_btn">
													<span class="text">비밀번호 확인</span>
												</button>
												<br> <span id="tellPasswordCheck-msg"></span>
											</div>

											<div class="changeTel hidden">
												<input type="text" id="changeTel" class="form_input"
													placeholder="변경하실 휴대폰 번호을 입력하세요">
												<button type="button" class="changeTel_btn"
													id="changeTel_btn">
													<span class="text">휴대폰 변경</span>
												</button>
												<br> <span id="changeTel-msg"></span>
											</div>
										</td>

									</tr>

								</tbody>
							</table>
							<table></table>
						</div>
						<ul class="list">
							<li class="list_items"><span>회원탈퇴 후 동일 아이디로 재가입이
									불가합니다.</span>
								<button class="quit_btn btn_ip" id="quit">회원탈퇴</button></li>
						</ul>
						<div class="inner_main_bottom">
							<button class="cancel_btn go_home">
								<span class="bottom_text">취소</span>
							</button>
							<button class="confirm_btn" id="edit">
								<span class="bottom_text">확인</span>
							</button>
						</div>


					</div>
				</section>
			</form>
		</main>
		<footer class="footer_wrapper">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>