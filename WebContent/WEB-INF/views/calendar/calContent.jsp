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
	<link href="/cnav/resources/css/my.css" rel="stylesheet" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
</head>
<body>
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
	<div id="layoutSidenav_content">
	<div id="wrapAll">
		<h3> 일정확인 </h3>
			<div class="myList"> 
				<table class="myTable">
					<tr>
						<td class='aa' >일정명 </td>
						<td>${dto.calTitle}</td>
					</tr>
					<tr>
						<td class='aa' >날짜</td>
						<td>${dto.calStart} ~ ${dto.calEnd}</td>
					</tr>
					<tr>
						<td class='aa' >내용</td>
						<td>${dto.calMemo}</td>
					</tr>
				</table>
			</div>
			
			<br />
			<br />
			
			<div align="center">
				<c:if test="${dto.calType eq 'all'}">
					<input type="button" onclick="window.location='/cnav/cal/calendar.cnav'" value="목록으로"/>
				</c:if>
				<c:if test="${dto.calType eq 'me'}">
					<input type="button" onclick="window.location='/cnav/cal/myCalendar.cnav'" value="목록으로"/>
				</c:if>
				<c:if test="${dto.userId == sid || sauth == 1}" >
					<input type="button" onclick="deleteConfirm(${dto.calNum}, ${dto.code})" value="삭제"/>
					<input type="button" onclick="modifyConfirm(${dto.calNum}, ${dto.code})" value="수정"/>
				</c:if>
			</div>
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