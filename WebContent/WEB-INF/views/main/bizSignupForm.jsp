<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bizSignupForm</title>
	<!-- 로고 글씨체 -->
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
	<link href="https://fonts.googleapis.com/css2?family=Charm&family=Playball&display=swap" rel="stylesheet">
	
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		//회사코드 숫자유효성 , 중복 검사
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
		});//change//회사코드 중복검사
		
	});//ready
		function check(){
			//회사 코드 미작성시 가입불가	
			if($("#code").val()==""){
				alert("회사코드는 필수 입니다");
				$("#code").focus();
				return false;
			}		
			
			//회사 코드 중복시 가입불가
			if($("#codeCheckRes").text()!="사용할 수 있는 회사코드 입니다 :)"){
				alert("회사코드 입력을 확인해 주세요");
				$("#code").focus();
				return false;
			}
			//유효성 검사
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
			
			//이름 필수
			if($("#name").val()==""){
				alert("이름 은 필수 입니다");
				$("#name").focus();
				return false;
			}	
			
		}
		/* 
		제이쿼리로 하려면
		function check_input(){
			var codeCheck=document.biz.code.value;
			var num_check=/^[0-9]*$/;
			if(!num_check.test(codeCheck)){
				alert ( "숫자만 입력할 수 있습니다." );
				document.biz.code.value="";
				$("#code").focus();
			}
			
		} */
	
	</script>
</head>
<body>
<div class="main-container">
		<div class="header">
				<h1><a href="/cnav/main/startPage.cnav">Choonav</a></h1>
		</div>
	<div class="signup">	
		<!-- 유효성 중복체크 추가 -->
		<!-- 회사코드 입력 안된경우에 비즈니스계정 만들기페이지로 자동이동-->
			<h1>비즈니스 계정 신청</h1>
			<form action="/cnav/main/bizSignupPro.cnav" onsubmit="return check()" name="biz">
			<!-- userId를 signupForm에서 넘겨줌 -->
			<input type="hidden" name="userId" value="${signupId}"/>
				<table align="center">
					<tr>
						<td>
							회사코드(숫자만가능)(*)		
						</td>
						<td>
							<input type="text" name="code" id="code" onblur="check_input()" autofocus/><br/>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<div id="codeCheckRes"></div>					
						</td>
					</tr>
					<tr>
						<td>
							회사명(*)
						</td>
						<td>
							<input type="text" name="bizName" id="bizName"/><br/>						
						</td>
					</tr>
					<tr>
						<td>
							대표자명(*)
						</td>
						<td>
							<input type="text" name="bizCEO" id="bizCEO" placeholder="유재석"/>
						</td>
					</tr>
					<tr>
						<td>
							사업자번호(*)
						</td>
						<td>
							<input type="text" name="bizNumber" id="bizNumber"/>
						</td>
					</tr>
					<tr>
						<td>
							전화번호(*)
						</td>
						<td>
							<input type="text" name="bizTel" id="bizTel" placeholder="027865678"/>
						</td>
					</tr>
					<tr>
						<td>
							이메일
						</td>
						<td>
							<input type="text" name="bizEmail" id="bizEmail"/>
						</td>
					</tr>
				</table><br/>
					* 사용하실 기능을 선택해주세요 *
				<fieldset class="cate">
					<label><input type="checkbox" name="approval" value="1" checked/>결재</label>
					<label><input type="checkbox" name="mail" value="1" />메일</label>
					<label><input type="checkbox" name="attend" value="1" />근태</label>
					<label><input type="checkbox" name="project" value="1" />프로젝트</label>
					<label><input type="checkbox" name="calendar" value="1" />일정</label>
					<label><input type="checkbox" name="reservation" value="1" />예약</label>
					<label><input type="checkbox" name="topic" value="1" />자유게시판</label>
					<label><input type="checkbox" name="poll" value="1" />투표</label>
				</fieldset><br/>
				
				<div class="sign-button">
					<input type="submit" value="신청"/>
					<input type="reset" value="재작성"/>
					<input type="button" onclick="history.back();" value="취소"/>
				</div>
			</form>
	</div>
</div>

</body>
</html>