<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${res == 1}">
		<script>
			alert("삭제가 완료되었습니다.")
			window.location="calendar.cnav";
		</script>
	</c:if>
</body>
</html>