$(document).ready(function() {
	// 신규회원이 배송지 입력 버튼을 클릭했을 때
	$('#popup_btn').on('click', function() {
		$('#addressList').css('display', 'block');
	});

	// 배송지 목록에서 닫기 버튼을 눌렀을 때
	$('#address_popup_list_close').on('click', function() {
		$('#addressList').css('display', 'none');
	})

	// 배송지 추가란에서 배송지 추가 버튼을 눌렀을 때
	$('#address_add_btn').on('click', function() {
		$('#addressAdd').css('display', 'flex');
	})

	// 배송지 추가란에서 닫기 버튼을 눌렀을 때
	$('#address_popup_add_close').on('click', function() {
		$('#addressAdd').css('display', 'none');
	})

	
	$('#all_point_btn').on('click', function() {
		const point = '${point}';
		$('#all_point_text').text(point);
		$('#all_point_btn').css('display', 'none');
		$('#cancel_point_btn').css('display', 'block');
	})
	
	/** 포인트 적용 취소할 때 */
	$('#cancel_point_btn').on('click', function() {
		$('#all_point_text').text(0);
		$('#cancel_point_btn').css('display', 'none');
		$('#all_point_btn').css('display', 'block');
	})

	/** 스크롤을 내릴 때 주문 결제 정보 창보다 더 많이 내려갈 경우 top & right 위치에 고정 */
	var lnb = $(".cart_info_wrap").offset().top;

	function adjustElementPosition() {
		var windowScroll = $(window).scrollTop();
		var windowWidth = $(window).width();
		var rightOffsetRatio = windowWidth >= 1440 ? 0.15 : 0.004; // 뷰포트의 너비에 따라 비율을 조절
		var rightOffset = windowWidth * rightOffsetRatio;

		if (lnb <= windowScroll) {
			$(".cart_info_wrap").css("position", "fixed").css('right', rightOffset);
		} else {
			$(".cart_info_wrap").css("position", "absolute").css('right', 0);
		}
	}

	$(window).on('scroll resize', adjustElementPosition);
	
	
})



