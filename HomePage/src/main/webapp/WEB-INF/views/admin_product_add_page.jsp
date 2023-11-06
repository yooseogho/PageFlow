<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_product_add.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	var jq = jQuery.noConflict(); // jQuery.noConflict()를 사용하여 $ 충돌 방지
	jq(document).ready(function() {
		var fontList = [ '맑은 고딕', '굴림', '돋움', '바탕', '궁서', 'NotoSansKR' ];
		jq('#summernote').summernote({
			height : 450,
			lang : "ko-KR",
			fontNames : fontList,
			fontNamesIgnoreCheck : fontList,
		});

		// RedirectAttribute을 이용한 에러 메세지 처리
		const msg = '${msg}';
		if (msg !== '') {
			alert(msg);
		}
	});
</script>
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
					<jsp:include page="/WEB-INF/views/include/admin_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
					<form action="/admin/book/add" method="post"
						enctype="multipart/form-data">
						<div class="admin_wrap">
							<div class="title_wrap title_size_lg">
								<p class="title_heading">상품 등록</p>
							</div>

							<div class="tbl_row_wrap">
								<table class="tbl_row">
									<colgroup>
										<col style="width: 160px;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="has_ip"><label for="book_type">책
													종류</label> <span class="required"> </span></th>
											<td>
												<div class="form_wrap">
													<div class="form_box">
														<div class="form_cont">
															<div class="valid_check w_full">
																<div class="form_sel_multi">
																	<div class="form_sel">
																		<select data-kbbfn-field="" id="mainBook"
																			title="책 유형 분류">
																			<option value="-1" selected="selected" disabled>책
																				종류를 선택해주세요</option>
																			<option value="110">소설</option>
																			<option value="120">만화</option>
																			<option value="130">참고도서</option>
																		</select>
																	</div>
																</div>
																<span class="valid_desc"></span>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="categoryCode">책
													장르</label> <span class="required"> </span></th>
											<td>
												<div class="form_wrap">
													<div class="form_box">
														<div class="form_cont">
															<div class="valid_check w_full">
																<div class="form_sel_multi">
																	<div class="form_sel">
																		<select data-kbbfn-field="" id="categoryCode"
																			title="책 장르 분류" name="categoryCode">
																			<option value="-1" selected="selected" disabled>책
																				장르를 선택해주세요</option>
																		</select>
																		<script>
																			// HTML 엘리먼트에 대한 참조 가져오기
																			var mainBook = document
																					.querySelector('#mainBook');
																			var categoryCode = document
																					.querySelector('#categoryCode');

																			// 책 종류 선택 시 실행할 이벤트 리스너 등록
																			mainBook
																					.addEventListener(
																							'change',
																							function() {
																								var selectedBook = mainBook.value;
																								var categoryOptions = categoryCode
																										.getElementsByTagName('option');

																								// "책 장르를 선택해주세요" 옵션을 제외한 모든 옵션 제거
																								for (var i = categoryOptions.length - 1; i > 0; i--) {
																									categoryCode
																											.removeChild(categoryOptions[i]);
																								}

																								// 선택한 책 종류에 따라 동적으로 옵션 추가
																								switch (selectedBook) {
																								case "110": // 소설
																									addCategoryOption(
																											"111",
																											"판타지소설");
																									addCategoryOption(
																											"112",
																											"공포/호러소설");
																									addCategoryOption(
																											"113",
																											"드라마/영화소설");
																									addCategoryOption(
																											"114",
																											"SF/과학소설");
																									addCategoryOption(
																											"115",
																											"로맨스소설");
																									break;
																								case "120": // 만화
																									addCategoryOption(
																											"121",
																											"웹툰");
																									addCategoryOption(
																											"122",
																											"요리만화");
																									addCategoryOption(
																											"123",
																											"액션만화");
																									addCategoryOption(
																											"124",
																											"학원만화");
																									break;
																								case "130": // 참고도서
																									addCategoryOption(
																											"131",
																											"중/고등참고서");
																									addCategoryOption(
																											"132",
																											"토익교재");
																									addCategoryOption(
																											"133",
																											"EBS교재");
																									break;
																								default:
																									// 선택한 책 종류가 없는 경우 또는 기본 선택 옵션일 경우
																									break;
																								}
																							});

																			// 책 장르 옵션을 추가하는 함수
																			function addCategoryOption(
																					value,
																					text) {
																				var option = document
																						.createElement('option');
																				option.value = value;
																				option.text = text;
																				categoryCode
																						.appendChild(option);
																			}
																		</script>
																	</div>
																</div>
																<span class="valid_desc"></span>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="bookTitle">책
													제목</label> <span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input data-kbbfn-field="" id="bookTitle" type="text"
																class="form_ip w_full" title="제목 입력" placeholder="제목"
																maxlength="50" name="bookTitle"> <span
																class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="bookIntro">책
													소개</label> <span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<div class="byte_check_wrap w_full">
																<textarea data-kbbfn-field="" id="bookIntro"
																	class="form_textarea" title="책 소개" placeholder="책 소개"
																	maxlength="3000" style="height: 246px;"
																	name="bookIntro"></textarea>
																<div class="byte_check_footer">
																	<div class="byte_check">
																		<span class="count">0</span><span class="total">3000</span>
																	</div>
																</div>
															</div>
															<span class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="bookContent">내용</label>
												<span class="required"> </span></th>
											<td>
												<div class="col_box">
													<div class="valid_check">
														<div class="byte_check_wrap w_full">
															<textarea id="summernote" name="bookContent"
																class="form_textarea" maxlength="3000"
																style="height: 246px;"></textarea>
															<div class="byte_check_footer">
																<div class="byte_check">
																	<span class="count">0</span><span class="total">3000</span>
																</div>
															</div>
														</div>
														<span class="valid_desc"></span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="authorName">작가명</label>
												<span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input data-kbbfn-field="" id="authorName" type="text"
																class="form_ip w_full" title="이름 입력" placeholder="작가명"
																maxlength="30" name="authorName"> <span
																class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="translator">옮긴이</label>
											</th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input data-kbbfn-field="" id="translator" type="text"
																class="form_ip w_full" title="이름 입력" placeholder="이름"
																maxlength="30" name="translator"> <span
																class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label
												for="publisherName">출판사명</label> <span class="required">
											</span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input data-kbbfn-field="" id="publisherName" type="text"
																class="form_ip w_full" title="출판사 이름 입력"
																placeholder="출판사명" maxlength="30" name="publisherName">
															<span class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="bookPrice">가격</label>
												<span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input data-kbbfn-field="" id="bookPrice" type="number"
																class="form_ip w_full" title="가격" placeholder="가격란"
																maxlength="10" name="bookPrice"> <span
																class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="publishDate">출판일</label>
												<span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input id="publishDate" type="date"
																class="form_ip w_full" title="날짜" name="publishDate">
															<span class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="stock">재고</label>
												<span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input id="stock" type="number" class="form_ip w_full"
																title="재고" maxlength="5" name="stock" placeholder="재고란">
															<span class="valid_desc"></span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr id="InquiryFileForm">
											<th scope="row" class="has_ip"><label for="bookImage">사진
													첨부</label> <span class="required"> </span></th>
											<td>
												<ul class="file_list">
													<li class="list_item"><span class="file_item">
															<span class="btn_box"> <input id="bookImage"
																type="file" name="bookImage" onchange="readURL(this);">
																<label for="bookImage" id="bookImageLabel"> <span
																	class="hidden">첨부파일 추가</span>
															</label>
														</span>
													</span> <span class="attach_img_box"> <span
															class="attach_img_view"><img id="preview"
																style="width: 100px; height: 100px;"></span>
													</span></li>
												</ul> <!-- 라벨 클릭 시 이미지 미리보기 --> <script>
													function readURL(input) {
														if (input.files
																&& input.files[0]) {
															var reader = new FileReader();
															reader.onload = function(
																	e) {
																document
																		.getElementById('preview').src = e.target.result;
															};
															reader
																	.readAsDataURL(input.files[0]);
														} else {
															document
																	.getElementById('preview').src = "";
														}

													}
												</script>
												<ul class="bul_list">
													<li class="bul_item_asterisk font_size_xxs">JPG, PNG,
														GIF 파일만 최대 1장 업로드 가능합니다.</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="btn_wrap page_bottom">
								<a href="/admin_page" class="btn_light_gray btn_lg"> <span
									class="text">취소</span>
								</a>
								<!-- 등록 버튼 -->
								<button data-kbbfn-form="inquiryForm" class="btn_primary btn_lg"
									id="add-book">
									<span class="text">등록</span>
								</button>
							</div>
						</div>
					</form>
				</section>
			</div>
		</main>
		<footer class="footer_wrapper">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>