
async function memberIdCheck() {
  const pattern = /^[a-z0-9]{6,10}$/
  $('#memberId-msg').text('');
  const memberId = $('#memberId').val();
  if(memberId==='') {
    $('#memberId-msg').text('아이디를 입력하세요').attr('class','fail');
    return false;
  }  
  if(pattern.test(memberId)===false) {
    $('#memberId-msg').text('아이디는 영숫자 6~10자입니다').attr('class','fail');
    return false;
  }
  try {
    await $.ajax('/member/username/available/' + memberId);
    return true;
  } catch(err) {
    console.log(err);
    $('#memberId-msg').text('사용중인 아이디입니다').attr('class','fail');
    return false;
  }
}

function passwordCheck() {
  $('#password-msg').text('');
  const pattern = /^[A-Za-z0-9]{8,10}$/;
  const password= $('#password').val();
  if(password==='') {
    $('#password-msg').text('비밀번호를 입력하세요').attr('class','fail');
    return false;	
  }
  if(pattern.test(password)===false) {
    $('#passowrd-msg').text('비밀번호는 영숫자 8~10자입니다').attr('class','fail');
    return false;
  }
  return true;
}

function emailCheck() {
  const pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  $('#email-msg').text('');
  const email= $('#email').val();
  if(email==='') {
    $('#email-msg').text('이메일을 입력하세요').attr('class','fail');
    return false;
  }
  if(pattern.test(email)===false) {
    $('#email-msg').text('이메일을 올바르게 입력하세요').attr('class','fail');
    return false;
  }  
  return true;
}

function birthdayCheck() {
  $('#birthday-msg').text('');
  const birthday= $('#birthday').val();
  if(birthday==='') {
    $('#birthday-msg').text('생일을 입력하세요').attr('class','fail');
    return false;
  }
  return true;
}


$(document).ready(function() {
   $('#memberId').on('blur', memberIdCheck);
   $('#password').on('blur', passwordCheck);
   $('#email').on('blur', emailCheck);
   $('#birthday').on('blur', birthdayCheck);

   
   $('#join').on('click', async function() {
     let 조건체크 = await memberCheck();
     console.log(조건체크);
     조건체크 = passwordCheck() && 조건체크;
     console.log(조건체크);
     조건체크 = emailCheck() && 조건체크;
     console.log(조건체크);
     조건체크 = birthdayCheck() && 조건체크;
     console.log(조건체크);
     if(조건체크===true)	
       $('#join-form').submit();
       
   });
})