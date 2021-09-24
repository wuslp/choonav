<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 메일함</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
								location.replace("/cnav/mail/sendMailList.cnav");
							}
						}
					})
				}
				if(chk == false){
					alert("삭제 실패");
				}
		}
	</script>
</head>
<body>
	<br />
	<!-- <div align="right"> 
		<c:if test="${sessionScope.sid == null}">
			<button onclick="window.location='/spring/member/loginForm.do'">로그인</button>
		</c:if>
		<c:if test="${sessionScope.sid != null}">
			<button onclick="window.location='/spring/member/logout.do'">로그아웃</button>
		</c:if>
	</div> -->
	
	<h1 align="center"> 보낸 메일함 </h1>
	
	<c:if test="${count == 0}">
	<table style="margin-left: auto; margin-right: auto;">
		<tr>
			<td><button onclick="window.location='/cnav/mail/writeMailForm.cnav'"> 메일 보내기 </button></td>
			<td><button onclick="window.location='/cnav/mail/recMailList.cnav'"> 보낸 메일함 </button></td>
		</tr>
		<tr>
			<td align="center"> 보낸 메일이 없습니다. </td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${count != 0}">
	<div align="center">
		<table>
			<div>
				<td><button onclick="window.location='/cnav/mail/writeMailForm.cnav'"> 메일 보내기 </button></td>
				<td><button onclick="window.location='/cnav/mail/recMailList.cnav'"> 받은 메일함 </button></td>
			</div>
			<div>
				<tr>
					<td>
						<input type="checkbox" name="allCheck" id="allCheck"/>
					</td>
					<td>받는 사람</td>
					<td>제  목</td>
					<td>시  간</td>
					<td>읽음 여부</td>
				</tr>
			</div>
			<div>
				<c:forEach var="sendMailList" items="${sendMailList}">
				<tr>
					<td class="checkBox">
						<input type="checkbox" name="RowCheck" class="chBox" value="${sendMailList.mailNum}" />
					</td>
					<td>
						${sendMailList.ridName}
					</td>
					<td>
						<a href="/cnav/mail/mail.cnav?num=${sendMailList.mailNum}&pageNum=${pageNum}"> ${sendMailList.mailSub} </a>
					</td>
					<td>
						${sendMailList.mailReg}
					</td>
					<c:if test="${sendMailList.mailResult != 0}">
						<td align="center"> O </td>
					</c:if>
					<c:if test="${sendMailList.mailResult == 0}">
						<td align="center"> X </td>
					</c:if>
				</c:forEach>
				</tr>
			</div>
			<div class="delete">
				<td><input type="button" value="선택삭제" class="del-btn" onclick="deleteValue();" /></td>
			</div>
		</table>
	</div>
	<!-- </c:if>  -->
	
		<br /> <br /> 
	<%-- 페이지 번호 --%>
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
		
		<%-- 검색했을때 페이지번호들 --%>
		<c:if test="${sel != null && search != null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/mail/sendMailList.cnav?pageNum=${startPage-pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/mail/sendMailList.cnav?pageNum=${i}&sel=${sel}&search=${search}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/mail/sendMailList.cnav?pageNum=${startPage+pageBlock}&sel=${sel}&search=${search}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
		
		<%-- 검색 안했을때 페이지번호들   --%> 
		<c:if test="${sel == null || search == null}">
			<c:if test="${startPage > pageBlock}">
				<a href="/cnav/mail/sendMailList.cnav?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; &nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/cnav/mail/sendMailList.cnav?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				&nbsp; <a href="/cnav/mail/sendMailList.cnav?pageNum=${startPage+pageBlock}" class="pageNums"> &gt; </a>
			</c:if>
		</c:if>
	</c:if>
	
	<%-- 받은 사람/내용 검색 --%>
	<form action="/cnav/mail/sendMailList.cnav">
		<select name="sel">
			<option value="mailRid">받는 사람</option>
			<option value="mailContent">내용</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>
	<br />
	<br /> 
	<c:if test="${sel != null && search != null}">
		<button onclick="window.location='/cnav/mail/sendMailList.cnav'"> 보낸 메일함 </button> <br />
	</c:if>
	</div>
	

</body>
</html>