<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정 - dept</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function updateDeptBtn(){
			var id = "${dto.userId}";
			var url = "updateDepUser.cnav";
			var deptVal = $("#dept option:selected").val(); // 선택된 dept값
			$.ajax({
				type : 'GET', // post 방식으로
				url : "updateDepUser.cnav?userId="+ id +"&dept=" + deptVal,
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
    
    <div align="center">
    <form>
        <input type = "hidden" id = "id" name = "id">
        <label>이름 : </label>
        	${dto.name}
        <br>
        <label>부서명 : </label>
        	<select id="dept" name="dept">
				<option value="마케팅팀">마케팅팀</option>
				<option value="영업팀">영업팀</option>
				<option value="인사팀">인사팀</option>
				<option value="총무팀">총무팀</option>
				<option value="디자인팀">디자인팀</option>
				<option value="개발팀">개발팀</option>
				<option value="기획팀">기획팀</option>
			</select>
        <br>
    </form>
    </div>
    <br />
    <div align="center">
	    <input type="button" value="수정하기" onclick="updateDeptBtn();"/>
	    <input type="button" value="닫기" onclick="self.close();"/>
	</div>


</body>
</html>