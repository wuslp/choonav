<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸결재함</title>
<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>

<h2> 보낸결재함 </h2>

	<%-- 작성자/내용 검색 --%>
	<form action="/cnav/approval/sendAppList.cnav">
		<select name="sel">
			<option value="appType">문서형식</option>
			<option value="appTitle">기안제목</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form><br/>  <%-- 이렇게 ! /spring/board/list.do?sel=writer&search=aaa --%>

	 <c:if test="${count==0}" >
		<h4 align="center">보낸 결재가 없습니다.</h4>
	</c:if>
	
	 <c:if test="${count != 0}" >
		<table>
			<tr>
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
				            반려
				         </c:when>
				         <c:when test ='${approval.state3=="2"}'>
				            승인
				         </c:when>
				         <c:otherwise>
				            진행중
				         </c:otherwise>
				      </c:choose>
					</td>
					<td><fmt:formatDate value="${approval.appDate}" pattern="yyyy.MM.dd"/></td>
					<td>${approval.reject}</td>
				</tr>
			</c:forEach>	
		</table><br/>
	</c:if>
	<c:if test="${sel != null && search != null}">
		<button onclick="window.location='/cnav/approval/sendAppList.cnav'">목록</button>
	</c:if>
	<button onclick="window.location='/cnav/approval/appForm.cnav'">문서 작성</button><br/><br/>
	
	<%-- 페이지 번호 --%>
	<div>
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
</body>
</html>