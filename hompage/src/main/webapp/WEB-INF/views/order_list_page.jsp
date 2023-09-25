<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/order_list.css">
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
                    <jsp:include page="/WEB-INF/views/include/member_info_left_aside.jsp" />
                </aside>
                
                <section class="section_wrapper">
                    <div class="title_wrap title_size_md has_btn">
                        <p class="title_heading">주문/배송 목록</p>
                        <div class="right_area">
                            <p class="bul_item_asterisk font_size_xxs" data-order-period-guidance="">최근 1개월 주문내역 입니다.</p>
                            <div class="prod_filter_wrap">
                                <button type="button" class="btn_sm btn_line_gray" style="cursor: pointer;">
                                    <span class="ico_calendar"></span>
                                    <span class="text">상세조회</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="order_history_group">
                        <div class="order_history_box type_title">
                            <span class="history_val">주문내역</span>
                            <span class="history_desc">
                                주문/배송안내
                                <button type="button" class="btn_info_popup" data-role="btn-dialog" data-target="#popOrderdeliveryinfo"></button>
                            </span>
                        </div>
                        <div class="order_history_box">
                            <button type="button" class="btn_filter_history">
                                <span class="history_val" data-order-summary-preparation="">0</span>
                                <span class="history_desc">준비중</span>
                            </button>
                        </div>
                        <div class="order_history_box">
                            <button type="button" class="btn_filter_history">
                                <span class="history_val" data-order-summary-delivery="">0</span>
                                <span class="history_desc">배송중</span>
                            </button>
                        </div>
                        <div class="order_history_box">
                            <button type="button" class="btn_filter_history">
                                <span class="history_val" data-order-summary-delivery-finish="">0</span>
                                <span class="history_desc">배송완료</span>
                            </button>
                        </div>
                        <div class="order_history_box">
                            <button type="button" class="btn_filter_history">
                                <span class="history_val" data-order-summary-cancel="">0</span>
                                <span class="history_desc">취소</span>
                            </button>
                        </div>
                        <div class="order_history_box">
                            <button type="button" class="btn_filter_history">
                                <span class="history_val" data-order-summary-exchange-returned-goods="">0</span>
                                <span class="history_desc">교환/반품</span>
                            </button>
                        </div>
                    </div>
                    <div class="tbl_prod_wrap type_myroom">
                        <div class="tbl_myorder_inner">
                            <div class="tbl_order_info">
                                <span class="order_date">주문날짜(주문번호)</span>
                                <a href="#" class="btn_more_view" data-order-detail-link="N">
                                    <span class="text">상세보기</span>
                                    <span class="ico_arw"></span>
                                </a>
                                <div class="right_area">
                                    <button type="button" class="btn_delete_text size_xxs" data-order-commodity-delete-button="" style="cursor: pointer;">
                                        <span class="ico_delete"></span>
                                        <span class="text">주문내역에서 삭제</span>
                                    </button>
                                </div>
                            </div>
                            <div class="tbl_prod_inner">
                                <table class="tbl_prod">
                                    <colgroup>
                                        <col>
                                        <col style="width: 164px;">
                                        <col style="width: 180px;">
                                        <col style="width: 130px;">
                                    </colgroup>
                                    <thead class="hidden">
                                        <tr>
                                            <th scope="col">상품정보</th>
                                            <th scope="col">금액</th>
                                            <th scope="col">배송정보</th>
                                            <th scope="col">취소</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr data-order-commodity="">
                                            <td class="prod">
                                                <div class="prod_area horizontal">
                                                    <div class="prod_thumb_box size_sm">
                                                        <a href="javascript:void(0);" class="prod_link" data-order-commoditylink="">
                                                            <span class="img_box">
                                                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791159259777.jpg" alt="오늘도 나아가는 중입니다">
                                                            </span>
                                                        </a>
                                                    </div>
                                                    <div class="prod_info_box size_sm">
                                                        <span class="badge_sm badge_page_flow ">
                                                            <span class="text">PageFlow 배송</span>
                                                        </span>
                                                        <a href="" class="prod_info" data-order-commoditylink="">
                                                            <span class="prod_name">[예약] [국내도서] 오늘도 나아가는 중입니다 </span>
                                                        </a>
                                                        <ul class="prod_option_list">
                                                            <li class="option_item">
                                                                <span class="text">수량 : </span><span class="val">1</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <span class="price">
                                                    <span class="val">15,120</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="delivery_info">
                                                    <span class="delivery_state ">취소완료</span>
                                                </div>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tbl_prod_wrap type_myroom">
                        <div class="tbl_myorder_inner">
                            <div class="tbl_order_info">
                                <span class="order_date">주문날짜(주문번호)</span>
                                <a href="#" class="btn_more_view" data-order-detail-link="N">
                                    <span class="text">상세보기</span>
                                    <span class="ico_arw"></span>
                                </a>
                                <div class="right_area">
                                    <button type="button" class="btn_delete_text size_xxs" data-order-commodity-delete-button="" style="cursor: pointer;">
                                        <span class="ico_delete"></span>
                                        <span class="text">주문내역에서 삭제</span>
                                    </button>
                                </div>
                            </div>
                            <div class="tbl_prod_inner">
                                <table class="tbl_prod">
                                    <colgroup>
                                        <col>
                                        <col style="width: 164px;">
                                        <col style="width: 180px;">
                                        <col style="width: 130px;">
                                    </colgroup>
                                    <thead class="hidden">
                                        <tr>
                                            <th scope="col">상품정보</th>
                                            <th scope="col">금액</th>
                                            <th scope="col">배송정보</th>
                                            <th scope="col">취소</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr data-order-commodity="">
                                            <td class="prod">
                                                <div class="prod_area horizontal">
                                                    <div class="prod_thumb_box size_sm">
                                                        <a href="javascript:void(0);" class="prod_link" data-order-commoditylink="">
                                                            <span class="img_box">
                                                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9791159259777.jpg" alt="오늘도 나아가는 중입니다">
                                                            </span>
                                                        </a>
                                                    </div>
                                                    <div class="prod_info_box size_sm">
                                                        <span class="badge_sm badge_page_flow ">
                                                            <span class="text">PageFlow 배송</span>
                                                        </span>
                                                        <a href="" class="prod_info" data-order-commoditylink="">
                                                            <span class="prod_name">[예약] [국내도서] 오늘도 나아가는 중입니다 </span>
                                                        </a>
                                                        <ul class="prod_option_list">
                                                            <li class="option_item">
                                                                <span class="text">수량 : </span><span class="val">1</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <span class="price">
                                                    <span class="val">15,120</span>
                                                    <span class="unit">원</span>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="delivery_info">
                                                    <span class="delivery_state ">주문접수</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="btn_wrap full" data-event-detail="review">
                                                    <button type="button" class="btn_sm btn_line_gray" data-order-commodity-cancel-application-button="" style="cursor: pointer;">
                                                        <span class="text">취소신청</span>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="info_text_box size_lg">
                        <div class="title_wrap title_size_xs">
                            <p class="title_heading">유의사항</p>
                        </div>
                        <ul class="bul_list">
                            <li class="bul_item_dot font_size_xxs">배송조회는 택배사로 상품전달 후 조회 가능합니다.</li>
                            <li class="bul_item_dot font_size_xxs">eBook은 구매 후 다운로드 시 이용할 수 있습니다.</li>
                            <li class="bul_item_dot font_size_xxs">eBook ‘sam’ 이용내역 조회 및 서비스 해지는 마이룸 &gt; sam이용내역 &gt; my이용권 페이지에서 가능합니다.</li>
                            <li class="bul_item_dot font_size_xxs">주문한 상품이 품절될 경우 해당 상품은 자동 취소 신청되며, 취소금액은 승인 취소 또는 예치금으로 반환됩니다.</li>
                            <li class="bul_item_dot font_size_xxs">반환된 예치금은 나의 통장 &gt; 예치금에서 환불신청시, 신청계좌로 환불해 드립니다.</li>
                        </ul>
                    </div>
                    <div class="info_text_box">
                        <div class="title_wrap title_size_sm">
                            <p class="title_heading">카드결제(간편결제,법인카드 포함) 취소 안내</p>
                        </div>
                        <ul class="bul_list">
                            <li class="bul_item_dot font_size_xxs">카드결제 취소 기간 안내
                                <ul class="bul_list type_sub_sm">
                                    <li class="bul_item_dash font_size_xxs">전체취소 : 당일 취소/환불 처리</li>
                                    <li class="bul_item_dash font_size_xxs">부분취소 : 영업일 기준 3~5일 소요(당일 취소 포함)</li>
                                </ul>
                            </li>
                            <li class="bul_item_dot font_size_xxs">카드사 정책에 따라 주문당일 부분취소한 경우 당일 취소 및 환불 불가합니다.</li>
                            <li class="bul_item_dot font_size_xxs">부분취소한 경우 카드사 승인 취소는 약 3~5일 소요됩니다.</li>
                            <li class="bul_item_dot font_size_xxs">카드사에서 부분취소를 지원하지 않는 카드의 경우 승인취소가 아닌 예치금으로 환불됩니다.</li>
                            <li class="bul_item_dot font_size_xxs">주문취소시 오류가 발생하거나 환불이 정상 처리되지 않을 경우 1:1로 문의 주시기 바랍니다.</li>
                        </ul>
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