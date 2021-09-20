<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>proContent</title>
</head>
<body>
	<br/>
	
	<table>
		<tr>
			<td colspan="2"><b>${project.proName}</b></td>
		</tr>
		<tr>
			<td>${project.dept}</td>
		</tr>
		<tr>
			<td>${project.proStart}~${project.proEnd}</td>
		</tr>
		<tr>
			<td colspan="2" height="100">${project.proContent}</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="window.location='/cnav/project/proModForm.cnav?proNum=${project.proNum}&pageNum=${pageNum}'">수정</button>
				<button onclick="window.location='/cnav/project/proDelForm.cnav?proNum=${project.proNum}&pageNum=${pageNum}'">삭제</button>
			</td>	
		</tr>
	
	
	
	
	
	</table>

</body>
	<br/>

</html>