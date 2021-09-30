<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>pollResult page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="/cnav/resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="/cnav/resources/css/AttendPoll.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/resources/startbootstrap/css/styles.css"rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	(function( $ ) {
	    "use strict";
	    $(function() {
	        function animated_contents() {
	            $(".zt-skill-bar > div ").each(function (i) {
	                var $this  = $(this),
	                    skills = $this.data('width');

	                $this.css({'width' : skills + '%'});

	            });
	        }
	        
	        if(jQuery().appear) {
	            $('.zt-skill-bar').appear().on('appear', function() {
	                animated_contents();
	            });
	        } else {
	            animated_contents();
	        }
	    });
	}(jQuery));
	</script>
    <style>
/*-------------------------------------------------------------------------*/
/*  Skill bar style
/*-------------------------------------------------------------------------*/

    .zt-skill-bar {
        color: #fff;
        text-align: center;
        font-size: 11px;
        line-height: 25px;
        height: 25px;
        margin-bottom: 5px;
        width: 80%;

        background-color: rgba(0,0,0,0.1);

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;

    }

    .zt-skill-bar * {
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }

    .zt-skill-bar div {
        background-color: #03c75a;
        position: relative;
        padding-left: 25px;
        width: 0;

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms- border-radius: 2px;
                border-radius: 2px;
    }

    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #1a1a1a;

        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }

    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }
    </style>
</head>

 <body class="sb-nav-fixed">
	<jsp:include page="/include/top_nav_bar.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="/include/left_nav_bar.jsp" />
		<div id="layoutSidenav_content">
   			<!--로그인된 세션이 없을경우 startPage 로 이동시켜주기  -->
			<div id=""> 
					<c:if test="${sessionScope.sid == null}">
					<script>
						alert("로그인후 이용할 수 있습니다");
			    		window.location="/cnav/main/startPage.cnav";
			    		</script>
					</c:if>
			</div>

			<div id="wrapAll">
			<h3><strong>투표 결과</strong></h3>
				<div class="pollResWrap">
				<div class="pollconResWrap">

									<i class="far fa-calendar-check"></i> 투표기간	<fmt:formatDate value="${article.stDate}" pattern="yyyy-MM-dd"/><strong>~</strong><fmt:formatDate value="${article.endDate}" pattern="yyyy-MM-dd"/><br/>
									제목		 : ${article.pollTitle}<br/>
									대상		 : ${article.target}<br/>
									내용		 : ${article.pollCon}<br/>
				<div class="resBar">
					    <div class="zt-span6 last"><!--막대기css  -->
									<strong>&nbsp;&nbsp; 총 투표수 : ${article.total}</strong> <br/>
														
									<div class="cssBar">
									<i class="fas fa-poll-h"></i> 항목 <br/>
									1 :&emsp;${article.ans1}<br/>
										<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${(article.res1/article.total)*100}"/>" style="">${article.ans1}<c:out value="${name}" /><span>결과비율 : <fmt:formatNumber value="${article.res1/article.total}" type="percent"/></span></div></div>
					
									2 :&emsp;${article.ans2}<br/>
										<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${article.res2/article.total*100}"/>" style="">${article.ans2}<span><fmt:formatNumber value="${article.res2/article.total}" type="percent"/></span></div></div>
					
									<c:if test="${article.ans3 != null}">
									3 :&emsp;${article.ans3}<br/>
									
										<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${article.res3/article.total*100}"/>" style=";">${article.ans3}<span><fmt:formatNumber value="${article.res3/article.total}" type="percent"/></span></div></div>
									</c:if>
									<c:if test="${article.ans4 != null}">
									4 :&emsp;${article.ans4}<br/>
									
										<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${article.res4/article.total*100}"/>" style=";">${article.ans4}<span><fmt:formatNumber value="${article.res4/article.total}" type="percent"/></span></div></div>
									</c:if><br/>
									</div>
					</div>
				</div>
								
						</div><!-- class="zt-span6 last" -->
							<br/>
									<input type="button" value="리스트로" id="" onClick="window.location='/cnav/poll/pollList.cnav'">
				</div><!-- pollResWrap -->
			</div>
			<jsp:include page="/include/footer.jsp" />
		</div><!-- <div id="layoutSidenav_content"> -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-area-demo.js"></script>
		<script src="<%=request.getContextPath()%>/resources/startbootstrap/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resource/startbootstrap/js/datatables-simple-demo.js"></script>
	</div>
</body>
</html>