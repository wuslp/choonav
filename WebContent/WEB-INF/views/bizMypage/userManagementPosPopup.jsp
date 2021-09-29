<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정 - Posi</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function updatePosBtn(){
			var id = "${dto.userId}";
			var url = "updateUser.cnav";
			var posiVal = $("#position option:selected").val(); // 선택된 position값
			$.ajax({
				type : 'GET', // post 방식으로
				url : "updatePosUser.cnav?userId="+ id + "&position=" + posiVal,
				async : false, // 전역변수 사용을 위한 false
				success : function(data){
					if(data == 1) {
						self.close();
						window.opener.parent.location.reload();
					}else{
						alert("수정 실패");
					}
					
				}
			})
				
		}
	</script>
</head>
<body>
	<br />
    <br />
    	
    <form>
    	<div align="center">
        <input type = "hidden" id = "id" name = "id">
        <label>이름 : </label>
        	${dto.name}
        <br>
        <label>직위 : </label> 
        	<select id="position" name="position">
				<option value="회장">회장</option>
				<option value="이사">이사</option>
				<option value="사장">사장</option>
				<option value="부장">부장</option>
				<option value="차장">차장</option>
				<option value="과장">과장</option>
				<option value="대리">대리</option>
				<option value="사원">사원</option>
				<option value="인턴">인턴</option>
			</select>
		</div>
    </form>
    	<br />
    	<div align="center">
		    <input type="button" value="수정하기" onclick="updatePosBtn();"/>
		    <input type="button" value="닫기" onclick="self.close();"/>
    	</div>

</body>
</html>