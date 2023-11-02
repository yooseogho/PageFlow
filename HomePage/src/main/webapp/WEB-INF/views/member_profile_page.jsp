<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_profile.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script>
const v = `${member}`;
console.log(v);

$(document).ready(function() {
    var isDeleted = false;
    var defaultImage = 'http://localhost:8081/defaultProfile.png';

    
    $(document).ready(function() {
        $("#uploadFileImg").change(function() {
            if (this.files && this.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.thumb_box img').attr('src', e.target.result);
                }

                reader.readAsDataURL(this.files[0]);
            }
        });
    });

    
    
    $(document).on('click', '#deleteImg, #regBtn', function() {
        if (this.id === 'deleteImg') {
            $('.thumb_box img').attr('src', defaultImage);
            isDeleted = true;

            // 서버에 프로필 사진을 기본 이미지로 변경하는 요청
            $.ajax({
                url: '/changeProfile',  // 프로필 사진 변경 API의 URL
                type: 'POST',  // 요청 방식
                data: {  // 서버에 전달할 데이터
                    memberId: $('input[name="memberId"]').val()
                },
                success: function(response) {
                },
                error: function(error) {
                    // 요청이 실패하면 실행할 코드
                }
            });
        } else if (this.id === 'regBtn' && isDeleted) {
            $('.thumb_box img').attr('src', defaultImage);
            isDeleted = false; // 저장 버튼 클릭 시 isDeleted 변수 초기화
        }
    });
});

</script>


<body>
	<div id="page">
		<header class="header_wrapper">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</header>
		<nav class="nav_wrapper">
			<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		</nav>
		<main class="main_wrapper">
			<div class="main_inner">
				<aside class="aside_wrapper">
					<jsp:include
						page="/WEB-INF/views/include/member_info_left_aside.jsp" />
				</aside>
				<section class="section_wrapper">
					<form action="changeProfile" method="post"
						enctype="multipart/form-data">
						<!-- form tag moved up -->
						<div class="title_wrap title_size_md">
							<p class="title_heading">프로필 설정</p>
						</div>
						<div class="tbl_row_wrap">
							<table class="tbl_row">
								<colgroup>
									<col style="width: 130px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">프로필 이미지 <span class="required"></span>
										</th>
										<td>
											<div class="profile_	_box no_img">
													<div class="thumb_box">
														<img src="${member.memberProfile}" 
															style="width: 140px; height: 140px; border-radius: 100%;">
													</div>

											</div>
											<div class="btn_wrap">
												<span class="btn_attach"> <input type="file"
													id="uploadFileImg" name="newProfile"> <label
													for="uploadFileImg"><span class="ico_picture"></span>이미지
														변경</label>
												</span>
												
												<button type="button" class="btn_sm btn_line_gray"
													id="deleteImg">
													
													<span class="ico_delete"></span><span class="text">삭제</span>
												</button>
												
											</div> 
											<input type="hidden" name="memberId"
											value="${member.memberId}">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="bul_item_dot font_size_xxs">
							회원기본정보는 회원정보수정에서 변경 가능합니다. <br> <a
								href="https://mmbr.kyobobook.co.kr/member-info"
								class="btn_more_view fc_black"><span class="text">회원정보
									수정으로 이동</span><span class="ico_arw"></span></a>
						</p>
						<div class="btn_wrap page_bottom">
							<!-- Save button moved down -->
							<button type="submit" class="btn_md btn_primary" id="regBtn">
								<span class="text">저장</span>
							</button>
						</div>
					</form>
					<!-- End of form -->
				</section>
			</div>
		</main>
		<footer class="footer_wrapper">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>
