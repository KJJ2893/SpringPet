<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 
input[type="radio"]{
display:none;
}
.conbox{
width:1500px;
height:500px;
background:#aaa;
display:none;
position:absolute;
top:200px;
left:200px;}

.btn {
padding:10px;
text-align:center;
position:absolute;
top:700px;
left:800px;
}

label[for*="tab"]{
display:inline-block;
padding:10px;
background:#ccc;
margin:5px;
cursor:pointer;

border-radius:100%;}

input[id="tab01"]:checked ~ .con1{
display:block;}
input[id="tab02"]:checked ~ .con2{
display:block;}
input[id="tab03"]:checked ~ .con3{
display:block;}

input[id="tab01"]:checked ~ .btn >label[for="tab01"]{
background:red;}
input[id="tab02"]:checked ~ .btn >label[for="tab02"]{
background:red;}
input[id="tab03"]:checked ~ .btn >label[for="tab03"]{
background:red;}


}
/* 자동롤링배너 */

.wrap {
            border: 1px solid;
            display: flex; 
            overflow: hidden;
        }
        .wrap .rolling-list ul {
            padding : 0px;
            display: flex;
        }
        .wrap .rolling-list ul li { 
            box-sizing: border-box; 
            display: flex; 
            align-items: center; 
            flex-shrink: 0; 
        }
 
        .rolling-list.original {
            animation: rollingleft1 90s linear infinite;
        }
        .rolling-list.clone {
            animation: rollingleft2 90s linear infinite;
        }
 
 	/*시간이 n 초일때 비율  */
        @keyframes rollingleft1 {
            0% { transform: translateX(0); }
            50% { transform: translateX(-100%); }
            50.01% { transform: translateX(100%); }
            100% { transform: translateX(0); }
        }
 
        @keyframes rollingleft2 {
            0% { transition: translateX(0); }
            100% { transform: translateX(-200%); }
            
            
        }


    </style>
    
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main.css">
<script type="text/javascript">
	function go_pet(){
		alert('로그인 필요');
		location.href="login_main.do";
	} // go_pet()
	
	
</script>
</head>

<body class="body"  style="background-image:url('resources/img/ground.jpg')">
<div class="logo">
xx병원
<img  id="logo1" src="resources/img/hos logo.jpg" width="60px;" height="60px"; >
</div>
	
	<div class="top" id="top">
	<input type="button" value="소개"  class="button" onclick="location.href='info_main.do'">
	<input type="button" value="공지" class="button"  onclick="">
	<input type="button" value="리뷰" class="button"  onclick="">
	<input type="button" value="QNA" class="button"  onclick="location.href='qna_form.do'">
	<input type="button" value="예약" class="button"  onclick="">
	<c:choose>
			<c:when test="${empty id}">
				<input type="button" value="로그인" onclick="location.href='login_main.do'">
				<input type="button" value="펫 등록" onclick="go_pet()">
			</c:when>
			<c:when test="${not empty id}">
				<input type="button" value="로그아웃" onclick="location.href='logout.do'">
				<input type="button" value="펫 등록" onclick="location.href='petinfo_main.do'">
			</c:when>
		</c:choose>
	</div>
	
	<div class="sns">
	<a href="https://www.instagram.com">
	<img src="resources/img/insta.jpg" width="100px"; height="100px"; >
	</a>
	</div>
	
	<div class="footer">
	<li>병원이름: 동물병원</li>
	<li> 주소  : 인천광역시 부평구 시장로 7 5층</li>
	<li>전화번호: 032-262-5890</li>
	<li> 이메일:email@naver.com</li>
	ⓒ2023.hospital name All rights reserved.
</div>
<div class="footer1">
	<li>대표자: 김이이유</li>
	<li>대표자 전화번호:000-0000-0000</li>
	<li>사업자 등록번호:000-00-00000</li>
</div>
	<div class="footer2">
	<!-- <img src="" width="30%" heigh="20%">  로고사진 들어가야함-->
	</div>
	
  <div class="tab_content">
<input type="radio" name="tabmenu" id="tab01" checked>
<input type="radio" name="tabmenu" id="tab02" >
<input type="radio" name="tabmenu" id="tab03" >

<div class="conbox con1"><li>사람</li></div> 
<div class="conbox con2"><li>나무</li></div>
<div class="conbox con3"><li>집</li></div>

<div class="btn">
<label for="tab01"></label>
<label for="tab02"></label>
<label for="tab03"></label>
</div>
</div>
    
<!-- 자동롤링배너 -->
<div class="wrap"> <!-- 배너표시영역 -->
        <div class="rolling-list"> <!-- 원본배너 -->
            <ul>
                <li>
                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1471922694854-ff1b63b20054?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
                </li>
                <li>
                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1493246507139-91e8fad9978e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
                </li>
                <li>
                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1501493870936-9c2e41625521?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
                </li>
                <li>
                    <div class="image-wrap"><img src="https://images.unsplash.com/photo-1611832197549-ff910be125dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200" alt=""></div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        // 롤링 배너 복제본 생성
        let roller = document.querySelector('.rolling-list');
        roller.id = 'roller1'; // 아이디 부여
 
        let clone = roller.cloneNode(true)
        // cloneNode : 노드 복제. 기본값은 false. 자식 노드까지 복제를 원하면 true 사용
        clone.id = 'roller2';
        document.querySelector('.wrap').appendChild(clone); // wrap 하위 자식으로 부착
 
        document.querySelector('#roller1').style.left = '0px';
        document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';
        // offsetWidth : 요소의 크기 확인(margin을 제외한 padding값, border값까지 계산한 값)
 
        roller.classList.add('original');
        clone.classList.add('clone');
    </script>
    
    
    

</body>
</html>