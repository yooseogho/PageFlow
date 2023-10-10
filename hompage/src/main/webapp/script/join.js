
async function memberIdCheck() {
	const pattern = /^[a-z0-9]{6,10}$/
	$('#memberId-msg').text('');
	const memberId = $('#memberId').val();

	if (memberId === '') {
		$('#memberId-msg').text('아이디를 입력하세요').attr('class', 'fail small-text');
		return false;
	}

	if (pattern.test(memberId) === false) {
		$('#memberId-msg').text('아이디는 영숫자 6~10자입니다').attr('class', 'fail small-text');
		return false;
	}

	try {
		await $.ajax('/member/username/available/' + memberId);

		// 사용 가능한 아이디인 경우 메시지 출력
		$('#memberId-msg').text('사용 가능한 아이디입니다.').attr('class', 'true small-text');

		return true;

	} catch (err) {

		console.log(err.responseJSON || err.responseText || err);

		// 이미 사용 중인 아이디인 경우 메시지 출력
		$('#memberId-msg').text('사용중인 아이디입니다.').attr('class', 'fail small-text');

		return false;

	}
}




let isPasswordValid = false;

function passwordCheck() {
	$('#password-msg').text('');

	const password = $('#password').val();

	// 패턴 설정 (영문, 숫자, 특수문자)
	const lowerCaseLetters = /[a-z]/g; // 소문자 확인
	const upperCaseLetters = /[A-Z]/g; // 대문자 확인
	const numbers = /[0-9]/g; // 숫자 확인
	const specialCharacters = /[\W_]/g; // 특수 문자 확인

	let typesCount = [lowerCaseLetters.test(password), upperCaseLetters.test(password), numbers.test(password), specialCharacters.test(password)].filter(Boolean).length;

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
        if(isPasswordValid) { // 이 조건문 추가
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


function emailCheck() {
	$('#email-msg').text('');
	const email = $('#memberEmail').val();

	if (email === '') {
		$('#email-msg').text('이메일을 입력하세요').attr('class', 'fail small-text');
		return false;
	}

	// 복잡한 정규 표현식으로 이메일 형식 확인
	const pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	if (!pattern.test(email)) {
		$('#email-msg').text('올바른 이메일 형식이 아닙니다.').attr('class', 'fail small-text');
		return false;
	}
	return true;
}

function birthdayCheck() {
  $('#birthday-msg').text('');
  const birthday= $('#birthday').val();
  if(birthday==='') {
    $('#birthday-msg').text('생일을 입력하세요').attr('class', 'fail small-text');
    return false;
  }
  return true;
}

function memberTelCheck() {
    $('#memberTel-msg').text('');  // 초기 메시지 제거
    const memberTel = $('#memberTel').val();  // 입력값 가져오기

    if (memberTel === '') {  // 입력값이 없는 경우
        $('#memberTel-msg')
            .text('핸드폰 번호를 입력해주세요.')
            .attr('class', 'fail small-text');
        return false;
    }

    const pattern = /^[0-9]{11}$/;  // 

    if (!pattern.test(memberTel)) {  // 패턴 불일치 시
        $('#memberTel-msg')
            .text('올바른 핸드폰 번호를 입력해주세요.')
            .attr('class', 'fail small-text');
        return false;
    }

    return true;  // 모든 검사 통과 시 true 반환
}








let composing = false;

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







$(document).ready(function() {
	$('#memberName').on('blur', nameCheck);
	$('#memberEmail').on('blur', emailCheck);
	$('#birthday').on('blur', birthdayCheck);
	$('#memberTel').on('blur', memberTelCheck);
	
 // input 및 compositionend 이벤트 발생 시마다 nameCheck 함수를 호출합니다.
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
    


			$('#join').on('click', async function() {
				let conditionChecked = await memberIdCheck();
				console.log(conditionChecked);
				conditionChecked = passwordCheck() && conditionChecked;
				console.log(conditionChecked);
				conditionChecked = emailCheck() && conditionChecked;
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
				}
			});
});	 		
