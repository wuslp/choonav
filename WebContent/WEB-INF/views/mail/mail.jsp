<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메일 본문 확인</title>
	
<script>
	function del(num) {
		var chk = confirm("삭제하시겠습니까?");
		if (chk) {
			location.href='/cnav/mail/deleteForm.cnav?num='+num;
		}
	}
</script>
</head>
<body>
	<br />
		<div>
			<div>
				<h4> ${mail.mailSub} </h4>
			</div>
			<div>
				<c:if test="${mail.mailRid == id}">
					보낸 사람 : ${mail.userId}
				</c:if>
				<c:if test="${mail.userId == id}">
					받는 사람 : ${mail.mailRid}
				</c:if>
			</div>
			<div>
				첨부파일 : ${mail.mailFile }
			</div>
			<div>
				${mail.mailReg}
			</div>
			<br />
			<br />
			<div style="border: 1px solid; float: center; padding: 10px; width: 33%;">
				${mail.mailContent}
			</div>
			<br />
			<br />
			<div>
				<input type="button" value="삭제" onclick="del(${mail.mailNum})" />
				<c:if test="${mail.mailRid == id}">
					<input type="button" value="목록" onclick="window.location='/cnav/mail/recMailList.cnav'"/>
				</c:if>
				<c:if test="${mail.userId == id}">
					<input type="button" value="목록" onclick="window.location='/cnav/mail/sendMailList.cnav'"/>
				</c:if>
			</div>
		</div>
	
</body>
</html>