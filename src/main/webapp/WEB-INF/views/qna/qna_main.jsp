<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_main.css" rel="stylesheet">
</head>
<body>
	<c:forEach var="qna" items="${list }">
		<div>
			<a href="qna_view?q_idx=${qna.q_idx }">${qna.q_title }</a>, <br>
			${qna.q_idx }, <br>
			<%-- ${qna.q_content }, <br>
			${qna.q_regdate }, <br>
			${qna.q_filename }, <br>
			${qna.q_moviename } <br> --%>
			<img alt="이미지 없음" src="${pageContext.request.contextPath}/resources/upload/qna/${qna.q_filename}">
			<%-- <img alt="동영상 없음" src="${pageContext.request.contextPath}/resources/upload/qna/${qna.q_moviename}"> --%>
		</div>
	</c:forEach>	
	${id } <br>
	${id.u_idx } <br>
	${id.u_nickName} <br>
</body>
</html>