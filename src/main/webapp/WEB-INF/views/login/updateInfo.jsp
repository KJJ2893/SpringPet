<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/update.css">
<script type="text/javascript">
	

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
		<div class="update_wrapper"> <!-- 값 받기 -->
			<h2>내정보</h2>
			<form id="update_form">
				<div class="update">
					<h3>NickName</h3>
					<input id="u_Nname" value="${id.u_nickName }" readOnly>
					<input type="button" value="수정" 
						onclick="window.open('updateNname.do', '팝업창 이름', 'width=450px;, height=500px;')">
				
					<h3>Name</h3>
					<input id="u_name" value="${id.u_name }" readOnly>
					<input type="button" value="수정">
					
					<h3>Email</h3>
					<input id="u_email" value="${id.u_email }" readOnly>
					<input type="button" value="수정">

					<h3>Password</h3>
					<input type="password" name="u_pwd" id="u_pwd" placeholder="Password" value="${id.u_email }">
					<input type="button" value="수정">
					
					<h3>Tel</h3>
					<input id="u_tel" value="${id.u_tel }" readOnly>
					<input type="button" value="수정">
					
					<h3>Address</h3>
					<input id="u_addr" value="${id.u_addr }" readOnly>
					<input type="button" value="수정">
				</div>
				<input type="button" value="완료" onclick="location.href='main_home.do'">
			</form>
		</div>
	</div>
</body>
</html>