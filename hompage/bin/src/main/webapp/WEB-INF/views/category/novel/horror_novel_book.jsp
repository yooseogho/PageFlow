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
                   <jsp:include page="/WEB-INF/views/include/book/novel/horror_novel_left_aside.jsp" />
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="백 명 버튼(큰글자도서)" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791168126879.jpg">
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
                                                                                <span>백 명 버튼(큰글자도서)</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        2016년부터 온라인 커뮤니티 공포 게시판에서 짧은 괴담을 창작하여, 2017년 《회색 인간》《세상에서 가장 약한 요괴》 《13일의 김남우》 등을 출간하며 ‘초단편괴담’이라는 새로운 장르를 구축해온 김동식의 신작 단편소설 《백 명 버튼》이 위즈덤하우스의 단편소설 시리즈 위픽으로 출간되었다. 인간 세상에 홀연히 나타난 악마는 백 명이 누르면 그중 한 명이 성공하고 두 명이 파멸하는 ‘백 명 버튼’을 만들어 판매한다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">김동식</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">위즈덤하우스</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 08월 05일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">20,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        1000p
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="완벽한 죽음을 팝니다" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198325426.jpg">
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
                                                                                <span>완벽한 죽음을 팝니다</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        뺑소니 사고로 식물인간이 되어버린 딸을 둔 태호는 이틀 전 아침 머리맡에 홀연히 나타난 ‘완벽한 죽음을 팝니다’라는 명함을 보고, 한참을 고민하다 명함 속 사무실을 찾아갑니다. 죽고 싶을 만큼 삶이 힘들고, 그래서 정말 죽고 싶은 마음에.
                                                                        그런데 상담사는 희한한 제안을 합니다. 태호의 죽음을 ‘다듬어진 형태’로 만들어주며, 딸에게 보험금까지 남겨주는 서비스를 이용해보는 게 어떠냐고. 음 … 하지만 뭔가 꺼림칙하니 이상합니다. 무엇보다 내가 지금 제정신일까요?
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">지현상</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">오러</a>
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="호러 픽션 나이트" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791163169185.jpg">
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
                                                                                <span>호러 픽션 나이트</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        호러, 판타지, 미스터리 등 다양한 장르를 능숙하게 다루는 반고훈 작가의 신작 『호러 픽션 나이트』가 출간됐다. 호러, 미스터리 작품들로만 구성한 『호러 픽션 나이트』는 작가 특유의 능청스러움으로 그려낸 흥미로운 전개와 이야기 곳곳에 숨겨진 은밀한 공포가 매력적인 작품이다.

                                                                        사람들이 실종되는 폐병원, 노인과 아이가 보이지 않는 기묘한 마을, 특이한 생물이 발견되는 바다, 미지의 존재가 감지되는 가정집 등 예사롭지 않은 공간에서 펼쳐지는 기이한 서사마다 작가는 반전과 공포라는 실을 꿰어 한 편의 명작 호러를 탄생시켰다.
                                                                        순식간에 독자들을 끌어당기는 독특한 소재, 쾌감마저 불러일으키는 놀라운 반전, 예기치 못한 순간 독자를 끌어당기는 늪 같은 공포의 배치는 새로운 자극과 흥미를 선물할 것이다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">반고훈</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">고즈넉이엔티</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 25일</span>
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="요괴도시" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791189770402.jpg">
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
                                                                                <span>요괴도시</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        고전 설화 속 요괴가 현대에도 존재한다는 가정하에 도시 괴담의 스타일을 빌려 현실감을 가미한 이야기들.

                                                                        「괴물아이」
                                                                        구박과 차별을 받으며 자라 온 고등학생 소녀 한주는 어느 날 가족들이 괴물에게 끔찍하게 살해당하는 꿈을 꾼다. 잠에서 깬 한주는 정말로 온 가족이 끔찍하게 죽어있는 것을 발견하고 놀라서 집을 뛰쳐나오는데…….

                                                                        「나쁜 놈만 골라 먹는다」
                                                                        엄청난 힘을 가진 식인 요괴 올출비채는 멈추지 않는 배고픔에 끊임없이 인간을 잡아먹던 중 도사에게 몸을 잃고 영혼만 떠돌아다닌다. 그렇게 현대에 와서 여고생, 가정주부, 노파 등 위험에 처한 여성의 몸을 옮겨 다니며 나쁜 인간을 죽여서 그 육체를 먹어 치우는데…….
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">배명은 외</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">아프로스미디어</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 20일</span>
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="균형 잡힌 기적" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791166687402.jpg">
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
                                                                                <span>균형 잡힌 기적</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        이신주 작가의 첫 책 《공산주의자가 온다!》를 읽으신 분들이 많지는 않겠습니다만, 읽으신 분들께선 즐거우셨는지 모르겠습니다. 어느 독자께서 “(작가가 천재라는 말이) 출판사의 광고성 호들갑이라 생각했는데 진짜”였다고 남겨주셔서 저희는 즐거웠습니다. 한 분이라도 알아주시면 계속 낼 수 있습니다.
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
                                                                    <span class="date">2023년 09월 09일</span>
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