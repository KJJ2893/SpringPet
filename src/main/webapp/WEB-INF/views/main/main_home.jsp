<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>LOGO OR TITLE</h2>
	<div>
		<input type="button" value="INFO" onclick="location.href='info_main.do'">
		<c:choose>
			<c:when test="${empty id}">
				<input type="button" value="로그인" onclick="location.href='login_main.do'">
				<input type="button" value="펫 등록" onclick="location.href='pet_main.do'">
			</c:when>
			<c:when test="${not empty id}">
				<input type="button" value="로그아웃" onclick="location.href='logout.do'">
				<input type="button" value="펫 등록" onclick="location.href='login_main.do'">
			</c:when>
		</c:choose>
		
	</div>
</body>
</html>