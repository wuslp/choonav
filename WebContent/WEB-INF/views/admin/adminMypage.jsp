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
	<meta charset="UTF-8">
	<title>전체관리자 마이페이지</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	</script>
</head>

<link href='../resources/css/clock.css' rel='stylesheet' />
<script src='../resources/js/clock.js'></script>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
		<div id="wrapAll">
			<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
			<div id="logincheck">
				<c:if test="${sessionScope.sid == null}">
				<script>
					alert("로그인후 이용할 수 있습니다");
					var link = "/cnav/main/startPage.cnav";
		    		window.location.href = link;
		    		</script>
				</c:if>
			</div><!--logincheck -->
			<div id="logincheck">
				<c:if test="${sessionScope.sauth != '2'}">
				<script>
					alert("접근할 수 없는 관리자 페이지 입니다");
					var link = "/cnav/main/startPage.cnav";
		    		window.location.href = link;
		    		</script>
				</c:if>
			</div><!--logincheck -->
		<h3>관리자 권한</h3>
			
			<!-- business테이블에 레코드 없을 경우 -->
			<div> 
				<c:if test="${count == 0}">
					<table>
						<tr>
							<td align="center">권한요청이 필요한 사람이 없습니다.</td>
						</tr>
					</table>
				</c:if>
			</div>
			
			<!-- business테이블에 레코드 있을 경우 -->
			<div class="adminAll">
				<c:if test="${count != 0}">
					<table class="cnavTable">
						<tr class="cnavList-top">
							<td>No.</td>
							<td>회사명</td>
							<td>아이디</td>
							<td>관리자 권한 여부</td>
						</tr>
						<c:forEach var="article" items="${articleList}">
							<tr>
								<td>${number}
									<c:set var="number" value="${number - 1}" /> 
								</td>
								<%-- <td align="left">
									<c:set var="wid" value="0" />
									<a href="/cnav/admin/adminMypage.cnav?topNum=${article.topNum}&pageNum=${pageNum}"> ${article.topTitle} </a>
								</td> --%>
								<td> ${article.bizName} </td>
								<td> ${article.userId} </td>
								<c:if test="${article.auth == 0}">
									<td>
									<button onclick="auth0('${article.userId}')">회원</button>
									</td>
								</c:if>
								<c:if test="${article.auth == 1}">
									<td>
									<button onclick="auth1('${article.userId}')">회사관리자</button>
									</td>
								</c:if>
								<c:if test="${article.auth == 2}">
									<td> 전체관리자 </td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
			
			<br /> <br /> 
			
			<%-- 페이지 번호 --%>
			<div class="pageNums-all">
				<c:if test="${count > 0}">
					<c:set var="pageBlock" value="3" />
					<fmt:parseNumber var="res" value="${count / pageSize}" integerOnly="true" />
					<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}" />
					<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true" />
					<fmt:parseNumber var="startPage" value="${result * pageBlock + 1}"/>
					<fmt:parseNumber var="endPage" value="${startPage + pageBlock -1}" />
					<c:if test="${endPage > pageCount}">
						<c:set var="endPage" value="${pageCount}" /> 
					</c:if>
					
					<%-- 페이지번호 --%> 
					<c:if test="${startPage > pageBlock}">
						<a href="/cnav/admin/adminMypage.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/cnav/admin/adminMypage.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						&nbsp; <a href="/cnav/admin/adminMypage.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
					</c:if>
				</c:if> <%-- end:count > 0 --%>

			</div>
			
		</div> <!-- wrapAll -->
		<jsp:include page="/include/footer.jsp" />
		</div><!-- id="layoutSidenav_content" -->
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
	function auth0(userId) {
		var chk = confirm("회사관리자로 전환하시겠습니까?");
		if (chk) {
			location.href='authUpdate0.cnav?userId='+userId;
		}
	}	
	function auth1(userId) {
		var chk = confirm("회원으로 전환하시겠습니까?");
		if (chk) {
			location.href='authUpdate1.cnav?userId='+userId;
		}
	}	
</script>
</html>