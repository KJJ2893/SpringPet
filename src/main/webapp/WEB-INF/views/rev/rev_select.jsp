<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rev_cancle(){
		var confirmCancle = confirm("예약을 취소하시겠습니까?");
		if(confirmCancle){
			alert("예약이 취소되었습니다.");
			return;	
			
		location.href = "rev_cancle.do?rv_idx="+rv_idx;
			
		}
		
</script>
</head>
<body>
	<form>
		<input type="hidden" name="u_idx" value="${u_idx}" >
		<h1 align="center">내 예약 정보</h1>
		<table border="1" align="center">
			<tr>
				<th>예약자 성함</th>
				<th>예약 날짜</th>
				<th>예약 시간</th>
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.u_name}</td>
				<td>${vo.rv_day}</td>
				<td>${vo.rv_time}</td>
			</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>