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
    
    // 여기서 rv_time을 파라미터로 넘기고, rv_day도 함께 넘길 수 있습니다.
    f.action = "rev_info.do";
    f.submit();
}


</script>
</head>
<body>
	<div class="wrapper">
		<form>
			<input type="hidden" value="${rv_day}" name="rv_day">
			 <input type="hidden" value="${rv_time}" name="rv_time">
			<div class="timearea">
				<ul>
					<c:forEach var="time" items="${time}">
						<li><input type="button" id="${time}" value="${time}" onClick="time('${time}')"></li>
					</c:forEach>
					<li><input name="rv_time" id="rv_time" value="" readonly></li>
				</ul>
				<input type="button" value="다음" onclick="go(this.form)">
			</div>
		</form>
	</div>	
</body>
</html>