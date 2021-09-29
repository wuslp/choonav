<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>공지사항</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/notice.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	    	window.location.href = link;
	    	</script>
		</c:if>
	
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
			<div id="notiWrapAll">	
			
	<div class="notiContent">
	<table class="notiTable">
			<tr>
				<td><a href="/cnav/notice/list.cnav?pageNum=${pageNum}"> 공지사항> </a></td>
			</tr>
			<tr>
				<td class="notiTitle">${article.notiTitle}</td>
			</tr>
			<tr>
				<td class="writer">관리자</td>
			</tr>
			<tr>
				<td class="date">
					 <fmt:formatDate value="${article.notiDate}" pattern="yyyy-MM-dd HH:mm" />
					조회 ${article.readcount}
				</td>
			</tr>
		<tr>
			<td height="100"> ${article.notiContent} </td>
		</tr>
	</table>
	</div>
	<div class="notiBtn">
		<!--회사 관리자일경우 수정,삭제보이게  -->
		<c:if test="${sessionScope.sauth=='1'}">
				<button onclick="window.location='/cnav/notice/modifyForm.cnav?notiNum=${article.notiNum}&pageNum=${pageNum}'">수 정</button>
				<input type="button" value="삭제" onclick="del(${article.notiNum})">
				<button onclick="window.location='/cnav/notice/list.cnav'">목록</button>
		</c:if>
		
		<!-- 로그인한 사람은 목록버튼만 보이게 -->
		<c:if test="${article.userId != sessionScope.sid}">
				<button onclick="window.location='/cnav/notice/list.cnav'">목록</button>
		</c:if>
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
<script>
	function del(notiNum) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete.cnav?notiNum='+notiNum;
		}
	}	
</script>
</html>