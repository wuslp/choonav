<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결재 문서 수정</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="/cnav/approval/modifyAppPro.cnav?pageNum=${pageNum}" method="post">
	<%-- 숨겨서 글 고유번호 값 전송 --%>
	<input type="hidden" name="appNum" value="${approval.appNum}" />
	<br/>
	
	<div class="appContentTitle">
	<h3>${approval.appType}</h3>
	</div>
	
	<div class="appContentLeft">
		<table>
			<tr>
				<td>문서번호</td>
				<td>${approval.appNum}</td>	
			</tr>
			<tr>
				<td>기안부서</td>
				<td></td>
			</tr>
			<tr>
				<td>기안자</td>
				<td>${approval.userId}</td>
			</tr>
			<tr>
				<td>기안일자</td>
				<td>${approval.appDate}</td>
			</tr>
				
		</table>
	</div>
	
	<table class="appContentRight">
		<tr>
			<td>직위 </td>
			<td>직위 </td>
			<td>직위 </td>
		</tr>
		<tr>
			<td>결재자1 </td>
			<td>결재자2 </td>
			<td>결재자3 </td>
		</tr>
	
	</table>
	<br/><br/><br/><br/><br/><br/>
	<table class="appCont1">
		<tr>
			<td>요청부서</td>
			<td>${approval.dept}</td>
		</tr>
		<tr>
			<td>일시</td>
			<td>${approval.appStart} ~ ${approval.appFinish}</td>
		</tr>
	</table>
	
	<table class="appCont2">
		<tr>
			<td>제목</td>
			<td><input type="text" name="appTitle" value="${approval.appTitle}"/></td>
		</tr>
		<tr>
			<td>참석자</td>
			<td></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="appContent" value="${approval.appContent}"/></td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td><input type="text" name="appRequest" value="${approval.appRequest}"/></td>
		</tr>
	</table>
	
	<div class="appConBtn">
		<input type="submit" value="등록"/>
		<input type="button" value="취소" onclick="window.location='/cnav/approval/sendAppList.cnav'"/>
	</div>
</form>
</body>
</html>