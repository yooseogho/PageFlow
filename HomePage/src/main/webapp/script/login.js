


$(document).ready(function() {


	$('#login').on('click', function(e) {
		e.preventDefault(); // 기본 폼 제출 동작 막기

		var memberId = $('[name="memberId"]').val();
		var password = $('[name="password"]').val();

		$.ajax({
			url: '/login',
			method: 'post',
			data: { memberId: memberId, password: password },
		success: function(response) {
    // 로그인 성공 시 처리
    location.reload();  // 현재 페이지 새로고침
},

error: function(jqXHR, textStatus, errorThrown) {
    if (jqXHR.status === 401) { 
	var errorMessage = jqXHR.responseText;
	if(errorMessage === '입력하신 정보가 일치하지 않습니다.') { 
		$('#login-msg').text(errorMessage).css({ 'color': 'red', 'font-size': '12px' });
		$('#login-msg1').text('다시 확인해 주세요.').css({ 'color': 'red', 'font-size': '12px' });
	} else if(errorMessage ==='일치하는 아이디가 없습니다.') {
		$('#login-msg').text(errorMessage).css({ 'color': 'red', 'font-size': '12px' });
	}
	
} else {
	alert('오류가 발생했습니다. 다시 시도해주세요.');
}
}
	
		});
	});
});