<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_product_list.css">
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
                    <jsp:include page="/WEB-INF/views/include/admin_left_aside.jsp" />
                </aside>

                <section class="section_wrapper">
                    <div class="admin_wrap">

                        <div class="title_wrap title_size_lg">
                            <p class="title_heading">관리자님 환영합니다.</p>
                        </div>

                        <div class="title_wrap title_size_md first">
                            <p class="title_heading">상품 검색 및 등록</p>
                        </div>

                        <div class="list_sort_wrap type_purple">
                            <div class="admin_search_wrap">
                                <div class="admin_search_box">
                                    <input id="searchKeyword" type="search" class="ip_gnb_search" title="통합검색어 입력" autocomplete="off" value="" placeholder="검색어를 입력해주세요">
                                </div>
                                <a href="#" class="btn_pnf_search"></a>
                            </div>

                            <div class="right_area">
                                <a href="/admin_product_add_page" class="btn_ip btn_primary"><span class="ico_comment_white"></span><span class="text">상품 등록하기</span></a>
                            </div>
                        </div>
                        
                        <div class="title_wrap title_size_md second">
                            <p class="title_heading">상품 리스트</p>
                        </div>
                        
                        <div class="search_result_top">

                            <div class="tab_wrap type_line justify ui-tabs ui-corner-all ui-widget ui-widget-content">

                                <div id="tabSearch" class="tab_content ui-tabs-panel ui-corner-bottom ui-widget-content">
                                    <div class="search_result_wrap">


                                        <!-- 상품 결과 영역 -->
                                        <div class="result_area">
                                            <div class="list_result_wrap">
                                                <p class="result_count">전체 <b class="fc_green">xx</b>건</p>
                                            </div>


                                            <!-- 상품들 리스트 영역 -->
                                            <div class="switch_prod_wrap view_type_list" id="shopData_list">
                                                <ul class="prod_list">

                                                    <!-- 상품 1 영역 -->
                                                    <li class="prod_item">
                                                        <span class="form_chk no_label">
                                                            <input class="result_checkbox spec_checkbox" id="chkBest14" type="checkbox">
                                                            <label for="chkBest14"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품1의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="푸틴을 죽이는 완벽한 방법" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791167763983.jpg">
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
                                                                                <span>푸틴을 죽이는 완벽한 방법</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        우크라이나 키이우 북쪽의 도시 부차. 미하일은 생일을 맞아 가족과 저녁 식사를 하던 중 갑자기 나타난 러시아군에 의해 칼에 찔려 의식을 잃고, 아내와 딸은 끔찍한 일을 당한 후 목숨을 잃는다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">김진명</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">이타북스</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 20일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">18,000원</span>
                                                                    </span>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- 수정하기 or 삭제 버튼 영역 -->
                                                        <div class="prod_btn_wrap">
                                                            <div class="btn_wrap full">
                                                                <a href="/product/update" class="btn_sm btn_light_gray"><span class="text">수정하기</span></a>
                                                                <a href="#" class="btn_sm btn_primary"><span class="text">삭제</span></a>
                                                            </div>
                                                        </div>

                                                    </li>

                                                    <!-- 상품 2 영역 -->
                                                    <li class="prod_item">
                                                        <span class="form_chk no_label">
                                                            <input class="result_checkbox spec_checkbox" id="chkBest115" type="checkbox">
                                                            <label for="chkBest115"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="달의 아이" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791192625652.jpg">
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
                                                                                <span>달의 아이</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">
                                                                        우리는 내일도 오늘과 같은 일들이 펼쳐지고, 소중한 존재는 언제나 그 자리에 있을 것으로 생각한다. 《달의 아이》는 평범한 일상에 갑자기 불어닥친 재난으로 한순간에 자신들의 가장 소중한 ‘무언가’를 잃고 만 사람들의 이야기를 다룬 감동 판타지 소설이다.
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">최윤석</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">포레스트북스</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 15일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">17,000원</span>
                                                                    </span>
                                                                    
                                                                </div>

                                                                
                                                            </div>
                                                        </div>

                                                        <!-- 수정하기 or 삭제 버튼 영역 -->
                                                        <div class="prod_btn_wrap">
                                                            <div class="btn_wrap full">
                                                                <a href="/product/update" class="btn_sm btn_light_gray"><span class="text">수정하기</span></a>
                                                                <a href="#" class="btn_sm btn_primary"><span class="text">삭제</span></a>
                                                            </div>
                                                        </div>

                                                    </li>

                                                    <!-- 상품 3 영역 -->
                                                    <li class="prod_item">
                                                        <span class="form_chk no_label">
                                                            <input class="result_checkbox spec_checkbox" id="chkBest19" type="checkbox">
                                                            <label for="chkBest19"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="테디베어는 죽지 않아" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791193024225.jpg">
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
                                                                                <span>테디베어는 죽지 않아</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">그 구원, 제가 살게요. 얼마예요?”《테디베어는 죽지 않아》는 《칵테일, 러브, 좀비》, 《뉴서울파크 젤리장수 대학살》 등 섬뜩하고도 경쾌한 호러 스릴러의 세계 ‘조예은 월드’를 구축해 온 조예은 작가의 세 번째 장편소설이다.</span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">조예은</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">안전가옥</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 06월 09일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">16,700원</span>
                                                                    </span>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- 수정하기 or 삭제 버튼 영역 -->
                                                        <div class="prod_btn_wrap">
                                                            <div class="btn_wrap full">
                                                                <a href="/product/update" class="btn_sm btn_light_gray"><span class="text">수정하기</span></a>
                                                                <a href="#" class="btn_sm btn_primary"><span class="text">삭제</span></a>
                                                            </div>
                                                        </div>

                                                    </li>

                                                    <!-- 상품 4 영역 -->
                                                    <li class="prod_item">
                                                        <span class="form_chk no_label">
                                                            <input class="result_checkbox spec_checkbox" id="chkAll120" type="checkbox" data-name="2023 해커스 토익 LC 리스닝(Listening) 토익 기본서">
                                                            <label for="chkAll120"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="2레벨로 회귀한 무신 27" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791136447364.jpg">
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
                                                                                <span>2레벨로 회귀한 무신 27</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">『내 상태창 2개』, 『1000년 만에 귀환한 검신』 염비의 야심작!『2레벨로 회귀한 무신』[NO. 4212.’인류’, 강등전 패배.]
                                                                        [인류의 삭제를 시작합니다.]
                                                                    </span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">염비</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">파피루스</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 09월 27일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">9,000원</span>
                                                                    </span>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- 수정하기 or 삭제 버튼 영역 -->
                                                        <div class="prod_btn_wrap">
                                                            <div class="btn_wrap full">
                                                                <a href="/product/update" class="btn_sm btn_light_gray"><span class="text">수정하기</span></a>
                                                                <a href="#" class="btn_sm btn_primary"><span class="text">삭제</span></a>
                                                            </div>
                                                        </div>

                                                    </li>

                                                    <!-- 상품 5 영역 -->
                                                    <li class="prod_item">
                                                        <span class="form_chk no_label">
                                                            <input class="result_checkbox spec_checkbox" id="chkAll12" type="checkbox" data-name="YBM 실전토익 RC 1000 1">
                                                            <label for="chkAll12"><span class="hidden">상품선택</span></label>
                                                        </span>

                                                        <!-- 상품 이미지 & 정보 영역 -->
                                                        <div class="prod_area horizontal">
                                                            <!-- 상품의 이미지 영역 -->
                                                            <div class="prod_thumb_box size_lg">
                                                                <a href="/product_read_page" class="prod_link">
                                                                    <span class="img_box">
                                                                        <img data-kbbfn="s3-image" loading="lazy" alt="열일곱, 오늘도 괜찮기로 마음먹다" src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791193162026.jpg">
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
                                                                                <span>열일곱, 오늘도 괜찮기로 마음먹다</span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품 설명 -->
                                                                <div class="prod_desc_info">
                                                                    <span class="prod_desc">10대의 현실을 예리하게 파고들어 온 박하령 작가가 이번에는 밝은 마음의 방향을 바라본다. 무미건조한 일상이 뒤흔들리는 변화, 바로 ‘짝사랑’과 ‘썸’이다.</span>
                                                                </div>

                                                                <!-- 상품의 작가 소개 -->
                                                                <div class="prod_author_info">
                                                                    <div class="auto_overflow_wrap prod_author_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/author_book_page" class="author rep">박하령</a>
                                                                                <span class="type">저자(글)</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- 상품의 출판사 소개 -->
                                                                <div class="prod_publish">
                                                                    <a href="/publisher_page" class="text">책폴</a>
                                                                    <span class="gap">·</span>
                                                                    <span class="date">2023년 08월 10일</span>
                                                                </div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">12,000원</span>
                                                                    </span>

                                                                </div>

                                                            </div>
                                                        </div>

                                                        <!-- 수정하기 or 삭제 버튼 영역 -->
                                                        <div class="prod_btn_wrap">
                                                            <div class="btn_wrap full">
                                                                <a href="/product/update" class="btn_sm btn_light_gray"><span class="text">수정하기</span></a>
                                                                <a href="#" class="btn_sm btn_primary"><span class="text">삭제</span></a>
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