<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>userPwChangeForm</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
	//비밀번호 확인
		$('#pw2').blur(function(){
		   if($('#pw').val() != $('#pw2').val()){
		    	if($('#pw2').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#pw2').val('');
		          $('#pw2').focus();
		       }
		    }
		   if(($('#pw1').val() == $('#pw2').val()) && ($('#pw1').val() == $('#pw').val())){
			    alert("현재 비밀번호와 동일 합니다.");
		    	    $('#pw').val('');
		    	    $('#pw2').val('');
		          	$('#pw').focus();
		    }
		})  	   
	});
</script>
<body>
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar_mypage.jsp" />
	<div id="layoutSidenav_content">
	<div id="wrapAll">
	
	<h3> 비밀번호 변경 </h3>
	<form action="pwChangePro.cnav" method="post">
		<table>
			<tr>
				<td> 현재 비밀번호 </td>
				<td> <input type="password" name="nowPw"  id="pw1" required/> </td>
			</tr>
			<tr>
				<td> 새 비밀번호 </td>
				<td> <input type="password" name="newPw" id="pw" required/> </td>
			</tr>
			<tr>
				<td> 새 비밀번호 확인</td>
				<td> <input type="password" name="newPwCheck" id="pw2" required/> </td>
			</tr>
			<tr>
				<td> <input type="submit" value="변경하기" /></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</html>