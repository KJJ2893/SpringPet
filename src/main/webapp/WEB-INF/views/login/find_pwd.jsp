<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/find_pwd.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f){
		
		
	}
	
</script>
</head>
<body>
	<div class="wrapper">
		<div class="header_wrapper">
			<div class="logo_wrapper">
				<a href="main_home.do" class="logo">
						MY PET DOC
					</a>
			</div>
		</div> <!-- 헤더 -->
		<div class="find_wrapper"> <!-- 값 받기 -->
			<h2>Forget Your Password?</h2>
			<form id="find_form">
				<input type="text" name="u_name" placeholder="Name">
				<input type="text" name="u_email" placeholder="Email">
				<input type="button" value="Find!!" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>