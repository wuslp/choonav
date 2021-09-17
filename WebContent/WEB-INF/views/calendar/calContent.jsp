<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.left {
	float: left;
}
.center {
	float: center;
}
</style>
<body>
	<div class="left" >
		<a href="calendar.cnav"><h1>전체 일정</h1></a>
		<a href="myCalendar.cnav"><h1>내 일정</h1></a>
	</div>
	<div class="center">
		<div><h1> 일정확인 </h1></div>
		<div>일정명 ${dto.calTitle}</div>
		<div>날짜 ${dto.calStart} ~ ${dto.calEnd} </div>
		<div>내용 ${dto.calMemo}</div>
		<c:if test="${dto.calType eq 'all'}">
		<input type="button" onclick="window.location='/cnav/cal/calendar.cnav'" value="목록으로"/>
		</c:if>
		<c:if test="${dto.calType eq 'me'}">
		<input type="button" onclick="window.location='/cnav/cal/myCalendar.cnav'" value="목록으로"/>
		</c:if>
		<c:if test="${dto.userId == sid}">
			<input type="button" onclick="deleteConfirm(${dto.calNum}, ${dto.code})" value="삭제"/>
			<input type="button" onclick="modifyConfirm(${dto.calNum}, ${dto.code})" value="수정"/>
		</c:if>
	</div>
</body>
<script>
	function deleteConfirm(calNum, code){
		if(confirm("해당 일정을 삭제하겠습니까?") == true){
			window.location='calDelete.cnav?code='+ code +'&calNum=' + calNum;
		}else{
			return;
		}
	}
	
	function modifyConfirm(calNum, code){
		var url = 'calModifyForm.cnav?code='+ code +'&calNum=' + calNum;
		var name = "schedulePopup";
		var option = "width = 600, height = 600 left = 100, top=50,location=no";
		window.open(url,name,option)
	}
</script>
</html>