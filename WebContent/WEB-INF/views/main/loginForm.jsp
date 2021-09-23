<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginForm</title>
	<!-- 로고 글씨체 -->	
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
	<link href="https://fonts.googleapis.com/css2?family=Charm&family=Playball&display=swap" rel="stylesheet">

	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function check(){
			var userId = $("#userId").val();
			//id입력란 필수 
			if(userId==""){
				alert("아이디는 필수 입니다");
				$("#userId").focus();
				return false;
			}
			var pw = $("#pw").val();
			//id입력란 필수 
			if(pw==""){
				alert("pw 는 필수 입니다");
				$("#pw").focus();
				return false;
			}
		}
	</script>
</head>
<body>
<!--로그인된 세션이 있을경우 main 페이지로 이동시켜주기  -->
	<div id=""> 
		<c:if test="${sessionScope.sid != null}">
		<script>
			var link = "http://localhost:8080/cnav/main/main.cnav";
    		window.location.href = link;
    		</script>
		</c:if>
	</div>
<!--로그인된 세션이 없을경우 로그인 페이지  -->
	<div class="main-container">
		<div class="header">
				<h1><a href="/cnav/main/startPage.cnav">Choonav</a></h1>
		</div>
	<div class="hero">	
			<h1>로그인</h1>
			<form action="/cnav/main/loginPro.cnav" method="post" onsubmit="return check()">
			<div class="idpw"><br/>
				아이디 &nbsp;&nbsp; <input type="text" name="userId" id="userId" autofocus/><br/>
				<span class="userId hide"></span><br/>
				비밀번호  <input type="password" name="pw" id="pw"/><br/>
				<div id="loginPw"></div><br/>
			</div><br/>	
				<div class="sign-button">
				<input type="submit" value="로그인" />
				<!-- 아이디 비밀번호찾기 팝업 -->
				<input type="button" value="아이디찾기" onclick="window.open('/cnav/main/findId.cnav','findId','width=400,height=600,location=no,status=no,scrollbars=yes');"/>
				<input type="button" value="비밀번호 찾기" onclick="window.open('/cnav/main/findPw.cnav','findPw','width=400,height=600,location=no,status=no,scrollbars=yes');"/>
				</div>
			</form>
	</div>
</body>
</html>