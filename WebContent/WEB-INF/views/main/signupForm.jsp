<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>signup Form</title>
	<!-- 로고 글씨체 -->	
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
	<link href="https://fonts.googleapis.com/css2?family=Charm&family=Playball&display=swap" rel="stylesheet">
	
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#userId").change(function(){	//id입력란에 변화가 있을떄 동작
		var idVal =$("#userId").val();//id입력란에 사용자가 작성한 값을 가져오기
		console.log("userId : "+idVal);
		//ajax요청 
			$.ajax({
				url : "/cnav/main/ajaxIdAvail.cnav",
				type : "post",
				data : {userId: idVal},
				success:function(data){//data매개변수 = Controller에서 리턴해준 결과가 들어온다(대입)
					console.log("success!!!");
					console.log("data : " + data);
					//결과를 idCheckRes 태그에 적용 코드
					$('#idCheckRes').text(data);//텍스트
					$('#idCheckRes').css('color', 'red');//강조
				},
				error:function(e){
					console.log("error~!");
					console.log(e);
				}
			});//ajax
		});//change
		//관리자가 회사코드로된 계정을 계설했을때만 일반회원이 회사코드로 가입가능하도록
		$("#code").change(function(){	//code입력란에 변화가 있을떄 동작
		var codeVal =$("#code").val();
		console.log("code : "+codeVal);
		//ajax요청 
			$.ajax({
				url : "/cnav/main/ajaxCodeCheck.cnav",
				type : "post",
				data : {code: codeVal},
				success:function(data){//data매개변수 = Controller에서 리턴해준 결과가 들어온다(대입)
					console.log("success!!!");
					console.log("data : " + data);
					//결과를 idCheckRes 태그에 적용 코드
					$('#codeCheckRes').text(data);//텍스트
					$('#codeCheckRes').css('color', 'red');//강조
				},
				error:function(e){
					console.log("error~!");
					console.log(e);
				}
			});//ajax
		});//change
		//email 양식 유효성 검사
		$("#email").change(function(){	//email입력란에 변화가 있을떄 동작
			var emailVal =$("#email").val();
			console.log("email : "+emailVal );
				$.ajax({
					url : "/cnav/main/ajaxEmailAvail.cnav",
					type : "post",
					data : {email: emailVal},
					success:function(data){
						console.log("success!!!");
						//결과를 emailCheckRes 태그에 적용
						$('#emailCheckRes').text(data);//텍스트
						$('#emailCheckRes').css('color', 'red');//강조
					},
					error:function(e){
						console.log("error~!");
						console.log(e);
					}
				});//ajax
			});//change
	});//ready //id 중복검사 and 회사코드 가입가능검사
		
		function check(){
			var checkCode = $("#codeCheckRes").text();
			//관리자가 회사코드로 개설한 코드의 회사직원만 가입할 수 있도록
			if(checkCode=="관리자가 회사계정을 먼저 개설해 주세요"){
				alert("회사계정을 개설해 주세요. 회사코드 공백 필요 !!");
				$("#code").focus();
				return false;
			}
			var codeVal = $("#code").val();
			//회사코드 관리자코드 가입불가 
			if(codeVal=="0000"){
				alert("해당 회사코드는 가입할수 없습니다");
				$("#code").focus();
				return false;
			}
			
			var userId = $("#userId").val();
			//id입력란 필수 
			if(userId==""){
				alert("id 는 필수 입니다");
				$("#userId").focus();
				return false;
			}
			var checkId = $("#idCheckRes").text();
			//id중복안되게
			if(checkId=="사용중인 아이디 입니다"){
				alert("id 중복을 확인해 주세요");
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
			//이메일 필수
			if($("#email").val()==""){
				alert("email 은 필수입니다")
				$("#email").focus();
				return false;
			}
			var checkEmail = $("#emailCheckRes").text();
			//email 양식 검사
			if(checkEmail=="이메일 형식을 확인해 주세요"){
				alert("이메일은 xxxx@xxx.xxx 형식이여야 합니다");
				$("#email").focus();
				return false;
			}

		}//check
	
	</script>
</head>
<body>

<div class="main-container">
		<div class="header">
				<h1><a href="/cnav/main/startPage.cnav">Choonav</a></h1>
		</div>
	<div class="signup">	
		<h1>회원가입</h1>
		<form action="/cnav/main/signupPro.cnav" method="post" onsubmit="return check()">
		<br/>
		<table>
			<tr>
				<td>
					회사코드
				</td>
				<td>
					<input type="text" name="code" id="code"/>
					<div id="codeCheckRes"></div>
				</td>
			</tr>
			<tr>
				<td>
					아이디(*)
				</td>
				<td>
					<input type="text" name="userId" id="userId" autofocus/>
					<div id="idCheckRes"></div>
				</td>
			</tr>
			<tr>
				<td>
					비밀번호(*)
				</td>
				<td>
					<input type="password" name="pw" id="pw"/>
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 확인
				</td>
				<td>
					<input type="password" name="pwch" id="pwch"/>
				</td>
			</tr>
			<tr>
				<td>
					이름(*)
				</td>
				<td>
					<input type="text" name="name" id="name"/>
				</td>
			</tr>
			<tr>
				<td>
					전화번호
				</td>
				<td>
					<input type="text" name="tel" />
				</td>
			</tr>
			<tr>
				<td>
					이메일(필수)
				</td>
				<td>
					<input type="text" name="email" id="email" placeholder="cnav@gmail.com"/>
					<div id="emailCheckRes"></div>
				</td>
			</tr>
			<tr>
				<td>
					부서
				</td>
				<td>
					<select id="dept" name="dept">
							<option value="영업팀" selected>마케팅팀</option>
							<option value="영업팀">영업팀</option>
							<option value="인사팀">인사팀</option>
							<option value="총무팀">총무팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
							<option value="기획팀">기획팀</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					직위
				</td>
				<td>
					<select id="position" name="position">
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
				</td>
			</tr>
					
		</table>
			<!-- 회사코드  <input type="text" name="code" /><br/>
			id(필수) <input type="text" name="userId" id="userId"/><br/>
			<div id="idCheckRes"></div><br/>
			비밀번호(필수)  <input type="password" name="pw" id="pw"/><br/>
			비밀번호 확인 <input type="password" name="pwch" id="pwch"/><br/><br/>
			이름(필수)  <input type="text" name="name" id="name"/><br/>	
			부서  <select id="dept" name="dept">
							<option value="영업팀" selected>마케팅팀</option>
							<option value="영업팀">영업팀</option>
							<option value="인사팀">인사팀</option>
							<option value="총무팀">총무팀</option>
							<option value="디자인팀">디자인팀</option>
							<option value="개발팀">개발팀</option>
							<option value="기획팀">기획팀</option>
					</select><br/>
			직위  <select id="position" name="position">
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
			전화번호  <input type="text" name="tel" /><br/>
			이메일  <input type="text" name="email" /><br/><br/>
			</div><br/> -->
			<div class="sign-button">
			<input type="submit" value="가입"/>
			<input type="button" value="취소" onclick="history.back();"/>
			</div>
		</form>
		</div>
	</div>
	
</body>
</html>