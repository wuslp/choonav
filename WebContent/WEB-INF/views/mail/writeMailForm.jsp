<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메일 보내기</title>
</head>

<body>
	<br />
	<h1 align="center"> 메일 보내기 </h1>
	<form action="/cnav/mail/writeMailPro.cnav" method="post" style="center;">
		<div style="text-align: center;">
			<div>
				<select name="mailRid">
				<option value="">선택</option>
				<c:forEach var="userList" items="${userList}">
					<option value="${userList.userId}">${userList.name} ${userList.position}</option>
				</c:forEach> 	
				</select>
			</div>
			<div>
				첨부파일 : <input type="button" name="mailFile" value="pc에서 등록"/>
			</div>
			<div>
				<input type="text" name="mailSub" placeholder="제목" />
			</div>
			<div>
				<textarea rows="40" cols="100" name="mailContent" placeholder="내용을 작성해 주세요"></textarea>
			</div>
			<div>
				<input type="submit" value="보내기" />
				<input type="button" value="취소" onclick="window.location='/cnav/mail/recMailList.cnav'"/>
			</div>
		</div>
	</form>
	
</body>
</html>