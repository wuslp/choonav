<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myRez</title>
</head>
<style>
.divTable{ display: table; width: 100%; loat: center; }
.divTableRow { display: table-row; }
.divTableHeading { background-color: #EEE; display: table-header-group; }
.divTableCell, .divTableHead { border: 1px solid #999999; display: table-cell; padding: 3px 10px; }
.divTableHeading { background-color: #EEE; display: table-header-group; font-weight: bold; }
.divTableFoot { background-color: #EEE; display: table-footer-group; font-weight: bold; }
.divTableBody { display: table-row-group; }
.left {
	float: left;
}
</style>
<body>
	<div class="left" >
		<a href="allRez.cnav"><h1>전체 예약 현황</h1></a>
		<a href="myRez.cnav"><h1>내 예약 현황</h1></a>
	</div>
	<div id='calendar' class="center"></div>
	
	<c:if test="${count == 0}">
		<div>
			예약한 내역이 없습니다.
		</div>
	</c:if>
	
	<c:if test="${count > 0}">
	<div class="divTable" style="width: 40%;"> 
		<div class="divTableBody"> 
			<div class="divTableRow">
				<div class="divTableCell">No.</div>
				<div class="divTableCell">예약 항목</div>
				<div class="divTableCell">예약 시간</div>
				<div class="divTableCell">예약 취소</div>
			</div>
			<c:forEach var="item" items="${articleList}">
			<div class="divTableRow">
				<div class="divTableCell">${number}<c:set var="number" value="${number - 1}" /> </div>
				<div class="divTableCell">${item.category}</div>
				<div class="divTableCell">${item.sDate} ~ ${item.eDate}</div>
				<div class="divTableCell"><button onclick="deleteConfirm(${item.rezNum})" >취소</button></div>
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
					<a href="/cnav/rez/myRez.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="/cnav/rez/myRez.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					&nbsp; <a href="/cnav/rez/myRez.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
				</c:if>
		</c:if> <%-- end:count > 0 --%>
		</div> <%-- page번호 div 끝 --%>
		
	</div>
	</c:if>
	
	
</body>
<script>
	function deleteConfirm(rezNum){
		if(confirm("해당 예약을 삭제하겠습니까?") == true){
			window.location='rezDelete.cnav?myRez=1&rezNum=' + rezNum;
		}else{
			return;
		}
	}

</script>
</html>