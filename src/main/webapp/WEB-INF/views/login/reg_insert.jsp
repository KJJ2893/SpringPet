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
	var b_NnameCheck = false;
	
	function send(f){
		var u_nickName = f.u_nickName.value.trim(); // 닉네임
		var	u_email = f.u_email.value.trim(); // 이메일
		var	u_pwd = f.u_pwd.value.trim(); // 비번
		var pwd2 = f.pwd2.value.trim(); // 비번 체크용
		var	u_name = f.u_name.value.trim(); //이름
		var	u_tel = f.u_tel.value.trim(); // 전화번호
		var	u_addr = f.u_addr.value.trim(); // 주소
		
		// 유효성 검사
		if(u_nickName == ''){
			alert('사용할 닉네임을 입력해주세요.');
			return;
		} else if(u_email == ''){
			alert('사용할 이메일을 입력해주세요.');
			return;
		} else if(u_pwd == ''){
			alert('사용할 비밀번호를 입력해주세요.');
			return;
		} else if(pwd2 == ''){
			alert('비밀번호 확인을 진행해주세요.');
			return;
		} else if(u_pwd != pwd2){
			alert('비밀번호 확인이 일치하지 않습니다.');
			return;
		} else if(u_name == ''){
			alert('이름을 입력해주세요.');
			return;
		} else if(u_tel == ''){
			alert('전화번호를 입력해주세요.');
			return;
		} else if(u_addr == ''){
			alert('주소를 입력해주세요.');
			return;
		}
		
		if(!b_idCheck){
			alert('아이디 중복체크 필요');
			return;
		}
		
		if(!b_NnameCheck){
			alert('닉네임 중복체크 필요');
			return;
		}
		/////////////
		
		f.action = "insert_user.do";
		f.submit();
		
		
		
		
	}
	
	// 닉네임 중복체크
	function nNameCheck(){
		var u_nickName = document.getElementById("u_Nname").value.trim();
		
		if(u_nickName == ''){
			alert('사용하실 닉네임을 입력해주세요.');
			return;
		}
		
		var url = "nNameCheck.do";
		var param = "u_nickName="+encodeURIComponent(u_nickName);
		
		sendRequest(url, param, resultFn2, "POST");
	}
	
	// 콜백
	function resultFn2(){
		if(xhr.readyState == 4 && xhr.status == 200){

			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == 'no'){
				alert('이미 사용중인 닉네임입니다.');
				return;
			} else{
				alert('사용 가능한 닉네임입니다.');
				b_NnameCheck = true;
			}
			
		}
	} // ResultFn2()
	
	// 아이디 중복체크
	function idCheck(){
		var u_email = document.getElementById("u_email").value.trim();
		
		if(u_email == ''){
			alert('사용하실 이메일을 입력해주세요.');
			return;
		}
		
		var url = "idCheck.do";
		var param = "u_email="+encodeURIComponent(u_email);
		
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
	
	// 닉네임 중복체크용
	function che2() {
		b_NnameCheck = false;
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
				<div class="id_input">
					<input type="text" id="u_Nname" name="u_nickName" placeholder="NickName" onchange="che2()"> 
					<input type="button" id="check_nName" value="중복확인" onclick="nNameCheck(this.form)">
				</div>
				<input type="text" name="u_name" placeholder="Name">
				<div class="id_input">
					<input type="text" id="u_email" name="u_email" placeholder="Email" onchange="che()"> 
					<input type="button" id="check_id" value="Check ID" onclick="idCheck(this.form)">
				</div>
				<input type="password" name="u_pwd" placeholder="Password">
				<input type="password" name="pwd2" placeholder="Password Check">
				<input type="text" name="u_tel" placeholder="Tel">
				<input type="text" name="u_addr" placeholder="Address">
				
				<input type="button" value="Sign Up" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>