var isPatternValid = false; // 패턴 유효성 검사 결과를 저장하는 변수
var isSequenceValid = false; // 연속/중복 문자 유효성 검사 결과를 저장하는 변수

// 비밀번호 패턴 검사 함수
function passwordCheck() {
	$('#password').on('input', function() { // 비밀번호 입력 필드에 입력 이벤트가 발생할 때마다 실행됩니다.
		var input = $(this);
		var password = input.val();

		const lowerCaseLetters = /[a-z]/g;// 소문자 포함 여부를 확인하는 정규 표현식
		const numbers = /[0-9]/g;// 숫자 포함 여부를 확인하는 정규 표현식
		const specialCharacters = /[\W_]/g; // 특수 문자 포함 여부를 확인하는 정규 표현식	

		var spaceCheck = /\s/;// 공백 포함 여부를 확인하는 정규 표현식

		if (password === "") { // 비밀번호가 비어있는 경우 처리
			$(".pw_valid_item1, .pw_valid_item2").css("color", "gray");// 패스워드 유효성 체크 아이템의 색상을 회색으로 변경합니다.
			isPatternValid = false;
			checkPasswordCheck();  // 비밀번호 확인창을 업데이트합니다.
			return;
		}

        if (spaceCheck.test(password)) {// 공백이 있는 경우 처리
        
            input.val("");
            isPatternValid = false;
            checkPasswordCheck();
            return;
        }

        if (password.length < 8 || !lowerCaseLetters.test(password) || !numbers.test(password) || !specialCharacters.test(password)) {
			  /*
              - 비밀번호의 길이가 8보다 작거나,
              - 소문자, 숫자, 특수 문자 중 하나 이상이 누락된 경우 처리 
              */
            $(".pw_valid_item1").css("color", "red");
            isPatternValid= false;
        } else {
			   /*
              - 비밀번호의 길이가 최소 요구 조건을 충족하고,
              - 소문자, 숫자, 특수 문자 모두 포함된 경우 처리 
           */
            $(".pw_valid_item1").css("color", "green");
            isPatternValid= true;
        }

        if (/(\w)\1\1/.test(password)) {
			     /*
             연속되거나 중복되는 문자가 있는 경우 처리 
             (\w)\1\1: 같은 문자 혹은 숫자가 연속해서 세 번 이상 반복되는지 확인하는 정규표현식입니다. 
           */
            $(".pw_valid_item2").css("color", "red");
          	isSequenceValid= false;;
        } else {
           $(".pw_valid_item2").css("color", "green");
          	isSequenceValid= true;;
       }
       
       if(isPatternValid && isSequenceValid){
       		isPatternValid=true
       }else{
       		isPatternValid=false
       }
	   
	   checkPasswordCheck();  
    });
}
// 비밀번호 일치여부 체크 함수 
function checkPasswordCheck() {
    const password = $("#password").val();
    const confirmPassword = $("#passwordCheck").val(); 

    if (isPatternValid) { 
         $("#passwordCheck").prop('disabled', false); // 패스워드 체크 필드 활성화 설정
         $("#passwordCheck").prop('disabled', true);// 패스워드 체크 필드 비활성화 설정
     }

	if (confirmPassword === "") {
		return false;
	}

	if (confirmPassword !== password ) {
	  	$('#passwordCheck-msg').text('비밀번호가 일치하지 않습니다.').css('color','red');
        return false;
    } else {
        $('#passwordCheck-msg').text('');
        return true;
    }
}
//-------------------------------------------------------------------------------------------

// 이메일 패턴
function emailCheck() {
	$('#email-msg').text('');
	const email = $('#changeEmail').val();

	if (email === '') {
		$('#changeEmail-msg').text('이메일을 입력하세요').css('color','red');
		return false;
	}

	// 복잡한 정규 표현식으로 이메일 형식 확인
	const pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;/* 복잡한 정규표현식으로 이메일 형식을 검증합니다.
                                                                         											  예: example@example.com */

	if (!pattern.test(email)) {
		$('#changeEmail-msg').text('올바른 이메일 형식이 아닙니다.').css('color','red');
		return false;
	}
	return true; /* 유효한 이메일 형식인 경우 true 반환 */
}
//-------------------------------------------------------------------------------------------
// 전화번호 형식 검사 함수 
function telCheck(tel) {
    const onlyNumPattern = /^\d+$/;  /* 숫자만 있는지 확인하기 위한 정규표현식입니다. 예: '01012345678' */
    const formattedNumPattern = /^\d{3}-\d{4}-\d{4}$/; /* '010-1234-5678'과 같은 형태인지 확인하기 위한 정규표현식입니다. */
    const msgElement = $('#changeTel-msg');

    msgElement.text('');

    if (!onlyNumPattern.test(tel.replace(/-/g, ''))) { // '-' 제거 후 숫자만 있는지 확인
        msgElement.text('숫자만 입력 가능합니다.').css('color', 'red');
        return false	
    }

    // 입력값을 010-1234-5678 형식으로 변환
    if (tel.length === 11) {
        tel = tel.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        $('#changeTel').val(tel);  // input 필드의 값 업데이트
    }   // 입력값이 11자리라면, 즉 '-' 없이 모든 숫자를 연속으로 입력했다면 이를 '010-1234-5678' 형태로 변환합니다.

	if (!formattedNumPattern.test(tel)) { // 변환된 전화번호가 올바른 형식인지 확인 
		msgElement.text('올바르지 않은 휴대폰 번호입니다.').css('color', 'red');
		return false;
	}

	msgElement.text('올바른 휴대폰 번호입니다.').css('color', 'green');
	return true;  // 유효성 검사 통과 시 true 반환 
};
  /*
    	    '-' 제거 후에도 숫자만으로 구성되어 있는지 확인합니다.
    	    replace(/-/g,'')로
*/
//-------------------------------------------------------------------------------------------


//  실행
$(document).ready(function() {
    checkPasswordCheck();
    passwordCheck();
    
    
       // 비밀번호 수정에서 엔처치면 비밀번호 확인 창으로 넘어가게 끔 
    $('#password').on('keypress', function(e) {
        if (e.keyCode === 13) { // Enter 치면 넘어가게함.
            e.preventDefault();

            // 다음 비밀번호 입력 필드로 포커스 이동
            $('#passwordCheck').focus();
        }
    });
    //-------------------------------------------------------------------------------------------
    
        $('#passwordCheck').on('keypress', function(e) {
        if (e.keyCode === 13) { // Enter 치면 넘어가게함.
            e.preventDefault();

            // 다음 비밀번호 입력 필드로 포커스 이동
            $('#edit').focus();
        }
    });
//-------------------------------------------------------------------------------------------

      // 페이지 로딩 시 초기 상태에서 이메일 변경 버튼은 비활성화됨.
    $('.changeEmail button').prop('disabled', true);

       // 'password'와 'passwordCheck'에 input event handler 추가. 사용자가 입력할 때마다 checkPasswordCheck() 함수 실행.
    $('#password, #passwordCheck').on('input', function() {
        checkPasswordCheck();
    });
    
//  이메일 변경 버튼 클릭 시, 해당 버튼 숨기고, 대신에 패스워드 확인 입력창 보여줌.
    $('#emailChangeButton').on('click', function(e) {
        e.preventDefault();
		// 변경 버튼은 감춤
        $(this).siblings('.black_text').addClass('hidden');//'black_text' class를 가진 형제 요소들을 숨김(hidden class 추가).
        $(this).hide();   //'emailChangeButton' 자체를 숨깁니다.

        $('.changeEmail_passwordCheck').removeClass('hidden'); //'changeEmail_passwordCheck' 클래스 요소의 hidden 클래스 제거.


	showBorder();//'active' 클래스 추가하여 border 보이게 함.
     });

     function showBorder() {
       $('#changeEmail_passwordCheck').addClass('active');
       $('#changeEmail').addClass('active');
     }
// 휴대폰 번호 변경 버튼 클릭시 해당 버튼 숨기고 전화번호 입력 창 활성화.
$('#telChange_btn').on('click', function(e){
    e.preventDefault();

    $(this).hide(); 

    $('.changeTel_passwordCheck.hidden').removeClass('hidden');
});

// 휴대폰 번호 입력창에 이벤트 핸들러 추가. 입력 내용이 변경될 때마다 전화번호 유효성 검사 실행.
$('#changeTel').on('input', function(){
    let newTel = $('#changeTel').val();
    
   // telCheck 함수를 호출하여 전화번호 유효성 검사 실행.
	telCheck(newTel);
});

	
	//-------------------------------------------------------------------------------------------
// 'edit' 버튼 클릭시 비밀번호 수정 요청
$('#edit').on('click', async function(e) {
	
    e.preventDefault(); // 폼 제출 동작 방지
    var password = $('#password').val();
    var memberId = $('#memberId').val();
   if (!password.trim()) {  // 입력된 비밀번호가 공백인지 확인
        alert('회원정보 수정 완료.');
        return;
    }
    
     
    // 비밀번호 중복 확인 요청
    $.ajax({
        url: '/member/password/available/' + memberId,
        method: 'get',
        data: { password: password },
        success: function(response) {
        // 서버에서 HTTP 상태 200(OK) 응답을 받았다면, 회원 정보 수정 요청 진행
            $.ajax({
                url: '/changePass',
                method: 'post',
                data: {
                    password: password,
                    memberId: memberId
                },
                success : function(response){
                    alert('회원정보 수정이 완료되었습니다.');
                    window.location.href = 'member_edit_page'; 
                },
                error : function(jqXHR, textStatus, errorThrown){
                    alert('오류가 발생했습니다. 다시 시도해주세요.'); 
                }
            });
        },
        error : function(jqXHR) { 
            if (jqXHR.status === 409) { // Conflict 상태 코드인 경우 이미 사용중인 비밀번호라는 메시지 출력
               $('#password-msg').text('※이미 사용중인 비밀번호 입니다.').css('color','red');
            } else { 
               alert('오류가 발생했습니다. 다시 시도해주세요.'); 
            } 
        }
    });
});


//-------------------------------------------------------------------------------------------


// 이메일 확인용 패스워드 체크 함수 및 연관된 이벤트 핸들러들
function checkPassword() {
    $.ajax({
        url: '/member_check_page',
        method: 'post',
        data: { password: $('#passwordEmaill').val() },
        success: function(response) {
            $('#emailPasswordCheck-msg').text('일치합니다').css('color','green');
            $('.changeEmail button').prop('disabled', false);  // Enable email change button
            $('.changeEmail').removeClass('hidden');
        },
        error: function(jqXHR) {  // jqXHR 객체에는 HTTP 상태 코드 등의 정보가 담겨 있음
            if (jqXHR.status === 401) {  // Unauthorized
                $('#emailPasswordCheck-msg').text('비밀번호가 일치하지 않습니다.').css('color','red');
            } else {
                $('#emailPasswordCheck-msg').text('비밀번호를 입력해주세요.').css('color','red');
            }
        }   
    });
}
// 버튼 클릭
$('#emailPasswordCheck').on('click', function(e) {
    e.preventDefault();
    checkPassword();
});
// 엔터키를 첬을떄 	
$('.changeEmail_passwordCheck input').on('keypress', function(e) {
    if (e.keyCode === 13) { // Enter key pressed
        e.preventDefault();
        checkPassword();
    }
});
//-------------------------------------------------------------------------------------------
// 휴대폰 번호 변경시 비밀번호 체크
function checkPasswordTel() {
    $.ajax({
        url: '/member_check_page',
        method: 'post',
        data: { password: $('#passwordTel').val() },
        success: function(response) {
            $('#tellPasswordCheck-msg').text('일치합니다').css('color','green');
            $('.changeTel_btn').prop('disabled', false);
            $('.changeTel_passwordCheck.hidden').addClass('hidden');
            $('.changeTel.hidden').removeClass('hidden');
        },
        error: function(jqXHR) {
            if (jqXHR.status === 401) {  // Unauthorized
                $('#tellPasswordCheck-msg').text('비밀번호가 일치하지 않습니다').css('color','red');
            } else {
                $('#tellPasswordCheck-msg').text('비밀번호를 입력해주세요').css('color','red');
            }
        }   
    });
}
//-------------------------------------------------------------------------------------------
// 휴대폰번호 변경시 비밀번호 체크 버튼 활성화
$('.changeTelPassword_btn').on('click', function(e) {
    e.preventDefault();
    checkPasswordTel();
});
//-------------------------------------------------------------------------------------------

// 휴대폰 번호 변경시 비밀번호Check 엔터키 이벤트 활성화
$('#passwordTel').on('keypress', function(e) {
    if (e.keyCode === 13) { // Enter key pressed
        e.preventDefault();
        checkPasswordTel();
    }
});

//-------------------------------------------------------------------------------------------



// 휴대폰 번호 변경 버튼 클릭 이벤트 핸들러 엔터 칠 시
$('#changeTel').on('keypress', function(e) {
    if (e.keyCode === 13) { // Enter 치면 넘어가게함.
        e.preventDefault();

        // 비밀번호 입력 필드에서 엔터 키를 누르면 #changeTel_btn 요소의 click 이벤트 실행
        $('#changeTel_btn').click();
    }
});

// 휴대폰 번호 중복확인
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

// 휴대폰 번호 변경 버튼 누를시
$('#changeTel_btn').on('click', async function(e){
   e.preventDefault();  

   let newTel = $('#changeTel').val();

   // 휴대폰 번호 중복 확인 로직 추가 
   if (!(await checkTelAvailable(newTel))) {
		$('#changeTel-msg').text('이미 사용중인 번호 입니다.').css('color','red');
       return;
   }


   if (!telCheck(newTel)) {  // 유효성 검사 실패 시 처리 변경, 여기서 telCheck() 함수의 반환값 활용 
       return; 
   } else { 
      await $.ajax({  // 휴대폰번호  변경
         url : '/changeTel',
         method : 'POST',
         data : {  
             newTel: newTel,
             password : $('#password').val()  // 비밀번호 필드 값 사용
         },
         success : function(response){
             if (response.error) {
                 alert('전화번호 변경 실패');
                 window.location.href = '/member_edit_page?error';
             } else {
                 alert('전화번호 변경 완료');
                 window.location.href = '/member_edit_page'; 
             }
         }
     });
   }
});

//-------------------------------------------------------------------------------------------


// 이메일 변경 엔터 누를시
$('#changeEmail').on('keypress', function(e) {
    if (e.keyCode === 13) { // Enter 치면 넘어가게함.
        e.preventDefault();

        // 비밀번호 입력 필드에서 엔터 키를 누르면 #changeEmail_btn 요소의 click 이벤트 실행
        $('#changeEmail_btn').click();
    }
});

async function checkEmailAvailable(email) {	
    let result = false;
    await $.ajax({
        url: '/member/email/available',
        method: 'GET',
        data: { memberEmail: email },
        success: function(response) {
            result = response;
        }
    });
    return result;
}


// 이메일 변경 버튼 클릭시
$('#changeEmail_btn').on('click', async function(e){
   e.preventDefault();  

   let newEmail = $('#changeEmail').val();

   // 중복 확인 로직 추가
   if (!(await checkEmailAvailable(newEmail))) {
      $('#changeEmail-msg').text('이미 사용중인 이메일 입니다.').css('color','red');
       return;
   }

   const isValidEmail = emailCheck();  
   
   if (!isValidEmail) {
       $('#changeEmail-msg').text('올바르지 않은 이메일 형식 입니다.').css('color','red');
       return; 
   } else { 
       $.ajax({  // 전화번호 변경 로직
           url : '/changeEmail',
           method : 'post',
           data : {  
               newEmail: newEmail,
               password : $('#passwordEmail').val()  // 비밀번호 필드 값 사용
           },
           success : function(response){
               if (response.error) {
                   alert('이메일 변경 실패');
                   window.location.href = '/member_edit_page?error';
               } else {
                   alert('이메일 변경 완료');
                   window.location.href = '/member_edit_page'; 
               }
           }
       });
   }
})


//-------------------------------------------------------------------------------------------


// 회원 탈퇴
$('#quit').on('click', async function(e){
    e.preventDefault(); // 버튼의 기본 동작(폼 제출)을 막음

    if (!confirm('정말로 회원탈퇴를 진행하시겠습니까?')) {
        return; // 사용자가 취소를 누르면 여기서 종료
    }

    $.ajax({
        url: '/quit',
        method: 'post',
        success: function(response) {
            alert('회원 탈퇴가 완료되었습니다.');
            window.location.href = '/'; // 홈 페이지로 이동
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('오류가 발생했습니다. 다시 시도해주세요.'); 
        }
    });
});

$('.go_home').on('click', function(e) {
    e.preventDefault(); 
    window.location.href = '/'; 
});



});//(document) 끝마침.






	










