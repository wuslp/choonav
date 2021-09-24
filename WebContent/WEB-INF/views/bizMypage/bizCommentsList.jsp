<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bizCommentsList</title>
</head>
<body>
<h3> 내가 쓴 댓글 </h3>
<a href="/cnav/my/myCommentsList.cnav?">자유게시판 댓글</a>
<a href="/cnav/my/myPjCommentsList.cnav?type=pj">프로젝트 댓글</a>
<c:if test="${count == 0}">
<div>작성한 댓글이 없습니다.</div>
</c:if>
<c:if test="${count > 0}">
	<div>
		<c:forEach var="item" items="${articleList}">
		<div>
			<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${item.topComment}</div>
			<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${item.topReg}</div>
			<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">[원문제목] ${item.topTitle}</div>
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
					<a href="/cnav/my/myCommentsList.cnav?type=topic&pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="/cnav/my/myCommentsList.cnav?type=topic&pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					&nbsp; <a href="/cnav/my/myCommentsList.cnav?type=topic&pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
				</c:if>
		</c:if> <%-- end:count > 0 --%>
		</div> <%-- page번호 div 끝 --%>
	</div>
	</c:if>
	
</body>
</html>