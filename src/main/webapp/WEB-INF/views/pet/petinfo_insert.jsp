<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pet/petinsert.css?after">
<script src="resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function insert_send(f){
			var p_name = f.p_name.value.trim();
			var p_type = f.p_type.value;
			var p_age = f.p_age.value.trim();
			var p_gender = f.p_gender.value;
			/* var p_photo = f.p_photo.value; */
			var u_idx = f.u_idx.value;
			var photoInput = f.photo; // 파일 입력 요소에 대한 참조
			
			// 유효성 검사
			if(p_name == ''){
				alert('이름을 입력하세요');
				return;
			}
			
			if(p_name.length > 15){
				alert('이름은 15글자 미만으로 입력해주세요');
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
			
			if(photoInput.files.length > 0){
				if(!isImageFile(photoInput)){
					alert('이미지 파일만 첨부 가능합니다.');
					return;
				}
			}
			
			f.action = "pet_insert.do";
			f.submit();
		}
		
		function cancel_send(f){
			var insertConfirm = confirm("등록을 취소하시겠습니까?");
			if(insertConfirm){
				window.location.href = "petinfo_main.do";
			}
		}
		
		// 이미지 파일인지 확인하는 함수
		function isImageFile(input){
			var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
			return input.files.length > 0 && allowedTypes.includes(input.files[0].type);
		}
	</script>
</head>
<body class="body" 
style="background-image:url('resources/img/petback.jpg');
					background-repeat: no-repeat;
					background-size:100%;">
					
						<a href="main_home.do"><img src="resources/img/hos logo.jpg" width="80px" height="80px"> </a>
					
		<div class="top">
	<input type="button" value="소개" class="btn1"  onclick="location.href='info_main.do'"  >
	<input type="button" value="공지" class="btn1" onclick=""  >
	<input type="button" value="리뷰" class="btn1" onclick="location.href='review_main.do'"  >
	<input type="button" value="QNA"  class="btn1" onclick="location.href='qna_main.do'"  >
	<input type="button" value="예약"  class="btn1" onclick="location.href='rev_main.do'"  >
	<c:choose>
			<c:when test="${not empty id}">
				
				<input type="button" value="펫 등록" class="btn1"  onclick="location.href='petinfo_main.do'">
				<input type="button" value="정보수정" class="btn1"  onclick="location.href='check_up.do'">
				<input type="button" value="로그아웃" class="btn1"   onclick="location.href='logout.do'">
			</c:when>
		</c:choose>
	</div>			

	
	
					
	<form method="POST" enctype="multipart/form-data">
		<table border="1" align="center">
			<caption><h2>마이 펫 등록하기</h2></caption>
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
				<td><input type="file" name="photo"  ></td>
			</tr>	
			<tr>
			   <td colspan="2" align="center">
             	<input name="u_idx" type="hidden" value="${id.u_idx}">
			      <input type="button" class="btn" value="등록하기" onclick="insert_send(this.form)">
			      <input type="button" class="btn" value="등록취소" onclick="cancel_send(this.form)">
			   </td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>