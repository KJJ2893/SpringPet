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
     <h1 align="center">마이 펫 리스트</h1>
         <table border="1" align="center">
             <tr>
                <th>반려동물 이름</th>
                <th>반려동물 종류</th>
                <th>반려동물 나이</th>
                <th>반려동물 성별</th>
             </tr>
             <c:forEach var="vo" items="${list }">
             <tr>
                <td>${vo.p_name }</td>
                <td>${vo.p_type }</td>
                <td>${vo.p_age }</td>
                <td>${vo.p_gender }</td>
             </tr>
             </c:forEach>
          </table>
           <input type="button" value="펫 정보수정하기" onclick="location.href='petinfo_retouch.do'">
           <input type="button" value="마이 펫 등록하기" onclick="location.href='petinfo_insert.do'">
           <input type="button" value="메인으로 가기" onclick="location.href='main_home.do'">
     </form>
</body>
</html>