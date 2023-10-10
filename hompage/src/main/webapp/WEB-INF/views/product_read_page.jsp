<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/product_read.css">
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
		<main class="container_wrapper" style="position: relative;">
            <section class="contents_wrap">
                <div class="prod_detail_header">
                    <div class="header_contents_inner">

                        <div class="prod_detail_title_wrap">
                            <div class="prod_title_area">
                                <div class="prod_title_box auto_overflow_wrap">

                                    <div class="auto_overflow_contents">
                                        <div class="auto_overflow_inner">
                                            <h1><span class="prod_title">일곱개의 대죄 40</span>
                                            </h1>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="prod_detail_view_wrap">
                            <div class="prod_detail_view_area">

                                <div class="col_prod_info">
                                    <div class="prod_info_wrap">

                                        <div class="prod_author_box auto_overflow_wrap">
                                            <div class="auto_overflow_contents">
                                                <div class="auto_overflow_inner">
                                                    <div class="author">
                                                        <a href="https://search.kyobobook.co.kr/search?keyword=스즈키 나카바&amp;chrcCode=2001732601" style="font-weight: 700;">스즈키 나카바</a>
                                                        저자(글)
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="prod_info_text publish_date">
                                            <a href="https://search.kyobobook.co.kr/search?keyword=학산문화사&amp;pbcmCode=PB07104" class="btn_publish_link" style="font-weight: 700;">학산문화사</a>
                                            ·2023년 10월 01일
                                        </div>

                                        <div class="prod_review_box">
                                            <div class="col_review">
                                                <span class="review_score no_score">0.0</span>

                                                <div class="rating-container theme-krajee-gly rating-md rating-animate rating-disabled">

                                                    <div class="rating-stars">
                                                        <span class="empty-stars">
                                                            <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                        </span>
                                                        <span class="filled-stars" style="width: 0%;">
                                                            <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                            <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <span class="review_desc">(<span class="val">0</span>개의 리뷰)</span>
                                            </div>
                                            <button type="button" class="btn_go_review"><span class="hidden">리뷰 영역으로 가기</span></button>
                                        </div>

                                    </div>
                                </div>

                                <div class="col_prod_info thumb">
                                    <div class="prod_thumb_swiper_wrap active single_slide">
                                        <div class="swiper-container prod_thumb_list_wrap">
                                            <ul class="swiper-wrapper">

                                                <li class="prod_thumb_item swiper-slide">
                                                    <div class="blur_img_wrap portrait">
                                                        <div class="portrait_img_box portrait">
                                                            <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791141118570.jpg" alt="일곱개의 대죄 40 대표 이미지">
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="col_prod_info">

                                    <div class="prod_price_wrap">
                                        <div class="prod_price_box">
                                            <div class="prod_price">
                                                <span class="price">
                                                    <span class="val">6,000<span class="unit">원</span></span>
                                                </span>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="prod_guide_wrap">
                                        <div class="prod_guide_box">

                                            <div class="prod_guide_row">
                                                <div class="prod_guide_title">적립</div>
                                                <div class="prod_guide_cont">
                                                    <div class="point_text">
                                                        300p
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="prod_guide_box">

                                            <div class="prod_guide_row">
                                                <div class="prod_guide_title">배송안내</div>
                                                <div class="prod_guide_cont">
                                                    <div class="delivery_guide_text">
                                                        <span id="OrderDeliveryType" class="delivery_type">무료배송</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="prod_guide_row">



                                                <div class="prod_guide_cont">
                                                    <div class="delivery_guide_text">
                                                        <span id="OrderEstimatedDate">
                                                            <span>
                                                                <strong class="blue">10월 11일 출고예정</strong>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="prod_guide_row">
                                                <div class="prod_guide_cont">
                                                    <div class="prod_info_text">

                                                        <span data-role="address" data-zip="03154K">회원 기본주소</span>
                                                        <!-- TODO: kbbfn - addr-finder 적용 -->
                                                        <button type="button" class="btn_line_gray btn_xxs">
                                                            <span class="text">변경</span>
                                                            <span class="ico_arw"></span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="info_text_box">

                                        <div class="title_wrap title_size_xs">
                                            <p class="title_heading"><span class="ico_speech"></span>알립니다.</p>
                                        </div>
                                        <div class="info_text_inner">
                                            <ul class="bul_list">
                                                <li class="bul_item_dot font_size_xxs">본 상품은 <span id="reservationSale"><strong class="blue">10월 11일 출고예정</strong></span>인 예약판매 상품입니다. 단, 거래처의 사정으로 출고가 지연될 수 있으니, 이 점 양해 부탁드립니다.</li>
                                                <li class="bul_item_dot font_size_xxs">예약판매 상품의 경우 실제 출간/출시 후 상품정보가 달라질 수 있습니다. 이 점 양해 부탁드립니다.</li>
                                            </ul>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="tab_wrap prod_detail_body">

                    <div class="tab_list_wrap">
                        <div class="sps sps_scroll_fixed tab_list_inner">
                            <div class="sps_inner">
                                <ul class="tabs">
                                    <li class="tab_item"><a href="#scrollSpyProdInfo" class="tab_link"><span class="tab_text">상품정보</span></a></li>
                                    <li class="tab_item"><a href="#scrollSpyProdReview" class="tab_link"><span class="tab_text">리뷰 <span class="num">(0)</span></span></a></li>
                                    <li class="tab_item"><a href="#scrollSpyProdClaim" class="tab_link"><span class="tab_text">교환/반품/품절</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="prod_detail_contents">
                        <div class="prod_detail_contents_inner">

                            <div class="tab_contents">

                                <div class="product_detail_area detail_img">
                                    <div class="inner">
                                        <img loading="lazy" src="https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/616/i9791171240616.jpg" alt="원피스 106: 천재의 꿈 상세 이미지">
                                    </div>
                                </div>

                                <div class="product_detail_area book_intro">
                                    <div class="intro_book">
                                        <div class="title_wrap title_size_md">
                                            <h2 class="title_heading">책 소개</h2>
                                        </div>
                                        <div class="title_wrap title_size_def">
                                            <p class="title_heading fw_medium">이 책이 속한 분야</p>
                                        </div>

                                        <ul class="intro_category_list">
                                            <li class="category_list_item">
                                                <a href="https://product.kyobobook.co.kr/KOR" class="intro_category_link">도서</a>
                                                <span class="arw_category"> &gt; </span>
                                                <a href="https://product.kyobobook.co.kr/category/KOR/47" class="intro_category_link">만화</a>
                                                <span class="arw_category"> &gt; </span>
                                                <a href="https://product.kyobobook.co.kr/category/KOR/4717" class="intro_category_link">SF/판타지</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="intro_bottom">

                                        <div class="info_text">에그 헤드에 상륙한 밀짚모자 일당.<br>그곳에는 Dr. 베가펑크의 연구소가 있고,<br>갖가지 미지의 기술들에 루피의 모험심이 고양된다!!<br>하지만, 베가펑크 밀살을 위해 CPO가 습격을?!<br>'원피스'를 둘러싼 해양 모험 로망!!</div>
                                    </div>
                                </div>

                                <div class="product_detail_area product_person">
                                    <div class="title_wrap title_size_md">
                                        <h2 class="title_heading">작가정보</h2>

                                    </div>

                                    <div class="round_gray_box">
                                        <div class="title_wrap title_size_def">
                                            <h3 class="title_heading">
                                                <span class="title_prefix">저자(글)</span>
                                                <a href="https://search.kyobobook.co.kr/search?keyword=스즈키 나카바&amp;chrcCode=2001732601" class="person_link">
                                                    <span class="text">스즈키 나카바</span>
                                                </a>

                                            </h3>
                                            <div class="right_area">
                                                <a href="https://www.kyobobook.co.kr/service/profile/information?chrcCode=2001732601" class="btn_xs btn_line_gray">
                                                    <span class="ico_write_info"></span>
                                                    <span class="text">작가의 다른 작품 더보기</span>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="writer_info_box">
                                            <div class="auto_overflow_wrap">
                                                <div class="auto_overflow_contents">
                                                    <div class="auto_overflow_inner">
                                                        <p class="info_text">출간작으로 『일곱 개의 대죄』 등이 있다.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="prod_swiper_wrap swiper-container swiper-container-horizontal swiper-container-free-mode">
                                            <ul class="prod_list swiper-wrapper">
                                                <li class="prod_item swiper-slide swiper-slide-visible swiper-slide-active">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000209666283" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="일곱개의 대죄 39" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141118563.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141118563.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000209666283" class="prod_info">
                                                                <span class="prod_name">일곱개의 대죄 39</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="prod_item swiper-slide swiper-slide-visible swiper-slide-next">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000209084877" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="묵시록의 4기사 6" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141107642.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141107642.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000209084877" class="prod_info">
                                                                <span class="prod_name">묵시록의 4기사 6</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="prod_item swiper-slide swiper-slide-visible">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000203157352" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="묵시록의 4기사 5" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141103651.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141103651.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000203157352" class="prod_info">
                                                                <span class="prod_name">묵시록의 4기사 5</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="prod_item swiper-slide swiper-slide-visible">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000203096912" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="일곱개의 대죄 33" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141103057.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141103057.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000203096912" class="prod_info">
                                                                <span class="prod_name">일곱개의 대죄 33</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="prod_item swiper-slide swiper-slide-visible">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000202385540" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="일곱개의 대죄 41" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141103064.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141103064.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000202385540" class="prod_info">
                                                                <span class="prod_name">일곱개의 대죄 41</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="prod_item swiper-slide swiper-slide-visible">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000201933252" class="prod_link">
                                                                <span class="img_box">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="일곱개의 대죄. 9" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791169473996.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791169473996.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000201933252" class="prod_info">
                                                                <span class="prod_name">일곱개의 대죄. 9</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="prod_item swiper-slide">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000201549812" class="prod_link">
                                                                <span class="img_box no_img">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="묵시록의 4기사 4" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791169478557.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791169478557.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000201549812" class="prod_info">
                                                                <span class="prod_name">묵시록의 4기사 4</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="prod_item swiper-slide">
                                                    <div class="prod_area">
                                                        <div class="prod_thumb_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000201598023" class="prod_link">
                                                                <span class="img_box no_img">
                                                                    <img data-kbbfn="s3-image" loading="lazy" alt="일곱개의 대죄 11" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141108595.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791141108595.jpg">
                                                                </span>
                                                            </a>
                                                        </div>
                                                        <div class="prod_info_box">
                                                            <a href="https://product.kyobobook.co.kr/detail/S000201598023" class="prod_info">
                                                                <span class="prod_name">일곱개의 대죄 11</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>

                                    </div>

                                </div>

                                <div class="tab_contents" style="width:75%;">
                                    <div class="product_detail_area klover_review_wrap">
                                        <div class="title_wrap title_size_md has_btn">

                                            <!-- 타이틀 영역 -->
                                            <p class="title_heading" data-review-label="title">Klover 리뷰 (0)</p>

                                            <!-- 버튼 영역 -->
                                            <div class="right_area">

                                                <button type="button" class="btn_sm btn_primary">
                                                    <span class="ico_review"></span>
                                                    <span class="text">리뷰 작성</span>
                                                </button>

                                            </div>
                                        </div>
                                    </div>

                                    <!-- 클로버 리뷰 영역 -->
                                    <div class="klover_review_box">
                                        <div class="klover_box">
                                            <div class="box_left">
                                                <p class="text_user_score">사용자 총점</p>
                                                <div class="rating-container theme-krajee-gly rating-md rating-animate rating-disabled has_caption">
                                                    <div class="rating-stars" tabindex="0">
                                                        <span class="empty-stars">
                                                            <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                        </span>

                                                        <span class="filled-stars" style="width: 0%;">
                                                            <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                            <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                        </span>
                                                    </div>
                                                    <div class="caption">
                                                        <span class="val" aria-hidden="true">0</span><span class="total" aria-hidden="true">10</span>
                                                    </div>
                                                </div>

                                            </div>


                                            <div class="box_right">
                                                <div class="score_bar_wrap">
                                                    <div class="rating-container theme-krajee-gly rating-sm rating-animate rating-disabled">
                                                        <div class="rating-stars" tabindex="0">
                                                            <span class="empty-stars">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            </span>

                                                            <span class="filled-stars" style="width: 100%;">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            </span>
                                                            <div class="caption"><span class="caption-badge caption-secondary">10점 중 10점</span></div>
                                                        </div>
                                                    </div>
                                                    <span class="text_score_bar score_best">0개</span>
                                                </div>

                                                <div class="score_bar_wrap">
                                                    <div class="rating-container theme-krajee-gly rating-sm rating-animate rating-disabled">
                                                        <div class="rating-stars" tabindex="0">
                                                            <span class="empty-stars">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            </span>

                                                            <span class="filled-stars" style="width: 75%;">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            </span>
                                                        </div>
                                                        <div class="caption"><span class="caption-badge caption-secondary">10점 중 7.5점</span></div>
                                                    </div>
                                                    <span class="text_score_bar">0개</span>
                                                </div>

                                                <div class="score_bar_wrap">
                                                    <div class="rating-container theme-krajee-gly rating-sm rating-animate rating-disabled">
                                                        <div class="rating-stars" tabindex="0">
                                                            <span class="empty-stars">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            </span>

                                                            <span class="filled-stars" style="width: 50%;">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            </span>
                                                        </div>
                                                        <div class="caption"><span class="caption-badge caption-success">10점 중 5점</span></div>
                                                    </div>
                                                    <span class="text_score_bar">0개</span>
                                                </div>

                                                <div class="score_bar_wrap">
                                                    <div class="rating-container theme-krajee-gly rating-sm rating-animate rating-disabled">
                                                        <div class="rating-stars" tabindex="0">
                                                            <span class="empty-stars">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                            </span>

                                                            <span class="filled-stars" style="width: 25%;">
                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                            </span>
                                                        </div>
                                                        <div class="caption"><span class="caption-badge caption-info">10점 중 2.5점</span></div>
                                                    </div>
                                                    <span class="text_score_bar">0개</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    <!-- 리뷰 리스트 영역 -->
                                    <div class="tab_wrap type_sm">
                                        <div class="tab_list_wrap">
                                            <ul class="tabs">
                                                <li class="tab_item" data-value="002"><button class="tab_link tab_disabled" type="button"><span class="tab_text">구매 리뷰</span></button></li>
                                            </ul>
                                        </div>

                                        <div class="tab_content">
                                            <div class="comment_wrap">

                                                <div class="comment_list">
                                                    <div class="comment_item">
                                                        <div class="comment_header">
                                                            <div class="left_area">
                                                                <div class="user_info_box">
                                                                    <span class="badge_box">
                                                                        <span class="badge_sm badge_pill badge_line_gray"><span class="text">구매자</span></span>
                                                                    </span>

                                                                    <span class="info_item">pp*****</span>
                                                                    <span class="gap"> | </span>
                                                                    <span class="info_item">2023.10.07</span>
                                                                    <span class="gap"> | </span>
                                                                    <span class="info_item">
                                                                        <button class="btn_comment_util" type="button" data-role="report">
                                                                            <span class="text">신고/차단</span>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="right_area">
                                                                <div class="review_summary_wrap">
                                                                    <div class="rating-container theme-krajee-gly rating-sm rating-animate rating-disabled">
                                                                        <div class="rating-stars" tabindex="0">
                                                                            <span class="empty-stars">
                                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                            </span>

                                                                            <span class="filled-stars" style="width: 100%;">
                                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                            </span>
                                                                        </div>
                                                                        <div class="caption"><span class="caption-badge caption-secondary">10점 중 10점</span></div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="comment_contents">
                                                            <div class="comment_contents_inner">
                                                                <div class="comment_view_wrap">
                                                                    <div class="comment_text_box">
                                                                        <div class="comment_text">남편이 1권부터 사 모으고 있는 만화책<br>신권 나왔데서 사줬더니 좋아라 하네요ㅎㅎ</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="comment_item" data-id="12350110">
                                                        <div class="comment_header">
                                                            <div class="left_area">
                                                                <div class="user_info_box">
                                                                    <span class="badge_box">
                                                                        <span class="badge_sm badge_pill badge_line_gray"><span class="text">구매자</span></span>
                                                                    </span>

                                                                    <span class="info_item">kb******</span>
                                                                    <span class="gap"> | </span>
                                                                    <span class="info_item">2023.10.09</span>
                                                                    <span class="gap"> | </span>
                                                                    <span class="info_item">
                                                                        <button class="btn_comment_util" type="button" data-role="report">
                                                                            <span class="text">신고/차단</span>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="right_area">
                                                                <div class="review_summary_wrap">
                                                                    <div class="rating-container theme-krajee-gly rating-sm rating-animate rating-disabled">
                                                                        <div class="rating-stars" tabindex="0">
                                                                            <span class="empty-stars">
                                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star-empty"></i></span>
                                                                            </span>

                                                                            <span class="filled-stars" style="width: 75%;">
                                                                                <span class="star" title="One Star"><i class="glyphicon glyphicon-star"></i></span>
                                                                                <span class="star" title="Two Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                                <span class="star" title="Three Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                                <span class="star" title="Four Stars"><i class="glyphicon glyphicon-star"></i></span>
                                                                            </span>
                                                                        </div>
                                                                        <div class="caption"><span class="caption-badge caption-secondary">10점 중 7.5점</span></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="comment_contents">
                                                            <div class="comment_contents_inner">
                                                                <div class="comment_view_wrap">
                                                                    <div class="comment_text_box">
                                                                        <div class="comment_text">기다렸던 책이네요..</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                                                <div class="no_data size_sm has_line" style="display: none;">
                                                    <div class="no_data_desc">Klover리뷰를 작성해 보세요.</div>
                                                </div>

                                                <div class="pagination">
                                                    <button class="btn_page prev" disabled="disabled"><span class="hidden">이전</span></button>

                                                    <div class="page_num">
                                                        <a href="#" class="btn_page_num active" data-index="0" data-role="first" title="현재페이지">1</a>
                                                        <a href="#" class="btn_page_num" data-index="2" data-role="middle">2</a>
                                                        <a href="#" class="btn_page_num" data-index="3" data-role="middle">3</a>
                                                        <a href="#" class="btn_page_num" data-index="4" data-role="middle">4</a>
                                                        <a href="#" class="btn_page_num" data-index="5" data-role="middle">5</a>
                                                    </div>

                                                    <button class="btn_page next"><span class="hidden">다음</span></button>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab_contents" style="width:75%;">
                                    <div class="product_detail_area claim_info_wrap">
                                        <div class="title_wrap title_size_md has_btn">
                                            <h2 class="title_heading">교환/반품/품절 안내</h2>
                                            <div class="right_area">
                                                <a href="javascript:void(0)" class="btn_sm btn_line_gray"><span class="text">반품/교환 신청</span></a>
                                                <a href="javascript:void(0)" class="btn_sm btn_primary"><span class="ico_inquiry"></span><span class="text">1:1 문의</span></a>
                                            </div>
                                        </div>
                                        <div class="claim_info">
                                            <ul class="claim_info_list">
                                                <li class="claim_info_item">
                                                    <div class="title_wrap title_size_sm">
                                                        <p class="title_heading">반품/교환방법</p>
                                                    </div>
                                                    마이룸 &gt; 주문관리 &gt; 주문/배송내역 &gt; 주문조회 &gt; 반품/교환 신청, [1:1 상담 &gt; 반품/교환/환불] 또는 고객센터 (1544-1900)<br>* 오픈마켓, 해외배송 주문, 기프트 주문시 [1:1 상담&gt;반품/교환/환불] 또는 고객센터 (1544-1900)
                                                </li>
                                                <li class="claim_info_item">
                                                    <div class="title_wrap title_size_sm">
                                                        <p class="title_heading">반품/교환가능 기간</p>
                                                    </div>
                                                    변심반품의 경우 수령 후 7일 이내,<br>상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
                                                </li>
                                                <li class="claim_info_item">
                                                    <div class="title_wrap title_size_sm">
                                                        <p class="title_heading">반품/교환비용</p>
                                                    </div>
                                                    변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담
                                                </li>
                                                <li class="claim_info_item">
                                                    <div class="title_wrap title_size_sm">
                                                        <p class="title_heading">반품/교환 불가 사유</p>
                                                    </div>
                                                    1) 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br> (단지 확인을 위한 포장 훼손은 제외)<br>2) 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br> 예) 화장품, 식품, 가전제품(악세서리 포함) 등<br>3) 복제가 가능한 상품 등의 포장을 훼손한 경우<br> 예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집<br>4) 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)<br>5) 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우<br>6) 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우<br>7) 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우<br>8) 세트상품 일부만 반품 불가 (필요시 세트상품 반품 후 낱권 재구매)
                                                </li>
                                                <li class="claim_info_item">
                                                    <div class="title_wrap title_size_sm">
                                                        <p class="title_heading">상품 품절</p>
                                                    </div>
                                                    공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는 이메일과 문자로 안내드리겠습니다.
                                                </li>
                                                <li class="claim_info_item">
                                                    <div class="title_wrap title_size_sm">
                                                        <p class="title_heading">소비자 피해보상 환불 지연에 따른 배상</p>
                                                    </div>
                                                    1) 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁 해결 기준 (공정거래위원회 고시)에 준하여 처리됨<br>2) 대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함
                                                </li>
                                            </ul>
                                            <div class="info_text_box size_lg">
                                                <p class="bul_item_dot font_size_xxs">상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수 있습니다.)</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>


                <div class="prod_detail_footer">
                    <div class="prod_purchase_info_wrap">

                        <div class="footer_contents_inner">
                            <div class="left_area">
                                <span class="prod_info_title">총 상품 금액</span>
                                <span class="prod_info_price">
                                    <span class="val">5,400</span>
                                    <span class="unit">원</span>
                                </span>

                            </div>

                            <div class="right_area">
                                <div id="count" class="form_spinner_box">
                                    <span class="ui-spinner ui-widget ui-widget-content ui-corner-all ui-spinner-right">
                                        <button class="decrease ui-spinner-button ui-spinner-down ui-corner-br ui-button ui-widget">
                                            <span class="offscreen ui-icon ui-icon-triangle-1-s">상품 수량 한 개 줄이기</span>
                                        </button>
                                        <input type="number" value="1" class="form_spinner ui-spinner-input" title="수량" autocomplete="off">
                                        <button class="increase ui-spinner-button ui-spinner-up ui-corner-tr ui-button ui-widget">
                                            <span class="offscreen ui-icon ui-icon-triangle-1-n">상품 수량 한 개 늘리기</span>
                                        </button>
                                    </span>
                                </div>

                                <div id="prodBtnWrap" class="btn_wrap">

                                    <button id="basket" type="button" class="btn_lg btn_line_primary"><span class="text">장바구니</span></button>

                                    <div id="prodBuyWrap" class="btn_wrap overlap single">
                                        <a href="javascript:void(0)" id="buy" type="button" class="btn_lg btn_primary"><span class="text">바로구매</span></a>
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