<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_point.css">
<title>내 포인트</title>

<style>

.text-red {
    color: red !important;
}
.text-green {
    color: green !important;
}
</style>
</head>
<script>
	const c = '${orders}';
	console.log(c);
</script>


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
					<jsp:include
						page="/WEB-INF/views/include/member_info_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
					<div class="title_wrap title_size_md has_btn">
						<h1 class="title_heading">나의 포인트</h1>
					</div>

					<div
						class="tab_wrap type_md ui-tabs ui-corner-all ui-widget ui-widget-content">

						<div id="point" class="content">
							<div class="info_text_box size_lg type_purple my_benefit_summary">
								<div class="my_benefit_summary_item">
									<span class="title"><span class="text">보유 통합 포인트</span></span>
									<span class="count"> <span class="val" id="validPnts"><%= request.getAttribute("memberPoint") %></span>

										<span class="unit">P</span>
									</span>
								</div>

							</div>
							<div class="list_result_wrap">
								<div class="right_area">
									<p class="bul_item_asterisk font_size_xxs"
										data-period-guidance="point">2021.09.01 ~ 2022.03.01</p>
									<div class="prod_filter_wrap" id="popPointFilter">
										<button type="button" class="btn_sm btn_line_gray">
											<span class="ico_calendar"></span><span class="text">상세조회</span>
										</button>
									</div>
								</div>
							</div>
							<div class="tbl_col_wrap my_benefit">
								<table class="tbl_col_line">
									<colgroup>
										<col style="width: auto;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 16%;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">상세내용</th>
											<th scope="col">등록일</th>
											<th scope="col">구분</th>
											<th scope="col">금액</th>
										</tr>
									</thead>
									<tbody id="pointDataWrapper">
										<tr>
<c:set var="lastOrderNo" value=""/>

<c:forEach var="order" items="${orders}">
    <c:if test="${order.ono ne lastOrderNo}">
        <tr>
            <td class="align_left"><span class="my_benefit_history">구매</span> <span class="my_benefit_ord_num"> <span class="label">주문번호 : </span> <a href="/order/read?ono=${order.ono}" class="btn_text_link"> <span class="text">${order.ono}</span></a></span></td>
            <td><span class="fc_light_gray" id="pointOrdrDt_${order.ono}">${order.orderDate}</span></td>
            <c:choose>
                <c:when test="${order.orderStatus eq '취소 완료'}">
                    <td><span class="fc_light_gray text-green">취소</span></td>
                    <td><span class="my_benefit_point text-green"> <span class="sign">+</span> <span class="val">${order.pointUsed}</span><span class="unit">P</span></span></td>
                </c:when>
                <c:when test="${order.pointUsed > 0}">
                    <td><span class="fc_light_gray text-red">사용</span></td>
                    <td><span class="my_benefit_point text-red"> <span class="sign">-</span> <span class="val">${order.pointUsed}</span><span class="unit">P</span></span></td>
                </c:when>
                <c:otherwise>
                    <td><span class="fc_light_gray text-green">적립</span></td>
                    <td><span class="my_benefit_point text-green"> <span class="sign">+</span> <span class="val">${order.pointEarn}</span><span class="unit">P</span></span></td>
                </c:otherwise>
            </c:choose>	
            <td></td>
        </tr>
    </c:if>
    <c:set var="lastOrderNo" value="${order.ono}"/>
</c:forEach>

										</tr>
									</tbody>
								</table>
							</div>
							<div class="info_text_box size_lg">
								<div class="info_text_inner">
									<div class="title_wrap title_size_xs">
										<p class="title_heading">통합포인트 안내</p>
									</div>
									<ul class="bul_list">
										<li class="bul_item_dot font_size_xxs">교보문고(인터넷, 매장),
											핫트랙스(인터넷, 매장), 모바일 교보문고에서 적립 및 사용이 가능합니다.(단, 중고장터는 배송비에 한하여
											최대 2,500원까지 사용 가능)</li>
										<li class="bul_item_dot font_size_xxs">쿠폰, 마일리지, 통합포인트,
											교환권 등을 사용한 금액을 제외한 실 결제금액에 한해 통합포인트를 적립해 드립니다.</li>
										<li class="bul_item_dot font_size_xxs">구매로 적립된 통합포인트는 기본
											유효기간이 1년이며, 이벤트나 제휴를 통해 적립된 통합포인트는 유효기간이 각각 다를 수 있습니다.</li>
										<li class="bul_item_dot font_size_xxs">통합포인트는 비현금성으로 현금이나
											예치금으로 전환되지 않습니다.</li>
										<li class="bul_item_dot font_size_xxs">주문취소나 반품시에는 적립된
											통합포인트 차감됩니다.</li>
									</ul>
									<div class="title_wrap title_size_xs">
										<p class="title_heading">포인트 소멸 안내</p>
									</div>
									<ul class="bul_list">
										<li class="bul_item_dot font_size_xxs">적립된 포인트의 만료일이 지날
											경우 해당 포인트는 자동으로 소멸처리 되어 사용하실 수 없습니다.(단, 중고장터는 배송비에 한하여 최대
											2,500원까지 사용 가능)</li>
										<li class="bul_item_dot font_size_xxs">구매로 적립된 통합포인트는 기본
											유효기간이 1년이며, 이벤트나 제휴를 통해 적립된 통합포인트는 유효기간이 각각 다를 수 있습니다. <br>(예
											: 통합포인트의 만료일이 2021년 12월 31일인 경우 해당 포인트는 2022년 12월 31일 23시까지만
											사용이 가능하며, 2023년 1월 1일 00시 부터는 자동으로 소멸되어 사용하실 수 없습니다.)
										</li>
										<li class="bul_item_dot font_size_xxs">통합포인트 사용 시, 유효기간이
											짧은 포인트부터 자동으로 사용됩니다.</li>
										<li class="bul_item_dot font_size_xxs">주문취소나 반품으로 인해 사용된
											통합포인트가 환원되어야 할 경우, 사용시점의 잔여 유효기간을 부여하여 환원됩니다. <br>(예 :
											사용시점의 잔여 유효기간이 3일인 통합포인트는 주문취소나 반품 시 유효기간이 3일인 포인트로 환원)
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