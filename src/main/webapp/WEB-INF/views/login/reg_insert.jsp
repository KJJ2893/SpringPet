<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/regster.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">

	var b_idCheck = false;
	
	function send(f){
		var userNickName = f.userNickName.value.trim(); // 닉네임
		var	userEmail = f.userEmail.value.trim(); // 이메일
		var	userPwd = f.userPwd.value.trim(); // 비번
		var pwd2 = f.pwd2.value.trim(); // 비번 체크용
		var	userName = f.userName.value.trim(); //이름
		var	userTel = f.userTel.value.trim(); // 전화번호
		var	userAddr = f.userAddr.value.trim(); // 주소
		
		// 유효성 검사
		if(userNickName == ''){
			alert('사용할 닉네임을 입력해주세요.');
			return;
		} else if(userEmail == ''){
			alert('사용할 이메일을 입력해주세요.');
			return;
		} else if(userPwd == ''){
			alert('사용할 비밀번호를 입력해주세요.');
			return;
		} else if(pwd2 == ''){
			alert('비밀번호 확인을 진행해주세요.');
			return;
		} else if(userPwd != pwd2){
			alert('비밀번호 확인이 일치하지 않습니다.');
			return;
		} else if(userName == ''){
			alert('이름을 입력해주세요.');
			return;
		} else if(userTel == ''){
			alert('전화번호를 입력해주세요.');
			return;
		} else if(userAddr == ''){
			alert('주소를 입력해주세요.');
			return;
		}
		
		if(!b_idCheck){
			alert('아이디 중복체크 필요');
			return;
		}
		/////////////
		
		f.action = "insert_user.do";
		f.submit();
		
		
		
		
	}
	
	function idCheck(){
		var userEmail = document.getElementById("userEmail").value.trim();
		
		if(userEmail == ''){
			alert('사용하실 이메일을 입력해주세요.');
			return;
		}
		
		var url = "idCheck.do";
		var param = "userEmail="+encodeURIComponent(userEmail);
		
		sendRequest(url, param, resultFn, "POST");
	} // idCheck()
	
	// 콜백
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){

			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == 'no'){
				alert('이미 가입된 이메일입니다.');
				return;
			} else{
				alert('사용 가능한 이메일입니다.');
				b_idCheck = true;
			}
			
		}
	} // resultFn()
	
	// 중복체크용
	function che() {
		b_idCheck = false;
	} // che()

</script>
</head>
<body>
	<div class="wrapper">
		<div class="header_wrapper">
			<div class="logo_wrapper">
				<a href="main_home.do" class="logo">
						MY PET DOC
					</a>
			</div>
		</div> <!-- 헤더 -->
		<div class="reg_wrapper"> <!-- 값 받기 -->
			<h2>Sign Up</h2>
			<form id="reg_form">
				<input type="text" name="userNickName" placeholder="NickName"> 
				<input type="text" name="userName" placeholder="Name">
				<div class="id_input">
					<input type="text" id="userEmail" name="userEmail" placeholder="Email" onchange="che()"> 
					<input type="button" id="check_id" value="Check ID" onclick="idCheck(this.form)">
				</div>
				<input type="password" name="userPwd" placeholder="Password">
				<input type="password" name="pwd2" placeholder="Password Check">
				<input type="text" name="userTel" placeholder="Tel">
				<input type="text" name="userAddr" placeholder="Address">
				
				<input type="button" value="Sign Up" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>