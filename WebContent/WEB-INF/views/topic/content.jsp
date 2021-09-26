<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
	<meta charset="UTF-8">
	<title>자유게시판</title>
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
	<h1 align="center"> 자유게시판 </h1>
	<!-- 게시글 본문 보여주기 제목, 내용, 작성자, 날짜 -->
	<div>
		<table>
			<tr>
				<td colspan="2"> <b>${article.topTitle}</b> </td>
			</tr>
			<tr>
				<td colspan="2" height="100"> ${article.topContent} </td>
			</tr>
			<tr>
				<td>posted by <b>${article.userId}</b>
					at ${article.topDate}
				</td>
				<td> ${article.readcount} viewed </td>
			</tr>
			<tr>
				<!--회사 관리자일경우 삭제보이게  -->
				<c:if test="${sessionScope.sauth=='1'}">
					<td colspan="2"> 
						<input type="button" value="삭제" onclick="del(${article.topNum})">
						<button onclick="window.location='/cnav/topic/list.cnav'">리스트</button>
					</td>
				</c:if>
				<!-- 작성자만 수정, 삭제 보이게 -->
				<c:if test="${article.userId == sessionScope.sid}">
					<td colspan="2"> 
						<button onclick="window.location='/cnav/topic/modifyForm.cnav?topNum=${article.topNum}&pageNum=${pageNum}'">수 정</button>
						<input type="button" value="삭제" onclick="del(${article.topNum})">
						<button onclick="window.location='/cnav/topic/list.cnav'">리스트</button>
					</td>
				</c:if>
				<!-- 로그인한사람은 목록만 보이게 -->
				<c:if test="${article.userId != sessionScope.sid}">
					<td colspan="2"> 
						<button onclick="window.location='/cnav/topic/list.cnav'">리스트</button>
					</td>
				</c:if>
			</tr>
		</table>
	</div>
	<!-- 댓글 작성 -->
	<div>
        <br>
       <form action="/cnav/topComments/insert.cnav" method="post">
		 	<input type="text" id="topComment" name="topComment">
		 	<input type="hidden" id="userId" name="userId" value="${sessionScope.sid}">
		 	<input type="hidden" id="topNum" name="topNum" value="${article.topNum}">
		 	<input type="hidden" id="code" name="code" value="${sessionScope.scode}">
		 	
		  	<input id="subBtn" type="button" value="댓글 달기"  onclick="topCom(this.form)"/>
		</form>
    </div>
    
    <!-- 댓글 보여주기 -->
    <div>
		<c:forEach items="${reply}" var="reply">
	      	
	        <p>
	        작성자 : ${reply.userId}<br />
	        작성 날짜 :  <fmt:formatDate value="${reply.topReg}" pattern="yyyy-MM-dd" />
	        </p>
			
	        <p>${reply.topComment}</p>
	        <!-- 로그인한사람이 댓글쓴사람이랑 같을경우 삭제버튼 보이게 -->
	 		<c:if test="${sessionScope.sid == reply.userId}">
		       <input type="button" value="삭제" onclick="window.location='/cnav/topComments/delete.cnav?topComNum=${reply.topComNum}&topNum=${article.topNum}'">
			</c:if>   
	        
	    </c:forEach>
    </div>
    
</body>

<script>
	/* 게시글 삭제 확인 */
	function del(topNum) {
		var chk = confirm("게시글을 삭제하시겠습니까?");
		if (chk) {
			location.href='delete.cnav?topNum='+topNum;
		}
	}	
	
	/* 댓글 작성 해야 action으로 넘어갈수 있게 */
	function topCom(frm) {
		var topComment = frm.topComment.value;

		if (topComment.trim() == ''){
			alert("댓글을 입력해주세요");
			return false;
		}
		frm.submit();
	}
</script>
</html>