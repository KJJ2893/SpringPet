<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f){
		var rv_day = f.rv_day.value;
		var rv_time = f.rv_time.value;
		var u_idx = f.u_idx.value;
		
		f.action = "rev_done.do";
		f.submit();
		
	}
</script>
</head>
<body>
	<div class="wrapper">
	<form>
		<input type="hidden" name="u_idx" value="${id.u_idx}">
		<table border="1" align="center">
			<tr>
				<th>이름 :</th>
				<td><input type="text" name="u_name" placeholder="이름을 입력해주세요." value="${id.u_name}"></td>
			</tr>
			<tr>
				<th>전화번호 :</th>
				<td><input type="text" name="u_tel" placeholder="전화번호를 입력해주세요." value="${id.u_tel}"></td>
			</tr>
			<tr>
				<th>날짜 :</th>
				<td><input name="rv_day" value="${date[0]}" readonly>
			</tr>
			<tr>
				<th>시간 :</th>
				<td><input name="rv_time" value="${date[1]}"readonly>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="다음" onclick="send(this.form)"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>