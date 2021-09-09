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
		var result = $(result).val();
		if(result =="1"){//기록있으면
			window.history.back();
		}else{
			
		}
	}
	
	
	
	function test(){
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
 						//console.log("data : " + data);
 						//결과를 idCheckRes 태그에 적용 코드
 						//$("#idCheckRes").val(data);
 					},
 					error:function(e){
 						console.log("error~!");
 						console.log(e);
 					}
 				});//ajax
	    
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
<!-- 
		<c:if test="${sessionScope.sid == null}">
			<script>
				alert("로그인후 이용할 수 있습니다");
				history.go(-1);
			</script>
		</c:if>
 -->

	<div id="">
		<h1> 투표 </h1>
		<div id="">
			<!--  -->
				<input type="hidden" value="${article.pollNum}" id="pollN"/>
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
					<!--<c:if test="${article.userId == sessionScope.sid}">
						1.페이지 바로 매핑-->
						<!--
						<input type="button" value="삭제" onclick="window.location='/cnav/poll/pollDelete.cnav?pollNum=${article.pollNum}'" id="">
						2.
						<input type="button" value="삭제" onclick="DelPoll()">
					</c:if>-->
					<c:set value="${result }" var="result"/>
					<c:if test="${article.pollStatus eq '진행중' }">
						<!-- <input type="button" value="투표" id="" onclick="check(); test();"> -->
						<input type="button" value="투표" id="" onclick="test()">
					</c:if>
					<c:if test="${article.pollStatus eq '완료' }">
						<input type="button" value="마감된 투표" id="" disabled>
					</c:if>
					<input type="button" value="취소" id="" onClick="window.location='/cnav/poll/pollList.cnav'">
				
				</div>
			
		</div>
	</div>
</body>
</html>