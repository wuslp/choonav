<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div>
		<div>
			<div>
			<h1> </h1><br/><br/><br/>
				<h2>선택한 카테고리만 보이게</h2>
					<a href="#">공지사항</a><br/><br/>
				<c:if test="${cdto.approval==1}">
					<a href="#">결재</a><br/><br/>
				</c:if>
				<c:if test="${cdto.mail==1}">
					<a href="#">메일</a><br/><br/>
				</c:if>
				<c:if test="${cdto.attend==1}">
					<a href="/cnav/attend/attend.cnav">근태</a><br/><br/>
				</c:if>
				<c:if test="${cdto.project==1}">
					<a href="#">프로젝트</a><br/><br/>
				</c:if>
				<c:if test="${cdto.calendar==1}">
					<a href="#">일정</a><br/><br/>
				</c:if>
				<c:if test="${cdto.reservation==1}">
					<a href="#">예약</a><br/><br/>
				</c:if>
				<c:if test="${cdto.topic==1}">
					<a href="#">자유게시판</a><br/><br/>
				</c:if>
				<c:if test="${cdto.poll==1}">
					<a href="/cnav/poll/pollList.cnav">투표</a><br/><br/>
				</c:if>
			</div><br/><br/>
			<h3>로그아웃</h3>
			<div><a href="/cnav/main/logout.cnav">logout</a></div>
		</div>
	</div>
</body>
</html>