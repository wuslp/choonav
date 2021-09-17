<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${res == 1}">
	<script>
		alert("수정이 완료되었습니다");
		opener.document.location.reload();
		self.close();
	</script>
</c:if>
</body>
</html>