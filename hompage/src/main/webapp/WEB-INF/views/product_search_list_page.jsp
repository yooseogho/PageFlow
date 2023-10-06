<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/product_search_list.css">
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
		<main class="container_wrapper">
            <section class="contents_wrap">
                <div class="contents_inner">
                    <div class="search_result_top">
                        <div class="title_wrap title_size_lg">
                            <h1 class="title_heading">
                                <span class="fc_green">'<span class="search_value">xx</span>'</span>에 대한 검색 결과
                            </h1>

                        </div>

                        <div class="tab_wrap type_line justify ui-tabs ui-corner-all ui-widget ui-widget-content">

                            <div id="tabSearch" class="tab_content ui-tabs-panel ui-corner-bottom ui-widget-content">
                                <div class="search_result_wrap">
                                    <div class="filter_area">
                                        <div class="title_wrap title_size_def">
                                            <p class="title_heading">필터</p>
                                        </div>

                                        <div class="filter_list_box" style="display: block">
                                            <ul class="filter_list">

                                                <!-- 가격 필터 영역 -->
                                                <li class="menu_item item_depth1">
                                                    <button type="button" class="btn_filter_depth1"><span class="text">가격</span></button>
                                                    <div class="filter_cont_box">
                                                        <ul class="filter_list depth2">
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterPrice_01" type="radio" name="filterPrice" value="0~1">
                                                                    <label for="filterPrice_01">~1만원</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterPrice_02" type="radio" name="filterPrice" value="1~3">
                                                                    <label for="filterPrice_02">1만원~3만원</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterPrice_03" type="radio" name="filterPrice" value="3~10">
                                                                    <label for="filterPrice_03">3만원~10만원</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterPrice_04" type="radio" name="filterPrice" value="10~99999999">
                                                                    <label for="filterPrice_04">10만원~</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <div class="price_range_wrap">
                                                                    <div class="col_box">
                                                                        <input type="text" class="form_ip" name="saprminFilter" id="saprminFilter" val="" maxlength="8" placeholder="0" title="최저 금액 입력" onkeyup="inputNumberFormat(this)">
                                                                        <span class="gap">~</span>
                                                                    </div>
                                                                    <div class="col_box">
                                                                        <div class="input_btn_box">
                                                                            <input type="text" class="form_ip" name="saprmaxFilter" id="saprmaxFilter" val="" maxlength="8" title="최대 금액 입력" placeholder="607,720" onkeyup="inputNumberFormat(this)">
                                                                            <button type="button" class="btn_sm btn_line_primary" onclick="searchFilterSaprText()"><span class="text">적용</span></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>

                                                <!-- 발행일 필터 영역 -->
                                                <li class="menu_item item_depth1">
                                                    <button type="button" class="btn_filter_depth1"><span class="text">발행일</span></button>
                                                    <div class="filter_cont_box">
                                                        <ul class="filter_list depth2">
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterRlseDate_ALL" type="radio" name="filterRlseDateRdo" value="" checked="checked">
                                                                    <label for="filterRlseDate_ALL">전체</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterRlseDate_3M" type="radio" name="filterRlseDateRdo" value="3M">
                                                                    <label for="filterRlseDate_3M">3개월 이내</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterRlseDate_6M" type="radio" name="filterRlseDateRdo" value="6M">
                                                                    <label for="filterRlseDate_6M">6개월 이내</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterRlseDate_1Y" type="radio" name="filterRlseDateRdo" value="1Y">
                                                                    <label for="filterRlseDate_1Y">1년 이내</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterRlseDate_3Y" type="radio" name="filterRlseDateRdo" value="3Y">
                                                                    <label for="filterRlseDate_3Y">3년 이내</label>
                                                                </span>
                                                            </li>
                                                            <li class="menu_item item_depth2">
                                                                <span class="form_rdo">
                                                                    <input id="filterRlseDate_5Y" type="radio" name="filterRlseDateRdo" value="5Y">
                                                                    <label for="filterRlseDate_5Y">5년 이내</label>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <!-- 상품 결과 영역 -->
                                    <div class="result_area">
                                        <div class="list_result_wrap">
                                            <p class="result_count">전체 <b class="fc_green">xx</b>건</p>
                                            <div class="right_area">
                                                <div class="item_group">
                                                    <button type="button" class="btn_sm btn_line_gray">
                                                        <span class="ico_cart"></span><span class="text">장바구니 담기</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- 상품들 리스트 영역 -->
                                        <div class="switch_prod_wrap view_type_list" id="shopData_list">
                                            <ul class="prod_list">

                                                <!-- 상품 1 영역 -->
                                                <li class="prod_item">
                                                    <span class="form_chk no_label">
                                                        <input class="result_checkbox spec_checkbox" id="chkSearch_S000200429481" type="checkbox" data-name="2023 해커스 토익 실전 1000제 1 RC Reading(리딩) 토익문제집">
                                                        <label for="chkSearch_S000200429481"><span class="hidden">상품선택</span></label>
                                                    </span>

                                                    <!-- 상품 이미지 & 정보 영역 -->
                                                    <div class="prod_area horizontal">
                                                        <!-- 상품1의 이미지 영역 -->
                                                        <div class="prod_thumb_box size_lg">
                                                            <a href="/product_read_page" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="2023 해커스 토익 실전 1000제 1 RC Reading(리딩) 토익문제집" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788965425052.jpg">
                                                                </span>
                                                            </a>
                                                        </div>

                                                        <!-- 상품의 소개 영역 -->
                                                        <div class="prod_info_box">
                                                            <!-- 상품의 이름 -->
                                                            <div class="auto_overflow_wrap prod_name_group">
                                                                <div class="auto_overflow_contents">
                                                                    <div class="auto_overflow_inner">
                                                                        <a href="/product_read_page" class="prod_info">
                                                                            <span class="prod_category">[국내도서]</span>
                                                                            <span id="cmdtName_S000200429481">2023 해커스 토익 실전 1000제 1 RC Reading(리딩) 토익문제집</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품 설명 -->
                                                            <div class="prod_desc_info">
                                                                <span class="prod_desc">
                                                                    최신 토익 리딩 실전기출유형 토익 문제집｜최신기출유형 100% 반영｜무료 동영상강의 제공 무료 Part 5&amp;6 해설ㅣ무료 온라인 실전모의고사
                                                                    <span class="gap"> | </span>
                                                                </span>
                                                                <span class="prod_desc normal">5판</span>
                                                            </div>

                                                            <!-- 상품의 작가 소개 -->
                                                            <div class="prod_author_info">
                                                                <div class="auto_overflow_wrap prod_author_group">
                                                                    <div class="auto_overflow_contents">
                                                                        <div class="auto_overflow_inner">
                                                                            <a href="/author_book_page" class="author rep">해커스 어학연구소</a>
                                                                            <span class="type">저자(글)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품의 출판사 소개 -->
                                                            <div class="prod_publish">
                                                                <a href="/publisher_page" class="text">해커스어학연구소</a>
                                                                <span class="gap">·</span>
                                                                <span class="date">2023년 01월 02일</span>
                                                            </div>

                                                            <!-- 상품의 가격 및 적립 정보 -->
                                                            <div class="prod_price">
                                                                <span class="price_normal">
                                                                    <span class="text">정가</span>
                                                                    <span class="val">11,900원</span>
                                                                </span>
                                                                <span class="gap">|</span>
                                                                <span class="point">
                                                                    590p
                                                                    <span class="rate">(5%)</span>
                                                                </span>

                                                            </div>

                                                            <!-- 리뷰 영역 -->
                                                            <div class="prod_bottom">
                                                                <span class="review_klover_box">
                                                                    <span class="review_klover_text font_size_xxs">9.68</span>
                                                                    <span class="review_desc">(131개의 리뷰)</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- 예상 배송 날짜 입력란 -->
                                                    <div class="prod_order_state">
                                                        <span class="badge_sm badge_pill badge_primary">
                                                            <span class="text">배송</span>
                                                        </span>
                                                        <p class="order_state_desc">주문 시<br> <span class="fw_bold">3일 후 </span><br>도착예정</p>
                                                    </div>

                                                    <!-- 장바구니 or 바로구매 버튼 영역 -->
                                                    <div class="prod_btn_wrap">
                                                        <div class="btn_wrap full">
                                                            <a href="/cart_page" class="btn_sm btn_light_gray"><span class="text">장바구니</span></a>
                                                            <a href="/order_page" class="btn_sm btn_primary"><span class="text">바로구매</span></a>
                                                        </div>
                                                    </div>

                                                </li>

                                                <!-- 상품 2 영역 -->
                                                <li class="prod_item">
                                                    <span class="form_chk no_label">
                                                        <input class="result_checkbox spec_checkbox" id="chkSearch_S000200429491" type="checkbox" data-name="2023 해커스 토익 실전 1000제 1 LC Listening(리스닝) 토익문제집">
                                                        <label for="chkSearch_S000200429491"><span class="hidden">상품선택</span></label>
                                                    </span>

                                                    <!-- 상품 이미지 & 정보 영역 -->
                                                    <div class="prod_area horizontal">
                                                        <!-- 상품의 이미지 영역 -->
                                                        <div class="prod_thumb_box size_lg">
                                                            <a href="/product_read_page" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="2023 해커스 토익 실전 1000제 1 LC Listening(리스닝) 토익문제집" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788965425076.jpg">
                                                                </span>
                                                            </a>
                                                        </div>

                                                        <!-- 상품의 소개 영역 -->
                                                        <div class="prod_info_box">
                                                            <!-- 상품의 이름 -->
                                                            <div class="auto_overflow_wrap prod_name_group">
                                                                <div class="auto_overflow_contents">
                                                                    <div class="auto_overflow_inner">
                                                                        <a href="/product_read_page" class="prod_info">
                                                                            <span class="prod_category">[국내도서]</span>
                                                                            <span id="cmdtName_S000200429491">2023 해커스 토익 실전 1000제 1 LC Listening(리스닝) 토익문제집</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품 설명 -->
                                                            <div class="prod_desc_info">
                                                                <span class="prod_desc">
                                                                    최신 토익 리스닝 실전 기출유형 토익 문제집｜최신기출유형 100% 반영｜무료 동영상강의 제공 교재 실전용+복습용 MP3 무료제공ㅣ온라인 실전모의고사 무료 제공
                                                                    <span class="gap"> | </span>
                                                                </span>
                                                                <span class="prod_desc normal">5판</span>
                                                            </div>

                                                            <!-- 상품의 작가 소개 -->
                                                            <div class="prod_author_info">
                                                                <div class="auto_overflow_wrap prod_author_group">
                                                                    <div class="auto_overflow_contents">
                                                                        <div class="auto_overflow_inner">
                                                                            <a href="/author_book_page" class="author rep">해커스 어학연구소</a>
                                                                            <span class="type">저자(글)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품의 출판사 소개 -->
                                                            <div class="prod_publish">
                                                                <a href="/publisher_page" class="text">해커스어학연구소</a>
                                                                <span class="gap">·</span>
                                                                <span class="date">2023년 01월 02일</span>
                                                            </div>

                                                            <!-- 상품의 가격 및 적립 정보 -->
                                                            <div class="prod_price">
                                                                <span class="price_normal">
                                                                    <span class="text">정가</span>
                                                                    <span class="val">11,900원</span>
                                                                </span>
                                                                <span class="gap">|</span>
                                                                <span class="point">
                                                                    590p
                                                                    <span class="rate">(5%)</span>
                                                                </span>

                                                            </div>

                                                            <!-- 리뷰 영역 -->
                                                            <div class="prod_bottom">
                                                                <span class="review_klover_box">
                                                                    <span class="review_klover_text font_size_xxs">9.79</span>
                                                                    <span class="review_desc">(114개의 리뷰)</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- 예상 배송 날짜 입력란 -->
                                                    <div class="prod_order_state">
                                                        <span class="badge_sm badge_pill badge_primary">
                                                            <span class="text">배송</span>
                                                        </span>
                                                        <p class="order_state_desc">주문 시<br> <span class="fw_bold">3일 후 </span><br>도착예정</p>
                                                    </div>

                                                    <!-- 장바구니 or 바로구매 버튼 영역 -->
                                                    <div class="prod_btn_wrap">
                                                        <div class="btn_wrap full">
                                                            <a href="/cart_page" class="btn_sm btn_light_gray"><span class="text">장바구니</span></a>
                                                            <a href="/order_page" class="btn_sm btn_primary"><span class="text">바로구매</span></a>
                                                        </div>
                                                    </div>

                                                </li>

                                                <!-- 상품 3 영역 -->
                                                <li class="prod_item">
                                                    <span class="form_chk no_label">
                                                        <input class="result_checkbox spec_checkbox" id="chkSearch_S000200406668" type="checkbox" data-name="2023 해커스 토익 RC 리딩(Reading) 토익 기본서">
                                                        <label for="chkSearch_S000200406668"><span class="hidden">상품선택</span></label>
                                                    </span>

                                                    <!-- 상품 이미지 & 정보 영역 -->
                                                    <div class="prod_area horizontal">
                                                        <!-- 상품의 이미지 영역 -->
                                                        <div class="prod_thumb_box size_lg">
                                                            <a href="/product_read_page" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="2023 해커스 토익 RC 리딩(Reading) 토익 기본서" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788965424765.jpg">
                                                                </span>
                                                            </a>
                                                        </div>

                                                        <!-- 상품의 소개 영역 -->
                                                        <div class="prod_info_box">
                                                            <!-- 상품의 이름 -->
                                                            <div class="auto_overflow_wrap prod_name_group">
                                                                <div class="auto_overflow_contents">
                                                                    <div class="auto_overflow_inner">
                                                                        <a href="/product_read_page" class="prod_info">
                                                                            <span class="prod_category">[국내도서]</span>
                                                                            <span id="cmdtName_S000200406668">2023 해커스 토익 RC 리딩(Reading) 토익 기본서</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품 설명 -->
                                                            <div class="prod_desc_info">
                                                                <span class="prod_desc">최신기출경향 완벽 반영｜토익 리딩의 기본서｜실전모의고사 4회분 시험장에도 들고 가는 토익 RC 필수 어휘, 단어암기 MP3</span>
                                                            </div>

                                                            <!-- 상품의 작가 소개 -->
                                                            <div class="prod_author_info">
                                                                <div class="auto_overflow_wrap prod_author_group">
                                                                    <div class="auto_overflow_contents">
                                                                        <div class="auto_overflow_inner">
                                                                            <a href="/author_book_page" class="author rep">David Cho</a>
                                                                            <span class="type">저자(글)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품의 출판사 소개 -->
                                                            <div class="prod_publish">
                                                                <a href="/publisher_page" class="text">해커스어학연구소</a>
                                                                <span class="gap">·</span>
                                                                <span class="date">2023년 01월 02일</span>
                                                            </div>

                                                            <!-- 상품의 가격 및 적립 정보 -->
                                                            <div class="prod_price">
                                                                <span class="price_normal">
                                                                    <span class="text">정가</span>
                                                                    <span class="val">18,800원</span>
                                                                </span>
                                                                <span class="gap">|</span>
                                                                <span class="point">
                                                                    940p
                                                                    <span class="rate">(5%)</span>
                                                                </span>

                                                            </div>

                                                            <!-- 리뷰 영역 -->
                                                            <div class="prod_bottom">
                                                                <span class="review_klover_box">
                                                                    <span class="review_klover_text font_size_xxs">9.85</span>
                                                                    <span class="review_desc">(161개의 리뷰)</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- 예상 배송 날짜 입력란 -->
                                                    <div class="prod_order_state">
                                                        <span class="badge_sm badge_pill badge_primary">
                                                            <span class="text">배송</span>
                                                        </span>
                                                        <p class="order_state_desc">주문 시<br> <span class="fw_bold">3일 후 </span><br>도착예정</p>
                                                    </div>

                                                    <!-- 장바구니 or 바로구매 버튼 영역 -->
                                                    <div class="prod_btn_wrap">
                                                        <div class="btn_wrap full">
                                                            <a href="/cart_page" class="btn_sm btn_light_gray"><span class="text">장바구니</span></a>
                                                            <a href="/order_page" class="btn_sm btn_primary"><span class="text">바로구매</span></a>
                                                        </div>
                                                    </div>

                                                </li>

                                                <!-- 상품 4 영역 -->
                                                <li class="prod_item">
                                                    <span class="form_chk no_label">
                                                        <input class="result_checkbox spec_checkbox" id="chkSearch_S000200406673" type="checkbox" data-name="2023 해커스 토익 LC 리스닝(Listening) 토익 기본서">
                                                        <label for="chkSearch_S000200406673"><span class="hidden">상품선택</span></label>
                                                    </span>

                                                    <!-- 상품 이미지 & 정보 영역 -->
                                                    <div class="prod_area horizontal">
                                                        <!-- 상품의 이미지 영역 -->
                                                        <div class="prod_thumb_box size_lg">
                                                            <a href="/product_read_page" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="2023 해커스 토익 LC 리스닝(Listening) 토익 기본서" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788965424772.jpg">
                                                                </span>
                                                            </a>
                                                        </div>

                                                        <!-- 상품의 소개 영역 -->
                                                        <div class="prod_info_box">
                                                            <!-- 상품의 이름 -->
                                                            <div class="auto_overflow_wrap prod_name_group">
                                                                <div class="auto_overflow_contents">
                                                                    <div class="auto_overflow_inner">
                                                                        <a href="/product_read_page" class="prod_info">
                                                                            <span class="prod_category">[국내도서]</span>
                                                                            <span id="cmdtName_S000200406673">2023 해커스 토익 LC 리스닝(Listening) 토익 기본서</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품 설명 -->
                                                            <div class="prod_desc_info">
                                                                <span class="prod_desc">최신기출경향 완벽 반영｜토익 리스닝의 기본서｜실전모의고사 4회분 시험장에도 들고 가는 토익 LC 필수 어휘, 단어암기 MP3</span>
                                                            </div>

                                                            <!-- 상품의 작가 소개 -->
                                                            <div class="prod_author_info">
                                                                <div class="auto_overflow_wrap prod_author_group">
                                                                    <div class="auto_overflow_contents">
                                                                        <div class="auto_overflow_inner">
                                                                            <a href="/author_book_page" class="author rep">David Cho</a>
                                                                            <span class="type">저자(글)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품의 출판사 소개 -->
                                                            <div class="prod_publish">
                                                                <a href="/publisher_page" class="text">해커스어학연구소</a>
                                                                <span class="gap">·</span>
                                                                <span class="date">2023년 01월 02일</span>
                                                            </div>

                                                            <!-- 상품의 가격 및 적립 정보 -->
                                                            <div class="prod_price">
                                                                <span class="price_normal">
                                                                    <span class="text">정가</span>
                                                                    <span class="val">18,800원</span>
                                                                </span>
                                                                <span class="gap">|</span>
                                                                <span class="point">
                                                                    940p
                                                                    <span class="rate">(5%)</span>
                                                                </span>

                                                            </div>

                                                            <!-- 리뷰 영역 -->
                                                            <div class="prod_bottom">
                                                                <span class="review_klover_box">
                                                                    <span class="review_klover_text font_size_xxs">9.91</span>
                                                                    <span class="review_desc">(139개의 리뷰)</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- 예상 배송 날짜 입력란 -->
                                                    <div class="prod_order_state">
                                                        <span class="badge_sm badge_pill badge_primary">
                                                            <span class="text">배송</span>
                                                        </span>
                                                        <p class="order_state_desc">주문 시<br> <span class="fw_bold">3일 후 </span><br>도착예정</p>
                                                    </div>

                                                    <!-- 장바구니 or 바로구매 버튼 영역 -->
                                                    <div class="prod_btn_wrap">
                                                        <div class="btn_wrap full">
                                                            <a href="/cart_page" class="btn_sm btn_light_gray"><span class="text">장바구니</span></a>
                                                            <a href="/order_page" class="btn_sm btn_primary"><span class="text">바로구매</span></a>
                                                        </div>
                                                    </div>

                                                </li>
                                                
                                                <!-- 상품 5 영역 -->
                                                <li class="prod_item">
                                                    <span class="form_chk no_label">
                                                        <input class="result_checkbox spec_checkbox" id="chkSearch_S000000450423" type="checkbox" data-name="YBM 실전토익 RC 1000 1">
                                                        <label for="chkSearch_S000000450423"><span class="hidden">상품선택</span></label>
                                                    </span>

                                                    <!-- 상품 이미지 & 정보 영역 -->
                                                    <div class="prod_area horizontal">
                                                        <!-- 상품의 이미지 영역 -->
                                                        <div class="prod_thumb_box size_lg">
                                                            <a href="/product_read_page" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="YBM 실전토익 RC 1000 1" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788917232134.jpg">
                                                                </span>
                                                            </a>
                                                        </div>

                                                        <!-- 상품의 소개 영역 -->
                                                        <div class="prod_info_box">
                                                            <!-- 상품의 이름 -->
                                                            <div class="auto_overflow_wrap prod_name_group">
                                                                <div class="auto_overflow_contents">
                                                                    <div class="auto_overflow_inner">
                                                                        <a href="/product_read_page" class="prod_info">
                                                                            <span class="prod_category">[국내도서]</span>
                                                                            <span id="cmdtName_S000000450423">YBM 실전토익 RC 1000 1</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품 설명 -->
                                                            <div class="prod_desc_info">
                                                                <span class="prod_desc">문제집 + 해설집 + 무료 동영상 / 토익주관사가 만든 고난도 적중실전</span>
                                                            </div>

                                                            <!-- 상품의 작가 소개 -->
                                                            <div class="prod_author_info">
                                                                <div class="auto_overflow_wrap prod_author_group">
                                                                    <div class="auto_overflow_contents">
                                                                        <div class="auto_overflow_inner">
                                                                            <a href="/author_book_page" class="author rep">YBM 토익연구소</a>
                                                                            <span class="type">저자(글)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- 상품의 출판사 소개 -->
                                                            <div class="prod_publish">
                                                                <a href="/publisher_page" class="text">YBM</a>
                                                                <span class="gap">·</span>
                                                                <span class="date">2019년 10월 01일</span>
                                                            </div>

                                                            <!-- 상품의 가격 및 적립 정보 -->
                                                            <div class="prod_price">
                                                                <span class="price_normal">
                                                                    <span class="text">정가</span>
                                                                    <span class="val">15,000원</span>
                                                                </span>
                                                                <span class="gap">|</span>
                                                                <span class="point">
                                                                    750p
                                                                    <span class="rate">(5%)</span>
                                                                </span>

                                                            </div>

                                                            <!-- 리뷰 영역 -->
                                                            <div class="prod_bottom">
                                                                <span class="review_klover_box">
                                                                    <span class="review_klover_text font_size_xxs">9.45</span>
                                                                    <span class="review_desc">(108개의 리뷰)</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- 예상 배송 날짜 입력란 -->
                                                    <div class="prod_order_state">
                                                        <span class="badge_sm badge_pill badge_primary">
                                                            <span class="text">배송</span>
                                                        </span>
                                                        <p class="order_state_desc">주문 시<br> <span class="fw_bold">3일 후 </span><br>도착예정</p>
                                                    </div>

                                                    <!-- 장바구니 or 바로구매 버튼 영역 -->
                                                    <div class="prod_btn_wrap">
                                                        <div class="btn_wrap full">
                                                            <a href="/cart_page" class="btn_sm btn_light_gray"><span class="text">장바구니</span></a>
                                                            <a href="/order_page" class="btn_sm btn_primary"><span class="text">바로구매</span></a>
                                                        </div>
                                                    </div>

                                                </li>
                                                
                                            </ul>
                                        </div>

                                        <!-- 페이지 설정 -->
                                        <div class="pagination">
                                           <button class="btn_page prev" disabled="disabled"><span class="hidden">이전</span></button>
                                            <div class="page_num">
                                            <a href="#" class="btn_page_num active" data-index="0" data-role="first" title="현재페이지">1</a>
                                            <span class="text_ellipsis hidden">...</span><a href="#" class="btn_page_num" data-index="2" data-role="middle">2</a>
                                            <a href="#" class="btn_page_num" data-index="3" data-role="middle">3</a>
                                            <a href="#" class="btn_page_num" data-index="4" data-role="middle">4</a>
                                            <a href="#" class="btn_page_num" data-index="5" data-role="middle">5</a>
                                            <a href="#" class="btn_page_num" data-index="6" data-role="middle">6</a>
                                            <a href="#" class="btn_page_num" data-index="7" data-role="middle">7</a>
                                            </div>
                                            <button class="btn_page next"><span class="hidden">다음</span></button>
                                        </div>

                                    </div>
                                </div>
                            </div>

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