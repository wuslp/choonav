<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>calendar</title>
</head>
	<!-- jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- fullcalendar CDN -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
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

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'custom1 dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      customButtons: {
          custom1: {
            text: '일정 추가',
            textSize: 10,
            click: function() {
            	click_cal();
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
    	  <c:set var="rezNum" value="${item.calNum}" />
    	  { title : '${item.calTitle}',
    		 start : '${item.calStart}',
    		 end : '${item.calEnd}',
    		url : 'calContent.cnav?calNum=${item.calNum}',
    	  },
    	  </c:forEach>
    	  {
    		  title : '',
     		 start : '',
     		//allDay : true,
    	  }
      ],
    });

    calendar.render();
  });
  
  function click_cal() {
		var url = "calForm.cnav";
		var name = "schedulePopup";
		var option = "width = 600, height = 600 left = 100, top=50,location=no";
		window.open(url,name,option)
	}
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
		<a href="calendar.cnav"><h1>전체 일정</h1></a>
		<a href="myCalendar.cnav"><h1>내 일정</h1></a>
	</div>
	<div id='calendar'></div>
</body>
<script>
	function click_add() {
		var url = "rezForm.cnav";
		var name = "schedulePopup";
		var option = "width = 600, height = 600 left = 100, top=50,location=no";
		window.open(url,name,option)
	};
</script>
</html>