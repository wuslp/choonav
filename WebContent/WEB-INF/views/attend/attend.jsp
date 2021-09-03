<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>attend jsp</title>
	<script src="install https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	</script>
</head>




<body>
<%-- 	<c:forEach items="${userlist}" var="user" >
		<h1>${user.id}</h1>
		<h2>${user.pw}</h2>
	</c:forEach> --%>
	
	<div>
		<div>
			<h1>근태관리</h1>
			<h5><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
			
			<button onclick="" id="worktime">출근</button>
			<input type="time" name="worktime">
			<button onclick="" id="leavetime">퇴근</button>
			<input type="time" name="leavetime">
			</h5>
		</div><br/><br/><br/><br/><br/>
		
		<div>
			<select name="">
				<option value='' selected>-- 선택 --</option>
				<option value=''>정상출근</option>
				<option value=''>지각</option>
				<option value='vacation'>휴가</option>
			</select>
			<input type="date" value="xxx" min="yyy" max="zzz"/>
			<strong>~</strong>
			<input type="date" value="xxx" min="yyy" max="zzz"/>
		</div><br/><br/>
				
		<div>	
			<table>
				<tr>
					<td>날짜</td>
					<td>근태</td>
					<td>출근</td>
					<td>퇴근</td>
					<td>사유</td>
				</tr>
				<c:if test="!=null">
					<%-- <c:forEach >
					<tr>
						<td>${attdate }</td>
						<td>${attendance }</td>
						<td>${worktime }</td>
						<td>${leavetime }</td>
						<td>${reason }</td>
					</tr>
					</c:forEach> --%>
				</c:if>
				
			</table>
		</div><br /> <br /> 
		<div><%-- 페이지 번호 --%>
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
						<a href="/spring/board/list.do?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/spring/board/list.do?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						&nbsp; <a href="/spring/board/list.do?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
					</c:if>
				</c:if>
				
				<%-- 검색 안했을때 페이지번호들   --%> 
				<c:if test="${sel == null || search == null}">
					<c:if test="${startPage > pageBlock}">
						<a href="/spring/board/list.do?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/spring/board/list.do?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						&nbsp; <a href="/spring/board/list.do?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
					</c:if>
				</c:if>	
			</c:if> <%-- end:count > 0 --%>
			<h3 style="color:grey"> page : ${pageNum} </h3>
			</div>
	</div>

</body>
</html>