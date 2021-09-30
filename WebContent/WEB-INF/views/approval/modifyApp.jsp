<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>결재 문서 수정</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/approval.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
			<div id="wrapAll">	
			<h3>결재 문서 수정</h3>
			
<form action="/cnav/approval/modifyAppPro.cnav?pageNum=${pageNum}" method="post">
	<%-- 숨겨서 글 고유번호 값 전송 --%>
	<input type="hidden" name="appNum" value="${approval.appNum}" />
	
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
		<tr>
			<td>미승인 </td>
		<tr>
			<td>${approval.name1}</td>
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
			<td width="70px" class="dd">제목</td>
			<td><input type="text" name="appTitle" value="${approval.appTitle}"/></td>
		</tr>
		<tr>
			<td align="center" colspan="2" class="dd">내용</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" width="90%" name="appContent" value="${approval.appContent}"/></td>
		</tr>
		<tr>
			<td class="dd">요청사항</td>
			<td><input type="text" name="appRequest" value="${approval.appRequest}"/></td>
		</tr>
	</table>
	</div>
	</div><!-- approvalWrap -->
	</div>
		<div class="appConBtn">
			<input type="submit" value="등록"/>
			<input type="button" value="취소" onclick="window.location='/cnav/approval/sendAppList.cnav'"/>
		</div>
</form>

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
