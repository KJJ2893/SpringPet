<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function
	</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>마이 펫 등록하기</caption>
			<tr>
			   <th>이름</th>
			   <td>
			   	<input name="p_name">
			   </td>
			</tr>
			<tr>
			 	<th>종</th>
			 	<td>
			 		<select>
			 			<option></option>
			 			<option>강아지</option>
			 			<option>고양이</option>
			 		</select>
			 	</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input name="p_age">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="p_gender_m"> 남
					<input type="radio" name="p_gender_m"> 여
				</td>
			</tr>
			<tr>
				<th>이미지 첨부</th>
				<td><input type="file" name="photo"></td>
			</tr>	
			<tr>
			   <td colspan="2" align="center">
			      <input type="button" value="등록하기" onclick="send(this.form)">
			      <input type="button" value="등록취소" onclick="send(this.form)">
			   </td>
			</tr>
		</table>
	</form>
</body>
</html>