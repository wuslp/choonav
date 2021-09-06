<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>attend page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
 	$(document).ready(function(){

 		
 		//여기서부터 원래있던것
 		
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
					alert("퇴근")
					//location.reload();
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
 				 alert(attcategory+"리스트 필터링");
 				 
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
 						//console.log("data : " + data);
 						//결과를 idCheckRes 태그에 적용 코드
 						//$("#idCheckRes").val(data);
 					},
 					error:function(e){
 						console.log("error~!");
 						console.log(e);
 					}
 				});//ajax
 				//location.reload();
 				//load("/cnav/attend/attend.cnav?attcategory"+attcategory);
 				//$("#test99").load(window.location.href + "#test99");
 				//$("#test99").load("/cnav/attend/attend.cnav?attcategory"+attcategory);
 			 }
 		 })
 		 /* $("#search1").change(function(){
 			var selectCate = $("#search1").val();//확인용
 			alert(selectCate);
 		 }) */
 		 

 	})
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

<body>
	
	<div id="" class="">
		<div id="" class="">
			<h1>근태관리</h1>
			<h5><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
			
			<input type="button" value="출근" id="button1">
			<input type="datetime" id="worktime" value="" disabled>
			<input type="button" value="퇴근" id="button2" >
			<input type="datetime" id="leavetime" value="" disabled>
			</h5>
		</div><br/><br/><br/><br/><br/>
		
		<div id="" class="">
			
				<form action="/cnav/attend/attend.cnav" method="get">
				<select id="attcategory" name="attcategory">
					<option value="">-- 선택 --</option>
					<option value="">전체</option>
					<option value="정상출근">정상출근</option>
					<option value="지각">지각</option>
					<option value='휴가'>휴가</option>
				</select>
				<input type="date" min="2000-01-01" max=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> id="search1" name="search1"/>
				<strong>~</strong>
				<input type="date" min="" max=<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> id="search2" name="search2"/>
				<input id="datesearch" type="submit" value="검색" />
				</form>
		</div><br/><br/>
						
				
		<div id="" class="">	
			<table border="1">
				<tr>
					<td>날짜</td>
					<td>근태</td>
					<td>출근</td>
					<td>퇴근</td>
					<td>사유</td>
				</tr>
				
				<c:if test="${userAttendList != null}">
					<c:forEach var="List" items="${userAttendList }">
					<tr id="">
						<td><fmt:formatDate value="${List.attDate }" type="date"/></td>
						<td>${List.attendance }</td>
						<td><fmt:formatDate value="${List.workTime }" pattern="HH:mm" /></td>
						<td><fmt:formatDate value="${List.leaveTime }" pattern="HH:mm" /></td>
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
			<h3 style="color:black"> current page : ${pageNum} </h3>
			</div>
		</div>
	</div>

</body>

</html>