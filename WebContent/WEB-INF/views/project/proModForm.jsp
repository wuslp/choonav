<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프로젝트 수정</title>
</head>
<body>
	
	
	<h1 align="center">프로젝트 수정</h1>
	<form action="/cnav/project/proModPro.cnav?pageNum=${pageNum}" method="post">
	<!-- 고유번호 값 전송 -->
		<input type="hidden" name="proNum" value="${project.proNum}" />
		<table>
			<tr>
				<td align="center"><input type="text" name="proName" value="${project.proName}"/></td>
			</tr>
			<tr>
				<td align="center"><input type="text" name="proContent" value="${project.proContent}"/></td>
			</tr>
			<tr>
				<td>기간</td>
				<td>${project.proStart}~${project.proEnd}</td>
			</tr>
			<tr>
				<td>부서</td>
				<td align="left">${project.dept}</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"/>
					<input type="reset" value="재작성"/>
					<input type="button" value="취소" onclick="window.location='/cnav/project/proContent.cnav?proNum=${project.proNum}&pageNum=${pageNum}'"/>
				
				</td>	
			</tr>
		</table>	
	</form>
	
	
	
	
	
	
	
</body>
</html>