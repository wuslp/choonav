<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	
<body>

	다음 승인자를 선택해주세요.
	
<form action="/cnav/approval/addTake.cnav?appNum=${appNum}" method="post">
	<input type="hidden" name="appNum" value="${appNum}" />
		<select name="name2">
			<option value="java01" >java01</option> 
			<option value="java02" >java02</option> 
			<option value="java03" >java03</option> 
		</select>	
	<input type="submit" value="완료"/> 
</form>
	
</body>
</html>