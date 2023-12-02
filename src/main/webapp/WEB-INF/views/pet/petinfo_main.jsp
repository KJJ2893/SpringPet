<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <form>
     <h1>마이 펫 리스트</h1>
         <table border="1" align="left">
             <tr>
                <th>반려동물 번호</th>
                <th>반려동물 이름</th>
                <th>반려동물 종류</th>
                <th>반려동물 나이</th>
             </tr>
             <c:forEach var="vo" items="${list }">
             <tr>
                <td>${vo.p_idx }</td>
                <td>${vo.p_name }</td>
                <td>${vo.p_type }</td>
                <td>${vo.p_age }</td>
             </tr>
             </c:forEach>
          </table>
           <input type="button" value="펫 정보수정하기" onclick="location.href='petinfo_retouch.do'">
     </form>
</body>
</html>