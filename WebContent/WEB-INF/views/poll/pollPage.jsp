<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pollForm page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	function check(){
		var result = $("#result").val();
		var pollNum = $("#pollN").val();
		console.log("result값"+result)
		if(result=="0"){//기록없으면
			console.log("2번탐");
				var pollNum = $("#pollN").val();
		        var obj_value = $("input:radio[name='ans1']:checked").val();
		        alert(obj_value);
		        //에이작스로 숫자보내고 그 숫자에 해당하면 res 각각 +1씩 시켜주기
		        $.ajax({
	 					url : "/cnav/poll/pollRes.cnav",
	 					type : "get",
	 					data :{"obj_value" :obj_value,"pollNum" :pollNum},
	 					async: false,
	 					success:function(data){//data매개변수 = Controller에서 리턴해준 결과가 들어온다(대입)
	 						console.log("success!!!");
	 						window.location.replace("/cnav/poll/pollRes.cnav?pollNum="+pollNum);
	 					},
	 					error:function(e){
	 						console.log("error~!");
	 						console.log(e);
	 					}
	 				});//ajax
			
		
		}else{//기록 있으면
			console.log("1번탐");
			alert("이미 투표한 글입니다 !")
			//window.history.back();
			window.location.replace("/cnav/poll/pollRes.cnav?pollNum="+pollNum);
		}
	}
	
	//투표삭제
	function DelPoll(){
		var pollNum=$("#pollN").val();
		alert("pollNum "+ pollNum +"삭제처리 ");
		$ajax({
			url:"/cnav/poll/pollDelete.cnav",
			type: "get",
			date:{"pollNum":pollNum},
			success: function(){
				alert("삭제 완료");
				window.location.replace("/cnav/poll/pollList.cnav");
			},
			error:function(e){
				console.log("error !");
				consolelog(e);
			}
			
		})
		
	}
	</script>
</head>
<body>
	<div id="">
		<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
		<div id=""> 
			<c:if test="${sessionScope.sid == null}">
			<script>
				alert("로그인후 이용할 수 있습니다");
				var link = "http://localhost:8080/cnav/main/startPage.cnav";
	    		window.location.href = link;
	    		</script>
			</c:if>
		</div>
		<div class="">
				<h1><a href="/cnav/main/main.cnav">Choonav 메인으로</a></h1>
		</div>
		<!--투표페이지 본문 시작  -->
		<div id="">
			<h1> 투표 </h1>
				<input type="hidden" value="${article.pollNum}" id="pollN"/>
				<input type="hidden" value="${result}" id="result"/>
				<div id="">
					투표기간	<fmt:formatDate value="${article.stDate}" pattern="yyyy-MM-dd"/><strong>~</strong><fmt:formatDate value="${article.endDate}" pattern="yyyy-MM-dd"/><br/>
					제목		 : ${article.pollTitle}<br/>
					대상		 : ${article.target}<br/>
					내용		 : ${article.pollCon}<br/>
					항목 <br/>
					1 :<input type="radio" id="ans1" name="ans1" value="1"/>${article.ans1}<br/>
					2 :<input type="radio" id="ans2" name="ans1" value="2"/>${article.ans2}<br/>
					<c:if test="${article.ans3 != null}">
					3 :<input type="radio" id="ans3" name="ans1" value="3"> ${article.ans3}<br/>
					</c:if>
					<c:if test="${article.ans4 != null}">
					4 :<input type="radio" id="ans4" name="ans1" value="4"> ${article.ans4}<br/><br/><br/>
					</c:if>
					<!-- 투표글 작성자일경우만 삭제버튼 보이게 처리 -->
					<c:if test="${article.userId == sessionScope.sid}">
						<input type="button" value="삭제" onclick="window.location='/cnav/poll/pollDelete.cnav?pollNum=${article.pollNum}'" id="">
						<!-- <input type="button" value="삭제" onclick="DelPoll()"> -->
					</c:if>
					<!-- 투표대상이 전체이거나 해당할때 -->
					<c:if test="${userIdDept==article.target && article.target=='전체'}">
						<c:set value="${result }" var="result"/>
						<c:if test="${article.pollStatus eq '진행중' }">
							 <input type="button" value="투표" id="" onclick="check()"> 
						</c:if>
					</c:if>	
					<!-- 투표대상이 해당하지 않을때 -->
					<c:if test="${userIdDept!=article.target && article.target!='전체'}">
						<input type="button" value="투표대상이 아닙니다" disabled> 
					</c:if>
					<!-- 마감된 투표일때 -->
					<c:if test="${article.pollStatus eq '완료' }">
							<input type="button" value="마감된 투표" id="" disabled>
							<input type="button" value="결과보기" onclick="window.location='/cnav/poll/pollResult.cnav?pollNum=${article.pollNum}'">
					</c:if>
					<input type="button" value="취소" id="" onClick="window.location='/cnav/poll/pollList.cnav'">
				</div>
			
		</div>
	</div>
</body>
</html>