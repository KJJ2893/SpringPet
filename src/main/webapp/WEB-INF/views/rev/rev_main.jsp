<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<form>
		<input type="button" value="예약하기"
			onclick="location.href='revInsert.do'"> 
		<input type="button" value="예약조회" onclick="">
		
		
		<%-- 조회로 가야할거
		
		<table border="1" align="center">
			<caption>예약 리스트</caption>
			<tr>
				<th>예약번호</th>
				<th>예약자명</th>
				<th>예약날짜</th>
				<th>예약시간</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.rv_idx }</td>
					<td>${vo.u_idx }</td>
					<td>${vo.rv_day }</td>
					<td>${vo.rv_time }</td>
				</tr>
			</c:forEach> --%>
			
			
		</table>
	</form>
</body>
</html>