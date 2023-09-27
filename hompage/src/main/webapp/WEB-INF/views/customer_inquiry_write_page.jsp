<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/customer_inquiry_write.css">
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
                   	<jsp:include page="/WEB-INF/views/include/customer_service_left_aside.jsp" />
                </aside>
                <section class="section_wrapper">
                    <div class="customer_wrap">
                        <div class="title_wrap title_size_lg">
                            <p class="title_heading">문의사항 답변</p>
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
                                                                        <option value="-1" selected="selected">문의 유형을 선택해 주세요.</option>
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
                                                        <input data-kbbfn-field="" id="InquiryTitle" type="text" class="form_ip w_full" title="제목 입력" placeholder="제목을 입력해 주세요." maxlength="30">
                                                        <span class="valid_desc"></span>
                                                    </div>
                                                </div>
                                                <div class="col_box">
                                                    <div class="valid_check">
                                                        <div class="byte_check_wrap w_full">
                                                            <textarea data-kbbfn-field="" id="InquiryContent" class="form_textarea" title="문의 내용 입력" placeholder="문의 유형을 먼저 선택 후 입력해주세요." maxlength="3000" style="height: 246px;"></textarea>
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
                                <p class="title_heading">문의에 대한 답변 등록 시 알려드립니다.</p>
                            </div>
                            <table class="tbl_row">
                                <colgroup>
                                    <col style="width: 160px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="InquiryPhoneNumber">연락처</label>
                                            <span class="required"></span>
                                        </th>
                                        <td>
                                            <div class="form_wrap">
                                                <div class="form_box">
                                                    <div class="form_cont">
                                                        <ul class="chk_row_list">
                                                            <li class="chk_row_item">
                                                                <span class="form_rdo">
                                                                    <input data-kbbfn-form="inquiryForm" data-kbbfn-field="" id="contactPhone1" name="InquiryPhoneType" type="radio" value="phone">
                                                                    <label for="contactPhone1">휴대폰번호</label>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="form_cont">
                                                        <div class="valid_check">
                                                            <input data-kbbfn-form="inquiryForm" data-kbbfn-field="" id="InquiryPhoneNumber" type="tel" class="form_ip" placeholder="-없이 입력해 주세요." title="연락처 입력" maxlength="30">
                                                            <span class="valid_desc"></span>
                                                        </div>
                                                        <span class="form_chk">
                                                            <input data-kbbfn-form="inquiryForm" data-kbbfn-field="" id="InquiryNotifyCheck" type="checkbox">
                                                            <label for="InquiryNotifyCheck">
                                                                <span>답변알림 요청</span>
                                                                <span class="fc_gray">(답변이 등록되면 알림톡으로 알려드립니다.)</span>
                                                            </label>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="has_ip">
                                            <label for="InquiryEmail">이메일</label>
                                        </th>
                                        <td>
                                            <div class="valid_check">
                                                <input data-kbbfn-form="inquiryForm" data-kbbfn-field="" id="InquiryEmail" type="email" class="form_ip" placeholder="이메일을 입력해 주세요." title="이메일 입력">
                                                <span class="valid_desc"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btn_wrap page_bottom">
                            <a href="/" class="btn_light_gray btn_lg">
                                <span class="text">취소</span>
                            </a>
                           
                                <button data-kbbfn-form="inquiryForm" data-kbbfn-submit="" type="button" class="btn_primary btn_lg" 
                                onclick="location.href=`/customer_inquiry_list_page`">
                                    <span class="text">문의접수</span>
                                </button>
                
                        </div>
                        <div class="info_text_box size_lg">
                            <div class="title_wrap title_size_xs">
                                <p class="title_heading">문의내용 답변 안내</p>
                            </div>
                            <ul class="bul_list">
                                <li class="bul_item_dot font_size_xxs">
                                    <span>답변은 마이룸 또는 회원정보에 등록된 이메일로 확인 가능합니다.</span>
                                </li>
                                <li class="bul_item_dot font_size_xxs">
                                    <span>
                                        당일 17시 이후 문의건과 공휴일 1:1 문의는 문의 유형과 이름/연락처/이메일 주소를 남겨 주시면 확인 후
                                        운영시간에 통지해 드립니다.
                                    </span>
                                </li>
                                <li class="bul_item_dot font_size_xxs">
                                    <span>정상근무일 기준이며, 통지예정일이 휴일인 경우 다음 정상 근무일에 진행 됩니다.</span>
                                </li>
                                <li class="bul_item_dot font_size_xxs">
                                    <span class="fw_bold">설/추석 연휴 기간 동안은 고객센터 휴무로 인해 1:1 문의 답변이 불가 합니다.</span>
                                </li>
                                <li class="bul_item_dot font_size_xxs">
                                    <span class="fw_bold">설/추석 연후 끝난 이후부터 순차적으로 답변드릴 예정이니 양해 부탁드립니다.</span>
                                </li>
                                <li class="bul_item_dot font_size_xxs">
                                    <span class="fw_bold">신학기(3월, 9월), 코로나로 인해 문의량이 급증하여 답변이 지연될 수 있습니다.</span>
                                </li>
                            </ul>
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