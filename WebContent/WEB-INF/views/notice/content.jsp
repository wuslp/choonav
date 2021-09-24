<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
	<%-- <div id=""> 
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	    	window.location.href = link;
	    	</script>
		</c:if>
	</div> --%>
	<br />
	<h1 align="center"> Content </h1>
	<table>
		<tr>
			<td colspan="2"> <b>${article.notiTitle}</b> </td>
		</tr>
		<tr>
			<td colspan="2" height="100"> ${article.notiContent} </td>
		</tr>
		<tr>
			<td>posted by <b>${article.userId}</b>
				at ${article.notiDate}
			</td>
			<td> ${article.readcount} viewed </td>
		</tr>
		
		<!--회사 관리자일경우 삭제보이게  -->
			<c:if test="${!article.userId == sessionScope.sid &&sessionScope.sauth=='1'}">
				<tr>
					<td colspan="2"> 
						<button onclick="window.location='/cnav/notice/modifyForm.cnav?notiNum=${article.notiNum}&pageNum=${pageNum}'">수 정</button>
						<input type="button" value="삭제" onclick="del(${article.notiNum})">
						<button onclick="window.location='/cnav/notice/list.cnav'">리스트</button>
					</td>
				</tr>
			</c:if>
			
		<!-- 로그인한 사람은 목록버튼만 보이게 -->
			<c:if test="${article.userId != sessionScope.sid}">
				<tr>
					<td colspan="2"> 
						<button onclick="window.location='/cnav/notice/list.cnav'">리스트</button>
					</td>
				</tr>
			</c:if>
	</table>

</body>
<script>
	function del(notiNum) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete.cnav?notiNum='+notiNum;
		}
	}	
</script>
</html>