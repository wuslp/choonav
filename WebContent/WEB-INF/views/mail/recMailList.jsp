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
<title>받은 메일함 - 메인</title>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/mail.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "deleteMailForm.cnav";
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for(var i = 0; i < list.length; i++){
				if(list[i].checked){ // 선택되어 있으면 배열에 값 저장
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0){
				alert("선택된 글이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk == true){
					$.ajax({
						url : url,
						type : 'POST',
						traditional : true,
						data : {
							valueArr : valueArr			// 보내고자 하는 data 변수
						},
						success: function(jdata){
							console.log(jdata);
							if(jdata == 1){
								alert("삭제 성공");
								location.replace("/cnav/mail/recMailList.cnav");
							}
						}
					})
				}
				if(chk == false){
					alert("삭제 실패");
				}
			}
		}
	</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">

		<jsp:include page="/include/left_nav_bar.jsp" />

		<div id="layoutSidenav_content">
		<div id="wrapAll">
	
	<div id=""> 
		<c:if test="${sessionScope.sid == null}">
		<script>
			alert("로그인후 이용할 수 있습니다");
			var link = "http://localhost:8080/cnav/main/startPage.cnav";
	   		window.location.href = link;
	   		</script>
		</c:if>
	</div>
	
	<h3> 받은 메일함 </h3>
	
	<%-- 보낸 사람/내용 검색 --%>
	<div class="searchMail">	
		<form action="/cnav/mail/recMailList.cnav">
			<select name="sel">
				<option value="userName">보낸 사람</option>
				<option value="mailContent">내용</option>
			</select>
			<input type="text" name="search" />
			<input type="submit" value="검색" />
		</form><br/>
	</div>
	<div class="recMailList-btn">
		<c:if test="${sel != null && search != null}">
			<button onclick="window.location='/cnav/mail/recMailList.cnav'"> 받은 메일함 </button> <br />
		</c:if>
	</div>

	
	<c:if test="${count == 0}">
	<table class="cnavTable">
		<div>
			<td> 받은 메일이 없습니다. </td>
		</div>
	</table>
	</c:if>
	
	<c:if test="${count != 0}">
	<div>
		<table class="cnavTable">
				<tr class="cnavList-top">
					<td>
						<input type="checkbox" name="allCheck" id="allCheck"/>
					</td>
					<td>보낸 사람</td>
					<td>제  목</td>
					<td>시  간</td>
					<td>읽음 여부</td>
				</tr>
			<div>
				<c:forEach var="recMailList" items="${recMailList}">
				<tr>
					<td class="checkBox">
						<input type="checkbox" name="RowCheck" class="chBox" value="${recMailList.mailNum}" />
					</td>
					<td>
						<a href="/cnav/mail/redirectMail.cnav?mailRid=${recMailList.userId}&ridName=${recMailList.userName}">${recMailList.userName}</a>
					</td>
					<td>
						<a href="/cnav/mail/mail.cnav?num=${recMailList.mailNum}&pageNum=${pageNum}"> ${recMailList.mailSub} </a>
					</td>
					<td>
						${recMailList.mailReg}
					</td>
					<c:if test="${recMailList.mailResult != 0}">
						<td align="center"> O </td>
					</c:if>
					<c:if test="${recMailList.mailResult == 0}">
						<td align="center"> X </td>
					</c:if>
				</tr>
				</c:forEach>
			</div>
		</table>
			<div class="delete">
				<input type="button" value="선택삭제" class="del-btn" onclick="deleteValue();" />
			</div>
	</div>
	</c:if>
	
	<%-- 페이지 번호 --%>
	<div class="pageNums-all">
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
		
		<%-- 검색했을때 페이지번호들 --%>
		<c:if test="${sel != null && search != null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/mail/recMailList.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/mail/recMailList.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/mail/recMailList.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
		<%-- 검색 안했을때 페이지번호들   --%> 
		<c:if test="${sel == null || search == null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/mail/recMailList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/mail/recMailList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/mail/recMailList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
	</c:if>
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