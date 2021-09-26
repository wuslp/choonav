<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>proContent</title>
</head>
<body>
	<br/>
	
	<table>
		<tr>
			<td colspan="2"><b>${project.proName}</b></td>
		</tr>
		<tr>
			<td>${project.dept}</td>
		</tr>
		<tr>
			<td>${project.proStart}~${project.proEnd}</td>
		</tr>
		<tr>
			<td colspan="2" height="100">${project.proContent}</td>
		</tr>
		
		
		<!-- 담당자만 수정/삭제 보이게 -->
		<c:if test="${project.userId==sessionScope.sid}">
			<td colspan="2">
				<button onclick="window.location='/cnav/project/proModForm.cnav?proNum=${project.proNum}&pageNum=${pageNum}'">수정</button>
				<button onclick="window.location='/cnav/project/proDelForm.cnav?proNum=${project.proNum}&pageNum=${pageNum}'">삭제</button>
			</td>		
		</c:if>
	</table>	

	<!-- 댓글작성 -->
	<form action="/cnav/proComments/create.cnav" method="post">
		 	<input type="text" id="proComment" name="proComment">
		 	<input type="hidden" id="userId" name="userId" value="${sessionScope.sid}">
		 	<input type="hidden" id="proNum" name="proNum" value="${project.proNum}">
		 	<input type="hidden" id="code" name="code" value="${sessionScope.scode}">
		 	
		  	<input id="subBtn" type="button" value="댓글 달기"  onclick="proCom(this.form)"/>
	</form>

	<!-- 댓글 리스트 -->
	<c:forEach items="${comment}" var="comment">
		
		<p>${comment.userId}<br/>
		<fmt:formatDate value="${comment.proReg}" pattern="yyyy-MM-dd" />
		</p>
		
		<p>${comment.proComment}</p>
		<!-- 댓글작성자=로그인한사람 -->
		<c:if test="${sessionScope.sid==comment.userId}">
			<input type="button" value="삭제" onclick="window.location='/cnav/proComments/delcom.cnav?proComNum=${comment.proComNum}&proNum=${project.proNum}'"/>		
		</c:if>
	
	</c:forEach>

</body>
	<script>
	function proCom(frm){
		var proComment=frm.proComment.value;
		
		if(proComment.trim()==''){
			alert("댓글을 작성해주세요");
			return false;
		}
		frm.submit();
	}
	
	</script>
	<!-- 세션에 아이디가 저장되었을 경우 (로그인한 경우)에만 댓글 작성 창이 출력되도록 코드를 작성함 -->
    

</html>