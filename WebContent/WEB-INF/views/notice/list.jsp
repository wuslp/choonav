<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>공지사항</title>
</head>

<body>
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
	<br />
	
	<h1 align="center"> 공지사항 </h1>
	
	<!-- 공지사항에 글이 없을 경우 -->
	<div>
		<c:if test="${count == 0}">
		<table>
		<!-- 회사관계자만 글쓰기버튼 보이게 -->
			<c:if test="${!article.userId == sessionScope.sid &&sessionScope.sauth=='1'}">
				<tr>
					<td><button onclick="window.location='/cnav/notice/writeForm.cnav'"> 글쓰기 </button></td>
				</tr>
			</c:if>
			<tr>
				<td align="center">공지사항이 없습니다.</td>
			</tr>
		</table>
		</c:if>
	</div>
	
	<!-- 게시판에 글 있는 경우 -->
	<div>
		<c:if test="${count != 0}">
		<table>
			<!-- 회사관계자만 글쓰기버튼 보이게 -->
			<c:if test="${!article.userId == sessionScope.sid &&sessionScope.sauth=='1'}">
				<tr>
					<td><button onclick="window.location='/cnav/notice/writeForm.cnav'"> 글쓰기 </button></td>
				</tr>
			</c:if>
			
			<tr>
				<td>No.</td>
				<td>제  목</td>
				<td>작성자</td>
				<td>시  간</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="article" items="${articleList}">
				<tr>
					<td>${number}
						<c:set var="number" value="${number - 1}" /> 
					</td>
					<td align="left">
						<c:set var="wid" value="0" />
						<a href="/cnav/notice/content.cnav?notiNum=${article.notiNum}&pageNum=${pageNum}"> ${article.notiTitle} </a>
					</td>
					<td> ${article.userId} </td>
					<td> ${article.notiDate} </td>
					<td> ${article.readcount} </td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
	</div>
	
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
				<a href="/cnav/notice/list.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/notice/list.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/notice/list.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
		<%-- 검색 안했을때 페이지번호들   --%> 
		<c:if test="${sel == null || search == null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/notice/list.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/notice/list.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/notice/list.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
	</c:if> <%-- end:count > 0 --%>
	
	
	<br /> <br />
	<%-- 제목/내용 검색 --%>
	<form action="/cnav/notice/list.cnav">
		<select name="sel">
			<option value="notiTitle">제목</option>
			<option value="notiContent">내용</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>  <%-- /spring/board/list.do?sel=writer&search=aaa --%>
	<br />
	
	<h3 style="color:grey"> 현재페이지 : ${pageNum} </h3>
	<br /> 
	<c:if test="${sel != null && search != null}">
		<button onclick="window.location='/cnav/notice/list.cnav'"> 전체 게시글 보기 </button> <br />
	</c:if>
	<button onclick="window.location='/cnav/main/main.cnav'"> 메인으로 </button>
	</div>
	
</body>
</html>
