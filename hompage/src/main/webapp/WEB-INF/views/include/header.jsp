<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#logo{
		height: 49px;
		border: 1px solid red;
		text-align: center;
		justify-content: center;
		display: flex;
		
	}
	#p_logo{
		line-height: 42px;
	}
	
	#h_button{
		height: 49px;
		border: 1px solid red;
		display: flex;
		justify-content: end;
	}
	
	.h_button{
		margin-left : 10px;
		height: 49px;
		width: 68px;
	}
</style>
</head>
<body>

	<div id="logo">
		<p id="p_logo">ImageLogo</p>
	</div>
			
	<div id="h_button">	
		<button class="h_button">로그아웃</button>
		<a href="/customer_service_page"><button class="h_button">고객센터</button></a>
	</div>	
</body>
</html>