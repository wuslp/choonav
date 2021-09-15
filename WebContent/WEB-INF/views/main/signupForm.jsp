<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>signup Form</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#userId").change(function(){//id입력란에 변화가오면
				if($("#userId").val()==""){
					$("#idCh").val("아이디 값");
				}
				
				
			})
			
		})
		
		function check(){
			var userId = $("#userId").val();
			//id입력란 필수 
			if(userId==""){
				alert("id 는 필수 입니다");
				$("#userId").focus();
				return false;
			}
			//비밀번호 필수
			if($("#pw").val()==""){
				alert("pw 는 필수 입니다");
				$("#pw").focus();
				return false;
			}
			//비밀번호 일치
			if($("#pw").val() !=$("#pwch").val()){
				alert("비밀번호와 비밀번호 확인값이 다릅니다");
				$("#pw").focus();
				return false;
			}	
			//이름 필수
			if($("#name").val()==""){
				alert("이름 은 필수 입니다");
				$("#name").focus();
				return false;
			}	
		}
	
	</script>
</head>
<body>
	<div>
		<h1>회원가입</h1>
			<!-- 유효성 중복체크 추가 -->
		<form action="/cnav/main/signupPro.cnav" method="post" onsubmit="return check()">
			회사코드 : <input type="text" name="code" /><br/>
			id(필수) : <input type="text" name="userId" id="userId"/><br/>
			<div id="idCh"></div><br/>
			비밀번호(필수) : <input type="password" name="pw" id="pw"/><br/>
			비밀번호 확인 : <input type="password" name="pwch" id="pwch"/><br/>
			이름(필수) : <input type="text" name="name" id="name"/><br/>	
			부서 : <select id="dept" name="dept">
							<option value="영업팀" selected>마케팅팀</option>
							<option value="영업팀">영업팀</option>
							<option value="인사팀">인사팀</option>
							<option value="총무팀">총무팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
							<option value="기획팀">기획팀</option>
					</select><br/>
			직위 : <select id="position" name="position">
							<option value="회장" selected>회장</option>
							<option value="이사">이사</option>
							<option value="사장">사장</option>
							<option value="부장">부장</option>
							<option value="차장">차장</option>
							<option value="과장">과장</option>
							<option value="대리">대리</option>
							<option value="사원">사원</option>
							<option value="인턴">인턴</option>
					</select><br/>
			전화번호 : <input type="text" name="tel" /><br/>
			이메일 : <input type="text" name="email" /><br/>
			<input type="submit" value="가입"/>
			<input type="button" value="취소" onclick="history.back();"/>
		</form>
	</div>
	
</body>
</html>