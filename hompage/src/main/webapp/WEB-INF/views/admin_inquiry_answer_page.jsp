<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_inquiry_answer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
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
	});
</script>
</head>
<body>
	<div id="page">
		<header class="header_wrapper">
			<div class="service_mall_wrap">
		<div class="service_mall_inner">
			<div class="customer_service_box">
				<ul class="customer_service_list">
					<li class="customer_service_item"><a
						href="/member_create_page" class="util_link">회원가입</a></li>
					<li class="customer_service_item"><a class="util_link"
						href="member_login_page">로그인</a></li>
					<li class="customer_service_item member_benefit">
						<button type="button" class="btn_member_benefit"
							onclick="location.href=`/member_grade_page`">
							<span class="text">회원혜택</span>
						</button>
					</li>
					<li class="customer_service_item"><a
						href="/customer_service_page" class="util_link">고객센터</a></li>
				</ul>
			</div>
		</div>
	</div>
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
                    <div class="customer_wrap">
                        <div class="title_wrap title_size_lg">
                            <p class="title_heading">고객 문의사항</p>
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
                                            <label for="InquiryQuestList-button">문의유형</label>
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
                                                                    <select data-kbbfn-field="" id="InquiryQuestList" title="문의유형 분류">
                                                                        <option value="-1" selected="selected">문의 유형</option>
                                                                        <option value="000">배송/수령예정일안내</option>
                                                                        <option value="001">주문/결제</option>
                                                                        <option value="002">검색 기능 관련</option>
                                                                        <option value="003">반품/교환/환불</option>
                                                                        <option value="004">도서/상품정보</option>
                                                                        <option value="005">회원정보서비스</option>
                                                                        <option value="006">웹사이트 이용 관련</option>
                                                                        <option value="007">시스템불편사항</option>
                                                                        <option value="012">택배사사례</option>
                                                                        <option value="013">고객제안/친절불친절</option>
                                                                        <option value="014">파본/상품불량신고</option>
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
                                            <label for="InquiryTitle">내용</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="InquiryTitle" type="text" class="form_ip w_full" title="제목 입력" placeholder="제목" maxlength="30">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <div class="byte_check_wrap w_full">
                                                            <textarea data-kbbfn-field="" id="InquiryContent" class="form_textarea" title="문의 내용 입력" placeholder="문의 내용" maxlength="500" style="height: 246px;"></textarea>
                                                            <div class="byte_check_footer">
                                                                <div class="byte_check"><span class="count">0</span><span class="total">3000</span></div>
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

                        <div class="tbl_row_wrap">
                            <div class="title_wrap title_size_sm">
                                <p class="title_heading">문의 사항 답변</p>
                            </div>
                            
                            <table class="tbl_row">
                                <colgroup>
                                    <col style="width: 160px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="InquiryTitle">제목</label>
                                            <span class="required">
                                            </span>
                                        </th>
                                        <td>
                                            <div class="form_col_group w_full">
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <input data-kbbfn-field="" id="InquiryTitle" type="text" class="form_ip w_full" title="제목 입력" placeholder="제목을 입력해 주세요." maxlength="30">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                            </div>
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
                                </tbody>
                            </table>
                            
                        </div>
                        <div class="btn_wrap page_bottom">
                            <a href="/" class="btn_light_gray btn_lg">
                                <span class="text">취소</span>
                            </a>
                            	<button data-kbbfn-form="inquiryForm" data-kbbfn-submit="" type="button" class="btn_primary btn_lg"
                            	onclick="location.href='/'">
                                	<span class="text">답변 완료</span>
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