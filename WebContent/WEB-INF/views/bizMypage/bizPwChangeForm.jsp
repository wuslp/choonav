<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bizPwChangeForm</title>
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
</body>
</html>