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
	<title>메일 본문 확인</title>
		<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
		<link href="/cnav/resources/css/mail.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
<script>
	function del(num) {
		var chk = confirm("삭제하시겠습니까?");
		if (chk) {
			location.href='/cnav/mail/deleteForm.cnav?num='+num;
		}
	}
</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">

		<jsp:include page="/include/left_nav_bar.jsp" />

		<div id="layoutSidenav_content">
		<div id="wrapAll">
	
	<div id=""> 
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	   		window.location.href = link;
	   		</script>
		</c:if>
	</div>
		<h3> 메일 내용 보기 </h3>
		<div class="mailConDiv">
			<div class="mailConleft">
				<h4> 제목 :  ${mail.mailSub} </h4>

				<c:if test="${mail.mailRid == id}">
					보낸 사람 : ${mail.userName}
				</c:if>
				<c:if test="${mail.userId == id}">
					받는 사람 : ${mail.ridName}
				</c:if><br/>
				
				시간 : ${mail.mailReg}
				<br/>
				
				<c:if test="${mail.fileName ne null}">
					첨부파일 :
					<input type="button" value="${mail.fileName}" onclick="window.location='/cnav/mail/mailFileDown.cnav?fileName=${mail.fileName}'"/>
				</c:if>
			</div>
	
			<br />
			<div class="mailbox">
			<div class="mailCon">
				<pre>${mail.mailContent}</pre>
			</div>
			</div>
			<br />
			<br />
			<div class="mailBtn">
				<input type="button" value="삭제" onclick="del(${mail.mailNum})" />
				<c:if test="${mail.mailRid == id}">
					<input type="button" value="목록" onclick="window.location='/cnav/mail/recMailList.cnav'"/>
				</c:if>
				<c:if test="${mail.userId == id}">
					<input type="button" value="목록" onclick="window.location='/cnav/mail/sendMailList.cnav'"/>
				</c:if>
			</div>
		</div>
	
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