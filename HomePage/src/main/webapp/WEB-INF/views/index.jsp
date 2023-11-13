<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>PageFlow</title>
</head>
<script>
$(document).ready(function () {
    var slides = $('#slide11'); //전체 슬라이드 컨테이너
    var slideImg = $('#slide11 li'); //모든 슬라이드들
    var currentIdx = 0; //현재 슬라이드 index
    var slideCount = slideImg.length; // 슬라이드 개수
    var prev = $('#prev1'); //이전 버튼
    var next = $('#next1'); //다음 버튼
    var slideWidth = 273; //한개의 슬라이드 넓이
    var slideMargin = 36; //슬라이드간의 margin 값

    //전체 슬라이드 컨테이너 넓이 설정
    slides.css('width', (slideWidth + slideMargin) * slideCount + 'px');

    function moveSlide1(num) {
    	slides.stop().animate({'left' : -num * 309 + 'px'}, 500);
        currentIdx = num;
    }

    prev.click(function () {
        if (currentIdx !== 0) moveSlide1(currentIdx - 1);
    });

    next.click(function () {
        if (currentIdx !== slideCount - 1) moveSlide1(currentIdx + 1);
    });

    var slides2 = $('#slide22'); //전체 슬라이드 컨테이너
    var slideImg2 = $('#slide22 li'); //모든 슬라이드들
    var currentIdx2 = 0; //현재 슬라이드 index
    var slideCount2 = slideImg2.length; // 슬라이드 개수
    var prev2 = $('#prev2'); //이전 버튼
    var next2 = $('#next2'); //다음 버튼
    var slideWidth2 = 273; //한개의 슬라이드 넓이
    var slideMargin2 = 36; //슬라이드간의 margin 값

    //전체 슬라이드 컨테이너 넓이 설정
    slides2.css('width', (slideWidth2 + slideMargin2) * slideCount2 + 'px');

    function moveSlide2(num2) {
    	slides2.stop().animate({'left' : -num2 * 309 + 'px'}, 500);
        currentIdx2 = num2;
    }

    prev2.click(function () {
        if (currentIdx2 !== 0) moveSlide2(currentIdx2 - 1);
    });

    next2.click(function () {
        if (currentIdx2 !== slideCount2 - 1) moveSlide2(currentIdx2 + 1);
    });
    
    const v = '${manyOrder}';
    console.log(v);
    
});

</script>
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
            <div class="welcome_main_content_area">
                <div class="contents_inner">
                    <div class="title_wrap title_size_xxl">
                        <h2 class="title_heading">많이 팔린 도서 Top 7!</h2>
                        
                    </div>
                    <div class="fluid_swiper_wrap outside_nav">
                        <div class="swiper-container swiper-container-horizontal">
                            <ul class="swiper-wrapper" id="slide11">
                            	<c:forEach items="${manyOrder}" var="order" begin="0" end="6">
	                                <li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 273px; margin-right: 36px;">
	                                    <div class="prod_area">
	                                        <div class="prod_thumb_box">
	                                            <a href="/book/read?bno=${order.bno}" class="prod_link">
	                                                <span class="img_box"> <img  alt="${order.bookTitle}" src="${order.bookImage}">
	                                                </span> </a>
	                                        </div>
	                                        <div class="prod_info_box size_lg">
	                                            <a href="/category/book/${order.categoryParent}/${order.categoryCode}" class="prod_info" style="width : 50%;">
	                                                <span class="prod_category">${order.categoryName}</span>
	                                            </a>
	                                            <a href="/book/read?bno=${order.bno}" class="prod_info">    
	                                            	<span class="prod_name">${order.bookTitle}</span>
	                                            </a> 
	                                            <span class="prod_author">
	                                            	${order.authorName}
		                                            <span class="gap">·</span>
	    	                                        <span class="prod_publish">${order.publisherName}</span>
	                                            </span>
	                                        </div>
	                                    </div>
	                                </li>
                                </c:forEach>
                            </ul>
                            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                        </div>
                        <button type="button" id="prev1" class="swiper-button-prev type_white swiper-button-disabled">
                            <span class="hidden">이전</span>
                        </button> 
                        <button type="button" id="next1" class="swiper-button-next type_white" ><span class="hidden">다음</span></button>
                    </div>
                </div>
                </div>
                <div class="welcome_main_content_area">
                <div class="contents_inner">
                    <div class="title_wrap title_size_xxl">
                        <h2 class="title_heading">뜨거운 신작 바로 이곳에서!</h2>
                        <div class="right_area">
                        	<a href="/category/book" class="btn_more_plus_text">
	                        	<span class="text">더보기</span>
	                        	<span class="ico_plus"></span>
                        	</a> 
  						</div>			
                    </div>
                    <div class="fluid_swiper_wrap outside_nav">
                        <div class="swiper-container swiper-container-horizontal" >
                            <ul class="swiper-wrapper" id="slide22">
                            	<c:forEach items="${newBook}" var="book" begin="0" end="6">
	                                <li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 273px; margin-right: 36px;">
	                                    <div class="prod_area">
	                                        <div class="prod_thumb_box">
	                                            <a href="/book/read?bno=${book.bno}" class="prod_link">
	                                                <span class="img_box"> <img alt="${book.bookTitle}" src="/category/${book.bookImage}">
	                                                </span> </a>
	                                        </div>
	                                        <div class="prod_info_box size_lg">
	                                            <a href="/category/book/${book.categoryParent}/${book.categoryCode}" class="prod_info" style="width : 50%;">
	                                                <span class="prod_category">${book.categoryName}</span>
	                                            </a>
	                                            <a href="/book/read?bno=${book.bno}" class="prod_info">    
	                                            	<span class="prod_name">${book.bookTitle}</span>
	                                            </a> 
	                                            <span class="prod_author">
	                                            	${book.authorName}
		                                            <span class="gap">·</span>
	    	                                        <span class="prod_publish">${book.publisherName}</span>
	                                            </span>
	                                        </div>
	                                    </div>
	                                </li>
                                </c:forEach>
                            </ul>
                            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                        </div>
                        <button type="button" id="prev2" class="swiper-button-prev type_white swiper-button-disabled">
                            <span class="hidden">이전</span>
                        </button> 
                        <button type="button" id="next2" class="swiper-button-next type_white" ><span class="hidden">다음</span></button>
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