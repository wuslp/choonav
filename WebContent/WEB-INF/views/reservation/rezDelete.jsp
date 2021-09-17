<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rezDelete</title>
</head>
<body>
	<c:if test="${res == 1}">
		<c:choose>
			<c:when test="${rezNum == null}">
				<script>
					alert("삭제가 완료되었습니다.")
					window.location="allRez.cnav";
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("삭제가 완료되었습니다.")
					window.location="myRez.cnav?rezNum=${rezNum}";
				</script>
			</c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>