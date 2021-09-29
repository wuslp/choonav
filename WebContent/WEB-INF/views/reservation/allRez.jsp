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
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
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
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
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
.container {
    width: 1000px;
   	height: 700px;
}
</style>
<body>
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
	<div id="layoutSidenav_content">
	<div id="wrapAll">
	
	<h3> 전체 예약 </h3>
	<div id='calendar' class='container'></div>
	</div>	
	<jsp:include page="/include/footer.jsp" />
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
	<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
</html>