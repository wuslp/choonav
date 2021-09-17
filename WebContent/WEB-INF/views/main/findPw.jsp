<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>find pw</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div id="">
		<div id="">
			<h2>비밀번호 찾기</h2>
			<form action="/cnav/main/findPwRes.cnav" method="post">
				이름 : <input type="text" id="name" name="name"/><br/>
				아이디 : <input type="text" id="userId" name="userId"/><br/>
				<input type="submit" value="비밀번호 찾기" /><br/>
			</form>
		</div>
	</div>
</body>
</html>