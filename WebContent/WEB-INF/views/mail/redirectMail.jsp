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
	<title>RE: 메일 보내기</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/mail.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function check() {
			var mailSub=$("#mailSub").val();
			if(mailSub==""){
				alert("제목을 입력하세요.");
				$("#mailSub").focus();
				return false;
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
	
	
	<h3> 메일 보내기 </h3>
	<form action="/cnav/mail/writeMailPro.cnav" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<div class="writeMailDiv">
			<div>
				받는 사람 : ${rName}
			</div>
			<div class="wrIn">
				제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : 
				<input type="text" name="mailSub" id="mailSub"/>
			</div>
			<div>
				첨부파일 :
				<input type="file" name="uploadFile"/>
			</div>
			<div>
				<textarea rows="18" cols="100" name="mailContent" id="mailContent" placeholder="내용을 작성해 주세요"></textarea>
			</div>
			<div>
				<input type="hidden" name="mailRid" value="${rid}" />
				<input type="hidden" name="RidName" value="${rName}" />
				<input type="submit" value="보내기" />
				<input type="button" value="취소" onclick="window.location='/cnav/mail/recMailList.cnav'"/>
			</div>
		</div>
	</form>
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