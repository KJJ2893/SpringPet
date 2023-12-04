<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function petinfo_del(f){
			if(!confirm("반려동물 정보를 삭제하시겠습니까?")){
				return;
			}
			
			f.action = "petinfo_del.do";
			f.method = "GET";
			f.submit();
		}
	</script>
</head>
<body>
     <form>
     <h1 align="center">마이 펫 리스트</h1>
         <table border="1" align="center">
             <tr>
             	<th>반려동물 사진</th>
                <th>반려동물 이름</th>
                <th>반려동물 종류</th>
                <th>반려동물 나이</th>
                <th>반려동물 성별</th>
                <th>비고</th>
             </tr>
             <c:forEach var="vo" items="${list }">
             <tr>
             	<td>${vo.photo}</td>
                <td>${vo.p_name }</td>
                <td>${vo.p_type }</td>
                <td>${vo.p_age }</td>
                <td>${vo.p_gender }</td>
                <td>
             	
                	<input type="button" value="수정하기" 
                		onclick="location.href='petinfo_retouch.do'">
                	<input type="button" value="삭제하기" 
                		onclick="petinfo_del(this.form)">
                </td>
             </tr>
             </c:forEach>
          </table>
          <table align="center">
             <tr>
          		<td>
           	       <input type="button" value="마이 펫 등록하기" onclick="location.href='petinfo_insert.do'">
           	       <input type="button" value="메인으로 가기" onclick="location.href='main_home.do'">
           		</td>
          	</tr>
          </table>
     </form>
</body>
</html>