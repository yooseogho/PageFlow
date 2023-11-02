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
                   <jsp:include page="/WEB-INF/views/include/book/novel/fantasy_novel_left_aside.jsp" />
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
                                                            <input class="result_checkbox spec_checkbox" id="chkAll13" type="checkbox">
                                                            <label for="chkAll13"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품1의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="국뽕조선 10" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788999286131.jpg">
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
                                                                                <span>국뽕조선 10</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        거북선을 제작한 스트리머 김인호.
                                                                        불법조업을 벌이는 중국 어선을 격파한다.
                                                                        하지만 보복으로 죽임을 당하고
                                                                        역사상 최악의 군주로 기록되는 선조
                                                                        그가 기나긴 꿈에서 깨어난다.
                                                                        불명예를 지우고, 세상의 찬사를 받기 위해
                                                                        위기의 조선을 개발한다.
                                                                        이번에는 이순신을 절대 버리지 않는다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">다물</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">어울림(어울림출판사)</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 10월 4일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">9,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        450p
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="길목식당 알바들 10" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788999286346.jpg">
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
                                                                                <span>길목식당 알바들 10</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        죽은 자들이 눈에 보이기 시작한 태식.
                                                                        그들에게서 벗어날 수 없었다.
                                                                        하지만 가까운 곳에 해답이 있었다.
                                                                        “여기서 일하면 돼.”
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">수호</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">어울림(어울림출판사)</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 10월 04일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">9,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        450p
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="빌런 경찰 이진우 3" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791140813537.jpg">
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
                                                                                <span>빌런 경찰 이진우 3</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        『어게인 마이 라이프』 작가 이해날의
                                                                        뒷목 잡는 특제 막장 복수극이 펼쳐진다!
                                                                        『빌런 경찰 이진우』

                                                                        인수합병을 통해 굴지의 대기업 진백을 세운 백동하
                                                                        임종의 순간, 믿었던 가족과 친구에게 배신당하고
                                                                        과거와 미래를 보는 능력을 가진 경찰 이진우로 깨어나다!
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">이해날</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">로크미디어</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 10월 05일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">9,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        450p
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="연기가 보이는 천재배우 6" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791136447319.jpg">
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
                                                                                <span>연기가 보이는 천재배우 6</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        "세계를 사로잡을 역대급 배우가 탄생했다

                                                                        『연기가 보이는 천재배우』

                                                                        연기에 대한 열정만큼은 남다르지만
                                                                        ‘단역’을 넘어서지 못했던 배우 김형일

                                                                        어느 날 죽음의 경계에서 만난 저승사자
                                                                        그에게 뜻밖의 선물을 받게 되는데

                                                                        ‘최고의 연기가 보인다고? 그게 진짜 가능한 거야?’
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">밤만</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">파피루스</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 25일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">9,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        450p
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
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="은해상단 막내아들 4" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791136447302.jpg">
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
                                                                                <span>은해상단 막내아들 4</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        "『은해상단 막내아들』


                                                                        천하제일의 상재를 타고난 은서호

                                                                        승승장구하던 그를 가로막는 자들


                                                                        “어째서 무림맹이 나를…….”

                                                                        “너무 크게 성장해서 귀찮아졌거든, 그러니까 눈에 거슬린다는 거지.”


                                                                        상단 일을 시작했던 그날로 돌아왔고, 굳게 다짐한다

                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">향란</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">파피루스 </a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 25일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">9,000원</span>
                                                                    </span>
                                                                    <span class="gap">|</span>
                                                                    <span class="point">
                                                                        450p
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