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
	             	<td><img src="${pageContext.request.contextPath}/resources/petImg/${vo.p_photo}"
	             	         width="100" height="100" onclick="openImage('${pageContext.request.contextPath}/resources/petImg/${vo.p_photo}')"
	             	         style="cursor: pointer;">
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
   
     
     
</body>
</html>