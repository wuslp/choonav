<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>메일 보내기</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">

		<jsp:include page="/include/left_nav_bar.jsp" />

		<div id="layoutSidenav_content">
	<br />
	<div id=""> 
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	   		window.location.href = link;
	   		</script>
		</c:if>
	</div>
	
	<br />
	<h1 align="center"> 메일 보내기 </h1>
	<form action="/cnav/mail/writeMailPro.cnav" method="post" style="center;">
		<div style="text-align: center;">
			<div>
				<select name="mailRid">
				<option value="">선택</option>
				<c:forEach var="userList" items="${userList}">
					<option value="${userList.userId}">${userList.name} ${userList.position}</option>
				</c:forEach> 	
				</select>
			</div>
			<div>
				첨부파일 : <input type="button" name="mailFile" value="pc에서 등록"/>
			</div>
			<div>
				<input type="text" name="mailSub" placeholder="제목" />
			</div>
			<div>
				<textarea rows="40" cols="100" name="mailContent" placeholder="내용을 작성해 주세요"></textarea>
			</div>
			<div>
				<input type="submit" value="보내기" />
				<input type="button" value="취소" onclick="window.location='/cnav/mail/recMailList.cnav'"/>
			</div>
		</div>
	</form>
	
<jsp:include page="/include/footer.jsp" />
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</body>
</html>