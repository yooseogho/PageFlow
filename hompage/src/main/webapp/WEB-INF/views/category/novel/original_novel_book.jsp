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
                   <jsp:include page="/WEB-INF/views/include/book/original_novel_left_aside.jsp" />
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll17" type="checkbox">
                                                            <label for="chkAll17"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품1의 이미지 영역 -->

                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="미스터 션샤인 1" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788925564685.jpg">
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
                                                                                <span>미스터 션샤인 1</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        2018 화제의 드라마
                                                                        [미스터 션샤인]소설 출간!

                                                                        격변의 조선 밤하늘에 수놓은
                                                                        쓸쓸하고 애틋한 모던 연애사

                                                                        검은 머리 미군과 총을 든 애기씨
                                                                        대사와 호흡에 미처 담지 못한 그들의 내밀한 이야기

                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">김은숙</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">알에이치코리아</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2018년 09월 17일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">14,800원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        740p
                                                                        <span class="rate">(5%)</span>
                                                                    </span>

                                                                </div>

                                                                <!-- 리뷰 영역 -->
                                                                <div class="prod_bottom">
                                                                    <span class="review_klover_box">
                                                                        <span class="review_klover_text font_size_xxs">8.68</span>
                                                                        <span class="review_desc">(160개의 리뷰)</span>
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="도깨비 2" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788925560977.jpg">
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
                                                                                <span>도깨비 2</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        김은숙 작가 특유의 감각적인 대사와 생생한 캐릭터 묘사에 섬세한 감정의 결이 더해진 소설 『도깨비』 제2권. 도깨비의 탄생부터 그 탄생의 배경, 이와 관련된 전생과 현생, 도깨비 신부, 저승사자 등 여러 인물들의 인연과 운명, 삶과 죽음, 선택이라는 삶에 대한 다양한 이야기들을 전하며 매회 화제를 불러일으킨 tvN 드라마 《도깨비》의 원작소설이다. 드라마 이면에 자리한 등장인물들의 숨은 이야기를 통해 읽는 즐거움과 드라마와는 또 다른 감동을 선사한다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">김은숙</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">알에이치코리아</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2017년 02월 24일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">13,800원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        690p
                                                                        <span class="rate">(5%)</span>
                                                                    </span>

                                                                </div>

                                                                <!-- 리뷰 영역 -->
                                                                <div class="prod_bottom">
                                                                    <span class="review_klover_box">
                                                                        <span class="review_klover_text font_size_xxs">8.9</span>
                                                                        <span class="review_desc">(427개의 리뷰)</span>
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll16" type="checkbox">
                                                            <label for="chkAll16"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="재벌집 막내아들 1" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791197915987.jpg">
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
                                                                                <span>재벌집 막내아들 1</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        2017년 2월부터 2018년 1월까지 1년여간 326화 연재되는 동안 단 한 번도 투데이베스트 1위를 놓치지 않을 만큼 수많은 독자들이 열광한 웹소설 《재벌집 막내아들》이 마침내 종이책으로 출간되었다. 13년간 재벌가의 뒤치다꺼리를 하다 누명을 쓰고 억울하게 죽은 대기업 직원이 자신을 죽인 집안의 막내 손자로 환생해 복수하고 재벌가의 모든 걸 차지하기 위해 고군분투하는 어쩌면 단순한 구조의 회빙환(회귀·빙의·환생) 소설이다. 하지만 이 단순한 구조에 독자들이 열광한 이유는 회빙환이라는 판타지 요소에 정재계의 사건과 음모, 계략, 암투가 긴장감 있게 펼쳐져 있기 때문이며, 재벌가에 환생했지만 하필이면 후계 구도의 가장 밑바닥인 막내 손자의 위치에서 총수인 할아버지의 신임을 얻고 자신을 죽인 후계자들을 하나하나 제거해 나가는 모습이 너무나 통쾌하게 그려졌기 때문이다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">산경</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">테라코타</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2022년 11월 18일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">17,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        850p
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll112" type="checkbox">
                                                            <label for="chkAll111"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="복수여신" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791168412668.jpg">
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
                                                                                <span>복수여신</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        유튜브 5000만 뷰, ‘화제성 갑’ 웹드라마
                                                                        서늘한 학원로맨스 〈복수여신〉 단행본 출간
                                                                        〈복수여신〉은 톡톡 튀는 트렌디한 이야기를 생산하는 것으로 이름난 유튜브 채널 ‘치즈필름’에서 만든 웹드라마로, 공개된 지 하루 만에 조회수 150만 뷰, 누적 5000만 뷰를 돌파하며 화제를 일으킨 웹드라마 계의 전설적인 시리즈다.
                                                                        책으로 재탄생한 《복수여신》은 두 편의 미공개 번외편을 수록하고 본문 곳곳에 풀컬러 일러스트를 담아 소장 가치를 높였다.

                                                                        “다 죽여 버릴 거야.”
                                                                        복수를 위해 모든 걸 버렸다, 이름도, 목소리도.
                                                                        클리셰를 뒤집는 특별 번외편 수록!
                                                                        호태라면 내 모든 걸 있는 그대로 좋아해 줄 거야, 라고 생각했다.
                                                                        그 애가 일진들 앞에서 거짓 고백을 하고 망신을 주기 전까진.
                                                                        내가 너 따위를 좋아해? 어떻게 감히 그런 생각을.
                                                                        호태의 서늘한 눈동자가 그렇게 말하고 있었다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">김은하</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">북폴리오</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2022년 08월 30일</span>
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll113" type="checkbox">
                                                            <label for="chkAll113"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="마녀식당으로 오세요" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791130637082.jpg">
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
                                                                                <span>마녀식당으로 오세요</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                       제3회 교보문고 스토리공모전에서 대상을 수상하며 ‘한국형 현실 판타지’의 등장을 알린 장편소설 『마녀식당으로 오세요』가 개정판으로 출간됐다. 인생의 막다른 골목길에 다다른 이들이 소원을 이루어주는 요리를 파는 ‘마녀식당’을 만나 삶을 다시 꾸려나갈 동력을 얻는다는 이야기로, 티빙 오리지널 드라마로 제작되어 방영을 앞두고 있다. 작가의 첫 작품이라는 것이 믿기지 않을 정도로 탄탄한 구성과 빠른 속도감, 눅진하게 남는 결말의 여운이 일품인 이 소설은 장르의 문법을 현실에 자연스럽게 녹여내며 독자들의 뜨거운 호응을 받았다. 믿었던 사랑에게 배신당하고, 끈질긴 학교 폭력에 시달리며, 대학 졸업장과 수천의 빚을 쥔 채, 앞으로 나아가는 오늘의 우리에게 이 책은 평범하지만 특별한 깨달음을 건넨다. 마법은 멀리 있지 않다는 것, 다시 살아내겠다는 용기, 그게 삶의 방향을 바꾸는 유일한 마법이라는 것을 말이다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">구상희</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">다산책방</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2021년 04월 19일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">7,500원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        370p
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