<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결재 문서 작성</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	</head>
	<!-- check == 0 : 비로그인 check == 1 : 로그인 -->
<%-- <c:if test="${check ==0}">
	<script>
		alert("로그인 후 이용해주세요.");
		window.location = "";
	</script>
</c:if> --%>
	
	
<body>
	<h2> 결재 문서 작성 </h2>
	<form action="/cnav/approval/appPro.cnav" method="post">
		<input type="hidden" name="appNum" value="${appNum}"/>
		문서형식 
		<select name="appType">
			<option value="품의서">품의서</option> 
			<option value="보고서">보고서</option> 
			<option value="휴가신청서">휴가신청서</option>  
		</select>
		요청부서 	
		<select name="dept"> 
			<option value="마케팅">마케팅팀</option> 
			<option value="영업">영업팀</option> 
			<option value="기획">인사팀</option> 
			<option value="개발">총무팀</option> 
			<option value="개발">디자인팀</option> 
			<option value="개발">개발팀</option> 
			<option value="개발">기획팀</option> 
		</select><br/>
		결재자
		<select name="name1">
			<option value="java01" >java01</option> 
			<option value="java02" >java02</option> 
			<option value="java03" >java03</option> 
		</select>
		<select name="name2">
			<option value="java01" >java01</option> 
			<option value="java02" >java02</option> 
			<option value="java03" >java03</option>  
		</select>
		<select name="name3">
			<option value="java01" >java01</option> 
			<option value="java02" >java02</option> 
			<option value="java03" >java03</option> 
		</select><br/>
		
		일시
		시작일 <input type="date" name="appStart"/>
		종료일 <input type="date" name="appFinish"/>
		<br/>
		
		<table>
			<tr>
				<td> 제목 </td>
				<td><input type="text" name="appTitle"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td><textarea rows="20" cols="60" name="appContent"></textarea></td>
			</tr>
			<tr>
				<td> 요청사항 </td>
				<td><input type="text" name="appRequest"></td>
			</tr>
		</table>
	
		<input type="submit" value="등록"/>
		<input type="button" value="취소" onclick="window.location='/cnav/approval/sendAppList.cnav'"/>
	</form>	
</body>
</html>