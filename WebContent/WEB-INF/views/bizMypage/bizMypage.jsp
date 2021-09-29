<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bizMypage</title>
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
		<jsp:include page="/include/left_nav_bar_mypage.jsp" />
	<div id="layoutSidenav_content">
	<div id="wrapAll">
		<h3> 마이페이지 </h3>
		<div class="myList"> 
			<table class="myTable">
				<tr>
					<td class='aa' >아이디</td>
					<td>${userId}</td>
				</tr>
				<tr>
					<td class='aa'>이름</td>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<td class='aa'>이메일</td>
					<td>${dto.email}</td>
				</tr>
				<tr>
					<td class='aa'>휴대폰번호</td>
					<td>${dto.tel}</td>
				</tr>
				<tr>
					<td class='aa'>회사명</td>
					<td>${dto.bizName}</td>
				</tr>
				<tr>
					<td class='aa'>부서명</td>
					<td>${dto.dept}</td>
				</tr>
				<tr>
					<td class='aa'>직위</td>
					<td>${dto.position}</td>
				</tr>
			</table>
		</div>
	</div>
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