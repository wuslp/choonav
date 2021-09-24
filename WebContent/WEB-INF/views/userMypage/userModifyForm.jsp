<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userModityForm</title>
</head>
<body>
	<form action="/cnav/my/modifyPro.cnav" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td>${userId}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="email" value="${dto.email}">
			</td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>
				<input type="text" name="tel" value="${dto.tel}">
			</td>
		</tr>
		<tr>
			<td>회사명</td>
			<td>${dto.bizName}</td>
		</tr>
		<tr>
			<td>부서명</td>
			<td>${dto.dept}</td>
		</tr>
		<tr>
			<td>직위</td>
			<td>${dto.position}</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정하기" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>