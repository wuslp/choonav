<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userDeletePro</title>
</head>
<body>
	<c:if test="${res == 1}">
		<script>
			alert("회원 탈퇴가 완료되었습니다.")
			window.location="/cnav/main/startPage.cnav";
		</script>
	</c:if>
	<c:if test="${res != 1}">
		<script>
			alert("비밀번호가 맞지않습니다. 확인후 다시 시도해주세요.")
			window.location="deleteForm.cnav";
		</script>
	</c:if>	
</body>
</html>