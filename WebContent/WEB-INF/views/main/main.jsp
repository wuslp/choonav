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
<link href='../resources/css/clock.css' rel='stylesheet' />
<script src='../resources/js/clock.js'></script>
<body>
	<div>
		<div>
			<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
			<div id=""> 
				<c:if test="${sessionScope.sid == null}">
				<script>
					alert("로그인후 이용할 수 있습니다");
					var link = "http://localhost:8080/cnav/main/startPage.cnav";
		    		window.location.href = link;
		    		</script>
				</c:if>
			</div>
			<div class="">
					<h1><a href="/cnav/main/main.cnav">Choonav 메인으로</a></h1>
			</div>
			<div>
			<h1> </h1><br/><br/><br/>
				<h2>선택한 카테고리만 보이게</h2>
					<a href="#">공지사항</a><br/><br/>
					
				<c:if test="${cdto.approval==1}">
					<a href="/cnav/approval/sendAppList.cnav">결재</a><br/><br/>
				</c:if>
				<c:if test="${cdto.mail==1}">
					<a href="/cnav/mail/recMailList.cnav">메일</a><br/><br/>
				</c:if>
				<c:if test="${cdto.attend==1}">
					<a href="/cnav/attend/attend.cnav">근태</a><br/><br/>
				</c:if>
				<c:if test="${cdto.project==1}">
					<a href="#">프로젝트</a><br/><br/>
				</c:if>
				<c:if test="${cdto.calendar==1}">
					<a href="/cnav/cal/calendar.cnav">일정</a><br/><br/>
				</c:if>
				<c:if test="${cdto.reservation==1}">
					<a href="/cnav/rez/allRez.cnav">예약</a><br/><br/>
				</c:if>
				<c:if test="${cdto.topic==1}">
					<a href="#">자유게시판</a><br/><br/>
				</c:if>
				<c:if test="${cdto.poll==1}">
					<a href="/cnav/poll/pollList.cnav">투표</a><br/><br/>
				</c:if>
			</div>
		</div>
	</div>
	<!--로그아웃  -->
	<a href="/cnav/main/logout.cnav">로그아웃 </a>
	<!-- 메인 content -->
	<table>
		<!-- 회사 공지사항 -->
		<tr>
			<table>
				<c:if test="${count == 0}">
					등록된 공지사항이 없습니다.
				</c:if>
				<c:if test="${count > 0}">
				<tr>
					<td> No. </td>
					<td> 제목 </td>
					<td> 작성일 </td>
				</tr>
				<c:forEach var="item" items="${articleList}">
					<tr>
						<td>${number}<c:set var="number" value="${number - 1}" /> </td>
						<td>${item.notiTitle}</td>
						<td>${item.notiDate}</td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
		</tr>
		<tr>
			<!-- 회사정보 -->
			<td>
				<table>
					<tr>회사정보</tr>
					<tr>
						<td>회사명</td>
						<td>${bizDTO.bizName}</td>
					</tr>
					<tr>
						<td>대표자</td>
						<td>${bizDTO.bizCEO}</td>
					</tr>
					<tr>
						<td>회사번호</td>
						<td>${bizDTO.bizTel}</td>
					</tr>
					<tr>
						<td>회사이메일</td>
						<td>${bizDTO.bizEmail}</td>
					</tr>
				</table>
			</td>
			
			<!-- 실시간 시계 -->
			<td>
				<a id="codepen-link" href='https://www.codepen.io/seanfree' target='_blank'></a>
				<div id="clock">
				  <ul id="tick-marks"></ul>
				  <div class="second ticker"></div>
				  <div class="minute ticker"></div>
				  <div class="hour ticker"></div>
				  <div id="time-output"></div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>