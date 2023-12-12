<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main.css">
<script type="text/javascript">
</script>
</head>

<body class="body"  
	style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#D9B66C;">
					
	<div class="wrapper">
		<div class="intro-bg">
		<div class="header">
			<div class="logo">
					<a href="main_home.do" id="logoa"><img src="resources/img/titleLogo.jpg" width="130px" height="130px"></a>
		        </div>
			<div class="title">
		        	<ul class="nav">
			            <li><a href="info_main.do">소개</a></li>
			            <li><a href="review_main.do">리뷰</a></li>
			            <li><a href="qna_main.do">QNA</a></li>
			            <li><a href="rev_main.do">예약</a></li>
			          	<c:choose>
							<c:when test="${empty id}">
								<li><a href="login_main.do">펫 등록</a></li>
								<li><a href="login_main.do">정보수정</a></li>
								<li><a href="login_main.do">로그인</a></li>
							</c:when>
							<c:when test="${not empty id}">
								<li><a href="petinfo_main.do">펫 등록</a></li>
								<li><a href="check_up.do">정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div> <!-- 헤더 -->
		
		<div class="mid">
			<ul class="midd">
			<li><div class="tab_content">
				
				<div class="slider">
					<c:if test="${list != null }">
					<c:forEach var="vo" items="${list }">
			        <div class="slide">
			          	<table border="1" align="left">
			          		<tr>
			          		<th colspan="2"><h6>${vo.u_nickName }</h6></th>
			          		</tr>
			          		<tr>
							<c:choose>
								<c:when test="${vo.r_photo}!='no_file' || ${vo.r_photo}!=null">
								
									<td><img
										src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
										width="100" height="100"></td>
										</c:when>
										<c:otherwise>
										<td><img
										src="${pageContext.request.contextPath}/resources/petImg/defaultImg.jpg"
										width="100" height="100"></td>
										</c:otherwise>
										</c:choose>
									<td><textarea class="col-auto form-control" width="100px;"
											id="reviewContents" placeholder="${vo.r_content }" readonly></textarea></td>
			          		</tr>
			          	</table>
			        </div>
			        </c:forEach>
			   
		    	</c:if>
		    	<c:if test="${list == null }">
		    		리뷰 없음
		    	</c:if>
		    	</div>
		    		
		    	
				
			</div></li>
			
			<li><div class="Qna">
				<ul>
					<li>자주묻는 질문</li>
					<li>자주묻는 질문</li>
					<li>자주묻는 질문</li>
				</ul>
			</div></li>
			</ul>
			
			<div class="banner">
				
		    </div>
			
		</div>
	
	
	<div class="footer">
	<li>병원이름: 동물병원</li>
	<li> 주소  : 인천광역시 부평구 시장로 7 5층</li>
	<li>전화번호: 032-262-5890</li>
	<li> 이메일:email@naver.com</li>
	ⓒ2023.hospital name All rights reserved.
</div>
<div class="footer1">
	<li>대표자: 김재준</li>
	<li>대표자 전화번호:000-0000-0000</li>
	<li>사업자 등록번호:000-00-00000</li>
	</div>
	
	<div class="sns">
	<a href="https://www.instagram.com">
	<img src="resources/img/insta.jpg" width="100px" height="100px">
	</a>
	</div>
	
 

    


<!-- 	<!-- 자동롤링배너 
			<div class="wrap"> 배너표시영역
		        <div class="rolling-list"> 원본배너
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
    </script> -->
    
    <script type="text/javascript">
	    var currentSlide = 0;
	    const slides = document.querySelectorAll('.slide');
	    const slideCount = slides.length;
	     
	    function showSlide(n) {
	        slides.forEach(slide => slide.style.display = 'none');
	        slides[n].style.display = 'block';
	    }
	     
	    function nextSlide() {
	        currentSlide = (currentSlide + 1) % slideCount;
	        showSlide(currentSlide);
	    }
	     
	    function prevSlide() {
	        currentSlide = (currentSlide - 1 + slideCount) % slideCount;
	        showSlide(currentSlide);
	    }
	     
	    document.addEventListener('DOMContentLoaded', () => {
	        showSlide(currentSlide);
	        setInterval(nextSlide, 3000); // 3초마다 자동 슬라이드                
	    });
    </script>
    
    
    
	</div>
</body>
</html>