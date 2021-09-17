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
<title>받은결재함</title>
<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>

<h2> 받은결재함 </h2>

	<%-- 작성자/내용 검색 --%>
	<form action="/cnav/approval/takeAppList.cnav">
		<select name="sel">
			<option value="userId">기안자</option>
			<option value="appTitle">기안제목</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form><br/>  <%-- 이렇게 ! /spring/board/list.do?sel=writer&search=aaa --%>
	
	 <c:if test="${count==0}" >
		<h4 align="center">받은 결재가 없습니다.</h4>
	</c:if>
	
	 <c:if test="${count != 0}" >
		<table>
			<tr>
				<td>No.</td>
				<td>기안제목</td>
				<td>기안자</td>
				<td>승인자1</td>
				<td>승인여부1</td>
				<td>승인자2</td>
				<td>승인여부2</td>
				<td>승인자3</td>
				<td>승인여부3</td>
				<td>결재요청일</td>
				<td>반려사유</td>
			</tr>
			<c:forEach var="approval" items="${takeAppList}">
				<tr>
					<td>${number}
						<c:set var="number" value="${number-1}"/>
					</td>
					<%--
					<c:if test="${approval.name1 == sessionScope.sid}">  --%>
					<c:if test='${approval.name1 == "java02"}'>
						<c:set var="sign" value="1" />
					</c:if>
					<c:if test='${approval.name2 == "java02"}'>
						<c:set var="sign" value="2" />
					</c:if>
					<c:if test='${approval.name3 == "java02"}'>
						<c:set var="sign" value="3" />
					</c:if>
					
		 			<td><a href="/cnav/approval/takeAppContent.cnav?num=${approval.appNum}&sign=${sign}"> ${approval.appTitle} </a></td>
					<td>${approval.userId}</td>
					<td>${approval.name1}</td>
					<td>
						<c:if test="${approval.state1 == 1}">
								반려
						</c:if>
						<c:if test="${approval.state1 == 2}">
								승인
						</c:if>
						<c:if test="${approval.state1 == 0}">
								진행중
						</c:if>
					</td>
					
					<td>${approval.name2}</td>
						<c:if test='${approval.name2 != null}'> 
					<td>
						<c:if test="${approval.state2 == 1}">
								반려
						</c:if>
						<c:if test="${approval.state2 == 2}">
								승인
						</c:if>
						<c:if test="${approval.state2 == 0}">
								진행중
						</c:if>
					</td>
					</c:if>
					<c:if test='${approval.name2 == null}'>
					<td>
					</td>
					</c:if>
					
					<td>${approval.name3}</td>
					<c:if test='${approval.name3 != null}'>
					<td>
						<c:if test="${approval.state3 == 1}">
								반려
						</c:if>
						<c:if test="${approval.state3 == 2}">
								승인
						</c:if>
						<c:if test="${approval.state3 == 0}">
								진행중
						</c:if>
					</td>
					</c:if>
					<c:if test='${approval.name3 == null}'>
						<td>
						</td>
					</c:if>
					<td><fmt:formatDate value="${approval.appDate}" pattern="yyyy.MM.dd"/></td>
					<td>${approval.reject}</td>
				</tr>
			</c:forEach>	
			
		</table><br/>
	</c:if>
	
	<c:if test="${sel != null && search != null}">
		<button onclick="window.location='/cnav/approval/takeAppList.cnav'">목록</button>
	</c:if>
	
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
				<a href="/cnav/approval/takeAppList.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/approval/takeAppList.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/approval/takeAppList.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
		<%-- 검색 안했을때 페이지번호들   --%> 
		<c:if test="${sel == null || search == null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/approval/takeAppList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/approval/takeAppList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/approval/takeAppList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>	
	
	</c:if> <%-- end:count > 0 --%>
	

	</div>	
</body>
</html>