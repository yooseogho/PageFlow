<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_product_add.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<title>(관리자)상품 등록</title>
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
                                        <th scope="row" class="has_ip">
                                            <label for="book_type">책 종류</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_wrap">
                                                <div class="form_box">
                                                    <div class="form_cont">
                                                        <div class="valid_check w_full">
                                                            <div class="form_sel_multi">
                                                                <div class="form_sel">
                                                                    <select data-kbbfn-field="" id="InquiryQuestList" title="책 유형 분류">
                                                                        <option value="-1" selected="selected">책 종류를 선택해주세요</option>
                                                                        <option value="000">소설</option>
                                                                        <option value="001">만화</option>
                                                                        <option value="002">참고도서</option>
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
                                        <th scope="row" class="has_ip">
                                            <label for="book_genre">책 장르</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_wrap">
                                                <div class="form_box">
                                                    <div class="form_cont">
                                                        <div class="valid_check w_full">
                                                            <div class="form_sel_multi">
                                                                <div class="form_sel">
                                                                    <select data-kbbfn-field="" id="book_genre" title="책 장르 분류">
                                                                        <option value="-1" selected="selected">책 장르를 선택해주세요</option>
                                                                        <option value="000">판타지소설</option>
                                                                        <option value="001">로맨스소설</option>
                                                                        <option value="002">SF/과학소설</option>
                                                                        <option value="003">공포/호러소설</option>
                                                                        <option value="004">드라마/영화소설</option>
                                                                        <option value="005">웹툰</option>
                                                                        <option value="006">요리만화</option>
                                                                        <option value="007">액션/무협만화</option>
                                                                        <option value="008">학원만화</option>
                                                                        <option value="009">중/고등참고서</option>
                                                                        <option value="010">토익교재</option>
                                                                        <option value="011">EBS교재</option>
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
                                        <th scope="row" class="has_ip">
                                            <label for="bookTitle">책 제목</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="bookTitle" type="text" class="form_ip w_full" title="제목 입력" placeholder="제목" maxlength="50">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <div class="byte_check_wrap w_full">
                                                            <textarea data-kbbfn-field="" id="InquiryContent" class="form_textarea" title="문의 내용 입력" placeholder="책 소개" maxlength="200" style="height: 246px;"></textarea>
                                                            <div class="byte_check_footer">
                                                                <div class="byte_check"><span class="count">0</span><span class="total">200</span></div>
                                                            </div>
                                                        </div>
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="InquiryTitle">내용</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                          <div class="col_box">
                                             <div class="valid_check">
                                                 <div class="byte_check_wrap w_full">
                                                     <textarea id="summernote" name="content" class="form_textarea" title="답변 내용 입력"  maxlength="3000" style="height: 246px;"></textarea>
                                                     <div class="byte_check_footer">
                                                         <div class="byte_check"><span class="count">0</span><span class="total">3000</span></div>
                                                     </div>
                                                 </div>
                                                 <span class="valid_desc"></span>
                                             </div>
                                          </div>
                                      </td>
                                     </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="authorName">작가명</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="authorName" type="text" class="form_ip w_full" title="이름 입력" placeholder="이름" maxlength="30">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="translator">옮긴이</label>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="translator" type="text" class="form_ip w_full" title="이름 입력" placeholder="이름" maxlength="30">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="publisherName">출판사명</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="publisherName" type="text" class="form_ip w_full" title="출판사 이름 입력" placeholder="출판사명" maxlength="30">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="bookPrice">가격</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="bookPrice" type="text" class="form_ip w_full" title="가격" placeholder="가격란" maxlength="10">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="publishDate">출판일</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="publishDate" type="date" class="form_ip w_full" title="날짜">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="stock">재고</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="stock" type="text" class="form_ip w_full" title="재고" maxlength="5">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="InquiryFileForm">
                                        <th scope="row" class="has_ip">
                                            <label for="book_image">사진 첨부</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <ul class="file_list">
                                                <li class="list_item">
                                                    <span class="file_item">
                                                        <span class="btn_box">
                                                            <input id="book_image" type="file">
                                                            <label for="book_image">
                                                                <span class="hidden">첨부파일 추가</span>
                                                            </label>
                                                            <span class="attach_img_box">
                                                                <span class="attach_img_view"></span>
                                                                <button class="btn_remove_img" type="button">
                                                                    <span class="hidden">첨부파일 삭제</span>
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </span>
                                                </li>
                                            </ul>
                                            <ul class="bul_list">
                                                <li class="bul_item_asterisk font_size_xxs">JPG, PNG, GIF 파일만 최대 1장 업로드 가능합니다.</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    
                        <div class="btn_wrap page_bottom">
                            <a href="/admin_page" class="btn_light_gray btn_lg">
                                <span class="text">취소</span>
                            </a>
                            <button data-kbbfn-form="inquiryForm" data-kbbfn-submit="" type="button" class="btn_primary btn_lg" onclick="location.href='/admin_product_list_page'">
                                <span class="text">등록</span>
                            </button>
                        </div>
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