<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>결재 문서 작성</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/approval.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	</head>
	
<script>
	function check(){
		var inputs= document.inputForm;
		if(! inputs.id1.value){
			alert("결재자를 선택해주세요.");
			return false;
		}
		if(! inputs.appStart.value){
			alert("시작일을 입력해주세요.");
			return false;
		}
		if(! inputs.appFinish.value){
			alert("종료일을 입력해주세요.");
			return false;
		}
		
		if(! inputs.appTitle.value){
			alert("문서 제목을 입력해주세요.");
			return false;
		}
		
		if(! inputs.appContent.value){
			alert("문서 내용을 입력해주세요.");
			return false;
		}
		
	}	
</script>	
	
<body class="sb-nav-fixed">
<c:if test="${sessionScope.sid == null}">
<script>
	alert("로그인후 이용할 수 있습니다");
	var link = "/cnav/main/startPage.cnav";
  		window.location.href = link;
</script>
</c:if>

	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
		<div id="wrapAll">	
	<h3> 결재 문서 작성 </h3>
	<form action="/cnav/approval/appPro.cnav" method="post"  name="inputForm"  onsubmit="return check()">
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
		<select name="id1">
			<option value="">선택</option>
				<c:forEach var="users" items="${list}">
					<option value="${users.userId}">${users.name} ${users.position}</option>
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
				<td><textarea rows="10" cols="60" name="appContent"></textarea></td>
			</tr>
			<tr>
				<td> 요청사항 </td>
				<td><input type="text" name="appRequest"></td>
			</tr>
		</table>
		
			<div class="appConBtn">
				<input type="submit" value="등록"/>
				<input type="button" value="취소" onclick="window.location='/cnav/approval/sendAppList.cnav'"/>
			</div>
	</form>	
	
	
			</div> <!-- wrapAll -->	
	<jsp:include page="/include/footer.jsp" />
		</div> <!-- layoutSidenav_content" -->
		</div><!-- id="layoutSidenav" -->	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</body>
</html>