<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pollList Page</title>
</head>
<body>
	<div><!-- 리스트 자체는 모두 보이고 , 투표하기 버튼을 해당하는 대상만 보이게? -->
		<div>
			<h1>투표목록</h1>
		</div>
		<div>
			<form action="/cnav/poll/pollList.cnav">
				진행중 완료 &nbsp;
				<select id="" name="sel">
					<option value="pollTitle">제목</option>
					<option value="pollCon">내용</option>
				</select>
				<input type="text" id="" name="search"/>
				<input type="submit" value="검색" name="search">
				<input type="button" value="만들기" onClick="window.location='/cnav/poll/pollForm.cnav'">
			</form>
		</div><br/><br/><br/><!-- 상단 버튼들 -->
		<div>
			<c:if test="${count == 0}">
				<table>
					<tr>
						<td>개설된 투표가 없습니다</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${count != 0}">
				<table>
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
				<c:if test="${sel != null && search != null}">
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
				<c:if test="${sel == null || search == null}">
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
			</c:if> <%-- end:count > 0 --%>
		</div>
	</div>
</body>
</html>