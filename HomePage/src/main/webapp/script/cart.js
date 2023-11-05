function updatePrice() {
    var totalAmount = 0; // 총 금액 초기화
    var totalPointEarnings = 0; // 총 포인트 적립 예정 초기화
    // 체크된 체크박스를 순회
    $("input[name='chkList']:checked").each(function() {
        // 각 체크박스의 'cno'에 해당하는 행에서 금액과 포인트를 찾아 더함
        var cno = $(this).attr('id');
        var amount = parseInt($("#price"+cno+" .val").text().replace(/,/g,""));
        var point = parseInt($("#point"+cno).text().replace(/,/g,""));
        totalAmount += amount;
        totalPointEarnings += point;
    });
    
    $(".payments_info_box .payments_info_item.total .price .val").text(totalAmount.toLocaleString());
    $(".payments_info_box .payments_info_item .price #totalPrice").text(totalAmount.toLocaleString()); // 총 금액 업데이트
    $(".payments_info_box .payments_info_item.point .price .val").text(totalPointEarnings.toLocaleString()); // 총 포인트 적립 예정 업데이트
}

$(document).ready(function() {
	
	// 스크롤 내릴 때 결제 정보창 div 영역 상단 고정 
	var lnb = $(".cart_info_wrap").offset().top;

	function adjustElementPosition() {
	    var windowScroll = $(window).scrollTop();
	    var windowWidth = $(window).width();
	    var rightOffsetRatio = windowWidth >= 1440 ? 0.15 : 0.004; // 뷰포트의 너비에 따라 비율을 조절
	    var rightOffset = windowWidth * rightOffsetRatio;
	
	    if (lnb <= windowScroll) {
	        $(".cart_info_wrap").css("position", "fixed").css('right',rightOffset);
	    } else {
	        $(".cart_info_wrap").css("position", "absolute").css('right', 0);
	    }
	}
	
	$(window).on('scroll resize', adjustElementPosition);



	
	
	/** 장바구니 개수 늘려주기 */
	$('.inc').on("click", function() {
		const cno = $(this).attr("data-cno");
		const bno = $(this).attr("data-bno");
	
	    $.ajax({
	        url: '/cart/increase',
	        type: 'POST',
	        data: {
	            'cno': cno,
	            'bno': bno
	        },
	        success: function(response) {
	            // 각 요소를 순회하면서 업데이트
	            response.forEach(function(cartData) {
	                const cno = cartData.cno;
	                const count = cartData.cartCount.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const price = cartData.bookPrice.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const pointEarnings = cartData.pointEarnings.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const amount = cartData.amount.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const totalAmount = cartData.totalAmount.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const totalPointEarnings = cartData.totalPointEarnings.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                
	                // 각 요소에 대한 업데이트
	                $('#prdNum' + cno).val(count);
	                
	                $('#point' + cno).text(pointEarnings);
	                $('#amount' + cno).text(amount);
	                $('#totalPrice').text(totalAmount);
	                $('#totalprice').text(totalAmount);
	                $('#totalPointEarnings').text(totalPointEarnings);
	            });
	        },
	        error: function(response) {
	        	if (response.status === 400) {
	        		alert('재고량보다 더 많이 담을수는 없습니다.')
	        	}
	        }
	    });
	});
	
	/** 장바구니 개수 줄여주기 */
	$('.dec').on("click", function() {
	    const cno = $(this).attr("data-cno");
	    const bno = $(this).attr("data-bno");
	
	    $.ajax({
	        url: '/cart/decrease',
	        type: 'POST',
	        data: {
	            'cno': cno,
	            'bno': bno
	        },
	        success: function(response) {
	            // 각 요소를 순회하면서 업데이트
	            response.forEach(function(cartData) {
	                const cno = cartData.cno;
	                const count = cartData.cartCount.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const price = cartData.bookPrice.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const pointEarnings = cartData.pointEarnings.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const amount = cartData.amount.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const totalAmount = cartData.totalAmount.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                const totalPointEarnings = cartData.totalPointEarnings.toLocaleString(); // 숫자를 0,000 형식으로 변환
	                
	                // 각 요소에 대한 업데이트
	                $('#prdNum' + cno).val(count);
	                
	                $('#point' + cno).text(pointEarnings);
	                $('#amount' + cno).text(amount);
	                $('#totalPrice').text(totalAmount);
	                $('#totalprice').text(totalAmount);
	                $('#totalPointEarnings').text(totalPointEarnings);
	            });
	        },
	        error: function(response) {
	            // 오류 메시지를 표시
	           	alert('최소 1개 이상부터 구매 가능합니다.')
	        }
	    });
	});
	
	

	
	/** 장바구니 삭제 */
	$('.btn_delete_ord').on('click', function(){
		const cnos = $(this).attr('data-cnos');
		
		const form = `
			<form action='/cart/delete' method='post'>
				<input type='hidden' name='cnos' value='${cnos}'>
			</form>
		`;
		$(form).appendTo($('body')).submit();
	});
	
	/** 장바구니 전체 삭제 */
	$('.btn_delete').on('click', function() {
	    var cnos = [];
	    // 체크된 체크박스를 순회
	    $("input[name='chkList']:checked").each(function() {
	        cnos.push($(this).attr('id')); // 체크박스의 id를 cno로 사용
	    });
	
	    const form = `
	        <form action='/cart/delete' method='post'>
	            <input type='hidden' name='cnos' value='${cnos.join(",")}'>
	        </form>
	    `;
		$(form).appendTo($('body')).submit();
	});
	
	
	
	// 각 상품 선택 체크박스 클릭
	$("input[name='chkList']").click(function() {
	    if (!$(this).is(":checked")) { // 상품 선택 체크박스가 해제된 경우
	        $("#chkCartSelectAll").prop("checked", false); // 전체 선택 체크박스 해제
	    }
	    updatePrice(); // 가격 업데이트 함수 호출
	    // 전체 선택 체크박스 상태 업데이트
	    updateSelectAllCheckbox();
	});

	// 전체 선택 체크박스 클릭
	$("#chkCartSelectAll").click(function() {
	    var isChecked = $(this).is(":checked");
	    $("input[name='chkList']").prop("checked", isChecked); // 상품 선택 체크박스 상태 업데이트
	    updatePrice(); // 가격 업데이트 함수 호출
	});

	// 전체 선택 체크박스 상태 업데이트 함수
	function updateSelectAllCheckbox() {
	    var allChecked = true;
	    $("input[name='chkList']").each(function() {
	        if (!$(this).is(":checked")) {
	            allChecked = false;
	            return false; // 반복문 종료
	        }
	    });
	    $("#chkCartSelectAll").prop("checked", allChecked); // 전체 선택 체크박스 상태 업데이트
	}
	
	/** 체크박스 클릭 이벤트 처리 */
	// 페이지 로드 시 체크된 체크박스 개수 카운트
    var initialCount = $('input[name="chkList"]:checked').length;
    $('#cart_count_val').text(initialCount);

    // 체크박스 클릭 이벤트 처리
    $('input[name="chkList"], #chkCartSelectAll').on("change", function() {
        var count = $('input[name="chkList"]:checked').length; // 체크된 체크박스 개수 카운트
        $('#cart_count_val').text(count); // 카운트를 <span></span> 태그에 담기
    });
    

});