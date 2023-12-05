<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function insert_send(f){
			var p_name = f.p_name.value.trim();
			var p_type = f.p_type.value;
			var p_age = f.p_age.value.trim();
			var p_gender = f.p_gender.value;
			var filename = f.filename.value;
			var u_idx = f.u_idx.value;
			
			// 유효성 검사
			if(p_name == ''){
				alert('이름을 입력하세요');
				return;
			}
			if(p_type == ''){
				alert('반려동물 종을 선택해주세요');
				return;
			}
			if(p_age == ''){
				alert('나이를 입력해주세요');
				return;
			}
			
			var intAge = parseInt(p_age);
			
			if(isNaN(intAge)){
				alert('나이는 숫자로만 입력이 가능합니다.');
				return;
			}
			
			if(intAge >= 30){
				alert('1 ~ 30 사이의 숫자를 입력해주세요');
				return;
			}
			
			if(p_gender == ''){
				alert('성별을 선택해주세요');
				return;
			}
			
			location.href="pet_insert.do?p_name="+p_name
					+"&p_type="+p_type
					+"&p_age="+p_age
					+"&p_gender="+p_gender
					+"&filename="+filename
					+"&u_idx="+u_idx;
			f.submit();
		}
		
		function cancel_send(f){
			var insertConfirm = confirm("등록을 취소하시겠습니까?");
			if(insertConfirm){
				window.location.href = "petinfo_main.do";
			}
		}
	</script>
</head>
<body>
	<form method="POST" enctype="multipart/form-data">
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
					<input type="radio" name="p_gender" value="남"> 남
					<input type="radio" name="p_gender" value="여"> 여
				</td>
			</tr>
			<tr>
				<th>이미지 첨부</th>
				<td><input type="file" name="filename"></td>
			</tr>	
			<tr>
			   <td colspan="2" align="center">
             	<input name="u_idx" type="hidden" value="${id.u_idx}">
			      <input type="button" value="등록하기" onclick="insert_send(this.form)">
			      <input type="button" value="등록취소" onclick="cancel_send(this.form)">
			   </td>
			</tr>
		</table>
	</form>
</body>
</html>