<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function next(f){
		var userId = f.userId.value;
		var rv_day = f.rv_day.value;
		
		console.log(rv_day);
		
		
		f.action = "rev_time.do";
		f.submit();
	}
</script>
</head>
<body>
	
	<div class="wrapper">
		<form>
			<input type="hidden" name="userId" id="userId" value="${successLoginUser}">
		<div class="date">
			<label for="rev_date">예약 날짜</label> 
	        <input type="date" min="${today}" name="rv_day" id="rev_Date">
        </div>
        <div class="next">
        	<input type="button" value="다음" onclick="next(this.form)">
        </div>
        
		<!-- <label for="reservation_time">예약 가능 시간</label> 
		<select>
			<option>시간을 선택하세요</option>
			<option>10:00</option>
			<option>11:00</option>
			<option>12:00</option>
			<option>13:00</option>
			<option>14:00</option>
			<option>15:00</option>
			<option>16:00</option>
			<option>17:00</option>
			<option>18:00</option>
			<option>19:00</option>
			<option>20:00</option>
			
		</select>
        <input type="time" min="10:00" max="20:00" name="bookDateE" id="end-day" class="end-date" 
        	step="1800"
								onchange="checkPrice()"> 
			
		<label for="bookingName">예약자명</label> 
        <input type="text" name="name" id="book-name" required="required"> 
        
        <label for="stringsize">반려동물 종류</label> 
        
        <select name="size" id="stringsize" onchange="checkPrice()">
			<option>선택하세요</option>
			<option>강아지</option>
			<option>고양이</option>
		</select> 
        <label for="intmoney">나이</label> 
        <input type="text" name="petAge" id="Age">
		<input type="button" value="에약하기" onclick="revCheck(this.form)"> -->
	</form>
</div>
</body>
</html>