<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>받은 결재 상세</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/approval.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
	function showReject(){
		window.open("/cnav/approval/rejectForm.cnav?appNum=${approval.appNum}&sign=${sign}","rejectForm","width=500, height=300, left=100, top=50");
	}
	function takeOk1(){
		window.open("/cnav/approval/takeOk.cnav?appNum=${approval.appNum}&sign=${sign}","takeOk1","width=500,height=200");
	}
	function takeOk2(){
		window.open("/cnav/approval/takeOk2.cnav?appNum=${approval.appNum}&sign=${sign}","takeOk2","width=500,height=200");
	}
	function takeOk3(){
		window.open("/cnav/approval/takeOk3.cnav?appNum=${approval.appNum}&sign=${sign}","takeOk3","width=500,height=200");
	}	
</script>

<body class="sb-nav-fixed">
<c:if test="${sessionScope.sid == null}">
<script>
	alert("로그인후 이용할 수 있습니다");
	var link = "/cnav/main/startPage.cnav";
  		window.location.href = link;
</script>
</c:if>
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
		<div id="wrapAll">
			<h3> 받은 결재 상세 </h3>
			
			<div id="printA">
			<div class="appAllWrap" >
				<div class="approvalWrap">
				<div class="approvalWrap-in">
				<div class="appContentTitle">
					<h4>${approval.appType}</h4>
				</div>

<div class="appContentLeft">
	<table>
		<tr>
			<td>문서번호</td>
			<td>${approval.appNum}</td>	
		</tr>
		<tr>
			<td>기안부서</td>
			<td>${approval.dept}</td>
		</tr>
		<tr>
			<td>기안자</td>
			<td>${approval.name}</td>
		</tr>
		<tr>
			<td>기안일자</td>
			<td><fmt:formatDate value="${approval.appDate}" pattern="yyyy.MM.dd"/></td>
		</tr>
			
	</table>
</div>

<table class="appContentRight">
	<tr> <!-- 이름 -->
		<td>${approval.name1} </td> 
		<td>${approval.name2} </td>
		<td>${approval.name3} </td>
	</tr>
	<tr>
		<td>
			<c:if test="${approval.state1 == 2}">
				승인
			</c:if>
			<c:if test="${approval.state1 == 1}">
				반려
			</c:if>
		</td>
		<td>
			<c:if test="${approval.state2 == 2}">
				승인
			</c:if>
			<c:if test="${approval.state2 == 1}">
				반려
			</c:if>
		</td>
		<td>
			<c:if test="${approval.state3 == 2}">
				승인
			</c:if>
			<c:if test="${approval.state3 == 1}">
				반려
			</c:if>
		</td>
	</tr>
</table>
<br/><br/><br/><br/><br/><br/>
<table class="appCont1">
	<tr>
		<td width="70px" class="dd">요청부서</td>
		<td>${approval.dept}</td>
	</tr>
	<tr>
		<td width="70px" class="dd">일시</td>
		<td>${approval.appStart} ~ ${approval.appFinish}</td>
	</tr>
</table>

<table class="appCont2">
	<tr>
		<td width="70px" class="dd">제목</td>
		<td>${approval.appTitle}</td>
	</tr>
	<tr>
		<td align="center" colspan="2" class="dd">내용</td>
	</tr>
	<tr>	
		<td colspan="2" class="ff"><pre>${approval.appContent}</pre></td>
	</tr>
	<tr>
		<td class="dd">요청사항</td>
		<td>${approval.appRequest}</td>
	</tr>
</table>
</div>



			</div><!-- approvalWrap -->
				<c:if test="${approval.reject != null }">			
				반려 사유 : ${approval.reject}
				</c:if>
			</div>
			</div> <!-- 프린트 -->
<div class="appConBtn">
	<%-- <c:if test='${!(approval.state1 == "1" && approval.state2 == "1" && approval.state3 == "1" && approval.state1 == "2" && approval.state2 == "2" && approval.state3 == "2" && approval.state2 != "0")}'> --%> 
	<c:if test='${(approval.id2 ==null && approval.id3 == null && approval.state1 != "1" && approval.state1 != "2")}'> 
	<c:if test='${(approval.id1==sessionScope.sid)}'>
	<button onclick="takeOk1();">승인</button>
	<button onclick="showReject();">반려</button>
	</c:if>
	</c:if>
	
	<c:if test='${(approval.state1 != "0" && approval.state1 == "2" && approval.id3 == null && approval.state1 !="1")}'>
	<c:if test='${(approval.id2==sessionScope.sid)}'>
	<button onclick="takeOk2();">승인</button> 
	<button onclick="showReject();">반려</button>
	</c:if>
	</c:if>
	
	<c:if test='${(approval.state2 !="1" && approval.state2=="2" && approval.state3 !="2" && approval.state3 !="1")}'>
	<c:if test='${(approval.id3==sessionScope.sid)}'>
	<button onclick="takeOk3();">승인</button> 
	<button onclick="showReject();">반려</button>
	</c:if>
	</c:if>
	
	<button onclick="window.location='/cnav/approval/takeAppList.cnav'">목록</button> 
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