<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>프로젝트 수정</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/project.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
			<div id="wrapAll">	
	<h1 align="center">프로젝트 수정</h1>
	<div class="proForm">
	<form action="/cnav/project/proModPro.cnav?pageNum=${pageNum}" method="post">
	<!-- 고유번호 값 전송 -->
		<input type="hidden" name="proNum" value="${project.proNum}" />
		<table>
			<tr>
				<td align="center"></td>
				<td>
					<input type="text" name="proName" value="${project.proName}"/>
				</td>
			</tr>
			<tr>
				<td align="center"></td>
				<td>		
					<input type="text" name="proContent" value="${project.proContent}"/>
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td>기간</td>
				<td>${project.proStart}~${project.proEnd}</td>
			</tr>
			<tr>
				<td>부서</td>
				<td align="left">${project.dept}</td>
			</tr>
		</table>
			<div class="proConBtn">
					<input type="submit" value="수정"/>
					<input type="reset" value="재작성"/>
					<input type="button" value="취소" onclick="window.location='/cnav/project/proContent.cnav?proNum=${project.proNum}&pageNum=${pageNum}'"/>
			</div>	

	</form>
	</div> <!-- proForm -->
	</div> <!-- wrapAll -->
			<jsp:include page="/include/footer.jsp" />
		</div><!-- layoutSidenav_content" -->
	</div><!-- id="layoutSidenav" -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
	
</body>
</html>