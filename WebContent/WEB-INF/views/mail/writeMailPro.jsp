<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<c:if test="${result == 1}">
	<script>
		alert("보내기 완료.");
		window.location.href = "/cnav/mail/recMailList.cnav";
	</script>
</c:if>
<c:if test="${result != 1}">
	<script>
		alert("메일 보내기 실패. 다시 시도해 주세요.");
		history.go(-1);
	</script>
</c:if>

<body>

</body>
</html>