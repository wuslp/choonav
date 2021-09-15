<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reject Form </title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
	<script>
		function closePopup() {
			 self.close();
		}
	</script>
<body align="center">
	<form action="/cnav/approval/rejectPro.cnav?pageNum=${pageNum}" method="post">
	appNum = ${appNum} / sign = ${sign}
	<input type="hidden" name="appNum" value="${appNum}" />
	<input type="hidden" name="sign" value="${sign}" />
		<h2> 반려 사유 </h2><br/>
		<textarea rows="20" cols="60" name="reject"></textarea><br/><br/>
		<input type="submit" value="작성"/> 
		<input type="button" value="취소" onclick="closePopup(); "/> 
	</form>
</body>
</html>