<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function time(t){
		var rr = t;
		
		console.log(rr);
		alert(rr);
	}
	
	t.action = "rev_insert.do";
	t.submit();
</script>
</head>
<body>
	
	<div class="wrapper">
		<form>
			
			<div class="timearea">
				<ul>
					<c:forEach var="time" items="${time}">
								<li><input type="button" id="${time}" value="${time}" onClick="time(this.form['${time}'].value)"></li>
					</c:forEach>
				</ul>
			</div>
		</form>
	</div>	
</body>
</html>