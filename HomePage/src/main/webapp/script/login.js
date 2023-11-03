$(document).ready(function() {
    $('form[action="/login"]').on('submit', function(e) {
        e.preventDefault(); 

        var memberId = $('[name="memberId"]').val();
        var password = $('[name="password"]').val();

        if (!memberId || !password) {
            alert('아이디와 비밀번호를 모두 입력해주세요.');
            return;
        }

        console.log(memberId, password);  
        console.log(JSON.stringify({ memberId: memberId, password: password }));

        $.ajax({
            url: '/api/login',
            method: 'post',
            contentType: 'application/json',
            data: JSON.stringify({ memberId: memberId, password: password}),
            success: function(response) {
                console.log(response);
                window.location.href = '/';
            },
            error: function(response) {
                var msg = response.responseText;
                $('#login-msg').text(msg).css('color', 'red').css('font-size', '12px');
            }
        });
    });

    function checkInput() {
        var memberId = $('input[name="memberId"]').val().trim();
        var password = $('input[name="password"]').val().trim();

if (!memberId) {
    $('#login-msg').text('아이디를 입력해주세요.').css('color', 'red').css('font-size', '12px');
    $('input[name="memberId"]').css('border', '1px solid red');
} else if (!password) {
    $('#login-msg').text('비밀번호를 입력해주세요.').css('color', 'red').css('font-size', '12px');
    $('input[name="password"]').css('border', '1px solid red');
} else {
    $('#login-msg').text('').css('font-size', '');
    $('input[name="memberId"], input[name="password"]').css('border', '');
}

    }

    $('input[name="memberId"], input[name="password"]').on('input', checkInput);
});
