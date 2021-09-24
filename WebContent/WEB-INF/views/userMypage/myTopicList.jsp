<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myTopicList</title>
</head>
<body>
<c:if test="${count == 0}">
<div>작성한 자유게시판 글이 없습니다.</div>
</c:if>
<c:if test="${count > 0}">
	<table>
		<tr>
			<td>No.</td>
			<td>제목</td>
			<td>작성자</td>
			<td>시간</td>
			<td>조회수</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="item" items="${articleList}">
		<tr>
			<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'">${number}<c:set var="number" value="${number - 1}" /> </td>
			<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" >${item.topTitle}</td>
			<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" >${item.userId}</td>
			<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" >${item.topDate}</td>
			<td onclick="window.location='/cnav/topic/content.cnav?topNum=${item.topNum}'" >${item.readcount}</td>
			<td><button onclick="window.location='/cnav/topic/modifyForm.cnav?topNum=${item.topNum}'" />수정</button></td>
			<td><button onclick="deleteConfirm(${item.topNum})" />삭제</button></td>
		</tr>
		</c:forEach>
	</table>
	
	
	
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
		if(confirm("해당 글을 삭제하겠습니까?") == true){
			window.location='/cnav/topic/delete.cnav?topNum=' + topNum;
		}else{
			return;
		}
	}

</script>
</html>