<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	var t_choose = false;

function time(t){
	
	var element = document.getElementById("rv_time");
	
	element.value = t;

    // 요소의 콘텐츠를 출력합니다.
    console.log(element.value);
    t_choose = true;
}

function go(f) {
  	var rv_time = f.rv_time.value.trim();
    var rv_day = f.rv_day.value;
    
    if(!t_choose){
    	alert('시간을 골라주세요');
    	return;
    }
    
    f.action = "rev_info.do";
    f.submit();
}


</script>
</head>
<body>
	<div class="wrapper">
		<form>
			<input type="hidden" value="${rv_day}" name="rv_day">
			 
			<div class="timearea">
				<c:choose>
					<c:when test="${empty time}">
						예약이 모두 끝났습니다 ㅠ
					</c:when>
					<c:when test="${not empty time}">
						<ul>
							<c:forEach var="time" items="${time}">
								<li><input type="button" id="${time}" value="${time}" onClick="time('${time}')"></li>
							</c:forEach>
							<li><input name="rv_time" id="rv_time" readonly></li>
						</ul>
						<input type="button" value="다음" onclick="go(this.form)">
					</c:when>
				</c:choose>
			</div>
		</form>
	</div>	
</body>
</html>