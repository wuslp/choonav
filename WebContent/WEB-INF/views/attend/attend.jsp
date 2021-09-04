<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>attend page</title>
	<script src="install https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(documnet).ready(function(){
		$("#worktime").onclick(function(){//worktime
			var idVal =$("#id").val();//입력란에 사용자가 작성한 값을 가져오기
			console.log("id : "+id);
		})
		
		
	})//ready	
	
	</script>
</head>

<body>
	
	<div id="" class="">
		<div id="" class="">
			<h1>근태관리</h1>
			<h5><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
			
			<button onclick="" id="worktime">출근</button>
			<input type="time" name="worktime">
			<button onclick="" id="leavetime">퇴근</button>
			<input type="time" name="leavetime">
			</h5>
		</div><br/><br/><br/><br/><br/>
		
		<div id="" class="">
			<select id="attcategory" name="attcategory" onchange="attcategoryChange()">
				<option value="nosel" selected>-- 선택 --</option>
				<option value="attend">정상출근</option>
				<option value="late">지각</option>
				<option value='off'>휴가</option>
			</select>
			<input type="date" value="xxx" min="yyy" max="zzz"/>
			<strong>~</strong>
			<input type="date" value="xxx" min="yyy" max="zzz"/>
		</div><br/><br/>
				
		<div id="" class="">	
			<table>
				<tr>
					<td>날짜</td>
					<td>근태</td>
					<td>출근</td>
					<td>퇴근</td>
					<td>사유</td>
				</tr>
				<c:if test="${userAttendList != null}">
					<c:forEach var="List" items="${userAttendList }">
					<tr>
						<td><fmt:formatDate value="${List.attDate }" type="date"/></td>
						<td>${List.attendance }</td>
						<td><fmt:formatDate value="${List.workTime }" pattern="HH:mm" /></td>
						<td><fmt:formatDate value="${List.leaveTime }" pattern="HH:mm" /></td>
						<td>${List.reason }</td>
					</tr>
					</c:forEach>
				</c:if>
				<c:if test="${userAttendList == null}">
					<tr>
						<td>근태기록이 존재하지 않습니다</td>	
					</tr>
				</c:if>
				
			</table>
		</div><br /> <br /> 
		<div id="" class=""><%-- 페이지 번호 --%>
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
						<a href="/cnav/attend/attend.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/cnav/attend/attend.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						&nbsp; <a href="/cnav/attend/attend.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
					</c:if>
				</c:if>
				
				<%-- 검색 안했을때 페이지번호들   --%> 
				<c:if test="${sel == null || search == null}">
					<c:if test="${startPage > pageBlock}">
						<a href="/cnav/attend/attend.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/cnav/attend/attend.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						&nbsp; <a href="/cnav/attend/attend.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
					</c:if>
				</c:if>	
			</c:if> <%-- end:count > 0 --%>
			<h3 style="color:black"> page : ${pageNum} </h3>
			</div>
		</div>
	</div>

</body>
</html>