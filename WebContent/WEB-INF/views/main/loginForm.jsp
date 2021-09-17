<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginForm</title>
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
	<div>
		<div>
			<h1>로그인</h1>
			<form action="/cnav/main/loginPro.cnav" method="post" onsubmit="return check()">
				아이디 : <input type="text" name="userId" id="userId" autofocus/><br/>
				<span class="userId hide"></span><br/>
				비밀번호 : <input type="password" name="pw" id="pw"/><br/>
				<div id="loginPw"></div><br/>
				<input type="submit" value="로그인" />
				<!-- 아이디 비밀번호찾기 팝업 -->
				<input type="button" value="아이디찾기" onclick="window.open('/cnav/main/findId.cnav','findId','width=400,height=600,location=no,status=no,scrollbars=yes');"/>
				<input type="button" value="비밀번호 찾기" onclick="window.open('/cnav/main/findPw.cnav','findPw','width=400,height=600,location=no,status=no,scrollbars=yes');"/>
			</form>
		</div>
	</div>
</body>
</html>