<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
	
<body align="center">


	다음 승인자를 선택해주세요.
	
<form action="/cnav/approval/addTake.cnav?appNum=${appNum}" method="post">
	<input type="hidden" name="appNum" value="${appNum}" />
		<select name="id2">
				<option value="">선택</option>			
				<c:forEach var="users" items="${list}">
					<option value="${users.userId}">${users.name} ${users.position}</option>
				</c:forEach> 
		</select>	
	<input type="submit" value="완료"/> 
</form>

  
 
	
</body>
</html>