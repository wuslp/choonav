<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>결재 문서 작성</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	</head>
	
<script>
	function check(){
		if(appTitle==""){
			alert("제목을 입력해주세요.");
			$("#appTitle").focus();
			return false;
		}
		if(name1==""){
			alert("제목을 입력해주세요.");
			$("#name1").focus();
			return false;
		}
	}	
	
	
</script>	
	
<body>

	<h2> 결재 문서 작성 </h2>
	<form action="/cnav/approval/appPro.cnav" method="post" onsubmit="return check()">
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
			<option value="">선택</option>
				<c:forEach var="users" items="${cnavUsers}">
					<option value="${users.userId}">${users.userId}</option>
				</c:forEach> 	
		</select><br/>
		
		일시
		시작일 <input type="date" name="appStart"/>
		종료일 <input type="date" name="appFinish"/>
		<br/>
		
		<table>
			<tr>
				<td> 제목 </td>
				<td><input type="text" name="appTitle" id="appTitle"></td>
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