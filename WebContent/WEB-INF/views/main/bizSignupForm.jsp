<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bizSignupForm</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#code").change(function(){//회사코드 입력란에 변화가 있을떄 동작
		var idVal =$("#code").val();//회사코드 입력란에 사용자가 작성한 값을 받는다
		console.log("code : "+idVal);
		//ajax요청 
			$.ajax({
				url : "/cnav/main/ajaxCodeAvail.cnav",
				type : "post",
				data : {code: idVal},
				success:function(data){
					console.log("success!!!");
					console.log("data : " + data);
					//결과 div 영역에 적용
					$('#codeCheckRes').text(data);
					$('#codeCheckRes').css('color', 'red');
				},
				error:function(e){
					console.log("error~!");
					console.log(e);
				}
			});//ajax
		});//change
	});//ready//회사코드 중복검사
		function check(){
			//회사 코드 미작성시 가입불가	
			if($("#code").val()==""){
				alert("회사코드는 필수 입니다");
				$("#code").focus();
				return false;
			}
			//회사 코드 중복시 가입불가
			if($("#codeCheckRes").text()=="사용중인 회사코드입니다"){
				alert("회사코드 중복을 확인해 주세요");
				$("#code").focus();
				return false;
			}
			if($("#bizName").val()==""){
				alert("회사명은 필수 입니다");
				$("#bizName").focus();
				return false;
			}
			if($("#bizCEO").val()==""){
				alert("대표자명은 필수 입니다");
				$("#bizCEO").focus();
				return false;
			}
			if($("#bizNumber").val()==""){
				alert("사업자 번호는 필수 입니다");
				$("#bizNumber").focus();
				return false;
			}
			if($("#bizTel").val()==""){
				alert("전화번호는 필수 입니다");
				$("#bizTel").focus();
				return false;
			}
			
		}
	</script>
</head>
<body>
	<div id="">
		<div id="">
		<!-- 유효성 중복체크 추가 -->
		<!-- 회사코드 입력 안된경우에 비즈니스계정 만들기페이지로 자동이동-->
			<h1>비즈니스 계정으로 신청</h1>
			<form action="/cnav/main/bizSignupPro.cnav" onsubmit="return check()">
				회사코드(필수) : <input type="text" name="code" id="code"/><br/>
				<div id="codeCheckRes"></div><br/>
				회사명(필수) : <input type="text" name="bizName" id="bizName"/><br/>
				대표자명(필수) : <input type="text" name="bizCEO" id="bizCEO"/><br/>
				사업자 번호(필수) : <input type="text" name="bizNumber" id="bizNumber"/><br/>
				전화번호(필수) : <input type="text" name="bizTel" id="bizTel"/><br/>
				이메일 : <input type="text" name="bizEmail" id="bizEmail"/><br/>
				체크박스 : 
				<fieldset>
					<label><input type="checkbox" name="approval" value="1" checked/>결재</label>
					<label><input type="checkbox" name="mail" value="1" />메일</label>
					<label><input type="checkbox" name="attend" value="1" />근태</label>
					<label><input type="checkbox" name="project" value="1" />프로젝트</label>
					<label><input type="checkbox" name="calendar" value="1" />스케쥴</label>
					<label><input type="checkbox" name="reservation" value="1" />예약</label>
					<label><input type="checkbox" name="board" value="1" />게시판</label>
					<label><input type="checkbox" name="poll" value="1" />신청</label>
				</fieldset><br/><br/>
				<input type="submit" value="신청"/>
				<input type="reset" value="재작성"/>
				<input type="button" onclick="history.back();" value="취소"/>
			</form>
		</div>
	</div>

</body>
</html>