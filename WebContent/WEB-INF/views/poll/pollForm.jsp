<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pollForm page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	//필수항목 유효성 검사
	function check(){
		var stDate = document.getElementById("stDate");
		var endDate = document.getElementById("endDate");
		var pollTitle = document.getElementById("pollTitle");
		var target = document.getElementById("target");
		var ans1 = document.getElementById("ans1");
		var ans2 = document.getElementById("ans2");
		var stDate = document.getElementById("stDate");
		var endDate = document.getElementById("endDate");
		
		if(stDate.value==""){
			alert("시작일을 입력하세요");
			stDate.focus();
			return false;
		}
		if(endDate.value==""){
			alert("마감일을 입력하세요");
			endDate.focus();
			return false;
		}
		if(pollTitle.value==""){
			alert("투표 제목을 입력하세요");
			pollTitle.focus();
			return false;
		}
		if(target.value==""){
			alert("참여대상을 선택하세요");
			target.focus();
			return false;
		}
		if(ans1.value==""){
			alert("항목1을 입력하세요");
			ans1.focus();
			return false;
		}
		if(ans2.value==""){
			alert("항목2를 입력하세요");
			ans2.focus();
			return false;
		}
		if(endDate.value < stDate.value ){
			alert("시작날짜보다 큰 날짜를 선택해 주세요");
			endDate.focus();
			return false;
		}
	}// check 함수 여기까지	
	
	$(document).ready(function(){
		$("#endDate").change(function(){
			var startDate = $("#stDate").val();//stDate에 선택된 값 가져오기
			var endDate = $("#endDate").val();//endDate에 선택된 값 가져오기
			if(startDate > endDate){
				alert("시작일보다 큰 날짜를 선택해 주세요");
				$("#endDate").empty();
			}
			
		})
		
		
	})
	
	</script>
</head>
<body>
<!-- 
		<c:if test="${sessionScope.sid == null}">
			<script>
				alert("로그인후 이용할 수 있습니다");
				history.go(-1);
			</script>
		</c:if>
	<div align="right"> 
		<c:if test="${sessionScope.sid != null}">
			<button onclick="window.location='/cnav/member/logout.cnav'">로그아웃</button>
		</c:if>
	</div>

 -->
	<div id="">
		<h1>투표 만들기</h1>
		<div id="">
			<form action="/cnav/poll/pollPro.cnav" onsubmit="return check()" name="pF">
				<div id="">
				투표기간(필수) <input type="date" id="stDate" name="stDate" min=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> > <strong>~</strong> <input type="date" id="endDate" name="endDate" ><br/>
				제목(필수) <input type="text" id="pollTitle" name="pollTitle"/><br/>
				대상(필수) &nbsp;
					<select id="target" name="target">
						<option value="마케팅팀" selected>마케팅팀</option>
						<option value="영업팀">영업팀</option>
						<option value="인사팀">인사팀</option>
						<option value="총무팀">총무팀</option>
						<option value="디자인팀">디자인팀</option>
						<option value="개발팀">개발팀</option>
						<option value="기획팀">기획팀</option>
					</select><br/>
				내용 <input type="text" id="pollCon" name="pollCon"/><br/>
				항목<br/>
				1(필수) :<input type="text" name="ans1"/><br/>
				2(필수) :<input type="text" name="ans2"/><br/>
				3 		:<input type="text" name="ans3"/><br/>
				4 		:<input type="text" name="ans4"/><br/><br/><br/>
					<!-- 유효성 검사 추가 -->
					<input type="submit" value="만들기" id="" >
					<input type="button" value="취소" id="" onClick="window.location='/cnav/poll/pollList.cnav'">
				</div>
			</form>
		</div>
	</div>
</body>
</html>