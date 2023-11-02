
// 회원가입시 아이디 패턴 체크
async function memberIdCheck() {
	const pattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,11}$/i;
	const memberId = $('#memberId').val();
	const msgElement = $('#memberId-msg');

	msgElement.text('');

	if (!memberId) {
		msgElement.text('아이디를 입력하세요').addClass('fail small-text');
		return false;
	}

	if (!pattern.test(memberId)) {
		msgElement.text('아이디는 영숫자 6~11자입니다').addClass('fail small-text');
		return false;
	}

	try {
		await $.get('/member/username/available/' + memberId);
		// 사용 가능한 아이디인 경우 메시지 출력
		msgElement.removeClass().addClass('true small-text').text('사용 가능한 아이디입니다.');

		return true;

	} catch (error) {
		console.log(error.responseJSON || error.responseText || error);
		msgElement.text('사용중인 아이디입니다.').addClass('fail small-text');
		return false;

	}
};




// 비밀번호 패턴체크 시 필요한 변수 설정
let isPasswordValid = false;

// 회원가입 비밀번호 패턴체크
function passwordCheck() {
	$('#password-msg').text(''); 

	const password = $('#password').val();

	// 패턴 설정 (영문, 숫자, 특수문자)
	const lowerCaseLetters = /[a-z]/g; // 소문자 확인
	const upperCaseLetters = /[A-Z]/g; // 대문자 확인
	const numbers = /[0-9]/g; // 숫자 확인
	const specialCharacters = /[\W_]/g; // 특수 문자 확인

	let typesCount = [lowerCaseLetters.test(password), upperCaseLetters.test(password), numbers.test(password), specialCharacters.test(password)].filter(Boolean).length;

	// 비밀번호가 공백일 경우 메세지 출력
	if (password === '') {
		$('#password-msg').text('비밀번호를 입력하세요').attr('class', 'fail small-text');
		isPasswordValid = false;
		return;
	}


	if (typesCount < 3 || password.length < 8) {
		$('#password-msg').text('비밀번호는 영문, 숫자, 특수문자 세 가지 조합으로 최소한 길이가 8 이상이어야 합니다. ').attr('class', 'fail small-text');
		isPasswordValid = false;
		return;
	}

	if (/(\w)\1\1\1/.test(password)) {
		$('#password-msg').text('비밀번호에 같은 문자를 네 번 이상 사용할 수 없습니다. ').attr('class', 'fail small-text');
		isPasswordValid = false;
		return;
	}

	if (/\s/.test(password)) {
		$('#password-msg').text('비밀번호는 공백없이 입력해주세요. ').attr('class', 'fail small-text');
		isPasswordValid = false;
		return;
	}

	$('#password-msg')
		.removeClass("fail")
		.addClass("true")
		.text("사용 가능한 비밀번호입니다.");

	isPasswordValid = true;
	return true;
}



// 2번쨰 비밀번호 확인 입력란
// 첫번째 유효성 검사 통과하고 첫번쨰 비밀번호랑 일치해야함.
function checkPasswordCheck() {
	const password = $("#password").val();
	const confirmPassword = $("#checkPassword").val();

	if (confirmPassword === "") {
		$('#checkPassword-msg')
			.removeClass("true")
			.addClass("fail small-text")
			.text("비밀번호 확인을 입력하세요.");
		return false;
	}

	if (confirmPassword === password) {
		if (isPasswordValid) { // 이 조건문 추가
			$('#checkPassword-msg')
				.removeClass("fail")
				.addClass("true small-text")
				.text("비밀번호가 일치합니다.");
			return true;
		} else {
			$('#checkPassword-msg')
				.removeClass("true")
				.addClass("fail small-text")
				.text('비밀번호가 불일치합니다.');
			return false;
		}
	} else {
		$('#checkPassword-msg')
			.removeClass("true")
			.addClass("fail small-text")
			.text('비밀번호가 불일치합니다.');
	}

	return false;
}

// 생년월일 입력 date 타입으로 설정함
function birthdayCheck() {
	$('#birthday-msg').text('');
	const birthday = $('#birthday').val();
	if (birthday === '') {
		$('#birthday-msg').text('생일을 입력하세요').attr('class', 'fail small-text');
		return false;
	}
	return true;
}

// 전화번호 중복확인
async function checkTelAvailable(tel) {
    let result = false;
    await $.ajax({
        url: '/member/memberTel/available',
        method: 'GET',
        data: { memberTel: tel },
        success: function(response) {
            result = response;
        }
    });
    return result;
}






let composing = false;
// 이름 패턴 체크 국내 사이트 이기떄문에 한국어로만 입력 가능함
function nameCheck() {
	const name = $('#memberName').val();
	const nonKorean = /[^가-힣]/;

	if (name.trim() === '') {
		// 이름이 비어 있으면
		$('#memberName-msg').removeClass('true').addClass('fail').text('이름을 입력해주세요');
		return false;
	} else if (nonKorean.test(name)) {
		// 한글 외의 문자가 있으면, 그 문자들을 제거합니다.
		$('#memberName').val(name.replace(nonKorean, ''));
		$('#memberName-msg').removeClass('true').addClass('fail').text('이름을 입력해주세요');
		return false;
	} else {
		$('#memberName-msg').removeClass('fail').addClass('true').text('');
		return true;
	}
}

// 이메일 인증
function email() {
	$.get("/getSessionEmail", function(data) {
		$("#memberEmail").val(data);
	});

}






// 위 함수를을 출력하기 위한 JavaScript 코드를 정의하기 위한 함수
$(document).ready(function() {
	$('#memberId').val(localStorage.getItem('memberId'));
	$('#password').val(localStorage.getItem('password'));
	$('#checkPassword').val(localStorage.getItem('checkPassword'));

	$('#memberName').on('blur', nameCheck);
	$('#birthday').on('blur', birthdayCheck);
	$('#sendEmail').on('blur', email);
	
	// 사용자가 이전 페이지로 돌아가는 등의 행동을 하면 모든 입력된 정보를 삭제
	window.addEventListener('beforeunload', function(e) {
    localStorage.removeItem('memberId');
    localStorage.removeItem('password');
    localStorage.removeItem('checkPassword');
    localStorage.removeItem('memberName');
    localStorage.removeItem('memberTel');
    localStorage.removeItem('birthday');
	});

	/* --------------------------------------------------------------------------- */
	// 이메일 값 들어 갔는지 확인하는 함수 생성
	function checkEmailInput() {
		let input = $('#memberEmail').val();

		if (input) {
			$('#sendEmail').prop('disabled', true).css('background-color', '#ccc').css('cursor', 'default')
				.text('이메일 인증이 완료되었습니다.').css('border', '1px solid #ccc');
		} else {
			$('#email-msg').attr('class', 'fail');
			$('#email-msg').text('이메일 인증이 필요합니다.').css('font-size', '13px');
			$('#sendEmail').prop('disabled', false);
		}

		$('#sendEmail').on('click', function() {
			localStorage.setItem('memberId', $('#memberId').val());
			localStorage.setItem('password', $('#password').val());
			localStorage.setItem('checkPassword', $('#checkPassword').val());
			localStorage.setItem('memberName', $('#memberName').val());
			localStorage.setItem('memberTel', $('#memberTel').val());
			localStorage.setItem('birthday', $('#birthday').val());
		});
	}

	// 페이지 로딩 시 한 번 실행
	checkEmailInput();

	// input 이벤트 발생 시마다 실행
	$('#memberEmail').on('input', checkEmailInput);
	/* --------------------------------------------------------------------------- */

	// input 및 compositionend 이벤트 발생 시마다 nameCheck 함수를 호출
	$('#memberName')
		.on('compositionstart', function(e) {
			composing = true;
		})
		.on('compositionend', function(e) {
			composing = false;
			nameCheck();
		})
		.on('input', function(e) {
			if (!composing) {
				nameCheck();
			}
		});
	//  'input' 함수들을 실시간으로 체크한다
	$('#password').on('input', function(e) {
		passwordCheck();
		checkPasswordCheck();  // 비밀번호 확인 필드도 체크합니다.
	});

	$('#password, #checkPassword').on('input', function(e) {
		passwordCheck();
		checkPasswordCheck();  // 두 개의 필드가 일치하는지 체크합니다.
	});

	$('#memberId').on('input', function(e) {
		memberIdCheck();
	});
	
		$('#memberTel').on('input',function(){
		memberTelCheck();
	})
	//----------------------------------------------------------------------------------------------------------------------------------------------------------
	
	// password_icon눈모양  아이콘을 클릭시 password의 Type을 text으로 바꾼다
	$('#password_icon').on('click', function() {
		const passwordField = $("#password");
		if (passwordField.attr('type') === "password") {
			passwordField.attr('type', "text");
			$(this).css("background-image", "url(https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_eye_active@2x.png)");
		} else {
			passwordField.attr('type', "password");
			$(this).css("background-image", "url(https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_eye@2x.png)");
		}
	});
	
	// password_icon눈모양  아이콘을 클릭시 password의 Type을 text으로 바꾼다
	$('#password_icon1').on('click', function() {
		const passwordField = $("#checkPassword");
		if (passwordField.attr('type') === "password") {
			passwordField.attr('type', "text");
			$(this).css("background-image", "url(https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_eye_active@2x.png)");
		} else {
			passwordField.attr('type', "password");
			$(this).css("background-image", "url(https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_eye@2x.png)");
		}
	});
		
		
	
	
	// 전화번호 패턴체크 및 중복확인
		async function memberTelCheck() {
    $('#memberTel-msg').text('');  // 초기 메시지 제거
    let memberTel = $('#memberTel').val();  // 입력값 가져오기

    if (memberTel === '') {  // 입력값이 없는 경우
        $('#memberTel-msg')
            .text('핸드폰 번호를 입력해주세요.')
            .css({ 'color': 'red', 'font-size': '12px' });
        return;
    }

    // '-' 제거 후 숫자만 추출하여 재조립  사용가능한 번호 입력시 하이픈(-)자동생성
    memberTel = memberTel.replace(/-/g, '');
    const onlyNumPattern = /^\d+$/; // 숫자만 있는 문자열에 대한 패턴

    if (!onlyNumPattern.test(memberTel)) { // '-' 제거 후 숫자만 있는지 확인
        $('#memberTel-msg').text('숫자만 입력 가능합니다.').addClass('fail small-text');
        return false;
    }


	// 중복시 메세지 출력
	if (!(await checkTelAvailable(memberTel))) {
		$('#memberTel-msg').text('이미 사용중인 핸드폰 번호 입니다.').css('color','red');
	    return false;
	}


const pattern = /^[0-9]{11}$/;

// '-' 제거 후 숫자만 추출하여 재조립
let pureNumber = memberTel.replace(/-/g, '');
	
if (!pattern.test(pureNumber)) {
    $('#memberTel-msg')
        .text('올바른 핸드폰 번호를 입력해주세요.')
        .css({ 'color': 'red', 'font-size': '12px' });
    return false;
}

// 위의 모든 검사가 통과한 경우 (즉, 전화번호 형식이 올바르고 중복되지 않은 경우)
$('#memberTel-msg')
    .text('사용 가능한 핸드폰 번호입니다.')
    .css({ 'color': 'green', 'font-size': '12px' });

if (memberTel.length >= 4 && memberTel.length < 7) {
    memberTel = `${pureNumber.substr(0, 3)}-${memberTel.substr(3)}`;
} else if (memberTel.length >= 7) {
    memberTel = `${memberTel.substr(0, 3)}-${memberTel.substr(3, 4)}-${memberTel.substr(7)}`;
}

$('#memberTel').val(memberTel);
}

	// 회원가입 버튼 누르기 모든 유효성검사가 통과시  submit
	$('#join').on('click', async function() {
		let conditionChecked = await memberIdCheck();
		console.log(conditionChecked);
		conditionChecked = passwordCheck() && conditionChecked;
		console.log(conditionChecked);
		conditionChecked = birthdayCheck() && conditionChecked;
		console.log(conditionChecked);
		conditionChecked = nameCheck() && conditionChecked;
		console.log(conditionChecked);
		conditionChecked = memberTelCheck() && conditionChecked;
		console.log(conditionChecked);
		// 비밀번호 확인 체크 추가
		conditionChecked = checkPasswordCheck() && conditionChecked;

		if (conditionChecked) {
			$('#join-form').submit();
			localStorage.removeItem('memberId');
			localStorage.removeItem('password');
			localStorage.removeItem('checkPassword');
			localStorage.removeItem('memberName');
			localStorage.removeItem('memberTel');
			localStorage.removeItem('birthday');
		}
	});
});
