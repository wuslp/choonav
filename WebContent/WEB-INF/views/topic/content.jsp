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
	<title>자유게시판</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
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
<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
	<%-- <div id=""> 
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	    	window.location.href = link;
	    	</script>
		</c:if>
	</div> --%>
	<br />
	<h3> 자유게시판 </h3>
	<!-- 게시글 본문 보여주기 제목, 내용, 작성자, 날짜 -->
	<div>
		<table>
			<tr>
				<td colspan="2"> <b>${article.topTitle}</b> </td>
			</tr>
			<tr>
				<td colspan="2" height="100"> ${article.topContent} </td>
			</tr>
			<tr>
				<td>posted by <b>${article.userId}</b>
					at ${article.topDate}
				</td>
				<td> ${article.readcount} viewed </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<!-- 작성자만 수정 보이게 -->
					<c:if test="${article.userId == sessionScope.sid}">
							<button onclick="window.location='/cnav/topic/modifyForm.cnav?topNum=${article.topNum}&pageNum=${pageNum}'">수 정</button>
					</c:if>
					<!--회사 관리자, 작성자 만 삭제보이게  -->
					<c:if test="${sessionScope.sauth=='1' || article.userId == sessionScope.sid}">
							<input type="button" value="삭제" onclick="del(${article.topNum})">
							<button onclick="window.location='/cnav/topic/list.cnav'">리스트</button>
					</c:if>
					<!-- 로그인한사람은 목록만 보이게 -->
					<c:if test="${article.userId != sessionScope.sid && sessionScope.sauth == '0'}">
							<button onclick="window.location='/cnav/topic/list.cnav'">리스트</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<!-- 댓글 작성 -->
	<div>
        <br>
       <form action="/cnav/topComments/insert.cnav" method="post">
		 	<input type="text" id="topComment" name="topComment">
		 	<input type="hidden" id="userId" name="userId" value="${sessionScope.sid}">
		 	<input type="hidden" id="topNum" name="topNum" value="${article.topNum}">
		 	<input type="hidden" id="code" name="code" value="${sessionScope.scode}">
		 	
		  	<input id="subBtn" type="button" value="댓글 달기"  onclick="topCom(this.form)"/>
		</form>
    </div>
    
    <!-- 댓글 보여주기 -->
    <div>
		<c:forEach items="${reply}" var="reply">
	      	
	        <p>
	        작성자 : ${reply.userId}<br />
	        작성 날짜 :  <fmt:formatDate value="${reply.topReg}" pattern="yyyy-MM-dd" />
	        </p>
			
	        <p>${reply.topComment}</p>
	        <!-- 로그인한사람이 댓글쓴사람이랑 같을경우 삭제버튼 보이게 -->
	 		<c:if test="${sessionScope.sid == reply.userId || sessionScope.sauth == '1'}">
		       <input type="button" value="삭제" onclick="window.location='/cnav/topComments/delete.cnav?topComNum=${reply.topComNum}&topNum=${article.topNum}'">
			</c:if>   
	        
	    </c:forEach>
    </div>
    


<script>
	/* 게시글 삭제 확인 */
	function del(topNum) {
		var chk = confirm("게시글을 삭제하시겠습니까?");
		if (chk) {
			location.href='delete.cnav?topNum='+topNum;
		}
	}	
	
	/* 댓글 작성 해야 action으로 넘어갈수 있게 */
	function topCom(frm) {
		var topComment = frm.topComment.value;

		if (topComment.trim() == ''){
			alert("댓글을 입력해주세요");
			return false;
		}
		frm.submit();
	}
</script>
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