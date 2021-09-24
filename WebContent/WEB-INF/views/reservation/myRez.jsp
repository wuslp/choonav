<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myRez</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
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
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
	<div id="layoutSidenav_content">
	
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
	<jsp:include page="/include/footer.jsp" />
	
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</html>