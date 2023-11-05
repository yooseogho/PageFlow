<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/book/category.css">
<title>Insert title here</title>
</head>
<script>
	const v = '${memberId}';
	console.log(v);
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
            <div class="main_inner">
                <aside class="aside_wrap sub_category">
                    <jsp:include page="/WEB-INF/views/include/book/category_book_left_aside.jsp" />
                </aside>

                <section class="contents_wrap">

                    <div class="contents_inner">
                        <div class="template_row">

                            <div class="template_col">

                                <div class="title_wrap title_size_md">
                                    <h2 class="hidden">새로나온 책 l 소설</h2>
                                    <p class="title_heading">새로나온 책 l 소설</p>

                                    <div class="right_area">
                                        <a href="/category/book/110" class="btn_more_view size_lg"><span class="text">더보기</span><span class="ico_arw"></span></a>
                                    </div>
                                </div>
                                <div class="template_common_swiper swiper-container">
                                    <ul class="swiper-wrapper">


                                        <li class="swiper-slide">
                                            <ul class="prod_list">
                                       		<c:forEach items="${novelBooks}" var="book">
	                                            <li class="prod_item">
	                                                    <div class="prod_area">
	                                                        <div class="prod_thumb_box">
	                                                            <a href="/book/read?bno=${book.bno}" class="prod_link">
	                                                                <span class="img_box">
	                                                                    <img data-kbbfn="s3-image" alt="${book.bookTitle}" loading="lazy" src="${book.bookImage}">
	                                                                </span>
	                                                            </a>
	                                                        </div>
	
	                                                        <div class="prod_info_box">
	                                                            <a href="/book/read?bno=${book.bno}" class="prod_info">
	                                                                <h3 class="prod_name">${book.bookTitle}</h3>
	                                                            </a>
	
	                                                            <span class="prod_author">
	                                                                ${book.authorName}
	                                                                ·
	                                                                ${book.publisherName}
	                                                            </span>
	
	                                                            <div class="prod_price">
	                                                                <span class="price">
	                                                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${book.bookPrice}"/></span>
	                                                                    <span class="unit">원</span>
	                                                                </span>
	
	                                                                <span class="point">
	                                                                    <fmt:formatNumber type="number" pattern="#,##0" value="${book.pointEarnings}"/>P 
	                                                                    <span style="margin-left:2px;">(<fmt:formatNumber type="percent" value="${book.pointRate}" />)</span>
	                                                                </span>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                            	 </li>
                                                </c:forEach>

                                            </ul>
                                        </li>

                                    </ul>
                                </div>
                                
                            </div>

                        </div>

                        <div class="template_row">

                            <div class="template_col">

                                <div class="title_wrap title_size_md">
                                    <h2 class="hidden">새로나온 책 l 만화</h2>
                                    <p class="title_heading">새로나온 책 l 만화</p>

                                    <div class="right_area">
                                        <a href="/category/book/120" class="btn_more_view size_lg"><span class="text">더보기</span><span class="ico_arw"></span></a>
                                    </div>
                                </div>
                                <div class="template_common_swiper swiper-container">
                                    <ul class="swiper-wrapper">


                                        <li class="swiper-slide">
                                            <ul class="prod_list">
												<c:forEach items="${comicBooks}" var="book">
	                                                <li class="prod_item">
	                                                    <div class="prod_area">
	                                                        <div class="prod_thumb_box">
	                                                            <a href="/book/read?bno=${book.bno}" class="prod_link">
	                                                                <span class="img_box">
	                                                                    <img data-kbbfn="s3-image" alt="${book.bookTitle}" loading="lazy" src="${book.bookImage}">
	                                                                </span>
	                                                            </a>
	                                                        </div>
	
	                                                        <div class="prod_info_box">
	                                                            <a href="/book/read?bno=${book.bno}" class="prod_info">
	                                                                <h3 class="prod_name">${book.bookTitle}</h3>
	                                                            </a>
	
	                                                            <span class="prod_author">
	                                                                ${book.authorName}
	                                                                ·
	                                                                ${book.publisherName}
	                                                            </span>
	
	                                                            <div class="prod_price">
	                                                                <span class="price">
	                                                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${book.bookPrice}"/></span>
	                                                                    <span class="unit">원</span>
	                                                                </span>
	
	                                                                <span class="point">
	                                                                    ${book.pointEarnings}P 
	                                                                    <span style="margin-left:2px;">(<fmt:formatNumber type="percent" value="${book.pointRate}" />)</span>
	                                                                </span>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	
	                                                </li>
	                                            </c:forEach>

                                            </ul>
                                        </li>

                                    </ul>
                                </div>


                            </div>

                        </div>

                        <div class="template_row">

                            <div class="template_col">

                                <div class="title_wrap title_size_md">
                                    <h2 class="hidden">새로나온 책 l 참고도서</h2>
                                    <p class="title_heading">새로나온 책 l 참고도서</p>

                                    <div class="right_area">
                                        <a href="/category/book/130" class="btn_more_view size_lg"><span class="text">더보기</span><span class="ico_arw"></span></a>

                                    </div>
                                </div>
                                <div class="template_common_swiper swiper-container">
                                    <ul class="swiper-wrapper">


                                        <li class="swiper-slide">
                                            <ul class="prod_list">

                                                <c:forEach items="${textBooks}" var="book">
	                                                <li class="prod_item">
	                                                    <div class="prod_area">
	                                                        <div class="prod_thumb_box">
	                                                            <a href="/book/read?bno=${book.bno}" class="prod_link">
	                                                                <span class="img_box">
	                                                                    <img data-kbbfn="s3-image" alt="${book.bookTitle}" loading="lazy" src="${book.bookImage}">
	                                                                </span>
	                                                            </a>
	                                                        </div>
	
	                                                        <div class="prod_info_box">
	                                                            <a href="/book/read?bno=${book.bno}" class="prod_info">
	                                                                <h3 class="prod_name">${book.bookTitle}</h3>
	                                                            </a>
	
	                                                            <span class="prod_author">
	                                                                ${book.authorName}
	                                                                ·
	                                                                ${book.publisherName}
	                                                            </span>
	
	                                                            <div class="prod_price">
	                                                                <span class="price">
	                                                                    <span class="val"><fmt:formatNumber type="number" pattern="#,##0" value="${book.bookPrice}"/></span>
	                                                                    <span class="unit">원</span>
	                                                                </span>
	
	                                                                <span class="point">
	                                                                    ${book.pointEarnings}P 
	                                                                    <span style="margin-left:2px;">(<fmt:formatNumber type="percent" value="${book.pointRate}" />)</span>
	                                                                </span>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	
	                                                </li>
	                                            </c:forEach>

                                            </ul>
                                        </li>

                                    </ul>
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