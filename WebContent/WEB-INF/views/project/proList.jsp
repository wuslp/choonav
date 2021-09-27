<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>프로젝트 목록</title>
</head>
<body>
		<h1 align="center">프로젝트 목록</h1>
		
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
	<c:if test="${count==0}">
		<table>
			<tr>
				<td>프로젝트가 존재하지 않습니다.</td>
			</tr>
		</table>		
	</c:if>	
	<c:if test="${count !=0}">
		<table border="2">
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
		<button onclick="window.location='/cnav/project/proList.cnav'">전체 목록 보기</button> <br/>		
	</c:if>
	
	
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
		<c:if test="${sort !=null}">
			<c:if test="${startPage>pageBlock}">
				<a href="/cnav/project/proList.cnav?pageNum=${startPage-pageBlock}&sort=${sort}" class="pageNums">&lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/project/proList.cnav?pageNum=${i}&sort=${sort}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>		
			<c:if test="${endPage < pageCount}">
						&nbsp; <a href="/cnav/project/proList.cnav?pageNum=${startPage+pageBlock}&sort=${sort}" class="pageNums"> &gt; </a>			
			</c:if>
		</c:if>
		
	</div>	
		
		
	
</body>
</html>