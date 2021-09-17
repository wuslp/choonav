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
		alert("예약이 완료되었습니다");
		opener.document.location.reload();
		self.close();
	</script>
</c:if>
<c:if test="${res != 1}">
	<script>
		alert("예약 실패, 다시 시도해주세요");
		window.location="calForm.cnav"
	</script>
</c:if>
</body>
</html>