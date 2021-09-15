<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

다음 승인자를 선택해주세요.
	
	<form action="/cnav/approval/takeOk.cnav?appNum=${approval.appNum}&sign=${sign}" method="post">
		<select name="name2">
			<option value="java01" >java01</option> 
			<option value="java02" >java02</option> 
			<option value="java03" >java03</option> 
		</select>
	</form>



</body>
</html>