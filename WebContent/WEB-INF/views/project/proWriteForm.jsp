<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WriteForm </title>
	
</head>
		<!-- check == 0 : 비로그인 check == 1 : 로그인 -->
		<%-- <c:if test="${check ==0}">
			<script>
				alert("로그인 후 이용해주세요.");
				window.location = "";
			</script>
		</c:if> --%>

<body>

	<br/>
	<h1 align="center">프로젝트 작성</h1>
	<form action="/cnav/project/proWritePro.cnav" method="post">

		<table>
			<tr>		
				<td align="center">
					<input type="text" name="proName" placeholder="프로젝트이름"/></td>
			</tr>
			<tr>		
				<td align="center">
					<input type="text" name="proContent" placeholder="내용을 입력해주세요"/></td>
				
				
			</tr>
		</table>
		
		<table>			
			<tr>
				<td>기간 : </td>
				<td>시작일<input type="date" name="proStart"/>~</td>
				<td>종료일<input type="date" name="proEnd"/></td>		
			</tr>	
			<tr>
				<td>
					<select name="dept">
						<option value='부서선택'>부서선택</option>
						<option value='마케팅팀'>마케팅팀</option>
						<option value='영업팀'>영업팀</option>
						<option value='인사팀'>인사팀</option>
						<option value='총무팀'>총무팀</option>
						<option value='디자인팀'>디자인팀</option>
						<option value='개발팀'>개발팀</option>
						<option value='기획팀'>기획팀</option>	
					</select>
				</td>
			</tr>
			<tr>
				<td>	
					<input type="submit" value="작성" />
					<input type="reset" value="재작성" />
					<input type="button" value="삭제" onclick="window.location='/cnav/project/proList.cnav'" />
				</td>
			</tr>		
		</table>
	</form>
</body>



</html>