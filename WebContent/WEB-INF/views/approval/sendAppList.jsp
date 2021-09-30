<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>보낸결재함</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/approval.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<!-- 로그인 테스트 -->
	<c:if test="${sessionScope.sid == null}">
	<script>
		alert("로그인후 이용할 수 있습니다");
		var link = "/cnav/main/startPage.cnav";
	  		window.location.href = link;
	</script>
	</c:if>
	
	<!--  본문 시작 --> 
	<jsp:include page="/include/top_nav_bar.jsp" />
		<div id="layoutSidenav">
			<jsp:include page="/include/left_nav_bar.jsp" />
			<div id="layoutSidenav_content">
				<div id="wrapAll">	
					<h3> 보낸 결재함 </h3>
						<div class="cnavAllList">
						<%-- 작성자/내용 검색 --%>
							<form action="/cnav/approval/sendAppList.cnav" name="search">
								<select name="sel">
									<option value="appType">문서형식</option>
									<option value="appTitle">기안제목</option>
								</select>
								<input type="text" name="search" />
								<input type="submit" value="검색" class="sendAppSerch" />
							</form><br/>  <%-- 이렇게 ! /spring/board/list.do?sel=writer&search=aaa --%>
					
						 <c:if test="${count==0}" >
						 	<div class="cnavNone">
							<h4 align="center">보낸 결재가 없습니다.</h4>
							</div>
						</c:if>
						
						 <div class="sendList">
						 <c:if test="${count != 0}" >
							<table class="cnavTable">
								<tr class="cnavList-top">
									<td>No.</td>
									<td>기안제목</td>
									<td>문서형식</td>
									<td>결재상태</td>
									<td>결재요청일</td>
									<td>반려사유</td>
								</tr>
								<c:forEach var="approval" items="${sendAppList}">
							
									<tr>
										<td>${number}
											<c:set var="number" value="${number-1}"/>
										</td>
							 			<td><a href="/cnav/approval/sendAppContent.cnav?num=${approval.appNum}"> ${approval.appTitle} </a></td>
										<td>${approval.appType}</td>
										<td>
										 <c:choose>
									         <c:when test = '${(approval.state1 == "1" || approval.state2 == "1" || approval.state3 == "1")}'>
									            <div class="stateReject">반려</div>
									         </c:when>
									         <c:when test ='${approval.state3=="2"}'>
									            <div class="stateOK">승인</div>
									         </c:when>
									         <c:otherwise>
									           <div class="roading">진행중</div>
									         </c:otherwise>
									      </c:choose>
										</td>
										<td><fmt:formatDate value="${approval.appDate}" pattern="yyyy.MM.dd"/></td>
										<td>
											<c:choose>
										 	<c:when test="${fn:length(approval.reject) gt 7}">
										    	<c:out value="${fn:substring(approval.reject, 0, 6)}"></c:out>....</a>
										    </c:when>
										    <c:otherwise>
										    	<c:out value="${approval.reject}"></c:out></a>
										    </c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>	
							</table><br/>
						</c:if>
						
						<div class="sendAppList-btn">
							<c:if test="${sel != null && search != null}">
								<button onclick="window.location='/cnav/approval/sendAppList.cnav'">목록</button>
							</c:if>
							<button onclick="window.location='/cnav/approval/appForm.cnav'">문서작성</button><br/><br/>
						</div>
						
				
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
							
							<%-- 검색했을때 페이지번호들 --%>
							<c:if test="${sel != null && search != null}">
								<c:if test="${startPage > pageBlock}">
									<a href="/cnav/approval/sendAppList.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
									<a href="/cnav/approval/sendAppList.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
								</c:forEach>
								<c:if test="${endPage < pageCount}">
									&nbsp; <a href="/cnav/approval/sendAppList.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
								</c:if>
							</c:if>
							
							<%-- 검색 안했을때 페이지번호들   --%> 
							<c:if test="${sel == null || search == null}">
								<c:if test="${startPage > pageBlock}">
									<a href="/cnav/approval/sendAppList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
									<a href="/cnav/approval/sendAppList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
								</c:forEach>
								<c:if test="${endPage < pageCount}">
									&nbsp; <a href="/cnav/approval/sendAppList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
								</c:if>
							</c:if>	
						</c:if> <%-- end:count > 0 --%>
						</div>
						
						
					</div>	
				</div>	<!-- cnavAllList -->
			</div> <!-- wrapAll -->	
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