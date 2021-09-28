<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사원 관리</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function deptClick(userId){
			window.open(
				"/cnav/my/userManagementDePopup.cnav?id=" + userId,
				"Popup_frame",
				"width=500, height = 500"
			);
		}
		function posiClick(userId){
			window.open(
				"/cnav/my/userManagementPosPopup.cnav?id=" + userId,
				"Popup_frame",
				"width=500, height = 500"
			);
		}
		
	</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">

		<jsp:include page="/include/left_nav_bar_mypage.jsp" />

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
	
	<h3 align="left"> 사원 정보 수정</h3>
	
	<c:if test="${count == 0}">
	<div align="center">
		<div>
			<td align="center"> 회사 내 등록된 사원이  없습니다. </td>
		</div>
	</div>
	</c:if>
	
	<c:if test="${count != 0}">
	<div class="sendList">
		<table class="cnavTable">
			<tr class="cnavList-top">
				<td>No.</td>
				<td>이름</td>
				<td>부서명</td>
				<td>직위</td>
			</tr>
			<c:forEach var="userList" items="${userList}">
			<tr>
				<td>
					${number}
					<c:set var="number" value="${number-1}"/>
				</td>
				<td>
					${userList.name}
				</td>
				<td id = "dept" onclick = "deptClick('${userList.userId}')">
					${userList.dept}
				</td>
				<td id = "position" onclick = "posiClick('${userList.userId}')">
					${userList.position}
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</c:if>
	
		<br /> <br /> 
	<%-- 페이지 번호 --%>
	<div align="center">
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
		
		<%-- 검색했을때 페이지번호들 --%>
		<c:if test="${sel != null && search != null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/my/userManagement.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/my/userManagement.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/my/userManagement.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
		<%-- 검색 안했을때 페이지번호들   --%> 
		<c:if test="${sel == null || search == null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/my/userManagement.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/my/userManagement.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/my/userManagement.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
	</c:if>
	
	<%-- 이름/부서명 검색 --%>
	<form action="/cnav/my/userManagement.cnav">
		<select name="sel">
			<option value="name">이름</option>
			<option value="dept">부서명</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>
	<br />
	<br /> 
	<c:if test="${sel != null && search != null}">
		<button onclick="window.location='/cnav/my/userManagement.cnav'"> 목록 </button> <br />
	</c:if>
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