<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>프로젝트 목록</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<c:if test="${sessionScope.sid == null}">
	<script>
		alert("로그인후 이용할 수 있습니다");
		var link = "/cnav/main/startPage.cnav";
	  		window.location.href = link;
	</script>
	</c:if>
	<jsp:include page="/include/top_nav_bar.jsp" />
		<div id="layoutSidenav">
			<jsp:include page="/include/left_nav_bar.jsp" />
			<div id="layoutSidenav_content">
	
		<h2 align="center">프로젝트 목록</h2>
		
		<%--프로젝트제목/부서 검색 --%>
		<div>
			<form action="/cnav/project/proList.cnav">
				<a href="/cnav/project/proList.cnav?sort=진행중">진행중</a>
				<a href="/cnav/project/proList.cnav?sort=완료">완료</a> &nbsp;
				<select id="" name="sel">
					<option value="dept">부서</option>
					<option value="proName">프로젝트</option>
				</select>
						
				<input type="text" id="" name="search"/>
				<input type="submit" value="검색">
				<input type="button" value="만들기" onclick="window.location='/cnav/project/proWriteForm.cnav'">
			</form>
		</div>
		<br/>
	
	<!-- 리스트 보여주기 -->	
	<div>
	<c:if test="${count==0}">
		<table>
			<tr>
				<td>프로젝트가 존재하지 않습니다.</td>
			</tr>
		</table>		
	</c:if>	
	<c:if test="${count !=0}">
		<table border="1">
			<tr>
				<td>No.</td>
				<td>프로젝트</td>
				<td>부서</td>
				<td>기간</td>			
				<td>진행상태</td>
				<td>담당자</td>
			</tr>
		<c:forEach var="project" items="${projectList}">
			<tr>
				<td>${number}
					<c:set var="number" value="${number-1}"/>
				</td>
				<td align="left"><a href="/cnav/project/proContent.cnav?proNum=${project.proNum}&pageNum=${pageNum}">${project.proName}</a></td>
				<td>${project.dept}</td>
				<td>${project.proStart}~${project.proEnd}</td>
				<td>${project.proState}</td>
				
				<td>${project.userId}</td>		
			</tr>
		</c:forEach>	
	</table>
	</c:if>
	<c:if test="${sel !=null && search !=null}">
		<button onclick="window.location='/cnav/project/proList.cnav'">전체 목록</button> <br/>		
	</c:if>
</div>	
	
	<br/><br/>
	<%--페이지 번호 --%>
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
		<c:if test="${sel != null && search != null && sort==null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/project/proList.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/project/proList.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/project/proList.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
	
		<%-- 검색 안했을때 페이지번호들   --%> 
		<c:if test="${sel == null && search == null && sort==null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/project/proList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/project/proList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/project/proList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
	</c:if> <%-- end:count > 0 --%>
		
		<!-- 진행중/완료 -->
		
		<c:if test="${sort != null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/project/proList.cnav?pageNum=${startPage-pageBlock}&sort=${sort}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/project/proList.cnav?pageNum=${i}&sort=${sort}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/project/proList.cnav?pageNum=${startPage+pageBlock}&sort=${sort}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>		
	</div>	
	<jsp:include page="/include/footer.jsp" />
		</div> <!-- layoutSidenav_content" -->
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