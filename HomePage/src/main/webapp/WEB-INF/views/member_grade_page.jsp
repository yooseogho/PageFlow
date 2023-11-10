
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ page import="java.util.Calendar, java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_grade.css">

<title>회원등급안내</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//JSP에서 값을 가져와서 JavaScript 변수에 할당합니다.
	var purchaseTotalForLastThreeMonths = $	
	{
		//JSP에서 값을 가져와서 JavaScript 변수에 할당합니다.
		var purchaseTotalForLastThreeMonths = $
		{
			var purchaseTotalForLastThreeMonths = $
			{
				var purchaseTotalForLastThreeMonths = ${purchaseTotalForLastThreeMonths != null ? purchaseTotalForLastThreeMonths : 0};

			}
			;

		}
		;

	};
	$(document).ready(
			function() {
				var purchaseTotal = purchaseTotalForLastThreeMonths; // 최근 3개월 동안의 구매 총액
				var targetPurchase = 300000; // 신규 등급에 도달하기 위한 목표 구매액

				// 회원 등급에 따른 진행바 색상 설정
				var memberGrade = "${memberGrade}"; // JSP에서 memberGrade 값을 가져옵니다.

				// 진행율 계산 (최대값은 100)
				var progressPercent;
				if (memberGrade === "PLATINUM") {
					progressPercent = 100; // 플래티넘 회원의 경우, 진행율을 강제로 100%로 설정
				} else {
					progressPercent = Math.min(
							(purchaseTotal / targetPurchase) * 100, 100);
				}
				var remainPercent = 100 - progressPercent;

				console.log(progressPercent);
				console.log(remainPercent);

				var color;

				switch (memberGrade) {
				case "FRIENDS":
					color = "#47C867"; // 초록색
					break;
				case "SILVER":
					color = "#C0C0C0"; // 실버색
					break;
				case "GOLD":
					color = "#FFD700"; // 골드색
					break;
				case "PLATINUM":
					color = "#0000FF"; // 플래티넘색
					break;
				default:
					color = "#47C867";
				}

				$(".state_guage_bar").css(
						'background',
						'linear-gradient(to right,' + color + ' '
								+ progressPercent + '%, #f2f2f2 '
								+ progressPercent + '%)');
			});
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

		<main>
			<section class="contents_wrap">
				<div class="contents_inner">
					<div class="inner_header">
						<p class="header_text">회원등급 혜택</p>
					</div>

					<div class="inner_main_top">
						<div class="main_top_top">
							<p class="main_top_title">나의 회원등급 혜택</p>
						</div>
						<div class="my_grade_info">
							<div class="grade_info_header">
								<div class="left_area">
									<div class="user_img_box">
										<span class="ico_grade_${memberGrade.toLowerCase()}"></span>
									</div>
								</div>
								<div class="right_area">
									<div class="grade_info_title">
										<span class="name">${member.memberName}</span> 회원님의 이번 달 등급은 <span
											class="grade">${memberGrade }</span> 등급입니다.
									</div>

									<dl class="grade_state_info_list">

										<dt class="state_info_title">등급 적용일</dt>
										<dd class="state_info_desc">
											<%
											Calendar cal = Calendar.getInstance();
											cal.add(Calendar.MONTH, 1);
											cal.set(Calendar.DAY_OF_MONTH, 1);
											SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd");
											String formatted = format1.format(cal.getTime());
											pageContext.setAttribute("formatted", formatted); // formatted 변수를 페이지 스코프에 저장
											%>

											<%=formatted%>
										</dd>


										<dt class="state_info_title">산정 기간</dt>
										<dd class="state_info_desc">
											<%
											Calendar cal2 = Calendar.getInstance();
											cal2.add(Calendar.MONTH, -3);
											cal2.set(Calendar.DAY_OF_MONTH, 1);
											String formatted2 = format1.format(cal2.getTime());
											%>
											<%=formatted2%>
											~
											<%
											cal.add(Calendar.DAY_OF_MONTH, -1); // 등급 적용일에서 하루를 뺍니다.
											String formatted3 = format1.format(cal.getTime());
											%>
											<%=formatted3%>
										</dd>

										<dt class="state_info_title">구매금액</dt>
										<dd class="state_info_desc">
											<fmt:formatNumber value="${purchaseTotalForLastThreeMonths}"
												groupingUsed="true" />
											원
										</dd>

									</dl>
								</div>
							</div>
							<div class="grade_info_contents">
								<div class="state_gauge_wrap">


									<div class="state_guage_title">
										<span class="val"> <c:choose>
												<c:when test="${memberGrade eq 'PLATINUM'}">
                현재 최고 등급을 유지하고 있습니다. 감사합니다!!!
            </c:when>
												<c:otherwise>
													<em>${formatted}</em> 까지 
    <em> <span style="color: red;"><fmt:formatNumber
																value="${additionalPurchaseRequired}" type="number"
																pattern="#,###" /></span>
													</em> 
    원만 더 구매하면 
    <em> <span style="color: blue;"
														class="${nextGrade.toLowerCase()}">${nextGrade}</span>
													</em> 등급 달성!
</c:otherwise>
											</c:choose>
										</span>
									</div>







									<div class="state_guage_bar">
										<span class="dot_group"> <span class="state_dot" id="F">F</span>
											<span class="state_dot" id="S">S</span> <span
											class="state_dot" id="G">G</span> <span class="state_dot"
											id="P">P</span>
										</span>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div class="title_wrap">
						<h2 class="title_heading">등급별 혜택</h2>
					</div>

					<div class="tbl_grade_wrap">
						<table class="tbl_col">
							<colgroup>
								<col style="width: 25%;">
								<col style="width: 25%;">
								<col style="width: 25%;">
								<col style="width: auto;">
							</colgroup>
							<thead>
								<tr>
									<!--등급 -->
									<%
									String memberGrade = (String) request.getAttribute("memberGrade");
									%>

									<th scope="col"
										class="<%=memberGrade.equals("PLATINUM") ? "active" : ""%>">
										<div class="img_box">
											<span class="ico_grade_platinum"></span>
										</div>
										<div class="grade_title">플래티넘</div>
										<div class="grade_desc">
											최근 한달 순수구매액 <span class="val">30만원 초과</span>
										</div>
									</th>
									<th scope="col"
										class="<%=memberGrade.equals("GOLD") ? "active" : ""%>">
										<div class="img_box">
											<span class="ico_grade_gold"></span>
										</div>
										<div class="grade_title">골드</div>
										<div class="grade_desc">
											최근 한달 순수구매액 <span class="val">21 ~ 30만원</span>
										</div>
									</th>
									<th scope="col"
										class="<%=memberGrade.equals("SILVER") ? "active" : ""%>">
										<div class="img_box">
											<span class="ico_grade_silver"></span>
										</div>
										<div class="grade_title">실버</div>
										<div class="grade_desc">
											최근 한달 순수구매액 <span class="val">10 ~ 20만원</span>
										</div>
									</th>
									<th scope="col"
										class="<%=memberGrade.equals("FRIENDS") ? "active" : ""%>">
										<div class="img_box">
											<span class="ico_grade_friends"></span>
										</div>
										<div class="grade_title">프렌즈</div>
										<div class="grade_desc">
											최근 한달 순수구매액 <span class="val">10만원 미만</span>
										</div>
									</th>
							</thead>
							<tbody>
								<tr>
									<td
										class="vertical_middle <%=memberGrade.equals("PLATINUM") ? "active" : ""%>">
										<div class="extra_rate_text">
											<span class="ico_point_plus"></span>포인트 적립률 <span class="val">5%</span>
										</div>
									</td>
									<td
										class="vertical_middle <%=memberGrade.equals("GOLD") ? "active" : ""%>">
										<div class="extra_rate_text">
											<span class="ico_point_plus"></span>포인트 적립률 <span class="val">4%</span>
										</div>
									</td>
									<td
										class="vertical_middle <%=memberGrade.equals("SILVER") ? "active" : ""%>">
										<div class="extra_rate_text">
											<span class="ico_point_plus"></span>포인트 적립률 <span class="val">3%</span>
										</div>
									</td>
									<td
										class="vertical_middle <%=memberGrade.equals("FRIENDS") ? "active" : ""%>">
										<div class="extra_rate_text">
											<span class="ico_point_plus"></span>포인트 적립률 <span class="val">2%</span>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
					</div>

					<div class="title_wrap">
						<h2 class="title_heading">등급 선정 기준</h2>
					</div>

					<div class="tbl_row_wrap">
						<table class="tbl_row">
							<colgroup>
								<col style="width: 12%;">
								<col style="width: auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">혜택기간</th>
									<td><span class="fc_black">매월 1일 (오전 9시)부터 1개월</span></td>
								</tr>
								<tr>
									<th scope="row">선정기간</th>
									<td><span class="fc_black">직전 1개월 순수구매액(전월 1일부터 전월
											말일까지)</span>
										<ul class="bul_list">
											<li class="bul_item">* 온라인은 상품발송일 기준</li>
										</ul></td>
								</tr>
								<tr>
									<th scope="row">순수구매액</th>
									<td><span class="fc_black">PageFlow 구매금액 합산</span>
										<ul class="bul_list text_bottom">
											<li class="bul_item_dot font_size_xxs">* 쿠폰, 통합포인트,
												마일리지, 포장봉투, 배송비 등은 제외</li>
										</ul></td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</section>
		</main>
		<footer>
			<jsp:include page="/WEB-INF/views/include/copy_right_footer.jsp" />
		</footer>
	</div>
</body>
</html>