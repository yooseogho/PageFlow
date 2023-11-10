<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/delivery_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>PageFlow</title>
</head>
<script>
	$(document).ready(function(){
		
		// 기본 배송지 변경
		$('#defaultChange-btn').on('click', function(){
			$('input[name="deliverySelect"]:checked').each(function() {
				var dno = $(this).attr('id');
				
				const form =`
					<form action="/delivery/default/change" method="post">
						<input type="hidden" name="dno" value="\${dno}">
					</form>
				`;
				$(form).appendTo($('body')).submit();
			})
		})
		
		// 새 배송지 등록 버튼을 누를경우 배송지 추가 팝업창이 나옴
		$('.add').on('click', function(){
			$('#addressAdd').css('display','block');
		})
		
		// 배송지 삭제
		$('.delete-btn').on('click', function(){
			const dno = $(this).attr('data-dno');
			const choice = confirm('정말로 배송지를 삭제하시겠습니까? 만약 삭제하실 경우 배송지와 관련된 주문 정보 또한 사라지게됩니다.');
			
			if(choice == true) {
				const form = `
					<form action="/delivery/delete" method="post">
						<input type="hidden" name="dno" value="\${dno}">
					</form>
				`;
				$(form).appendTo($('body')).submit();
			} else {
				return false;
			}
		})
			
		// RedirectAttribute을 이용한 에러 메세지 처리
		const msg = '${msg}';
		if (msg !== '') {
			alert(msg);
		}
		
	})
</script>
<body>
	<div id="page">
        <header class="header_wrapper">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
        </header>
        <nav class="nav_wrapper">
            <jsp:include page="/WEB-INF/views/include/nav.jsp" />
        </nav>
        <main class="main_wrapper">
            <div class="main_inner">
                <aside class="aside_wrapper">
            		<jsp:include page="/WEB-INF/views/include/member_info_left_aside.jsp" />      
                </aside>
                <section class="section_wrapper">
                    <div class="title_wrap">
                    <h1 class="title_heading">배송주소록</h1>
                </div>

                <div class="round_gray_box">
                    <div class="address_item">
                        <div class="address_info_box">
                            <div class="address_name">
                                <span class="name">${defaultDelivery.deliveryName}</span>
                                <span class="badge_sm">
                                    <span class="text">기본배송지</span>
                                </span>
                            </div>
                            <div class="address_person">
                                <span class="name">${defaultDelivery.receiverName} /</span>
                                <span class="phone_number">
                               	 ${defaultDelivery.receiverTel.substring(0,3)}-${defaultDelivery.receiverTel.substring(3,7)}-${defaultDelivery.receiverTel.substring(7)}
                                </span>
                            </div>
                            <div class="address">[${defaultDelivery.zipCode}] ${defaultDelivery.deliveryAddress}</div>
                        </div>
                    </div>
                    <div class="right_area">
                        <button class="btn_sm" type="button">
                            <span class="ico_edit"></span>
                            
                            <span class="text">수정</span>
                        </button>
                    </div>
                </div>

                <ul class="bul_list">
                    <li class="bul_item">* 기본배송지 기준으로 배송일자가 안내됩니다.</li>
                    <li class="bul_item">* 기본배송지는 삭제 불가합니다.</li>
                </ul>

                <div class="list_result_wrap">
                    <p class="result_count">
                        <span class="fc_green">${count}</span>개
                    </p>
                    <div class="right_area">
                        <button class="btn_sm add">
                            <span class="ico_plus_primary"></span>
                            <span class="text">새 배송지 등록</span>
                        </button>
                    </div>
                </div>

                <div class="tbl_col_wrap">
                    <table class="tbl_col_line">
                        <colgroup>
                            <col>
                            <col style="width: 174px;">
                        </colgroup>
                        <tbody data-address="address-list-area">
                        <c:choose>
                        <c:when test="${not empty page.delivery}">
                        <c:forEach items="${page.delivery}" var="delivery">
			                <tr>
			                    <td class="align_left">
			                        <div class="address_item my_address">
			                            <div class="address_chk_box">
			                                <span class="form_rdo no_label">
			                                    <input id="${delivery.dno}" type="radio" name="deliverySelect">
			                                    <label for="${delivery.dno}">배송지 선택</label>
			                                </span>
			                            </div>
			                            <div class="address_info_box">
			                                <div class="address_name">
			                                    <span class="name">${delivery.deliveryName}</span>
			                                    <c:if test="${delivery.defaultAddress eq 1 }">
			                                    	<span class="badge_sm badge_pill badge_line_primary"><span class="text">기본배송지</span></span>
			                                    </c:if>
			                                </div>
			                                <div class="address_person">
			                                    <span class="name">${delivery.receiverName} /</span>
			                                    <span class="phone_number">${delivery.receiverTel.substring(0,3)}-${delivery.receiverTel.substring(3,7)}-${delivery.receiverTel.substring(7)}</span>
			                                </div>
			                                <div class="address">[${delivery.zipCode}] ${delivery.deliveryAddress}</div>
			                            </div>
			                        </div>
			                    </td>
			                    <td>
			                        <div class="btn_wrap">
			                            <button type="button" class="btn_sm btn_line_gray" onclick="location.href=`/delivery/update/${delivery.dno}`">
			                                <span class="ico_edit_black"></span><span class="text">수정</span>
			                            </button>
			                            <c:if test="${delivery.defaultAddress eq 0 }">
				                            <button type="button" class="btn_sm btn_line_gray delete-btn" data-dno="${delivery.dno}">
				                                <span class="ico_delete"></span><span class="text">삭제</span>
				                            </button>
			                            </c:if>
			                        </div>
			                    </td>
			                </tr>
			                </c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        	</c:otherwise>
                        	</c:choose>
			            </tbody>
                    </table>
                </div>
                
                <!-- 페이지 설정 -->
                <div class="pagination">
                    <c:if test="${page.prev>0}">
                        <a class="btn_page prev" href="/delivery/list?pageno=${page.prev}">
                            <span class="hidden">이전</span>
                        </a>
                    </c:if>
                    <div class="page_num">
                        <c:forEach begin="${page.start}" end="${page.end}" var="i">
                            <c:if test="${i== page.pageno}">
                                <a href="/delivery/list?pageno=${i}" class="btn_page_num active">${i}</a>
                            </c:if>
                            <c:if test="${i != page.pageno}">
                                <a href="/delivery/list?pageno=${i}" class="btn_page_num">${i}</a>
                            </c:if>
                        </c:forEach>
                    </div>
                    <c:if test="${page.next>0}">
                        <a class="btn_page next" href="/delivery/list?pageno=${page.next}">
                            <span class="hidden">다음</span>
                        </a>
                    </c:if>
                </div>

                <div class="delivery_btn_wrap">
                    <button class="btn_lg" id="defaultChange-btn">
                        <span class="text">기본 배송지로 설정</span>
                    </button>
                </div>
                </section>
            </div>
        </main>
        <footer class="footer_wrapper">
            <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        </footer>
    </div>
    
    <!-- 배송지 목록 -->
    <div id="addressList" class="dialog_wrapper open" style="top: 0px; z-index: 1001; display : none;">
        <jsp:include page="/WEB-INF/views/include/delivery_address_popup_list.jsp" />
    </div>
    
    <!-- 배송지 추가 -->
    <div id="addressAdd" class="dialog_wrapper open" style="top: 0px; z-index: 1003; display : none;">
        <jsp:include page="/WEB-INF/views/include/delivery_address_popup_add.jsp" />
    </div>
</body>
</html>