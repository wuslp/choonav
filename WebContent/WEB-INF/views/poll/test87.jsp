<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <style>
        /* UI Object 가로 */
        .h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none}
        .h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
        .h_graph .g_term{position:absolute;top:0;left:-50px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:right}
        .h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
        .h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}
        /* //UI Object */

        /* UI Object 세로 
        .ratio{padding-top:20px}
        .ratio li{float:left;position:relative;width:100px;height:300px;margin-right:10px;list-style:none}
        .ratio div{position:absolute;left:0;bottom:0;width:100%;background:url(img/bg_gage2.gif) repeat;font-size:0}
        .ratio em{position:absolute;top:-20px;width:100%;font-size:12px;font-weight:bold;text-align:center}*/
        /* //UI Object */
    </style>
</head>

 <body>
    <!-- UI Object 가로 -->
    <div class="h_graph">
        <ul>
            <li><span class="g_term">SUN</span><span class="g_bar" style="width:0%"><span>0%</span></span></li>
            <li><span class="g_term">MON</span><span class="g_bar" style="width:50%"><span>20%</span></span></li>
            <li><span class="g_term">TUE</span><span class="g_bar" style="width:30%"><span>30%</span></span></li>
            <li><span class="g_term">WED</span><span class="g_bar" style="width:40%"><span>40%</span></span></li>
            <li><span class="g_term">THU</span><span class="g_bar" style="width:50%"><span>50%</span></span></li>
            <li><span class="g_term">FRI</span><span class="g_bar" style="width:60%"><span>60%</span></span></li>
            <li><span class="g_term">SAT</span><span class="g_bar" style="width:100%"><span>100%</span></span></li>
        </ul>
    </div>
    <!-- //UI Object -->

    <!-- UI Object 세로 
    <ul class="ratio">
        <li><div style="height:30%"><em>30%</em></div></li>
        <li><div style="height:40%"><em>40%</em></div></li>
        <li><div style="height:100%"><em>50%</em></div></li>
    </ul>-->
    <!-- //UI Object -->
 </body>
</html>