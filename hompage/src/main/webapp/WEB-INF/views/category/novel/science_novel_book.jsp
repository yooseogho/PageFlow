<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/book/book.css">
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
            <div class="main_inner">
                <aside class="aside_wrap sub_category">
                   <jsp:include page="/WEB-INF/views/include/book/novel/science_novel_left_aside.jsp" />
                </aside>

               <section class="contents_wrap">
                    <div class="contents_inner">
                        <div class="search_result_top">

                            <div class="tab_wrap type_line justify ui-tabs ui-corner-all ui-widget ui-widget-content">

                                <div id="tabSearch" class="tab_content ui-tabs-panel ui-corner-bottom ui-widget-content">
                                    <div class="search_result_wrap">

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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll11" type="checkbox">
                                                            <label for="chkAll11"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품1의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="일곱 번째 약속" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791166687396.jpg">
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
                                                                                <span>일곱 번째 약속</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        SF 소설집 《공산주의자가 온다!》, 호러 소설집 《균형 잡힌 기적》에 이은 이신주 작가의 세 번째이자 판타지 소설집 《일곱 번째 약속》. 수사적 의미로 그저 “장르를 넘나드는” 게 아니라 다양한 장르의 세계를 마음껏 즐기는 이 작가가 과연 앞으로 무엇을 쓸 수 있을지, 함께 지켜보자는 의미로 신인 작가의 데뷔작을 유례없이 세 권으로 나누어 출간했습니다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">이신주</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">아작</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 10월 10일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">16,800원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        840p
                                                                        <span class="rate">(5%)</span>
                                                                    </span>

                                                                </div>

                                                                <!-- 리뷰 영역 -->
                                                                <div class="prod_bottom">
                                                                    <span class="review_klover_box">
                                                                        <span class="review_klover_text font_size_xxs">9.68</span>
                                                                        <span class="review_desc">(60개의 리뷰)</span>
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll15" type="checkbox">
                                                            <label for="chkAll15"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="위그드라실의 여신들" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791193024287.jpg">
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
                                                                                <span>위그드라실의 여신들</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        SF 독자는 과학에 대한 갈증을 품고 있다. 과학 이론과 기술 관련 정보를 심도 깊게 다루면서 이를 흥미진진한 이야기 속에 녹인 작품은 아무래도 소수인 까닭이다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">해도연</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">안전가옥</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 13일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">12,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        600p
                                                                        <span class="rate">(5%)</span>
                                                                    </span>

                                                                </div>

                                                                <!-- 리뷰 영역 -->
                                                                <div class="prod_bottom">
                                                                    <span class="review_klover_box">
                                                                        <span class="review_klover_text font_size_xxs">9.5</span>
                                                                        <span class="review_desc">(407개의 리뷰)</span>
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll18" type="checkbox">
                                                            <label for="chkAll18"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="네가 있는 요일" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788936439293.jpg">
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
                                                                                <span>네가 있는 요일</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        첫 작품 『스노볼』이 미국·프랑스·이탈리아 등 6개국에 번역 수출되고 영상화가 결정되며 새로운 문학의 얼굴로 주목받고 있는 박소영의 두 번째 장편소설 『네가 있는 요일』(소설Y)이 출간되었다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">박소영</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">창비</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 08일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">16,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        800p
                                                                        <span class="rate">(5%)</span>
                                                                    </span>

                                                                </div>

                                                                <!-- 리뷰 영역 -->
                                                                <div class="prod_bottom">
                                                                    <span class="review_klover_box">
                                                                        <span class="review_klover_text font_size_xxs">9.76</span>
                                                                        <span class="review_desc">(29개의 리뷰)</span>
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll111" type="checkbox">
                                                            <label for="chkAll111"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="잼 한 병을 받았습니다" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791189836504.jpg">
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
                                                                                <span>잼 한 병을 받았습니다</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        텀블벅 펀딩으로 '인기 프로젝트' 1위, 목표액 2535% 달성!
                                                                        드래곤이 쌓아놓은 산더미 같은 금에 세금을 매겨야 한다면?
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">홍락훈</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">에이플랫</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 13일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">17,500원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        870p
                                                                        <span class="rate">(5%)</span>
                                                                    </span>

                                                                </div>

                                                                <!-- 리뷰 영역 -->
                                                                <div class="prod_bottom">
                                                                    <span class="review_klover_box">
                                                                        <span class="review_klover_text font_size_xxs">0.0</span>
                                                                        <span class="review_desc"></span>
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll117" type="checkbox">
                                                            <label for="chkAll117"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="100년 후 학교" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791191360868.jpg">
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
                                                                                <span>100년 후 학교</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        참신한 주제와 풍부한 내용으로 1318들이 자신을 이해하고 더 넓은 세상을 바라볼 수 있도록 돕는 생각학교의 문학 시리즈, 클클문고의 아홉 번째 작품.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">소향 외</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">생각학교</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 08월 23일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">13,500원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        675p
                                                                        <span class="rate">(5%)</span>
                                                                    </span>

                                                                </div>

                                                                <!-- 리뷰 영역 -->
                                                                <div class="prod_bottom">
                                                                    <span class="review_klover_box">
                                                                        <span class="review_klover_text font_size_xxs">10</span>
                                                                        <span class="review_desc">(10개의 리뷰)</span>
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
            </div>
        </main>
		<footer class="footer_wrapper">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>