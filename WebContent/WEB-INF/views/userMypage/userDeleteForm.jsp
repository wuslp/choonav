<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userDeleteForm</title>
</head>
<body>
	<form action="deletePro.cnav" method="post" >
		<table>
			<tr>
				<td>탈퇴를 원하시면 비빌번호를 입력하세요.</td>
			</tr>
			<tr>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td><input type="submit" value="탈퇴하기" onclick="return confirm('탈퇴를 원하시면 확인버튼을 눌러주세요')"></td>
			</tr>
		</table>
	</form>
</body>
</html>