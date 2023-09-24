<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_point.css">
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
                        <h1 class="title_heading">나의 포인트</h1>
                    </div>

                    <div class="tab_wrap type_md ui-tabs ui-corner-all ui-widget ui-widget-content">
                        <div class="tab_list_wrap">
                            <ul class="tabs ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header" data-benefit-tab-list-wrap="" role="tablist">
                                <li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active" data-my-benefit-tap="coupon-list" role="tab" tabindex="0" aria-controls="ui-id-25" aria-labelledby="ui-id-24" aria-selected="true" aria-expanded="true">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-24"><span class="tab_text">쿠폰</span></a>
                                </li>
                                <li class="tab_item ui-state-active ui-tabs-tab ui-corner-top ui-state-default ui-tab" data-my-benefit-tap="point" role="tab" tabindex="-1" aria-controls="ui-id-27" aria-labelledby="ui-id-26" aria-selected="false" aria-expanded="false">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-26"><span class="tab_text">통합포인트</span></a>
                                </li>
                                <li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab" data-my-benefit-tap="deposit" role="tab" tabindex="-1" aria-controls="ui-id-29" aria-labelledby="ui-id-28" aria-selected="false" aria-expanded="false">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-28"><span class="tab_text">예치금</span></a>
                                </li>
                                <li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab" data-my-benefit-tap="ecash" role="tab" tabindex="-1" aria-controls="ui-id-31" aria-labelledby="ui-id-30" aria-selected="false" aria-expanded="false">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-30"><span class="tab_text">교보e캐시</span></a>
                                </li>
                                <li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab" data-my-benefit-tap="kyobocash" role="tab" tabindex="-1" aria-controls="ui-id-33" aria-labelledby="ui-id-32" aria-selected="false" aria-expanded="false">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-32"><span class="tab_text">교보캐시</span></a>
                                </li>
                                <li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab" data-my-benefit-tap="ecoupon" role="tab" tabindex="-1" aria-controls="ui-id-35" aria-labelledby="ui-id-34" aria-selected="false" aria-expanded="false">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-34"><span class="tab_text">e-교환권</span></a>
                                </li>
                                <li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab" data-my-benefit-tap="giftcard" role="tab" tabindex="-1" aria-controls="ui-id-37" aria-labelledby="ui-id-36" aria-selected="false" aria-expanded="false">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-36"><span class="tab_text">기프트카드</span></a>
                                </li>
                                <li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab" data-my-benefit-tap="mileage" role="tab" tabindex="-1" aria-controls="ui-id-39" aria-labelledby="ui-id-38" aria-selected="false" aria-expanded="false">
                                    <a href="javascript:void(0);" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-38"><span class="tab_text">마일리지</span></a>
                                </li>
                            </ul>
                        </div>
                        <div id="point" class="content">
                            <div class="info_text_box size_lg type_purple my_benefit_summary">
                                <div class="my_benefit_summary_item">
                                    <span class="title"><span class="text">보유 통합 포인트</span></span>
                                    <span class="count">
                                        <span class="val" id="validPnts">0</span>
                                        <span class="unit">P</span>
                                    </span>
                                </div>
                                <div class="my_benefit_summary_item">
                                    <span class="title"><span class="text">이번 달 소멸예정 포인트</span></span>
                                    <span class="count fc_spot">
                                        <span class="val" id="expirePnts">0</span>
                                        <span class="unit">P</span>
                                    </span>
                                </div>
                            </div>
                            <div class="list_result_wrap">
                                <div class="right_area">
                                    <p class="bul_item_asterisk font_size_xxs" data-period-guidance="point">2021.09.01 ~ 2022.03.01</p>
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
                                            <th scope="col">유효기간</th>
                                        </tr>
                                    </thead>
                                    <tbody id="pointDataWrapper">
                                        <tr>
                                            <td class="align_left">
                                                <span class="my_benefit_history">구매적립</span>
                                                <span class="my_benefit_ord_num">
                                                    <span class="label">주문번호 : </span>
                                                    <a href="/myroom/member/order-detail?ordrId=O21096071255" class="btn_text_link"><span class="text">O21096071255</span></a>
                                                </span>
                                            </td>
                                            <td><span class="fc_light_gray" id="pointOrdrDt_O21096071255">2021.09.07</span></td>
                                            <td>
                                                <span class="fc_light_gray">적립</span>
                                            </td>
                                            <td>
                                                <span class="my_benefit_point fc_green">
                                                    <span class="sign">+</span>
                                                    <span class="val">710</span>
                                                    <span class="unit">P</span>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="fc_light_gray">2021.09.07<br>~<br>2022.09.30</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align_left">
                                                <span class="my_benefit_history">구매</span>
                                                <span class="my_benefit_ord_num">
                                                    <span class="label">주문번호 : </span>
                                                    <a href="/myroom/member/order-detail?ordrId=O21096071255" class="btn_text_link"><span class="text">O21096071255</span></a>
                                                </span>
                                            </td>
                                            <td><span class="fc_light_gray" id="pointOrdrDt_O21096071255">2021.09.07</span></td>
                                            <td>
                                                <span class="fc_light_gray">사용</span>
                                            </td>
                                            <td>
                                                <span class="my_benefit_point ">
                                                    <span class="sign">-</span>
                                                    <span class="val">1,160</span>
                                                    <span class="unit">P</span>
                                                </span>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align_left">
                                                <span class="my_benefit_history">구매적립</span>
                                                <span class="my_benefit_ord_num">
                                                    <span class="label">주문번호 : </span>
                                                    <a href="/myroom/member/order-detail?ordrId=O21092001919" class="btn_text_link"><span class="text">O21092001919</span></a>
                                                </span>
                                            </td>
                                            <td><span class="fc_light_gray" id="pointOrdrDt_O21092001919">2021.09.04</span></td>
                                            <td>
                                                <span class="fc_light_gray">적립</span>
                                            </td>
                                            <td>
                                                <span class="my_benefit_point fc_green">
                                                    <span class="sign">+</span>
                                                    <span class="val">1,160</span>
                                                    <span class="unit">P</span>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="fc_light_gray">2021.09.04<br>~<br>2022.09.30</span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="align_left">
                                                <span class="my_benefit_history">구매</span>
                                                <span class="my_benefit_ord_num">
                                                    <span class="label">주문번호 : </span>
                                                    <a href="/myroom/member/order-detail?ordrId=O21092001919" class="btn_text_link"><span class="text">O21092001919</span></a>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="fc_light_gray" id="pointOrdrDt_O21092001919">2021.09.01</span>
                                            </td>
                                            <td>
                                                <span class="fc_light_gray">사용</span>
                                            </td>
                                            <td>
                                                <span class="my_benefit_point ">
                                                    <span class="sign">-</span>
                                                    <span class="val">1,060</span>
                                                    <span class="unit">P</span>
                                                </span>
                                            </td>
                                            <td></td>
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
                                        <li class="bul_item_dot font_size_xxs">교보문고(인터넷, 매장), 핫트랙스(인터넷, 매장), 모바일 교보문고에서 적립 및 사용이 가능합니다.(단, 중고장터는 배송비에 한하여 최대 2,500원까지 사용 가능)</li>
                                        <li class="bul_item_dot font_size_xxs">쿠폰, 마일리지, 통합포인트, 교환권 등을 사용한 금액을 제외한 실 결제금액에 한해 통합포인트를 적립해 드립니다.</li>
                                        <li class="bul_item_dot font_size_xxs">구매로 적립된 통합포인트는 기본 유효기간이 1년이며, 이벤트나 제휴를 통해 적립된 통합포인트는 유효기간이 각각 다를 수 있습니다.</li>
                                        <li class="bul_item_dot font_size_xxs">통합포인트는 비현금성으로 현금이나 예치금으로 전환되지 않습니다.</li>
                                        <li class="bul_item_dot font_size_xxs">주문취소나 반품시에는 적립된 통합포인트 차감됩니다.</li>
                                    </ul>
                                    <div class="title_wrap title_size_xs">
                                        <p class="title_heading">포인트 소멸 안내</p>
                                    </div>
                                    <ul class="bul_list">
                                        <li class="bul_item_dot font_size_xxs">적립된 포인트의 만료일이 지날 경우 해당 포인트는 자동으로 소멸처리 되어 사용하실 수 없습니다.(단, 중고장터는 배송비에 한하여 최대 2,500원까지 사용 가능)</li>
                                        <li class="bul_item_dot font_size_xxs">구매로 적립된 통합포인트는 기본 유효기간이 1년이며, 이벤트나 제휴를 통해 적립된 통합포인트는 유효기간이 각각 다를 수 있습니다.
                                            <br>(예 : 통합포인트의 만료일이 2021년 12월 31일인 경우 해당 포인트는 2022년 12월 31일 23시까지만 사용이 가능하며, 2023년 1월 1일 00시 부터는 자동으로 소멸되어 사용하실 수 없습니다.)
                                        </li>
                                        <li class="bul_item_dot font_size_xxs">통합포인트 사용 시, 유효기간이 짧은 포인트부터 자동으로 사용됩니다.</li>
                                        <li class="bul_item_dot font_size_xxs">주문취소나 반품으로 인해 사용된 통합포인트가 환원되어야 할 경우, 사용시점의 잔여 유효기간을 부여하여 환원됩니다.
                                            <br>(예 : 사용시점의 잔여 유효기간이 3일인 통합포인트는 주문취소나 반품 시 유효기간이 3일인 포인트로 환원)
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