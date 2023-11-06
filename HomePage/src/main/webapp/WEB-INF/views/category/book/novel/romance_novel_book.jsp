<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/book/book.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	
	// 장바구니에 담기
	$('.cart_add').on('click', function() {
	const bno = $(this).attr('data-bno');
	const member = '${memberId}';
		
		if (member == 0) {
		const choice = confirm('장바구니는 회원만 담을 수 있습니다. 로그인하시겠습니까?');
		    if (choice == false) {
		    	return;
		    } else {
		        // 확인 버튼을 선택한 경우
		        location.href = "localhost:8081/login";
		    }
		}
		
		const form = `
			<form action='/cart/add' method='post'>
				<input type='hidden' name='bno' value='\${bno}'>
				<input type='hidden' name='cartCount' value='1'>
			</form>
		`;
		
		$(form).appendTo($('body')).submit();
		
		alert('상품이 장바구니에 담겼습니다.');		
		
	})
	
	// 여러 도서 장바구니에 담기
	$('.btn_cart').on('click', function() {
		const member = '${memberId}';
		
		if (member == 0) {
		const choice = confirm('장바구니는 회원만 담을 수 있습니다. 로그인하시겠습니까?');
		    if (choice == false) {
		    	return;
		    } else {
		        // 확인 버튼을 선택한 경우
		        location.href = "localhost:8081/login";
		    }
		}
	    var bnos = [];
	    // 체크된 체크박스를 순회
	    $("input[name='chkList']:checked").each(function() {
	        bnos.push($(this).attr('id')); // 체크박스의 id를 bno로 사용
	    });
	
	    var form = `
	        <form action='/cart/multiAdd' method='post'>
	            <input type='hidden' name='bnos' value='\${bnos.join(",")}'>
	            <input type='hidden' name='cartCount' value='1'>
	        </form>
	    `;
	    $(form).appendTo($('body')).submit();
	    alert('상품이 장바구니에 담겼습니다.');	
	});
	
	// 바로 구매
	$('.order').on('click', function(){
		const bno = $(this).attr('data-bno');
		
		const form = `
			<form action="/buy/\${bno}" method="post">
				<input type="hidden" name="bno" value="\${bno}">
			</form>
		`;
		$(form).appendTo($('body')).submit();
	})
})
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
		<main class="container_wrapper">
            <div class="main_inner">
                <aside class="aside_wrap sub_category">
                   <jsp:include page="/WEB-INF/views/include/book/novel/romance_novel_left_aside.jsp" />
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
                                                <p class="result_count">
                                                    전체 <b class="fc_green">${count}</b>건
                                                </p>
                                                <div class="right_area">
													<div class="item_group">
														<button type="button" class="btn_sm btn_line_gray btn_cart">
															<span class="ico_cart"></span><span class="text">장바구니
																담기</span>
														</button>
													</div>
												</div>
                                            </div>


                                            <!-- 상품들 리스트 영역 -->
                                            <div class="switch_prod_wrap view_type_list" id="shopData_list">
                                                <ul class="prod_list">
                                                    <c:forEach var="book" items="${page.books }">
                                                        <li class="prod_item"><span class="form_chk no_label">
                                                                <input class="result_checkbox spec_checkbox" id="${book.bno }" type="checkbox" name="chkList">>
                                                                <label for="${book.bno }"><span class="hidden">상품선택</span></label>
                                                            </span> <!-- 상품 이미지 & 정보 영역 -->
                                                            <div class="prod_area horizontal">
                                                                <!-- 상품1의 이미지 영역 -->
                                                                <div class="prod_thumb_box size_lg">
                                                                    <a href="/book/read?bno=${book.bno }" class="prod_link"> <span class="img_box"> <img loading="lazy" alt="${book.bookTitle }" src="${book.bookImage }">
                                                                        </span>
                                                                    </a>
                                                                </div>

                                                                <!-- 상품의 소개 영역 -->
                                                                <div class="prod_info_box">
                                                                    <!-- 상품의 이름 -->
                                                                    <div class="auto_overflow_wrap prod_name_group">
                                                                        <div class="auto_overflow_contents">
                                                                            <div class="auto_overflow_inner">
                                                                                <a href="/book/read?bno=${book.bno }" class="prod_info">
                                                                                    <span class="prod_category">[국내도서]</span> <span>${book.bookTitle }</span>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- 상품 설명 -->
                                                                    <div class="prod_desc_info">
                                                                        <span class="prod_desc">${book.bookIntro }</span>
                                                                    </div>

                                                                    <!-- 상품의 작가 소개 -->
                                                                    <div class="prod_author_info">
                                                                        <div class="auto_overflow_wrap prod_author_group">
                                                                            <div class="auto_overflow_contents">
                                                                                <div class="auto_overflow_inner">
                                                                                    <a href="/book/search/authorName?keyword=${book.authorName}" class="author rep">${book.authorName }</a>
                                                                                    <span class="type">저자(글)</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- 상품의 출판사 소개 -->
                                                                    <div class="prod_publish">
                                                                        <a href="/book/search/publisher?keyword=${book.publisherName}" class="text">${book.publisherName }</a>
                                                                        <span class="gap">·</span>
                                                                        <span class="date">${book.publishDate.substring(0, 10) }</span>
                                                                    </div>

                                                                    <!-- 상품의 가격 및 적립 정보 -->
                                                                    <div class="prod_price">
                                                                        <span class="price_normal">
                                                                            <span class="text">정가</span>
                                                                            <span class="val">
                                                                                <fmt:formatNumber type="number" pattern="#,##0" value="${book.bookPrice }" />원
                                                                            </span>
                                                                        </span>
                                                                        <span class="gap">|</span>
                                                                        <span class="point">
                                                                            <fmt:formatNumber type="number" pattern="#,##0" value="${book.pointEarnings }" />p
                                                                            <span class="rate">(
                                                                                <fmt:formatNumber type="percent" value="${book.pointRate }" />)
                                                                            </span>
                                                                        </span>

                                                                    </div>

                                                                    <!-- 리뷰 영역 -->
                                                                    <div class="prod_bottom">
                                                                        <span class="review_klover_box"> <span class="review_klover_text font_size_xxs">9.68</span>
                                                                            <span class="review_desc">(55개의 리뷰)</span>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div> <!-- 예상 배송 날짜 입력란 -->
                                                            <div class="prod_order_state">
                                                                <span class="badge_sm badge_pill badge_primary">
                                                                    <span class="text">배송</span>
                                                                </span>
                                                                <p class="order_state_desc">
                                                                    주문 시<br> <span class="fw_bold">3일 후 </span><br>도착예정
                                                                </p>
                                                            </div> 
                                                            <!-- 장바구니 or 바로구매 버튼 영역 -->
															<div class="prod_btn_wrap">
																<div class="btn_wrap full">
																	<button class="btn_sm btn_light_gray cart_add" data-bno="${book.bno}">
																		<span class="text">장바구니</span>
																	</button> 
																	<button class="btn_sm btn_primary order" data-bno="${book.bno}">
																		<span class="text">바로구매</span>
																	</button>
																</div>
															</div>
                                                        </li>
                                                    </c:forEach>

                                                </ul>
                                            </div>

                                            <!-- 페이지 설정 -->
                                            <div class="pagination">
                                                <c:if test="${page.prev>0}">
                                                    <button class="btn_page prev" href="/category/book/${page.categoryParent}/${page.categoryCode}?pageno=${page.prev}">
                                                        <span class="hidden">이전</span>
                                                    </button>
                                                </c:if>
                                                <div class="page_num">
                                                    <c:forEach begin="${page.start}" end="${page.end}" var="i">
                                                        <c:if test="${i== page.pageno}">
                                                            <a href="/category/book/${page.categoryParent}/${page.categoryCode}?pageno=${i}" class="btn_page_num active">${i}</a>
                                                        </c:if>
                                                        <c:if test="${i != page.pageno}">
                                                            <a href="/category/book/${page.categoryParent}/${page.categoryCode}?pageno=${i}" class="btn_page_num">${i}</a>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${page.next>0}">
                                                    <button class="btn_page next" href="/category/book/${page.categoryParent}/${page.categoryCode}?pageno=${page.next}">
                                                        <span class="hidden">다음</span>
                                                    </button>
                                                </c:if>
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