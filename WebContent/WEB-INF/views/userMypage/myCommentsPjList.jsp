<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myCommentsPjList</title>
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
	<h3> 프로젝트 댓글 </h3>
	<a href="/cnav/my/myCommentsList.cnav?">자유게시판 댓글</a>
	<a href="/cnav/my/myPjCommentsList.cnav?type=pj">프로젝트 댓글</a>
	<c:if test="${count == 0}">
	<div>작성한 댓글이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<div>
			<c:forEach var="item" items="${articleList}">
			<div>
				<div class="divTableCell" onclick="window.location='/cnav/project/proContent.cnav?proNum=${item.proNum}'">${item.proComment}</div>
				<div class="divTableCell" onclick="window.location='/cnav/project/proContent.cnav?proNum=${item.proNum}'">${item.proReg}</div>
				<div class="divTableCell" onclick="window.location='/cnav/project/proContent.cnav?proNum=${item.proNum}'">[원문제목] ${item.proName}</div>
			</div>
			</c:forEach>
			</div>
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
				
				
				<%-- 검색 안했을때 페이지번호들   --%> 
					<c:if test="${startPage > pageBlock}">
						<a href="/cnav/my/myCommentsList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/cnav/my/myCommentsList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						&nbsp; <a href="/cnav/my/myCommentsList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
					</c:if>
			</c:if> <%-- end:count > 0 --%>
			</div> <%-- page번호 div 끝 --%>
		</div>
		</c:if>
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