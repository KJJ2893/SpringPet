<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/review.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="logo">
		<a href="main_home.do"><img src="resources/img/hos logo.jpg" width="100px" height="100px"> </a>
	</div>
	<div class="top">
		<form>
			리뷰리뷰리뷰
		<div class="list">
			<table border="1">
				<caption>:::리뷰:::</caption>
				<c:forEach var="vo" items="${list }">
				<tr>
				<th>작성자 : ${vo.u_nickName }</th>
				<th>작성일 : ${vo.r_regdate }</th>
				</tr>
				<tr>
				<td id="photo"><img src="resources/img/hos logo.jpg"></td>
				<td><textarea class="col-auto form-control" id="reviewContents"
				  placeholder="새로운 리뷰 ${vo.r_content }" readonly></textarea></td>
				</tr>
				</c:forEach>
			</table>
		</div>

		</form>
	</div>
</body>
</html>