<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>userModityForm</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
</head>
<body>
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar_mypage.jsp" />
	<div id="layoutSidenav_content">
	
	<h3> 계정정보 수정 </h3>
	<form action="/cnav/my/modifyPro.cnav" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td>${userId}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="email" value="${dto.email}">
			</td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>
				<input type="text" name="tel" value="${dto.tel}">
			</td>
		</tr>
		<tr>
			<td>회사명</td>
			<td>${dto.bizName}</td>
		</tr>
		<tr>
			<td>부서명</td>
			<td>${dto.dept}</td>
		</tr>
		<tr>
			<td>직위</td>
			<td>${dto.position}</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정하기" />
			</td>
		</tr>
	</table>
	</form>
	<jsp:include page="/include/footer.jsp" />
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</html>