<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
	<h3 align="left"> 사원 정보 수정</h3>>
	
	<c:if test="${count == 0}">
	<div align="center">
		<div>
			<td align="center"> 회사 내 등록된 사원이  없습니다. </td>
		</div>
	</div>
	</c:if>
	
	<c:if test="${count != 0}">
	<div align="center">
		<table>
			<div>
				<tr>
					<td>
						<input type="checkbox" name="allCheck" id="allCheck"/>
					</td>
					<td>No.</td>
					<td>이름</td>
					<td>회사명</td>
					<td>부서명</td>
					<td>직위</td>
				</tr>
			</div>
			<div>
				<c:forEach var="recMailList" items="${recMailList}">
				<tr>
					<td class="checkBox">
						<input type="checkbox" name="RowCheck" class="chBox" />
					</td>
					<td>
						넘버
					</td>
					<td>
						이름
					</td>
					<td>
						회사명
					</td>
					<td>
						부서명
					</td>
					<td>
						직위
					</td>
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
	
	<%-- 이름/부서명 검색 --%>
	<form action="/cnav/mail/recMailList.cnav">
		<select name="sel">
			<option value="userId">이름</option>
			<option value="dept">부서명</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>
	<br />
	<br /> 
	<c:if test="${sel != null && search != null}">
		<button onclick="window.location='/cnav/bizMypage/userManagement.cnav'"> 목록 </button> <br />
	</c:if>
	</div>

</body>
</html>