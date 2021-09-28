<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>WriteForm </title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<script>
	//유효성 검사 
	function check(){
		var inputs=document.inputForm;
		if(! inputs.proName.value){
			alert("프로젝트 제목을 입력해주세요 ");
			return false;
		}
		if(! inputs.proContent.value){
			alert("내용을 입력해주세요");
			return false;
		}
		if(! inputs.proStart.value){
			alert("시작일을 입력해주세요");
			return false;
		}
		if(! inputs.proEnd.value){
			alert("종료일을 입력해주세요");
			return false;
		}
		if(! inputs.dept.value){
			alert("부서를 선택해주세요");
			return false;
		}
	}
</script>	
	<script>	
	$(document).ready(function(){
		$("#proEnd").change(function(){
			var proStart=$("#proStart").val();
			var proEnd=$("#proEnd").val();
			if(proStart>proEnd){
				alert("시작일보다 큰 날짜를 선택해주세요");
				$("#proEnd").empty();
			}
		})
	})	
</script>

<body class="sb-nav-fixed">
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	   		window.location.href = link;
	   		</script>
		</c:if>
		
		<jsp:include page="/include/top_nav_bar.jsp" />
		<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">


	<br/>
	<h1 align="center">프로젝트 작성</h1>
	<form action="/cnav/project/proWritePro.cnav" method="post" name="inputForm" onsubmit="return check()">
		<table>
			<tr>		
				<td align="center">
					<input type="text" name="proName" placeholder="프로젝트이름"/></td>
			</tr>
			<tr>		
				<td align="center">
					<input type="text" name="proContent" placeholder="내용을 입력해주세요"/>
				</td>			
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
 						<option value="">부서선택</option> 
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
					<input type="button" value="취소" onclick="window.location='/cnav/project/proList.cnav'" />
				</td>
			</tr>		
		</table>
	</form>
	<jsp:include page="/include/footer.jsp" />
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
	</div>
</body>
</html>