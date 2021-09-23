<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<c:if test="${count == 0}">
<div>작성한 자유게시판 글이 없습니다.</div>
</c:if>
<c:if test="${count > 0}">
	<div class="divTable" style="width: 40%;"> 
		<div class="divTableBody"> 
			<div class="divTableRow">
				<div class="divTableCell">No.</div>
				<div class="divTableCell">제목</div>
				<div class="divTableCell">작성자</div>
				<div class="divTableCell">시간</div>
				<div class="divTableCell">조회수</div>
				<div class="divTableCell">수정</div>
				<div class="divTableCell">삭제</div>
			</div>
			<c:forEach var="item" items="${articleList}">
			<div class="divTableRow">
				<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${number}<c:set var="number" value="${number - 1}" /> </div>
				<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${item.topTitle}</div>
				<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${item.userId}</div>
				<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${item.topDate}</div>
				<div class="divTableCell" onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${item.readcount}</div>
				<div class="divTableCell"><button onclick="window.location='/cnav/topic/modifyForm.cnav?topNum=${item.topNum}'" >수정</button></div>
				<div class="divTableCell"><button onclick="deleteConfirm(${item.topNum})" >삭제</button></div>
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
					<a href="/cnav/my/bizPjList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="/cnav/my/bizPjList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					&nbsp; <a href="/cnav/my/bizPjList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
				</c:if>
		</c:if> <%-- end:count > 0 --%>
		</div> <%-- page번호 div 끝 --%>
		
	</div>
</c:if>

</body>
<script>
	function deleteConfirm(topNum){
		if(confirm("해당 프로젝트를 삭제하겠습니까?") == true){
			window.location='/cnav/topic/delete.cnav?topNum=' + topNum;
		}else{
			return;
		}
	}

</script>
</html>