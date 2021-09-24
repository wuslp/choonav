<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<br />
	<h1 align="center"> Content </h1>
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
				<td colspan="2"> 
					<button onclick="window.location='/cnav/topic/modifyForm.cnav?topNum=${article.topNum}&pageNum=${pageNum}'">수 정</button>
					<input type="button" value="삭제" onclick="del(${article.topNum})">
					<button onclick="window.location='/cnav/topic/list.cnav'">리스트</button>
				</td>
			</tr>
		</table>
	</div>
	<!-- 댓글 작성 -->
	<div>
        <br>
        <!-- **로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <%-- <c:if test="${sessionScope.userId != null}"> --%>    
       <form action="/cnav/topComments/insert.cnav" method="post">
		 	<input type="text" id="topComment" name="topComment">
		 	<input type="hidden" id="userId" name="userId" value="${sessionScope.sid}">
		 	<input type="hidden" id="topNum" name="topNum" value="${article.topNum}">
		 	<input type="hidden" id="code" name="code" value="${sessionScope.scode}">
		 	
			
		  	<input id="subBtn" type="button" value="댓글 달기"  onclick="topCom(this.form)"/>
		</form>
        <%-- </c:if> --%>
    </div>
    
    <!-- 댓글 보여주기 -->
    <div>
		<c:forEach items="${reply}" var="reply">
	      	
	        <p>
	        작성자 : ${reply.userId}<br />
	        작성 날짜 :  <fmt:formatDate value="${reply.topReg}" pattern="yyyy-MM-dd" />
	        </p>
			
	        <p>${reply.topComment}</p>
		       <input type="button" value="삭제" onclick="window.location='/cnav/topComments/delete.cnav?topComNum=${reply.topComNum}&topNum=${article.topNum}'">
	        
	<%-- 		<c:if test="${sessionScope.memId == reply.userId}">
		       <input type="button" value="수정" onclick="window.location='/cnav/topCommets/update.cnav?topComNum=${reply.topComNum}&topNum=${article.topNum}'"> 
		       <input type="button" value="삭제" onclick="window.location='/cnav/topComments/delete.cnav?topComNum=${reply.topComNum}&topNum=${article.topNum}'">
			</c:if>  --%>  
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