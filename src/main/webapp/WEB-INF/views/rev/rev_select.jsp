<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rev_cancle(f){
		var u_idx = f.u_idx.value;
		var rv_idx = f.rv_idx.value;

		if(!confirm("예약을 취소하시겠습니까?")){
			return;
		} else {
				
			f.action = "rev_cancle.do";
			f.submit();
		}
		
	}
</script>
</head>
<body style="background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
			
	<div class="wrapper">
		<form>
			<input type="hidden" name="u_idx" value="${id.u_idx }">
			<h1 align="center">내 예약 정보</h1>
			<table border="1" align="center">
				<c:forEach var="vo" items="${list}">
					<tr>
						<th>예약자 : </th>
						<td>${vo.u_name}</td>
					</tr>
			
					<tr>
						<th>예약 날짜</th>
						<td>${vo.rv_day}</td>
					</tr>
					<tr>
						<th>예약 시간</th>
						<td>${vo.rv_time}</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="hidden" name="rv_idx" value="${vo.rv_idx}" >
							<input type="button" value="예약취소" onclick="rev_cancle(this.form)">
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="right"><input type="button" value="완료" onclick="location.href='rev_main.do'">
				</tr>
			</table>
		</form>
	</div>
</body>
</html>