<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>rezContent</title>
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
		<h3> 예약확인 </h3>
			<div class="myList"> 
				<table class="myTable">
					<tr>
						<td class='aa' >예약일시</td>
						<td>${dto.sDate} ~ ${dto.eDate}</td>
					</tr>
					<tr>
						<td class='aa' >예약항목</td>
						<td>${dto.category}</td>
					</tr>
					<tr>
						<td class='aa' >예약자</td>
						<td>${dto.userId}</td>
					</tr>
					<tr>
						<td class='aa' >목적</td>
						<td>${dto.content}</td>
					</tr>
					<tr>
						<td class='aa' >등록일</td>
						<td>${dto.reg}</td>
					</tr>
				</table>
			</div>
			
			<br />
			<br />
			
			<div align="center">
				<input type="button" onclick="a()" value="목록으로"/>
				<c:if test="${dto.userId == sid || sauth == 1}">
					<input type="button" onclick="deleteConfirm(${dto.rezNum})" value="삭제"/>
				</c:if>
			</div>
		</div>
	<jsp:include page="/include/footer.jsp" />
</body>
	<script>
		function deleteConfirm(rezNum){
			if(confirm("해당 예약을 삭제하겠습니까?") == true){
				window.location='rezDelete.cnav?myRez=0&rezNum=' + rezNum;
			}else{
				return;
			}
		}
		
		function a(){
			history.go(-1);
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