<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/welcom.css">
</head>
<body class="body"  style="background-image:url('resources/img/loginback.jpg');
					background-repeat: no-repeat;
					background-size:100%;
					background-color:fuchsia;">
	<div class="wrapper">
		<div class="header_wrapper">
			<div class="logo_wrapper">
					<a href="main_home.do" class="logo">
						MY PET DOC
					</a>
			</div>
		</div>
		<div class="id_wrapper">
			<h2>?????????</h2>
			<div id="id_div">
				<h3 align="center">회원가입 실패... </h3>
				<h3 align="center">다시 시도해주세요 </h3>
				<input type="button" value="회원가입 하러가기" onclick="location.href='regster_insert.do'">
			</div>
		</div>
	</div>
</body>
</html>