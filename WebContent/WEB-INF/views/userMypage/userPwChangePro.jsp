<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bizPwChangePro</title>
</head>
<body>
	<c:if test="${res == 1}">
		<script>
			alert("비밀번호 변경이 완료되었습니다.")
			window.location="pwChangeForm.cnav";
		</script>
	</c:if>
	<c:if test="${res != 1}">
		<script>
			alert("현재 비밀번호가 맞지 않습니다. 비밀번호 확인후 다시 시도해주세요.")
			window.location="pwChangeForm.cnav";
		</script>
	</c:if>	
</body>
</html>