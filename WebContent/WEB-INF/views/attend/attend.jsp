<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>attend page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/AttendPoll.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
 	$(document).ready(function(){
 		//여기서부터		
 		  $("#button1").on("click", function() {
				//#button1'값 가져오기
 		    	/* alert($('#button1').val()); */
				if($("#button1").val()=="출근"){
					//출근버튼클릭시
					//input 값에 현재시간 들어가도록 처리
					$("#worktime").val(new Date());
					$("#button1").val("출근완료");
					//DB에 인서트 처리
					//ajax요청 
	 				$.ajax({
	 					url : "/cnav/attend/insertTime.cnav",
	 					type : "post",
	 					async: false,
	 					success:function(){
	 						console.log("success!!!");
	 					},
	 					error:function(e){
	 						console.log("error~!");
	 						console.log(e);
	 					}
	 				});
					
					alert("출근");
					//location.reload();
				}
 		    })
 		    //else로 바꿔서 함수하나로도 가능함 
 		    $("#button2").on("click", function() {
				if($("#button2").val()=="퇴근"){
					$("#leavetime").val(new Date());
					$("#button2").val("퇴근완료");
					//DB에 인서트 처리
					//ajax요청 
	 				$.ajax({
	 					url : "/cnav/attend/insertTime2.cnav",
	 					type : "post",
	 					async: false,
	 					success:function(){
	 						console.log("success!!!");
	 					},
	 					error:function(e){
	 						console.log("error~!");
	 						console.log(e);
	 					}
					})
					alert("퇴근");
					location.reload();
				}
 		    })
 		    
 		 //필터링
 		 $("#attcategory").change(function(){
 			var attcategory = $("#attcategory").val();//select된값 가져오기
 			var search1 = $("#search1").val();//input값 가져오기
 			var search2 = $("#search2").val();//input값 가져오기
 			var pageNum = $(pageNum).val();//page값 가져오기
 			if(attcategory == ""){
 				window.location.replace("/cnav/attend/attend.cnav");
			 }else{
 				 //alert(attcategory+"리스트 필터링");
 				//ajax요청 
 				$.ajax({
 					url : "/cnav/attend/attend.cnav",
 					type : "get",
 					data :{"attcategory" :attcategory},
 						//"attcategory=" + selectCate+"&search1="+search1+"&search2="+search2+"&pageNum="+pageNum,
 					async: false,
 					success:function(data){//data매개변수 = Controller에서 리턴해준 결과가 들어온다(대입)
 						window.location.replace("/cnav/attend/attend.cnav?attcategory="+attcategory+"&pageNum"+pageNum);
 						//$(location).attr('href', 'http://localhost:8080/cnav/attend/attend.cnav?attcategory='attcategory)
 						console.log("success!!!");
 					},
 					error:function(e){
 						console.log("error~!");
 						console.log(e);
 					}
 				});//ajax
 				//location.reload();
 			 }
 		 })
 	})//ready
 	
 	$('#print').on('click', function(){

 		 window.print();  // 클릭액션 : 버튼클릭시 인쇄창팝업

 	  });



 	  $('#print').mouseover(function(){

 		  $(this).css("color",'#cdee1d');  // 마우스오버액션 : 커서가 올라갈 경우 다른색상으로 변경 

 	  });



 	  $('#print').mouseleave(function(){

 		  $(this).css("color",'#0c4276');  // 마우스릴리즈액션 : 커서가 밖에 위치할 경우 기존색상으로 변경 

 	  });

	function check(){
		var search1 = $("#search1").val();
		//조회 시작일 필수
		if(search1==""){
			alert("조회시작일을 선택해주세요");
			$("#search1").focus();
			return false;
		}
		var search2 = $("#search2").val();
		//조회 시작일 필수 
		if(search2==""){
			alert("조회마지막일을 선택해주세요");
			$("#search2").focus();
			return false;
		}
		if(search1 > search2){
			alert("마지막일은 시작일보다 작아야 합니다");
			$("#search1").focus();
			return false;
		}
	}
 <%-- 		$("#button1").click(){
			var worktime = document.getElementById("worktime");
			var btn1Val =$("#button1").val();
			console.log(btn1Val);
 			myFunction1();
 		}
 		$("#button2").click(){
			var leavetime = document.getElementById("leavetime");
			var btn2 = document.getElementById("button2");
 			myFunction2();
 		}
 	})

	function myFunction1() {
		  if (btn1.value == "출근") {
			btn1.value = "출근 완료";
		    worktime.value =new Date();
		  }
	}
	function myFunction2() {
		if (btn2.value == "퇴근") {
			btn2.value = "퇴근 완료";
			leavetime.value ="<%=new java.util.Date()%>";
		}
	} --%>
	</script>

</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
			<div id="layoutSidenav_content">
			<div id="wrapAll">
					<div id="" class="">
						<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
						<div id=""> 
							<c:if test="${sessionScope.sid == null}">
							<script>
								alert("로그인후 이용할 수 있습니다");
								//var link = "http://localhost:8080/cnav/main/startPage.cnav";
					    		//window.location.href = link;
					    		window.history.back();
					    		</script>
							</c:if>
						</div>
						<!--근태관리 페이지 본문 시작  -->
						<h3>근태 관리</h3>
						<!-- 실시간 날짜 -->
						<div class="attendLine"><br/>
							<h6>Today : <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /></h6>
							<div id="" class="attendButton">
								<!--출근 퇴근 기록여부에따른 버튼 able  -->
								<c:if test="${WTrecodeCheck =='1' }">
									<input type="button" value="출근완료" id="button1">
									<input type="datetime" id="worktime" value="${workTimeRecode }" disabled>
								</c:if>
								<c:if test="${WTrecodeCheck !='1' }">
									<input type="button" value="출근" id="button1">
									<input type="datetime" id="worktime" value="" pattern="\d{4}-\d{2}-\d{2}" disabled>
								</c:if>
								<c:if test="${LTrecodeCheck =='1' }">
									<input type="button" value="퇴근완료" id="button2">
									<input type="datetime" id="leavetime" value="${leaveTimeRecode }" disabled>
								</c:if>			
								<c:if test="${LTrecodeCheck !='1' }">			
									<input type="button" value="퇴근" id="button2" >
									<input type="datetime" id="leavetime" value="" disabled>
								</c:if>
							</div><br/><br/><br/><br/><br/>
							<div id="" class="">
									<form action="/cnav/attend/attend.cnav" method="get" onsubmit="return check()">
									<select id="attcategory" name="attcategory">
										<option value="">-- 선택 --</option>
										<option value="">전체</option>
										<option value="정상출근">정상출근</option>
										<option value="지각">지각</option>
										<option value='조퇴'>조퇴</option>
										<option value='휴가'>휴가</option>
									</select>
									<input type="date" min="2000-01-01" max=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> id="search1" name="search1"/>
									<strong>~</strong>
									<input type="date" min="" max=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> id="search2" name="search2"/>
									<input id="datesearch" type="submit" value="검색" />
									</form>
							</div>
											
									
							<div id="" >	
								<div align="right"><i id="print" style="cursor: pointer; color:#000000 " class="fa fa-print print-button fa-1x"  onclick="window.print()"></i><font size="1em" style="font-weight: bold; ">인쇄하기</font></div>
								<table class="cnavTable">
									<tr class="cnavList-top">
										<td>날짜</td>
										<td>&nbsp;근태</td>
										<td>&nbsp;출근</td>
										<td>&nbsp;퇴근</td>
										<td>기타</td>
									</tr>
									
									<c:if test="${userAttendList != null}">
										<c:forEach var="List" items="${userAttendList }">
										<tr id="">
											<td>&nbsp;<fmt:formatDate value="${List.attDate }" type="date"/></td>
											<td>
												<div class="stateOk" >
													<c:if test="${List.attendance=='정상출근' }">
														정상출근
													</c:if>
												</div>
												<div class="stateNow" >
													<c:if test="${List.attendance=='지각' }">
														지각
													</c:if>
												</div>
												<div class="stateRoading" >
													<c:if test="${List.attendance=='휴가' }">
														휴가
													</c:if>
												</div>
												<div class="stateRoading" >
													<c:if test="${List.attendance=='조퇴' }">
														조퇴
													</c:if>
												</div>
											</td>
											<td>&emsp;<fmt:formatDate value="${List.workTime }" pattern="HH:mm" /></td>
											<td>&emsp;<fmt:formatDate value="${List.leaveTime }" pattern="HH:mm" /></td>
											<td>${List.reason }</td>
										</tr>
										</c:forEach>
									</c:if>
									<c:if test="${userAttendList == null}">
										<tr>
											<td>근태기록이 존재하지 않습니다</td>	
										</tr>
									</c:if>
								</table>
							</div><br /> <br /> 
						</div><!-- attendLine -->
						
						<div id="" class=""><%-- 페이지 번호 --%>
							<div align="center">
							<c:if test="${count > 0}">
								<c:set var="pageBlock" value="3" />
								<fmt:parseNumber var="res" value="${count / pageSize}" integerOnly="true" />
								<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}" />
								<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true" />
								<fmt:parseNumber var="startPage" value="${result * pageBlock + 1}"/>
								<fmt:parseNumber var="endPage" value="${startPage + pageBlock -1}" />
								<c:if test="${endPage > pageCount}">
									<c:set var="endPage" value="${pageCount}" /> 
								</c:if>
								<%-- 검색 안했을때 페이지번호들   --%> 
								<c:if test="${category == null}">
									<c:if test="${search1 == null }">
										<c:if test="${search2 == null }">
											<c:if test="${startPage > pageBlock}">
												<a href="/cnav/attend/attend.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
											</c:if>
											<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
												<a href="/cnav/attend/attend.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
											</c:forEach>
											<c:if test="${endPage < pageCount}">
												&nbsp; <a href="/cnav/attend/attend.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
											</c:if>
										</c:if>
									</c:if>
								</c:if>	
								
								<%-- 카테고리 검색했을때 페이지번호들 --%>
								<c:if test="${category != null}">
									<c:if test="${search1 == null }">
										<c:if test="${search2 == null }">
											<c:if test="${startPage > pageBlock}">
												<a href="/cnav/attend/attend.cnav?pageNum=${startPage-pageBlock}&attcategory=${category}" class="pageNums"> &lt; &nbsp;</a>
											</c:if>
											<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
												<a href="/cnav/attend/attend.cnav?pageNum=${i}&attcategory=${category}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
											</c:forEach>
											<c:if test="${endPage < pageCount}">
												&nbsp; <a href="/cnav/attend/attend.cnav?pageNum=${startPage+pageBlock}&attcategory=${category}" class="pageNums"> &gt; </a>
											</c:if>
										</c:if>
									</c:if>
								</c:if>
								<%--날짜 검색했을때 페이지번호들 --%>
								<c:if test="${category == null}">
								<c:if test="${search1 != null}">
									<c:if test="${search2 != null}">
										<c:if test="${startPage > pageBlock}">
											<a href="/cnav/attend/attend.cnav?pageNum=${startPage-pageBlock}&search1=${search1}&search2=${search2}" class="pageNums"> &lt; &nbsp;</a>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
											<a href="/cnav/attend/attend.cnav?pageNum=${i}&search1=${search1}&search2=${search2}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
										</c:forEach>
										<c:if test="${endPage < pageCount}">
											&nbsp; <a href="/cnav/attend/attend.cnav?pageNum=${startPage+pageBlock}&search1=${search1}&search2=${search2}" class="pageNums"> &gt; </a>
										</c:if>
									</c:if>
								</c:if>
								</c:if>
							</c:if> <%-- end:count > 0 --%>
<%-- 							<h3 style="color:black"> current page : ${pageNum} </h3>
 --%>							</div>
						</div>
					</div>
			</div> <!-- wrapAll -->
			<jsp:include page="/include/footer.jsp" />
		</div><!-- layoutSidenav_content" -->
	</div><!-- id="layoutSidenav" -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</body>
</html>