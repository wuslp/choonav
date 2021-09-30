<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>pollForm page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/AttendPoll.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){//댓글등록
				
		$("#comSubmit").click(function(){
			//var p_Content = document.getElementById('#textarea');
		    var p_Content = $("textarea#pContent").val();    //댓글의 내용값 가져옴
		    console.log(p_Content);
		    var pollNum =  "${article.pollNum}";//el태그로 넘어온값 그대로 보내기위해 변수에 담음
		    console.log(pollNum);	    
		    var params = {"pollNum" : pollNum, "pollComment" : p_Content};
		    if(p_Content!=""){;
			    $.ajax({
			        type: "post", //데이터를 보낼 방식
			        url: "/cnav/poll/pollInsertComm.cnav", //데이터를 보낼 url
			        data: params, //보낼 데이터
			        success: function(data){ //데이터를 보내는 것이 성공했을 시 출력되는 메시지
			        	if(data==1){
			            	alert("댓글이 등록되었습니다.");
			            	window.location.replace("/cnav/poll/pollPage.cnav?pollNum="+pollNum);
			        	}
			        }
			    });//ajax
		    }else{//댓글 유효성 검사
		    	alert("댓글내용을 입력해 주세요");
		    }
		});//click
		/*댓글삭제
		$("#deleteCom").click(function(){
			var answer = confirm("삭제 하시겠습니까?");
	        if(answer==true){
	        //댓글 삭제를 하기위해 댓글 번호, 글 번호, 그리고 게시글 세부 페이지로 포워딩 하기 위해 페이지 관련 값들을 변수에 저장한다.
	            var pollNum = "${article.pollNum}";
	            var pollComNum = $("#pollComNum").val();
	            var ComId = $("#ComId").val();
	            var params = {"ComId":ComId, "pollComNum":pollComNum};
	            //ajax로 보내주기
	            $.ajax({
			        type: "post",
			        url: "/cnav/poll/commDelete.cnav",
			        data: params,
			        success: function(data){
			        	if(data!=1){
			            	alert("댓글 작성자만 삭제할 수 있습니다");
			            	window.location.replace("/cnav/poll/pollPage.cnav?pollNum="+pollNum);
			        	}else{
				            alert("댓글이 삭제되었습니다.");	
			            	window.location.replace("/cnav/poll/pollPage.cnav?pollNum="+pollNum);
			        	}
			        }
			    });//ajax
	        }//answer
	    });*/
		
	});//function
		
	function check(){
		var result = $("#result").val();
		var pollNum = $("#pollN").val();
		console.log("result값"+result)
		if($(':radio[name="ans1"]:checked').length < 1){//투표 유효성 검사
			alert("항목을 선택해 주세요");
		}else{//유효성검사 통과
			
			if(result=="0"){//기록없으면
				console.log("2번탐");
					var pollNum = $("#pollN").val();
			        var obj_value = $("input:radio[name='ans1']:checked").val();
			        alert(obj_value+"항목에 투표하셨습니다");
			        //에이작스로 숫자보내고 그 숫자에 해당하면 res 각각 +1씩 시켜주기
			        $.ajax({
		 					url : "/cnav/poll/pollRes.cnav",
		 					type : "get",
		 					data :{"obj_value" :obj_value,"pollNum" :pollNum},
		 					async: false,
		 					success:function(data){//data매개변수 = Controller에서 리턴해준 결과가 들어온다(대입)
		 						console.log("success!!!");
		 						window.location.replace("/cnav/poll/pollResult.cnav?pollNum="+pollNum);
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
				window.location.replace("/cnav/poll/pollResult.cnav?pollNum="+pollNum);
			}//else끝
		}//유효성검사통과하면
	}
	
	//투표삭제
	function DelPoll(){
		var pollNum="${article.pollNum}";
		var pollTitle="${article.pollTitle}";
		var answer=confirm(pollTitle+"을(를)" +"삭제하시겠습니까? ");
		if(answer==true){
			$.ajax({
				url:"/cnav/poll/pollDelete.cnav",
				type: "post",
				data:{pollNum : pollNum},
				success: function(data){
					alert("삭제 완료");
					window.location.href="/cnav/poll/pollList.cnav";
				},
				error:function(e){
					console.log("error !");
					consolelog(e);
				}
				
			})
		}else{
			alert("삭제취소");
		}
		
	}
	</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
			<div id="">
				<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
				<div id=""> 
					<c:if test="${sessionScope.sid == null}">
					<script>
						alert("로그인후 이용할 수 있습니다");
						var link = "/cnav/main/startPage.cnav";
			    		window.location.href = link;
			    		</script>
					</c:if>
				</div>
				<!--투표페이지 본문 시작  -->
				<div id="wrapAll">
					<div id="">
						<h3> 투표 </h3>
						<div class="pollPageWrap">
							<div class="pollconPageWrap">
								<input type="hidden" value="${article.pollNum}" id="pollN"/>
								<input type="hidden" value="${result}" id="result"/>
								
								<div id="">
									<br/><br/><i class="far fa-calendar-check"></i> 투표기간	: <fmt:formatDate value="${article.stDate}" pattern="yyyy-MM-dd"/><strong>~</strong><fmt:formatDate value="${article.endDate}" pattern="yyyy-MM-dd"/><br/>
									제목		 : ${article.pollTitle}<br/>
									대상		 : ${article.target}<br/>
									내용		 : ${article.pollCon}<br/>
									<div class="pollChoise">
										<i class="fas fa-poll-h"></i>
										항목 <br/>
										1 :&emsp;<label><input type="radio" id="ans1" name="ans1" value="1" class="ans"/>&nbsp; ${article.ans1}</label><br/>
										2 :&emsp;<label><input type="radio" id="ans2" name="ans1" value="2"/>&nbsp; ${article.ans2}</label><br/>
										<c:if test="${article.ans3 != null}">
										3 :&emsp;<label><input type="radio" id="ans3" name="ans1" value="3">&nbsp; ${article.ans3}</label><br/>
										</c:if>
										<c:if test="${article.ans4 != null}">
										4 :&emsp;<label><input type="radio" id="ans4" name="ans1" value="4">&nbsp; ${article.ans4}</label>
										</c:if>
									</div>
							</div>
						</div><br/>
									<!-- 투표대상이 전체이거나 해당할때 -->
									<c:if test="${userIdDept==article.target || article.target=='전체'}">
										<!-- 해당 id가 투표기록이 있는지 확인 result -->
										<c:set value="${result }" var="result"/>
										<c:if test="${article.pollStatus eq '진행중' }">
											 <input type="button" value="투표" id="" onclick="check()"> 
										</c:if>
									</c:if>	
									
									<!-- 투표대상이 해당하지 않을때 -->
									<c:if test="${!(userIdDept==article.target || article.target=='전체')}">
										<input type="button" value="투표대상이 아닙니다" disabled> 
									</c:if>
									<!-- 마감된 투표일때 -->
									<c:if test="${article.pollStatus eq '완료' }">
											<input type="button" value="마감된 투표" id="" disabled>
											<input type="button" value="결과보기" onclick="window.location='/cnav/poll/pollResult.cnav?pollNum=${article.pollNum}'">
									</c:if>
									<input type="button" value="리스트로" id="" onClick="window.location='/cnav/poll/pollList.cnav'">
									<!-- 투표글 작성자일경우만 삭제버튼 보이게 처리 -->
									<c:if test="${article.userId == sessionScope.sid}">
		<%-- 								<input type="button" value="삭제" onclick="window.location='/cnav/poll/pollDelete.cnav?pollNum=${article.pollNum}'" id="">
		 --%>								<input type="button" value="삭제" onclick="DelPoll()" id="">
									</c:if>
									<!--회사 관리자일경우 삭제보이게  -->
									<c:if test="${article.userId != sessionScope.sid &&sessionScope.sauth=='1'}">
										<c:if test="${sessionScope.sauth == '1'}">
		<%-- 									<input type="button" value="삭제" onclick="window.location='/cnav/poll/pollDelete.cnav?pollNum=${article.pollNum}'" id="">
		 --%>									<input type="button" value="삭제" onclick="DelPoll()" id="">
										</c:if>
									</c:if>
								</div>
					</div><!--투표페이지 본문 끝  --><br/><br/><br/>
					
					<div class="commCenter"><!-- 투표페이지 댓글 -->
						<strong>댓글로 의견을 나눠보세요</strong> <br/><textarea rows = "2" cols = "80" id = "pContent" name = "pContent" placeholder="여기에 내용을 써보세요"></textarea>
	    				<input type="button" id="comSubmit" name="comSubmit" value="댓글등록">
	    				<br>
					</div>
					<!-- 댓글 목록 -->
					<c:if test="${ComList!=null }">
	<%-- 				<input type="hidden" value="${ComList[0]}" id="pollComNum"/>--%>
						<c:forEach items="${ComList }" var="ComList">
							<div >
								<input type="hidden" value="${ComList.pollComNum }" id="pollComNum">
								<strong><c:out value="${ComList.userId}"></c:out></strong>&emsp;&emsp;
								<c:out value="${ComList.pollReg}"></c:out>
								<br/>
								<pre><c:out value="${ComList.pollComment}"></c:out></pre>&emsp;
								<c:if test="${ComList.userId==sessionScope.sid}">
								<!-- <input type="button" value="삭제" id="deleteCom" name="deleteCom" /> -->
								<input type="button" value="삭제" onclick="window.location='/cnav/poll/commDelete.cnav?pollComNum='+${ComList.pollComNum }+'&pollNum='+${ComList.pollNum}"/>
								</c:if>
							</div>
						</c:forEach>
					</c:if>
					</div><br/><br/>
				</div>
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