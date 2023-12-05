<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<table border="1" align="center">
<caption>예약 리스트</caption>
<tr>
<th>예약자명</th>
<th>전화번호</th>
<th>예약시간</th>
<th>예약날짜</th>
</tr>

<tr>
<td>${vo.u_name }</td>
<td>${vo.u_tel }</td>
<td>${vo.rv_time }</td>
<td>${vo.rv_day }</td>
</tr>
</table>
</form>
</body>
</html>