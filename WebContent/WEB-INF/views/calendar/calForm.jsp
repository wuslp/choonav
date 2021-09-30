<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>calForm</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- custom -->
<link href="../resources/css/schedule.css" rel="stylesheet" type="text/css"/>
<!--  제이쿼리 ui css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--제이쿼리 ui js-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
 <script>
 $(document).ready(function () {
     $.datepicker.setDefaults($.datepicker.regional['ko']); 
     $( "#startDate" ).datepicker({
    	  showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
    	  buttonImage: "../resources/imgs/Calendar (3).png",
          changeMonth: true, 
          changeYear: true,
          nextText: '다음 달',
          prevText: '이전 달',
          dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          dateFormat: "yy-mm-dd",
          onClose: function( selectedDate ) {    
               //시작일(startDate) datepicker가 닫힐때
               //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
              $("#endDate").datepicker( "option", "minDate", selectedDate );
          },
     });
     $( "#endDate" ).datepicker({
    	  showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
    	  buttonImage: "../resources/imgs/Calendar (3).png",
          changeMonth: true, 
          changeYear: true,
          nextText: '다음 달',
          prevText: '이전 달', 
          dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          dateFormat: "yy-mm-dd",
          
     });
});

  $( function() {
    $( "#datepicker" ).datepicker();
    $('#startDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
    $('#endDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
  } );
  
  
  function ff(obj){
	  var day = obj;
	  var hours = ('0' + day.getHours()).slice(-2); 
	  var minutes = ('0' + day.getMinutes()).slice(-2);
	  var result = hours + ":" + minutes;
	  return result;
  }
  
  </script>
<body>
	<div id = "popupGroup">	
		<div class = "group-head">
			<h2> 일정 등록 </h2>
		</div>
		<div class = "group-body">
		<form action="/cnav/cal/calPro.cnav" method="post" name="rezForm">
			<div>
				<h3> 일정유형 </h3>
				<label><input type="radio" name="calType" value="all" required>전체 일정</label>
				<label><input type="radio" name="calType" value="me" required>내 일정</label>
			</div>
			<div>
				<h3> 일정명 </h3>
			</div>
			<div>
				<input type="text" class="text1" name="calTitle" required/>
			</div>
			<div>
				<h3> 날짜 </h3>
				<input class ="date" id="startDate" type= text" name="calStart" autocomplete="off" required/>
				-
				<input class="date" id ="endDate" type ="text" name="calEnd" autocomplete="off" required/>
			</div>
			<div>
				<h3> 내용 </h3>
			</div>
			<div>
				<textarea class="memo" id ="calMemo" name ="calMemo" rows="5" cols ="20" placeholder="일정에 필요한 설명을 남기세요" required></textarea> 
			</div>
			
			<br/>
			
			<div align="center">
				<button class="ok-button" type="submit">등록</button>
				<button class="ok-button"  type= "button" onclick="self.close();">취소</button>
			</div>
		</form>
		</div>
	</div>

</body>
</html>