<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/update.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	var b_telCheck = false;

</script>
</head>
<body>
	<div class="update_wrapper"> <!-- 값 받기 -->
		<h2>전화번호 변경</h2>
		<form id="update_form">
			<div class="update">
				<h3>사용중인 전화번호</h3>
				<input name="tel" value="${id.u_tel}" readonly> 
				
				<h3>새로운 전화번호를 입력해주세요.</h3>
				<input id="u_tel" name="u_tel" placeholder="Tel" onchange="che()"> 
				<input type="button" id="check_tel" value="전화번호 확인" onclick="telCheck(this.form)">
			</div>
			<input type="button" value="완료" onclick="done(this.form)">
		</form>
		</div>
</body>
</html>