<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>writePro</title>
</head>

<c:redirect url="/project/proList.cnav" />
<body>
	<script>
		alert("프로젝트가 만들어졌습니다.");
		window.location.href ="/cnav/project/proList.cnav"; 
		
	</script>

</body>
</html>