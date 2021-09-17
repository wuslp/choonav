<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginForm</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#userId").blur(function(){
				if(("#userId").val()==""){
					alert("경고 !")
				}
			})
			
			
		})
	</script>
</head>
<body>
	<div>
		<div>
			<h1>로그인</h1>
			<form action="/cnav/main/loginPro.cnav" method="post">
				아이디 : <input type="text" name="userId" id="userId" onblur="check_id()" autofocus/><br/>
				<span class="userId hide"></span><br/>
				비밀번호 : <input type="password" name="pw" id="pw"/><br/>
				<div id="loginPw"></div><br/>
				<input type="submit" value="로그인"/>
				<!-- 아이디 비밀번호찾기 팝업 -->
				<input type="button" value="아이디찾기" onclick="window.open('/cnav/main/findId.cnav','findId','width=400,height=600,location=no,status=no,scrollbars=yes');"/>
				<input type="button" value="비밀번호 찾기" onclick="window.open('/cnav/main/findPw.cnav','findPw','width=400,height=600,location=no,status=no,scrollbars=yes');"/>
			</form>
		</div>
	</div>
</body>
</html>