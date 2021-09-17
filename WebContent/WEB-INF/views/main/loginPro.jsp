<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginPro Page</title>
</head>
<body>
	<c:if test="${result == 1}">
		<c:redirect url="/main/main.cnav" />
	</c:if>
	<c:if test="${result == 0}">
		<script>
			alert("아이디 또는 비밀번호가 맞지 않습니다!");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == 2}">
		<script>
			alert("이미 로그인 중입니다");
		</script>
		<c:redirect url="/main/main.cnav" />
	</c:if>

</body>
</html>