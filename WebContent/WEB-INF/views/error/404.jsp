<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
<script>
	function error(){
		history.go(-1);
	}
</script>
</head>
<body>
	<div align="center">
	<br/><br/><br/>
	<input type="button" onclick="error()" value="뒤로 가기" /><br/>
	<img src="../resources/imgs/error.jpg"/>
	</div>

</body>

</html>