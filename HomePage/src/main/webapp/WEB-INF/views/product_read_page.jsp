<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/product_read.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>

<script>
	<!-- 재고량보다 더 많이 장바구니에 담는 경우 -->
	const msg = '${msg}';
	if(msg!==''){
		alert(msg);
	}

	<!-- 스크롤 내릴 때 상품정보 / 리뷰 / 교환/환불/품절 div 영역 상단 고정 -->
    $(document).ready(function() {
		var lnb = $(".sps_scroll_fixed").offset().top;
	    $(window).scroll(function() {
	      	var window = $(this).scrollTop();
	
	        if(lnb <= window) {
	          $(".sps_scroll_fixed").css("position","fixed")
	        } else {
	          $(".sps_scroll_fixed").css("position","absolute");
	        }
	    })
	    
	    $('#cart_add').on('click', function() {
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

	    	let quantityInput = $('.form_spinner.ui-spinner-input').val();
	    		    		    		    	
	    	const form = `
	    		<form action='/cart/add' method='post'>
	    			<input type='hidden' name='bno' value='${book.bno}'>
	    			<input type='hidden' name='cartCount' value='\${quantityInput}'>
	    		</form>
	    	`;
	    	
	    	$(form).appendTo($('body')).submit();
	    	
	    	alert('상품이 장바구니에 담겼습니다.');
	    	
	    })
	    
	    
	    // 바로 구매
		$('#buy').on('click', function(){
			const bno = $('#buy').attr('data-bno');
			let quantityInput = $('.form_spinner.ui-spinner-input').val();
			const form = `
				<form action="/buy/\${bno}" method="post">
					<input type="hidden" name="bno" value="\${bno}">
					<input type='hidden' name='cartCount' value='\${quantityInput}'>
				</form>
			`;
			$(form).appendTo($('body')).submit();
			alert('주문 페이지로 이동합니다.')
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
		<main class="container_wrapper" style="position: relative;">
            <section class="contents_wrap">
	                <div class="prod_detail_header">
	                    <div class="header_contents_inner">
	
	                        <div class="prod_detail_title_wrap">
	                            <div class="prod_title_area">
	                                <div class="prod_title_box auto_overflow_wrap">
	
	                                    <div class="auto_overflow_contents">
	                                        <div class="auto_overflow_inner">
	                                            <h1><span class="prod_title">${book.bookTitle}</span>
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
	                                                        <a href="/book/search/authorName?keyword=${book.authorName}" style="font-weight: 700;">${book.authorName}</a>
	                                                        저자(글)
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	
	                                        <div class="prod_info_text publish_date">
	                                            <a href="/book/search/publisher?keyword=${book.publisherName}" class="btn_publish_link" style="font-weight: 700;">${book.publisherName}</a>
	                                            · ${book.publishDate}
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
	                                                            <img src="${book.bookImage}" alt="${book.bookTitle}">
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
	                                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${book.bookPrice}"/><span class="unit">원</span></span>
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
	                                                        ${book.pointEarnings}p
	                                                    </div>
	                                                </div>
	                                            </div>
	
	                                        </div>
	                                        
	                                        <div class="prod_guide_box">
	
	                                            <div class="prod_guide_row">
	                                                <div class="prod_guide_title">재고량</div>
	                                                <div class="prod_guide_cont">
	                                                    <div class="point_text">
	                                                        ${book.stock}개	
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
	                                    <li class="tab_item"><a href="#" class="tab_link"><span class="tab_text">상품정보</span></a></li>
	                                    <li class="tab_item"><a href="#" class="tab_link"><span class="tab_text">리뷰 <span class="num">(0)</span></span></a></li>
	                                    <li class="tab_item"><a href="#" class="tab_link"><span class="tab_text">교환/반품/품절</span></a></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="prod_detail_contents">
	                        <div class="prod_detail_contents_inner">
	
	                            <div class="tab_contents">
	
	                                <div class="product_detail_area detail_img">
	                                    <div class="inner">
	                                        ${book.bookContent}
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
												    <%-- categories 변수에 담긴 각각의 카테고리에 대해 반복문 실행. 
												         각 반복마다 category 변수에 현재 카테고리 객체가 저장됨.
												         varStatus 속성을 사용하여 현재 반복의 상태 정보를 status 변수에 저장 --%>
												    <c:forEach items="${categories}" var="category" varStatus="status">
												        <%-- 조건문 시작. 현재 처리 중인 카테고리가 마지막 항목인지 확인 --%>
												        <c:choose>
												            <%-- 첫 번째 항목일 경우 (즉, status.index 가 0 일 경우) 아래 내용 실행 --%>
												            <c:when test="${status.index == 0}">
												                <a href="/category/book" class="intro_category_link">${category.categoryName}</a>
												                <%-- 각 카테고리 사이에 위치하는 구분자 출력 --%>
												                <span class="arw_category">&nbsp;&gt;&nbsp;</span>                
												            </c:when>
												
												            <%-- 마지막 항목일 경우 (즉, status.last 가 true 일 경우) 아래 내용 실행 --%>
												            <c:when test="${status.last}">
												                <%-- 마지막 항목일 경우 --%>
												                <a href="/category/book/${categories[status.index - 1].categoryCode}/${category.categoryCode}" class="intro_category_link">${category.categoryName}</a>  
												            </c:when>
												
												            <%-- 첫 번째나 마지막 항목이 아닐 경우 --%>  
												            <c:otherwise>
												                <%-- 부모카테고리만 포함하는 링크 생성--%>  
												                <a href="/category/book/${category.categoryCode}" class="intro_category_link">${category.categoryName}</a> 
												                <%-- 각 카테고리 사이에 위치하는 구분자 출력 --%> 
												                <span class="arw_category">&nbsp;&gt;&nbsp;</span>                
												            </c:otherwise>
												
												        </c:choose>   
												    </c:forEach>   
												</li> 
	                                        </ul>
	                                    </div>
	                                    <div class="intro_bottom">
	
	                                        <div class="info_text">${book.bookIntro}</div>
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
	                                                <a href="/book/search/authorName?keyword=${book.authorName}" class="person_link">
	                                                    <span class="text">${book.authorName}</span>
	                                                </a>
	
	                                            </h3>
	                                            <div class="right_area">
	                                                <a href="/book/search/authorName?keyword=${book.authorName}" class="btn_xs btn_line_gray">
	                                                    <span class="ico_write_info"></span>
	                                                    <span class="text">작가의 다른 작품 더보기</span>
	                                                </a>
	                                            </div>
	                                        </div>
	
	                                        <div class="writer_info_box">
	                                            <div class="auto_overflow_wrap">
	                                                <div class="auto_overflow_contents">
	                                                    <div class="auto_overflow_inner">
	                                                        <p class="info_text">작가의 다른 작품</p>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	
	                                        <div class="prod_swiper_wrap swiper-container swiper-container-horizontal swiper-container-free-mode">
	                                            <ul class="prod_list swiper-wrapper">
	                                            	<!-- 작가의 다른 작품 최대 8까지 이미지와 제목 보여줌 -->
	                                                <c:forEach var="book" items="${otherBooks}" varStatus="status">
	                                                	<!-- 현재 read 페이지에 있는 작품 정보는 제외하기 위한 if -->
													    <c:if test="${status.index < 7 and book.bno != currentBno}">
													        <li class="prod_item swiper-slide swiper-slide-visible swiper-slide-active">
													            <div class="prod_area">
													                <div class="prod_thumb_box">
													                    <a href="/book/read?bno=${book.bno}" class="prod_link">
													                        <span class="img_box">
													                            <img loading="lazy" alt="${book.bookTitle}" src="${book.bookImage}">
													                        </span>
													                    </a>
													                </div>
													                <div class="prod_info_box">
													                    <a href="/book/read?bno=${book.bno}" class="prod_info">
													                        <span class="prod_name">${book.bookTitle}</span>
													                    </a>
													                </div>
													            </div>
													        </li>    
													    </c:if>    
													</c:forEach>
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
	                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${book.bookPrice}"/></span>
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
	                                    <button id="cart_add" type="button" class="btn_lg btn_line_primary"><span class="text">장바구니</span></button>
	                                    <div id="prodBuyWrap" class="btn_wrap overlap single">
	                                        <button id="buy" type="button" class="btn_lg btn_primary" data-bno="${book.bno}"><span class="text">바로구매</span></button>
	                                  	</div>
	                                </div>
	                                <%-- 수량에 따라 가격 변경시키는 Script --%>
	                             	<script>
		                             // 초기 상품 가격 및 재고 설정
		                             	var bookPrice = ${book.bookPrice};
		                             	var stock = ${book.stock};
									
									    // 상품 수량 input 태그와 총 상품 금액 span 태그 선택
									    var quantityInput = document.querySelector('.form_spinner.ui-spinner-input');
									    var decreaseButton = document.querySelector('.decrease');
									    var increaseButton = document.querySelector('.increase');
									    var totalPriceSpan = document.querySelector('.prod_info_price .val');
									
									    // 상품 수량 변경 시 핸들러 함수 정의
									    function updateTotalPrice() {
									        var quantity = parseInt(quantityInput.value);
									        if (isNaN(quantity) || quantity < 1) {
									            quantity = 1;
									            quantityInput.value = 1;
									        }
									        
									       	// 숫자 포맷팅 함수. 세 자리 마다 콤마 추가.
									        function numberWithCommas(x) {
									            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
									        }
									
									        totalPriceSpan.textContent = numberWithCommas(bookPrice * quantity);
									    }
									
									     // 수량 감소 버튼 클릭 이벤트 핸들러
									     decreaseButton.addEventListener('click', function() {
									         if (quantityInput.value > 1) {
									             quantityInput.value--;
									         }
									         updateTotalPrice();
									     });
									
									 	 // 수량 증가 버튼 클릭 이벤트 핸들러
									     increaseButton.addEventListener('click', function() {
									          if (quantityInput.value < stock) { // 재고보다 작은 경우에만 증가 가능하게 함.
									              quantityInput.value++;
									          } else {
									              alert('재고량보다 많은 수량을 선택할 수 없습니다.'); // 재고량보다 많을 때 알림창 띄우기
									          }
									          updateTotalPrice();
									     });
									     
									  	 // 입력창에서 Enter 키 입력 이벤트 핸들러
									     quantityInput.addEventListener('keydown', function(e) {
									         if (e.key === 'Enter') { 
									        	 // Enter 키를 눌러도 form에 submit 되는것을 막는다
									             e.preventDefault();  
									          
									             // 사용자가 직접 입력한 값이 재고를 초과하면 최대 재고로 설정함.
									             if (parseInt(quantityInput.value) > stock) { 
									                 quantityInput.value = stock; 
									             }
									             updateTotalPrice();
									         }
									     });
									
									</script>
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