<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function showAddTake(){
		window.open("rejectForm.cnav?appNum=${approval.appNum}&sign=${sign}", "width=500, height=600, left=100, top=50");
	}
</script>
<body>
	<script>
	alert("결재가 승인되었습니다.");
	window.open ="/cnav/approval/addTake.cnav?appNum=${approval.appNum}&sign=${sign}'"; //메인으로 이동 
	</script>
</body>
</html>