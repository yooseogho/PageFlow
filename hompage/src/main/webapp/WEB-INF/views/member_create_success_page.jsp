<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/member_create_success.css">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
        <header>
            <div class="header_inner">
                <a href="/page" class="logo">LogoImage</a>
            </div>
        </header>

        <main class="container_wrapper">
            <section class="contents_wrap">

                <div class="join_complete_wrap">
                    <div class="title_wrap title_size_lg">
                        <p class="title_heading">
                            반갑습니다. <span class="fc_green">xxx</span> 님!<br>
                            회원이 되신 것을 축하드립니다.
                        </p>
                    </div>

                    <div class="btn_wrap justify page_bottom" id="joinComplete">
                        <a href="/" style="width: 100%">
                            <button class="btn_lg btn_primary">
                                <span class="text">메인</span>
                            </button>
                        </a>
                    </div>
                </div>
            </section>
        </main>
        <footer>
			<jsp:include page="/WEB-INF/views/include/copy_right_footer.jsp" />
		</footer>
	</div>
</body>
</html>