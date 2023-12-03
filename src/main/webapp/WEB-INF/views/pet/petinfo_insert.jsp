<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function insert_send(f){
			var name = f.p_name.value;
			var type = f.p_type.value;
			var age = f.p_age.value;
			var gender = f.p_gender.value;
			
			// 유효성 검사
			if(name == ''){
				alert('이름을 입력하세요');
				return;
			}
			if(type == ''){
				alert('반려동물 종을 선택해주세요');
				return;
			}
			if(age == ''){
				alert('나이를 입력해주세요');
				return;
			}
			
			var intAge = parseInt(age);
			
			if(isNaN(intAge)){
				alert('나이는 숫자로만 입력이 가능합니다.');
				return;
			}
			
			if(gender == ''){
				alert('성별을 선택해주세요');
				return;
			}
			
			f.action = "pet_insert.do";
			f.submit();
		}
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
			 		<select name="p_type">
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
					<input type="radio" name="p_gender"> 남
					<input type="radio" name="p_gender"> 여
				</td>
			</tr>
			<tr>
				<th>이미지 첨부</th>
				<td><input type="file" name="photo"></td>
			</tr>	
			<tr>
			   <td colspan="2" align="center">
			      <input type="button" value="등록하기" onclick="insert_send(this.form)">
			      <input type="button" value="등록취소" onclick="cancel_send(this.form)">
			   </td>
			</tr>
		</table>
	</form>
</body>
</html>