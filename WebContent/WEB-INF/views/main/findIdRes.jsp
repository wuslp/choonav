<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>findId Res</title>
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
			<h2>아이디 찾기</h2>
				${udto.name }님의 아이디는 <br/>
				<strong>${udto.userId }</strong> 입니다. <br/>
				<input type="button" value="로그인" onclick="goLogin()"/>
				<input type="button" value="비밀번호 찾기" onclick="window.location='/cnav/main/findPw.cnav'"/>
		</div>
	</div>
</body>
</html>