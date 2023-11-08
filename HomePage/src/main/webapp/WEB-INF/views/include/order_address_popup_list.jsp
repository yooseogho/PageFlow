<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/include/address_popup_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<script>
$(document).ready(function() {
    $('#select_defaultAddress_btn').on('click', function() {
        $('input[name="deliverySelect"]:checked').each(function() {
            var dno = $(this).attr('data-dno');
            
            if($('#popDeliveryListSetDefault').is(':checked')) {
	            
	            const form1 = `
	            	<form action="/order/delivery/list" method="post">
	            		<input type="hidden" name="dno" value="\${dno}">
	            	</form>
	            `;
	            $(form1).appendTo($('body')).submit();
	            
	            const form = `
	            	<form action="/order/defaultAddress/change" method="post">
	            		<input type="hidden" name="dno" value="\${dno}">
	            	</form>
	            `;	
	            $(form).appendTo($('body')).submit();
            
            } else {
            	const form = `
                	<form action="/order/delivery/list" method="post">
                		<input type="hidden" name="dno" value="\${dno}">
                	</form>
                `;
            	$(form).appendTo($('body')).submit();
            }
        });
    });
    
    $('.delete').on('click', function(){
		const dno = $(this).attr('data-dno');
		
		const form = `
			<form action="/order/delivery/delete" method="post">
				<input type="hidden" name="dno" value="\${dno}">
			</form>
		`;
	    $(form).appendTo($('body')).submit();
    })
});
</script>
<body>
	<!-- 배송지 목록 -->
        <div class="ui-dialog dialog_address_change ui-widget ui-widget-content ui-front" style="height: auto;">
            <div id="popDeliveryList" class="dialog_wrap no_title_line has_btn type_col_btn ui-dialog-content ui-widget-content initialized" data-class="dialog_address_change" style="width: auto; min-height: 0px; max-height: none; height: auto;">
                <button type="button" class="btn_dialog_close" id="address_popup_list_close"><span class="ico_dialog_close"></span><span class="hidden">닫기</span></button>
                <div class="dialog_header">
                    <h1 class="dialog_title" data-pop-delivery-list="title">배송지 목록</h1>
                </div>
                <div class="dialog_contents">
                    <div class="custom_scroll_wrap" data-simplebar="init">
                        <div class="simplebar-wrapper" style="margin: 0px;">
                            <div class="simplebar-mask">
                                <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                    <div class="simplebar-content-wrapper" style="height: 100%; overflow: hidden;">
                                        <div class="simplebar-content" style="padding: 0px;">
                                            <div class="custom_scroll_inner" tabindex="0">
                                                <div class="address_wrap">
                                                    <div class="btn_wrap full">
                                                        <button type="button" class="btn_ip btn_line_primary" id="address_add_btn">
                                                            <span class="ico_add"></span><span class="text">배송지 추가</span>
                                                        </button>
                                                    </div>
                                                    <!-- 배송지 목록 -->
                                                    <ul class="address_list" style="" data-pop-delivery-list="list">
                                                    	<c:choose>
                                                    		<c:when test="${empty page.delivery}">
																<!-- 신규 회원의 경우 배송지를 등록하지않음 -->
			                                                    <div class="no_data">
			                                                        <div class="no_data_desc">등록된 배송지가 없습니다.</div>
			                                                    </div>
                                                    		</c:when>
                                                    		<c:otherwise>
	                                                    		<c:forEach items="${page.delivery}" var="page">
																    <li class="address_item">
																        <div class="address_chk_box">
																            <span class="form_rdo no_label">
																                <input id="${page.dno}" name="deliverySelect" type="radio" data-dno="${page.dno}">
																                <label for="${page.dno}">배송지 선택</label>
																            </span>
																        </div>
																        <div class="address_info_box">
																            <div class="address_name">
																                <span class="name fc_spot">${page.deliveryName}</span>
																                <c:if test="${page.defaultAddress eq 1}">
																				    <span class="badge_sm badge_pill badge_line_primary">
																				        <span class="text">기본배송지</span>
																				    </span>
																				</c:if>
																            </div>
																            <div class="address_person">
																			    <span class="name">${page.receiverName} /</span>
																			    <span class="phone_number">
																			   		${page.receiverTel.substring(0,3)}-${page.receiverTel.substring(3,7)}-${page.receiverTel.substring(7)}
																			    </span>
																			</div>

																            <div class="address">[${page.zipCode}] ${page.deliveryAddress}</div>
																        </div>
																        <div class="btn_wrap">
																            <a href="/order/delivery/update/${page.dno}"><button type="button" class="btn_xs btn_line_primary update" data-dno="${page.dno}"><span class="text">수정</span></button></a>
																            <c:if test="${page.defaultAddress eq 0}">
																            	<button type="button" class="btn_xs btn_light_gray delete" data-dno="${page.dno}"><span class="text">삭제</span></button>
																            </c:if>
																        </div>
																    </li>
														    	</c:forEach>
													    	</c:otherwise>
	                                                    </c:choose>
													</ul>
													<!-- 페이지 설정 -->
													<c:if test="${not empty page.delivery}">
														<div class="pagination">
															<c:if test="${page.prev>0}">
																<button class="btn_page prev" href="/order/delivery?pageno=${page.prev}">
																	<span class="hidden">이전</span>
																</button>
															</c:if>
															<div class="page_num">
																<c:forEach begin="${page.start}" end="${page.end}" var="i">
																	<c:if test="${i== page.pageno}">
																		<a href="/order/delivery?pageno=${i}" class="btn_page_num active">${i}</a>
																	</c:if>
																	<c:if test="${i != page.pageno}">
																		<a href="/order/delivery?pageno=${i}" class="btn_page_num">${i}</a>
																	</c:if>
																</c:forEach>
															</div>
															<c:if test="${page.next>0}">
																<button class="btn_page next" href="/order/delivery?pageno=${page.next}">
																	<span class="hidden">다음</span>
																</button>
															</c:if>
														</div>
													</c:if>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- 신규 회원을 띄우는 배송지에는 해당 없음. -->
                <c:if test="${not empty page.delivery}">
	                <div class="dialog_footer address_footer" data-pop-delivery-list="data-footer"">
	                    <div class="def_check_wrap" data-pop-delivery-list="default-checkbox-area">
	                        <span class="form_chk">
	                            <input id="popDeliveryListSetDefault" type="checkbox" name="defaultAddress">
	                            <label for="popDeliveryListSetDefault">기본 배송지로 설정</label>
	                        </span>
	                    </div>
	                    <div class="btn_wrap auto">
	                        <button type="button" class="btn_md btn_primary" id="select_defaultAddress_btn">
	                            <span class="text">선택</span>
	                        </button>
	                    </div>
	                </div>
                </c:if>
            </div>
        </div>
        <div class="ui-widget-overlay ui-front" style="z-index: 99;"></div>
    
</body>
</html>