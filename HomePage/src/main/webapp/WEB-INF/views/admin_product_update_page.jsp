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
	/** summerNote 사용하기 위한 script */
	var jq = jQuery.noConflict(); // jQuery.noConflict()를 사용하여 $ 충돌 방지
	jq(document).ready(function() {
		var fontList = [ '맑은 고딕', '굴림', '돋움', '바탕', '궁서', 'NotoSansKR' ];
		jq('#summernote').summernote({
			height : 450,
			lang : "ko-KR",
			fontNames : fontList,
			fontNamesIgnoreCheck : fontList,
		});

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
					<form action="/admin/book/update/${bno}" method="post"
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
																			<option value="-1"
																				${(book.categoryCode == -1) ? 'selected' : ''}>책
																				장르를 선택해주세요</option>
																			<option value="111"
																				${(book.categoryCode == 111) ? 'selected' : ''}>판타지소설</option>
																			<option value="112"
																				${(book.categoryCode == 112) ? 'selected' : ''}>호러/공포소설</option>
																			<option value="113"
																				${(book.categoryCode == 113) ? 'selected' : ''}>드라마/영화소설</option>
																			<option value="114"
																				${(book.categoryCode == 114) ? 'selected' : ''}>SF/과학소설</option>
																			<option value="115"
																				${(book.categoryCode == 115) ? 'selected' : ''}>로맨스소설</option>
																			<option value="121"
																				${(book.categoryCode == 121) ? 'selected' : ''}>웹툰</option>
																			<option value="122"
																				${(book.categoryCode == 122) ? 'selected' : ''}>요리만화</option>
																			<option value="123"
																				${(book.categoryCode == 123) ? 'selected' : ''}>액션만화</option>
																			<option value="124"
																				${(book.categoryCode == 124)?  'selected' : '' }>학원만화</option>
																			<option value="125"
																				${(book.categoryCode == 125)?  'selected' : '' }>판타지만화</option>
																			<option value="131"
																				${(book.categoryCode == 131)?  'selected' : '' }>중/고등참고서</option>
																			<option value="132"
																				${(book.categoryCode == 132)?  'selected' : '' }>토익교재</option>
																			<option value="133"
																				${(book.categoryCode == 133)?  'selected' : '' }>EBS교재</option>
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
											<th scope="row" class="has_ip"><label for="bookTitle">책
													제목</label> <span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<input data-kbbfn-field="" id="bookTitle" type="text"
																class="form_ip w_full" title="제목 입력" placeholder="제목"
																maxlength="50" name="bookTitle"
																value="${book.bookTitle}"> <span
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
																	name="bookIntro">${book.bookIntro}</textarea>
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
																style="height: 246px;">${book.bookContent}</textarea>
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
																maxlength="30" name="authorName"
																value="${book.authorName}"> <span
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
																maxlength="30" name="translator"
																value="${book.translator}"> <span
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
																placeholder="출판사명" maxlength="30" name="publisherName"
																value="${book.publisherName}"> <span
																class="valid_desc"></span>
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
																maxlength="10" name="bookPrice"
																value="${book.bookPrice}"> <span
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
																class="form_ip w_full" title="날짜" name="publishDate"
																value="${book.publishDate}"> <span
																class="valid_desc"></span>
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
																title="재고" maxlength="5" name="stock" placeholder="재고란"
																value="${book.stock}"> <span class="valid_desc"></span>
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
																type="file" name="bookImage" onchange="readURL(this);"
																value="${book.bookImage}"> <label
																for="bookImage" id="bookImageLabel"> <span
																	class="hidden">첨부파일 추가</span>
															</label>
														</span>
													</span> <span class="attach_img_box"> <span
															class="attach_img_view"><img
																src="/category/${book.bookImage}" id="preview"
																style="width: 100px; height: 100px;"></span>
													</span></li>
												</ul> <!-  라벨 클릭 시 이미지 미리보기 --> <script>
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
								<button data-kbbfn-form="inquiryForm" class="btn_primary btn_lg">
									<span class="text">수정</span>
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