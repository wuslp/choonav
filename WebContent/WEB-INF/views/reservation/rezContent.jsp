<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div><h1> 예약확인 </h1></div>
		<div>예약일시 ${dto.sDate} ~ ${dto.eDate} </div>
		<div>예약항목 ${dto.category}</div>
		<div>예약자 ${dto.userId}</div>
		<div>목적 ${dto.content}</div>
		<div>등록일 ${dto.reg}</div>
		<input type="button" onclick="window.location='/cnav/rez/allRez.cnav'" value="목록으로"/>
		<c:if test="${dto.userId == sid}">
			<input type="button" onclick="deleteConfirm(${dto.rezNum})" value="삭제"/>
			<input type="button" onclick="rez/allRez3.cnav" value="수정"/>
		</c:if>
	</div>
</body>
<script>
	function deleteConfirm(rezNum){
		if(confirm("해당 예약을 삭제하겠습니까?") == true){
			window.location='rezDelete.cnav?myRez=0&rezNum=' + rezNum;
		}else{
			return;
		}
		
	}
</script>
</html>