<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>calContent</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
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
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
	<div id="layoutSidenav_content">
	
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
	<jsp:include page="/include/footer.jsp" />
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</html>