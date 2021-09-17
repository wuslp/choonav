<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>find id</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div id="">
		<div id="">
			<h2>아이디 찾기</h2>
			<form action="/cnav/main/findIdRes.cnav" method="post">
				이름 : <input type="text" id="name" name="name"/><br/>
				이메일 : <input type="text" id="email" name="email"/><br/>
				<input type="submit" value="아이디 찾기" /><br/>
			</form>
		</div>
	</div>
</body>
</html>