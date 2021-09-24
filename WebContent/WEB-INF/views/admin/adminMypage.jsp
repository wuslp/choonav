<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체관리자 마이페이지</title>
</head>

<body>
	<div>
	 관리자 권한
	</div>
	
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
	<div>
		<c:if test="${count != 0}">
			<table>
				<tr>
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
	
		<br />
	
		<h3 style="color:grey"> 현재페이지 : ${pageNum} </h3>
		<br /> 
		<button onclick="window.location='/cnav/member/main.cnav'"> 메인으로 </button>
	</div>
	
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