<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<meta charset="UTF-8">
	<title>Main Page</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<link href='../resources/css/clock.css' rel='stylesheet' />
<script src='../resources/js/clock.js'></script>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
			<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
			<div id="logincheck">
				<c:if test="${sessionScope.sid == null}">
				<script>
					alert("로그인후 이용할 수 있습니다");
					var link = "/cnav/main/startPage.cnav";
		    		window.location.href = link;
		    		</script>
				</c:if>
			</div><!--logincheck -->
		
		<div id="wrapAll">	
			<div class="main"><!-- 메인 content -->
					<div class="bizclock">
					
					<div class="card mb-4">
                     <div class="card-header">
                                회사정보
                     </div>
                            <div class="card-body">
							<table>
								<tr>
									<td>회사명</td>
									<td>${bizDTO.bizName}</td>
								</tr>
								<tr>
									<td>대표자</td>
									<td>${bizDTO.bizCEO}</td>
								</tr>
								<tr>
									<td>회사번호</td>
									<td>${bizDTO.bizTel}</td>
								</tr>
								<tr>
									<td>회사이메일</td>
									<td>${bizDTO.bizEmail}</td>
								</tr>
							</table>
						</div>
					</div>	
						
						<!-- 실시간 시계 -->
						
<!-- 						<a id="codepen-link" href='https://www.codepen.io/seanfree' target='_blank'></a> -->
							<div id="clock">
							  <ul id="tick-marks"></ul>
							  <div class="second ticker"></div>
							  <div class="minute ticker"></div>
							  <div class="hour ticker"></div>
							  <div id="time-output"></div>
							</div>
						</div><br/>	

				
				 <div class="card mb-4">
                     <div class="card-header">
                           <i class="fas fa-table me-1"></i>
                                공지사항
                     </div>
                            <div class="card-body">
                             <table>
								<c:if test="${count == 0}">
									등록된 공지사항이 없습니다.
								</c:if>
								<c:if test="${count > 0}">
							<tr>
								<td> No. </td>
								<td> 제목 </td>
								<td> 작성일 </td>
							</tr>
							
							<c:forEach var="item" items="${articleList}">
								<tr>
									<td onclick="window.location='/cnav/notice/content.cnav?notiNum=${item.notiNum}'">${number}<c:set var="number" value="${number - 1}" /> </td>
									<td onclick="window.location='/cnav/notice/content.cnav?notiNum=${item.notiNum}'">${item.notiTitle}</td>
									<td onclick="window.location='/cnav/notice/content.cnav?notiNum=${item.notiNum}'">${item.notiDate}</td>
								</tr>
							</c:forEach>
							</c:if>
							</table>
						</div>
					</div>



			</div><!-- main 메인 content -->
		</div>	
			
		<jsp:include page="/include/footer.jsp" />
		</div><!-- layoutSidenav_content" -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
	</div><!-- id="layoutSidenav" -->
</body>
</html>