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
	<link href="/cnav/resources/css/notice.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	    	window.location.href = link;
	    	</script>
		</c:if>
		
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
			<div id="notiWrapAll">	


	<!-- 게시글 본문 보여주기 제목, 내용, 작성자, 날짜 -->
	<div class="notiContent">
		<table class="notiTable">
			<tr>
				<td><a href="/cnav/topic/list.cnav?pageNum=${pageNum}"> 자유게시판> </a></td>
			</tr>
			<tr>
				<td class="notiTitle">${article.topTitle} </td>
			</tr>
			<tr>
				<td class="writer">${article.name}</td>
			</tr>
			<tr>
				<td class="date">
					<fmt:formatDate value="${article.topDate}" pattern="yyyy-MM-dd HH:mm" />
					조회 ${article.readcount}
				</td>
			</tr>
			<tr>
				<td height="100"> ${article.topContent} </td>
			</tr>
			<tr>
				<td>
				<div class="notiBtn">
					<!-- 작성자만 수정 보이게 -->
					<c:if test="${article.userId == sessionScope.sid}">
						<button onclick="window.location='/cnav/topic/modifyForm.cnav?topNum=${article.topNum}&pageNum=${pageNum}'">수 정</button>
					</c:if>
					<!--회사 관리자, 작성자 만 삭제보이게  -->
					<c:if test="${sessionScope.sauth=='1' || article.userId == sessionScope.sid}">
						<input type="button" value="삭제" onclick="del(${article.topNum})">
						<button onclick="window.location='/cnav/topic/list.cnav'">목록</button>
					</c:if>
					<!-- 로그인한사람은 목록만 보이게 -->
					<c:if test="${article.userId != sessionScope.sid && sessionScope.sauth == '0'}">
						<button onclick="window.location='/cnav/topic/list.cnav'">목록</button>
					</c:if>
				</div>
				</td>
			</tr>
		</table>
	</div>
	
	
	<!-- 댓글 작성 -->
	<div class="topComWrite">
       <form action="/cnav/topComments/insert.cnav" method="post">
       		<textarea id="topComment" name="topComment" rows="2"  placeholder="내용을 작성해 주세요"></textarea>
		 	<input type="hidden" id="userId" name="userId" value="${sessionScope.sid}">
		 	<input type="hidden" id="topNum" name="topNum" value="${article.topNum}">
		 	<input type="hidden" id="code" name="code" value="${sessionScope.scode}">
		  	<input id="subBtn" type="button" value="댓글 달기"  onclick="topCom(this.form)"/>
		</form>
    </div>
    
    <!-- 댓글 보여주기 -->
    <div class="topComments">
		<c:forEach items="${reply}" var="reply">
	      	<div class="commentName">
	        ${reply.name}
		        <!-- 로그인한사람이 댓글쓴사람이랑 같을경우 삭제버튼 보이게 -->
		        <div class="notiBtn">
			 		<c:if test="${sessionScope.sid == reply.userId || sessionScope.sauth == '1'}">
				       <input type="button" value="삭제" onclick="window.location='/cnav/topComments/delete.cnav?topComNum=${reply.topComNum}&topNum=${article.topNum}'">
					</c:if>   
				</div>
	        </div>
	        <div class="comment">
	        <pre class="commentPre">${reply.topComment}</pre>
	        </div>
	        <div class="commentReg">
	        <fmt:formatDate value="${reply.topReg}" pattern="yyyy-MM-dd HH:mm" />
	        <br />
	        </div>
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