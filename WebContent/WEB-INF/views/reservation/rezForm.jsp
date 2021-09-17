<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Bootstrap</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.6.3.css.all.css" rel="stylesheet" />
    <link href="../resources/css/schedule.css" rel="stylesheet" type="text/css"/>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<body>
    <div id = "popupGroup">	
		<div class = "group-head">
			<h1 class = "zTree-h1"> 예약 하기 </h1>
		</div>
		<div class = "group-body">
		<form action="/cnav/rez/addRez.cnav" method="post" name="rezForm">
			<div>
				<h3> 예약일시 </h3>
				<input type="text" name="sDate" id="start" autocomplete="off"  />
				-
				<input type="text" name="eDate" id="end" autocomplete="off"  />
			</div>
			<div>
				<h3> 예약자 </h3>
			</div>
			<div>
				${sid}
			</div>
			<div>
				<h3> 예약항목 </h3>
			</div>
			<div>
				<select name="category">
					<option value="회의실1">회의실1</option>
					<option value="회의실2">회의실2</option>
					<option value="회의실3">회의실3</option>
					<option value="회의실4">회의실4</option>
				</select>
			</div>
			<div>
				<h3> 목적 </h3>
			</div>
			<div>
				<textarea class = "memo" id = "memo" name = "content" rows = "5" cols = "20" placeholder="100글자까지 입력 가능합니다"></textarea> 
			</div>
			<button class = "ok-button" type="submit" >확인</button>
		</form>
			<button class = "ok-button" type= "button" onclick="self.close();">취소</button>
		</div>
	</div>
</body>

<script>
$.datetimepicker.setLocale('kr');
$('#start').datetimepicker({
    timepicker: true,
    datepicker: true,
    format: 'Y-m-d H:i', // formatDate
    hours12: false,
    step: 30,
    minDate: 0,
    minTime: '7',
    defaultTime: '7',
    onShow: function(ct){
    	this.setOptions({
    		maxDate: $('#end').val() ? $('#end').val() : false
    	})
    }
})

$('#end').datetimepicker({
    timepicker: true,
    datepicker: true,
    format: 'Y-m-d H:i', // formatDate
    hours12: false,
    step: 30,
    minDate: 0,
    minTime: '7',
    defaultTime: '7',
    
    onShow: function(ct){
    	this.setOptions({
    		minDate: $('#start').val() ? $('#start').val() : false
    	})
    }
})
</script>

</html>