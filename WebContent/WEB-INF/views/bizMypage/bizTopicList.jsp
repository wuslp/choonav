<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>biz</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/rez.css" rel="stylesheet" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<body>
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar_mypage.jsp" />
	<div id="layoutSidenav_content">
	
	<div id="wrapAll">
		<h3> 내 게시물 </h3>
			<c:if test="${count == 0}">
				<div>작성한 자유게시판 글이 없습니다.</div>
			</c:if>
			
			<c:if test="${count > 0}">
				<div class="sendList"> 
					<table class="cnavTable">
						<tr class="cnavList-top">
							<td>No.</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
							<td>수정</td>
							<td>삭제</td>
						</tr>
						<c:forEach var="item" items="${articleList}">
						<tr>
							<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${number}<c:set var="number" value="${number - 1}" /> </td>
							<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" >${item.topTitle}</td>
							<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" >${item.name}</td>
							<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" ><fmt:formatDate value="${item.topDate}" pattern="yy/MM/dd" /></td>
							<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" >${item.readcount}</td>
							<td>
								<div class="sendAppList-btn">
									<button style="margin-right: 35%;" onclick="window.location='/cnav/topic/modifyForm.cnav?topNum=${item.topNum}'" />수정</button>
								</div>
							</td>
							<td>
								<div class="sendAppList-btn">
									<button style="margin-right: 35%;" onclick="deleteConfirm(${item.topNum})" />삭제</button>
								</div>
							</td>
						</tr>
						</c:forEach>
					</table>
					</div>
					
					<br/>
					<br/>
			
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
							<a href="/cnav/my/myTopicList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<a href="/cnav/my/myTopicList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							&nbsp; <a href="/cnav/my/myTopicList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
						</c:if>
					</div> <%-- page번호 div 끝 --%>
			</c:if> <%-- end:count > 0 --%>
		</c:if>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
	<script>
		function deleteConfirm(topNum){
			if(confirm("해당 글을 삭제하겠습니까?") == true){
				window.location='/cnav/topic/delete.cnav?topNum=' + topNum;
			}else{
				return;
			}
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</html>