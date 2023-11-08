<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/include/member_info_left_aside.css">
<script >
$(document).ready(function() {
    var gradeElement = document.querySelector('[data-role="grade"]');
    var gradeName = "${gradeName}".toUpperCase();
    switch (gradeName) {
        case 'FRIENDS':
            gradeElement.classList.add('grade_friends');
            break;
        case 'SILVER':
            gradeElement.classList.add('grade_silver');
            break;
        case 'GOLD':
            gradeElement.classList.add('grade_gold');
            break;
        case 'PLATINUM':
            gradeElement.classList.add('grade_platinum');
            break;
    }
});



</script>
</head>
<body>
	<div class="aside_body">
		<div class="my_profile_area">
			<div class="blur_img_box"></div>
			<div class="profile_inner">
				<div class="profile_thumb_box">
					<a href="/member_profile_page" class="btn_setting">
<img src="/profiles/${member.memberProfile}" style="width: 62px; height: 62px; border-radius: 100%;">

					</a>
				</div>

				<!--  
<img src="${empty member.memberProfile ? '/upload/default/defaultProfile.png' : member.memberProfile}"
	style="width: 140px; height: 140px; border-radius: 100%;">
	-->

	<div class="profile_name_box">
    <span class="name" data-role="">${member.memberName}님</span> 
    <span data-role="badge" class="badge"> 
        <a data-role="grade" class="badge_lg badge_pill badge_grade_friends" href="/member_grade_page"> 
            <span class="text">${gradeName}</span>
        </a>
    </span>
</div>

			</div>
		</div>
		<div class="snb_wrap">
			<ul class="snb_list category">
				<li class="snb_item">
					<ul>
						<li class="snb_item"><a class="snb_link depth_title"
							href="/order/list"><span>쇼핑 내역</span></a></li>
					</ul>
					<ul class="snb_list">
						<li class="snb_item"><a href="/order/list">주문/배송목록</a></li>
					</ul>
				</li>
				<li class="snb_item">
					<ul>
						<li class="snb_item"><a class="snb_link depth_title"
							href="/member_point_page"><span>혜택/포인트</span></a></li>
					</ul>
					<ul class="snb_list">
						<li class="snb_item"><a href="/member_point_page">포인트</a></li>
					</ul>
				</li>
				<li class="snb_item">
					<ul>
						<li class="snb_item"><a class="snb_link depth_title"
							href="/customer_inquiry_list_page">문의 내역</a></li>
					</ul>
					<ul class="snb_list">
						<li class="snb_item"><a href="/customer_inquiry_list_page">1:1
								문의</a></li>
					</ul>
				</li>
				<li class="snb_item">
					<ul>
						<li class="snb_item"><a class="snb_link depth_title"
							href="/member_check_page">회원 정보</a></li>
					</ul>
					<ul class="snb_list">
						<li class="snb_item"><a href="/member_check_page">회원정보관리</a></li>
						<li class="snb_item"><a href="/member_profile_page">프로필설정</a></li>
						<li class="snb_item"><a href="/delivery/list">배송주소록</a></li>
						<li class="snb_item"><a href="/member_grade_page">나의 회원등급</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>

</html>