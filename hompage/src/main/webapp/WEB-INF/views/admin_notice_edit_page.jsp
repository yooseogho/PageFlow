<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_notice_write.css">
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
	
	    jq('form').on('submit', function(e) {
	        var noticeTitle = jq('#noticeTitle').val();
	        var noticeContent = jq('#summernote').summernote('code');
	
	        if (!noticeTitle || noticeTitle.trim().length < 1) {
	            alert('제목을 입력해주세요.');
	            e.preventDefault();
	            return false;
	        }
	
	       if (!noticeContent || noticeContent.trim().length < 1 || noticeContent == '<p><br></p>') { // summernote default empty value is '<p><br></p>'
	           alert('내용을 입력해주세요.');
	           e.preventDefault();
	           return false;
	       }
	
	       alert('공지사항 작성되었습니다.');
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
					<div class="admin_wrap">
						<div class="title_wrap title_size_lg">
							<p class="title_heading">공지사항 수정</p>
							<!-- 제목 변경 -->
						</div>

						<form action="/admin_notice_edit_page/${notice.nno}" method="post">
							<!-- action 경로 변경 -->
							<div class="tbl_row_wrap">

								<table class="tbl_row">
									<colgroup>
										<col style="width: 160px;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="has_ip"><label for="notice-title">제목</label>
												<span class="required"> </span></th>
											<td>
												<div class="col_box">
													<div class="valid_check">
														<input name='noticeTitle' id='noticeTitle' type='text'
															class='form_ip w_full' title='제목입력'
															placeholder='제목을 입력해 주세요.' maxlength='30'
															value="${notice.noticeTitle}">
														<!-- value 추가 -->

													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="has_ip"><label for="summernote">내용</label>
												<span class="required"> </span></th>
											<td>
												<div class="form_col_group w_full">
													<div class="col_box">
														<div class="valid_check">
															<div class="byte_check_wrap w_full">
																<textarea data-kbbfn-field="" name="noticeContent"
																	id="summernote" class="form_textarea" title="공지 내용 입력"
																	placeholder="공지할 내용을 입력해주세요." maxlength="3000"
																	style="height: 246px;">${notice.noticeContent}</textarea>
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
									</tbody>
								</table>

							</div>

							<div class="btn_wrap page_bottom">

								<a href="/notices/${notice.nno}" class="btn_light_gray btn_lg"><span
									class="text"> 취소 </span></a>
								<!-- 취소 버튼 링크 변경 -->

								<button type="submit" class="btn_primary btn_lg">
									<span class="text"> 공지사항 저장 </span>
								</button>
								<!-- 버튼 텍스트 변경 -->
							</div>
						</form>
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