<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>전체 예약 현황</title>
</head>
	<link href='../resources/css/main.css' rel='stylesheet' />
	<!-- jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- fullcalendar CDN 
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />-->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	<!-- fullcalendar 언어 CDN -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- 
<link href='../resources/css/main.css' rel='stylesheet' />
<script src='../resources/js/main.js'></script>
 -->
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var rezNum = 0
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next,today',
        center: 'title',
        right: 'custom1 dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      customButtons: {
          custom1: {
            text: '예약 하기',
            textSize: 10,
            click: function click_add() {
        		var url = "rezForm.cnav";
        		var name = "schedulePopup";
        		var option = "width = 600, height = 600 left = 100, top=50,location=no";
        		window.open(url,name,option)
        	}
          }
      },
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      locale : "ko",
      events: [
    	  <c:forEach var="item" items="${list}">
    	  { title : '[${item.category}]',
    		 start : '${item.sDate}',
    		 end : '${item.eDate}',
    		url : 'rezContent.cnav?rezNum=${item.rezNum}',
    	  },
    	  </c:forEach>
    	  {
    		  title : '',
     		 start : '',
     		//allDay : true,
    	  }
      ]
    });
    calendar.render();
  });
  

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  
  .add-button {
    position: absolute;
    top: 1px;
    right: 230px;
    background: #2C3E50;
    border: 0;
    color: white;
    height: 35px;
    border-radius: 3px;
    width: 157px;
}

.left {
	float: left;
}
.center {
	float: center;
}
</style>
<body>
	<div class="left" >
		<a href="allRez.cnav"><h1>전체 예약 현황</h1></a>
		<a href="myRez.cnav"><h1>내 예약 현황</h1></a>
	</div>
	<div id='calendar' class="center"></div>
</body>
<script>
	<%--
	--%>
	function click_add() {
		var url = "rezForm.cnav";
		var name = "schedulePopup";
		var option = "width = 600, height = 600 left = 100, top=50,location=no";
		window.open(url,name,option)
	};
</script>
</html>