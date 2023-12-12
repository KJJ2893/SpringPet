<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pet/pet.css">
	<script type="text/javascript">
		function petinfo_del(p_idx){
			if(!confirm("반려동물 정보를 삭제하시겠습니까?")){
				return;
			}
			
			 location.href ="petinfo_del.do?p_idx="+p_idx;
			
		}
		
		function openImage(imageSrc){
			window.open(imageSrc, '_blank', 'width=1000, height=800');
		}
	</script>
</head>
<body class="body" 
style="background-image:url('resources/img/petback.jpg');
					background-repeat: no-repeat;
					background-size:100%;
					background-color:lime;">
					
					
					<a href="main_home.do"><img src="resources/img/hos logo.jpg" width="80px" height="80px"> </a>
					
					<div class="leftimg">
					<img src="${pageContext.request.contextPath}/resources/img/cat.jpg">
					</div>
					<div class="leftimg1">
					<img src="${pageContext.request.contextPath}/resources/img/cat1.jpg">
					</div>
					<div class="rightimg">
					<img src="${pageContext.request.contextPath}/resources/img/dog.jpg">
					</div>
					<div class="rightimg1" >
					<img src="${pageContext.request.contextPath}/resources/img/dog1.jpg">
					
				</div>
				
				<div class="top">
	<input type="button" value="소개" class="btn1"  onclick="location.href='info_main.do'"  >
	<input type="button" value="공지" class="btn1" onclick=""  >
	<input type="button" value="리뷰" class="btn1" onclick="location.href='review_main.do'"  >
	<input type="button" value="QNA"  class="btn1" onclick="location.href='qna_main.do'"  >
	<input type="button" value="예약"  class="btn1" onclick="location.href='rev_main.do'"  >
	<c:choose>
			<c:when test="${empty id}">
				
				<input type="button" value="펫 등록" class="btn1"  onclick="go_pet()">
				<input type="button" value="정보수정" class="btn1"  onclick="go_pet()">
				<input type="button" value="로그인"class="btn1"   onclick="location.href='login_main.do'">
				
			</c:when>
			<c:when test="${not empty id}">
				
				<input type="button" value="펫 등록" class="btn1"  onclick="location.href='petinfo_main.do'">
				<input type="button" value="정보수정" class="btn1"  onclick="location.href='check_up.do'">
				<input type="button" value="로그아웃" class="btn1"   onclick="location.href='logout.do'">
			</c:when>
		</c:choose>
	</div>
	
				
     <form>
     <h1 align="center">마이 펫 리스트</h1>
     	
            <div class="btn2">
          		
       <input type="button"  class="btn" value="마이 펫 등록하기" onclick="location.href='petinfo_insert.do'">
       <input type="button"  class="btn" value="메인으로 가기" onclick="location.href='main_home.do'">
           	
          
          </div >
          		
         <table  align="center">
             <tr>
             	<th>반려동물 사진</th>
                <th>반려동물 이름</th>
                <th>반려동물 종류</th>
                <th>반려동물 나이</th>
                <th>반려동물 성별</th>
                <th>비고</th>
             </tr>
             <c:forEach var="vo" items="${list}">
	             <tr>	             
	             	<td>
	             		<c:choose>
	             			<c:when test="${vo.p_photo == 'no_file' }">
	             				<!-- 이미지를 등록하지 않으면 나오는 기본 이미지 -->
           						 <img src="${pageContext.request.contextPath}/resources/petImg/defaultImg.jpg"
                					  width="100" height="100" onclick="openImage('${pageContext.request.contextPath}/resources/petImg/defaultImg.jpg')"
                					  style="cursor: pointer;">
	             			</c:when>
	             			<c:otherwise>
	             				<img src="${pageContext.request.contextPath}/resources/petImg/${vo.p_photo}"
	             	                 width="100" height="100" onclick="openImage('${pageContext.request.contextPath}/resources/petImg/${vo.p_photo}')"
	             	          		 style="cursor: pointer;">
	             			</c:otherwise>
	             		</c:choose>
	             	</td>
	                <td><h5>${vo.p_name }</h5></td>
	                <td><h5>${vo.p_type }</h5></td>
	                <td><h5>${vo.p_age }</h5></td>
	                <td><h5>${vo.p_gender }</h5></td>
	                <td>
	                <input type="hidden" name="p_idx" value="${vo.p_idx}">
	                <input type="hidden" name="u_idx" value="${vo.u_idx }">	
                    <input type="button" class="btn" value="수정하기" onclick="location.href='petinfo_updateForm.do?p_idx=${vo.p_idx}'">
	                <input type="button" class="btn" value="삭제하기" onclick="petinfo_del(${vo.p_idx})"> 
	                </td>
	             </tr>
             </c:forEach>
             
             <!-- 여기서부터 페이징 -->
             <tr>
             <td colspan="6">
               <div class="paging">
					<c:if test="${nowpage!=1}">
						<c:choose>
							<c:when test="${nowpage>jumpgingPage}">
								<a href="petinfo_main.do?page=${nowpage-jumpgingPage}">◀</a>
							</c:when>
							<c:otherwise>
								<a href="petinfo_main.do?page=1">◀</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:forEach var="index" begin="${minpage}" end="${maxpage}" step="1">
						<c:choose>
							<c:when test="${index==nowpage}">
								<a href="petinfo_main.do?page=${index}" class="bolder">${index}</a>
							</c:when>
							<c:otherwise>
								<a href="petinfo_main.do?page=${index}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${nowpage!=maxpage}">
						<c:choose>
							<c:when test="${nowpage<pagingCount-jumpgingPage}">
								<a href="petinfo_main.do?page=${nowpage+jumpgingPage}">▶</a>
							</c:when>
							<c:otherwise>
								<a href="petinfo_main.do?page=${pagingCount}">▶</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>	
             </td>
             </tr>
          </table> 
          
     </form>
   
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
     
</body>
</html>