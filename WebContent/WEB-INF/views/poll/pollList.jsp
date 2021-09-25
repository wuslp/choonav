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
	<title>pollList Page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	</script>
	
 	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
			<div id="pollListContent">
				<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
				<div id=""> 
					<c:if test="${sessionScope.sid == null}">
					<script>
						alert("로그인후 이용할 수 있습니다");
						var link = "http://localhost:8080/cnav/main/startPage.cnav";
			    		window.location.href = link;
			    		</script>
					</c:if>
				</div>
				<!-- 투표 리스트 본문-->
				<div>
					<h3>투표 리스트</h3>
				</div><br/><br/>
				<div>
					<form action="/cnav/poll/pollList.cnav">
						<a href="/cnav/poll/pollList.cnav?sort=진행중">진행중</a> 
						<a href="/cnav/poll/pollList.cnav?sort=완료">완료</a> &nbsp;
						<select id="" name="sel">
							<option value="pollTitle" >제목</option>
							<option value="pollCon" >내용</option>
						</select>
						<input type="text" id="" name="search"/>
						<input type="submit" value="검색">
						<input type="button" value="만들기" onClick="window.location='/cnav/poll/pollForm.cnav'">
					</form>
				</div><br/><br/><br/><!-- 상단 버튼들 -->
				<div>
					<c:if test="${count == 0}">
						<table border="1">
							<tr>
								<td>개설된 투표가 없습니다</td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count != 0}">
						<table border="1">
							<tr>
								<td>No.</td>
								<td>진행상태</td>
								<td>제목</td>
								<td>기간</td>
								<td>대상</td>
							</tr>
							<c:forEach var="article" items="${articleList}">
								<tr>
									<td>${number}
									<c:set var="number" value="${number - 1}" /> </td>
									<td>${article.pollStatus}</td>
									<td><a href="/cnav/poll/pollPage.cnav?pollNum=${article.pollNum}&pageNum=${pageNum}"> ${article.pollTitle} </a></td>
									<td><fmt:formatDate value="${article.stDate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${article.endDate}" pattern="yyyy-MM-dd" /></td>
									<td>${article.target}</td>
									
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div><!-- 테이블 보여주기 -->
				
				
				
				<div align="center"><!-- 페이지 번호 -->
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
						<c:if test="${sel != null && search != null && sort == null}">
							<c:if test="${startPage > pageBlock}">
								<a href="/cnav/poll/pollList.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
								<a href="/cnav/poll/pollList.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
							</c:forEach>
							<c:if test="${endPage < pageCount}">
								&nbsp; <a href="/cnav/poll/pollList.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
							</c:if>
						</c:if>
						
						<%-- 검색 안했을때 페이지번호들   --%> 
						<c:if test="${sel == null && search == null && sort == null}">
							<c:if test="${startPage > pageBlock}">
								<a href="/cnav/poll/pollList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
								<a href="/cnav/poll/pollList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
							</c:forEach>
							<c:if test="${endPage < pageCount}">
								&nbsp; <a href="/cnav/poll/pollList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
							</c:if>
						</c:if>
						<%-- 진행중 완료로 했을때  --%> 
						<c:if test="${sort != null}">
							<c:if test="${startPage > pageBlock}">
								<a href="/cnav/poll/pollList.cnav?pageNum=${startPage-pageBlock}&sort=${sort}" class="pageNums"> &lt; &nbsp;</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
								<a href="/cnav/poll/pollList.cnav?pageNum=${i}&sort=${sort}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
							</c:forEach>
							<c:if test="${endPage < pageCount}">
								&nbsp; <a href="/cnav/poll/pollList.cnav?pageNum=${startPage+pageBlock}&sort=${sort}" class="pageNums"> &gt; </a>
							</c:if>
						</c:if>
					</c:if> <%-- end:count > 0 --%>
				</div>
			</div><!-- pollListContent -->
					<jsp:include page="/include/footer.jsp" />
		</div><!-- layoutSidenav_content -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script
				src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
				crossorigin="anonymous"></script>
			<script
				src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
				crossorigin="anonymous"></script>
			<script
				src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
	</div>
</body>
</html>