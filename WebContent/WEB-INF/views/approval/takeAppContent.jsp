<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	function showReject(){
		window.open("rejectForm.cnav?appNum=${approval.appNum}&sign=${sign}", "width=400, height=300, left=100, top=50");
	}	
	
</script>

<body>
<br/>

<div class="appContentTitle">
<h3>${approval.appType}</h3>
</div>

<div class="appContentLeft">
	<table>
		<tr>
			<td>문서번호</td>
			<td>${approval.appNum}</td>	
		</tr>
		<tr>
			<td>기안부서</td>
			<td></td>
		</tr>
		<tr>
			<td>기안자</td>
			<td>${approval.userId}</td>
		</tr>
		<tr>
			<td>기안일자</td>
			<td><fmt:formatDate value="${approval.appDate}" pattern="yyyy.MM.dd"/></td>
		</tr>
			
	</table>
</div>

<table class="appContentRight">
	<tr>
		<td>직위 </td>
		<td>직위 </td>
		<td>직위 </td>
	</tr>
	<tr> <!-- 도장 -->
		<td>${approval.name1} </td> 
		<td>${approval.name2} </td>
		<td>${approval.name3} </td>
	</tr>

</table>
<br/><br/><br/><br/><br/><br/>
<table class="appCont1">
	<tr>
		<td>요청부서</td>
		<td>${approval.dept}</td>
	</tr>
	<tr>
		<td>일시</td>
		<td>${approval.appStart} ~ ${approval.appFinish}</td>
	</tr>
</table>

<table class="appCont2">
	<tr>
		<td>제목</td>
		<td>${approval.appTitle}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${approval.appContent}</td>
	</tr>
	<tr>
		<td>요청사항</td>
		<td>${approval.appRequest}</td>
	</tr>
</table>

<div class="appConBtn">
	<%-- <c:if test='${!(approval.state1 == "1" && approval.state2 == "1" && approval.state3 == "1" && approval.state1 == "2" && approval.state2 == "2" && approval.state3 == "2" && approval.state2 != "0")}'> --%> 
	<c:if test='${(approval.name2 ==null && approval.name3 == null)}'> 
	<button onclick="window.location='/cnav/approval/takeOk.cnav?appNum=${approval.appNum}&sign=${sign}'">승인1</button>
	<button onclick="showReject();">반려</button>
	</c:if>
	
	<c:if test='${(approval.state1 != "0" && approval.state1 == "2" && approval.name3 == null && approval.state1 !="1")}'>
	<button onclick="window.location='/cnav/approval/takeOk2.cnav?appNum=${approval.appNum}&sign=${sign}'">승인2</button> 
	<button onclick="showReject();">반려</button>
	</c:if>
	
	<c:if test='${(approval.state2 !="1" && approval.state2=="2")}'>
	<button onclick="window.location='/cnav/approval/takeOk3.cnav?appNum=${approval.appNum}&sign=${sign}'">승인3</button> 
	<button onclick="showReject();">반려</button>
	</c:if>
	
	<button onclick="window.location='/cnav/approval/takeAppList.cnav'">취소</button> 
</div>
</body>
</html>