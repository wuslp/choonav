<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
	<title>test page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        font-size: 11px;
        line-height: 25px;
        height: 25px;
        margin-bottom: 5px;

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

 <body>
    <div class="zt-span6 last">
    
    	<div id="">
		<h1><strong>투표 결과 페이지</strong></h1>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<div id="">
			<!--div 수정필요  -->
				<div id="">
					투표기간	<fmt:formatDate value="${article.stDate}" pattern="yyyy-MM-dd"/><strong>~</strong><fmt:formatDate value="${article.endDate}" pattern="yyyy-MM-dd"/><br/>
					제목		 : ${article.pollTitle}<br/>
					대상		 : ${article.target}<br/>
					내용		 : ${article.pollCon}<br/>
					항목 <br/>
					<strong>&nbsp;&nbsp; 총 투표수 : ${article.total}</strong> <br/>
					1 :${article.ans1}<br/>
						<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${article.res1/article.total*100}"/>" style="">항목 값 : ${article.ans1}<c:out value="${name}" /><span>결과비율 : <fmt:formatNumber value="${article.res1/article.total}" type="percent"/></span></div></div>
	
					2 :${article.ans2}<br/>
						<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${article.res2/article.total*100}"/>" style="">${article.ans2}<span><fmt:formatNumber value="${article.res2/article.total}" type="percent"/></span></div></div>
	
					<c:if test="${article.ans3 != null}">
					3 :${article.ans3}<br/>
					</c:if>
					<c:if test="${article.res3 ne '0'}">
						<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${article.res3/article.total*100}"/>" style=";">${article.ans3}<span><fmt:formatNumber value="${article.res3/article.total}" type="percent"/></span></div></div>
					</c:if>
					<c:if test="${article.ans4 != null}">
					4 :${article.ans4}<br/>
					</c:if>
					<c:if test="${article.res4 ne '0'}">
						<div class="zt-skill-bar"><div data-width="<fmt:formatNumber value = "${article.res4/article.total*100}"/>" style=";">${article.ans4}<span><fmt:formatNumber value="${article.res4/article.total}" type="percent"/></span></div></div>
					</c:if><br/><br/>
					<input type="button" value="리스트로" id="" onClick="window.location='/cnav/poll/pollList.cnav'">
				
				</div>
		</div>
	</div>

	
	<!-- 나누기 
	 1의 비율 = ${article.res1/article.total*100}
	 2의 비율 = ${article.res2/article.total*100}
	 3의 비율 = ${article.res3/article.total*100}
	 4의 비율 = ${article.res4/article.total*100}-->
	
	
	<%-- <c:set var="name" value="${article.res1}" /> --%>
	<%--메모장
	 나중에 지울것
	<fmt:formatNumber value = "${article.res1/article.total*100}"/>
	<fmt:parseNumber value="${article.res1/article.total*100}" var="test11" integerOnly="true"/> <br/>
	type percent 쓰기
	항목1 비율 : <fmt:formatNumber value="${article.res1/article.total}" type="percent"/><br/>
	항목2 비율 : <fmt:formatNumber value="${article.res2/article.total}" type="percent"/><br/>
	항목3 비율 : <fmt:formatNumber value="${article.res3/article.total}" type="percent"/><br/>
	항목4 비율 : <fmt:formatNumber value="${article.res4/article.total}" type="percent"/><br/>
	됐다!!
	${test11 }
	 --%>
	
	
</div>
 </body>
</html>