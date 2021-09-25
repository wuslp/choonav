<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	function goLogin(){	//팝업창 닫고 기본창 로그인 페이지로 이동
		opener.parent.location='/cnav/main/loginForm.cnav';
		window.close();
	}
	</script>
</head>
<body>
	<div id="">
		<div id="">
			<h2>비밀번호 찾기</h2>
				아이디 ${udto.userId}님의 비밀번호는<br/>
				${udto.pw } 입니다<br/><br/>
				<input type="button" value="로그인" onclick="goLogin()"/>
		</div>
	</div>
</body>
</html>