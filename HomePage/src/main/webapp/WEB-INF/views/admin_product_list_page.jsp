<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin_product_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		 /** 상품 삭제 */
		 $('.delete').on('click', function() {
			 var bno = $(this).data('bno');
		     const form = `
		     	<form action='/admin/book/delete' method='post'>
		     		<input type='hidden' name='bno' value='\${bno}'>
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
                                	<form id="adminsearchForm" action="/admin/book/list/search" method="get">
                                   		<input type="search" class="ip_gnb_search" title="통합검색어 입력" placeholder="검색어를 입력해주세요" name="keyword">
                                   	</form>	
                                </div>
                                <a href="#" class="btn_pnf_search" onclick='event.preventDefault(); document.getElementById("adminsearchForm").submit();'></a>
                            </div>

                            <div class="right_area">
                                <a href="/admin/book/add" class="btn_ip btn_primary"><span class="ico_comment_white"></span><span class="text">상품 등록하기</span></a>
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
                                                <p class="result_count">전체 <b class="fc_green">${count}</b>건</p>
                                            </div>


                                            <!-- 상품들 리스트 영역 -->
                                            <div class="switch_prod_wrap view_type_list" id="shopData_list">
                                                <ul class="prod_list">

                                                    <c:forEach var="book" items="${page.books}">
														<li class="prod_item">
															<span class="form_chk no_label">
															<input class="result_checkbox spec_checkbox" id="${book.bno}" type="checkbox"> 
															<label for="${book.bno}"><span class="hidden">상품선택</span></label>
															</span> 
															<!-- 상품 이미지 & 정보 영역 -->
															<div class="prod_area horizontal">
																<!-- 상품1의 이미지 영역 -->
																<div class="prod_thumb_box size_lg">
																	<a href="/book/read?bno=${book.bno}" class="prod_link">
																		<span class="img_box"> 
																			<img loading="lazy" alt="${book.bookTitle}" src="${book.bookImage}">
																		</span>
																	</a>
																</div>

																<!-- 상품의 소개 영역 -->
																<div class="prod_info_box">
																	<!-- 상품의 이름 -->
																	<div class="auto_overflow_wrap prod_name_group">
																		<div class="auto_overflow_contents">
																			<div class="auto_overflow_inner">
																				<a href="/book/read?bno=${book.bno}" class="prod_info">
																					<span class="prod_category">[국내도서]</span> <span>${book.bookTitle}</span>
																				</a>
																			</div>
																		</div>
																	</div>

																	<!-- 상품 설명 -->
																	<div class="prod_desc_info">
																		<span class="prod_desc">${book.bookIntro}</span>
																	</div>

																	<!-- 상품의 작가 소개 -->
																	<div class="prod_author_info">
																		<div class="auto_overflow_wrap prod_author_group">
																			<div class="auto_overflow_contents">
																				<div class="auto_overflow_inner">
																					<a href="/book/search/authorName?keyword=${book.authorName}" class="author rep">${book.authorName}</a>
																					<span class="type">저자(글)</span>
																				</div>
																			</div>
																		</div>
																	</div>

																	<!-- 상품의 출판사 소개 -->
																	<div class="prod_publish">
																		<a href="/book/search/publisher?keyword=${book.publisherName}" class="text">${book.publisherName}</a>
																		<span class="gap">·</span> <span class="date">${book.publishDate}</span>
																	</div>

                                                                <!-- 상품의 가격 및 적립 정보 -->
                                                                <div class="prod_price">
                                                                    <span class="price_normal">
                                                                        <span class="text">정가</span>
                                                                        <span class="val">
                                                                        	<fmt:formatNumber type="number" pattern="#,##0" value="${book.bookPrice }" />원
                                                                        </span>
                                                                    </span>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- 수정하기 or 삭제 버튼 영역 -->
                                                        <div class="prod_btn_wrap">
                                                            <div class="btn_wrap full">
                                                                <a href="/admin/book/update/${book.bno}" class="btn_sm btn_light_gray"><span class="text">수정하기</span></a>
                                                                <a class="btn_sm btn_primary delete" data-bno="${book.bno}"><span class="text">삭제</span></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                  </c:forEach>

                                                </ul>
                                            </div>

                                            <div class="pagination">
												<c:if test="${page.prev>0}">
													<a class="btn_page prev" href="/admin/book/list?pageno=${page.prev}">
														<span class="hidden">이전</span>
													</a>
												</c:if>
												<div class="page_num">
													<c:forEach begin="${page.start}" end="${page.end}" var="i">
														<c:if test="${i== page.pageno}">
															<a href="/admin/book/list?pageno=${i}" class="btn_page_num active">${i}</a>
														</c:if>
														<c:if test="${i != page.pageno}">
															<a href="/admin/book/list?pageno=${i}" class="btn_page_num">${i}</a>
														</c:if>
													</c:forEach>
												</div>
												<c:if test="${page.next>0}">
													<a class="btn_page next" href="/admin/book/list?pageno=${page.next}">
														<span class="hidden">다음</span>
													</a>
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