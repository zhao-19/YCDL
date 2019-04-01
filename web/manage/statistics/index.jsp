<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>盈创动力在线统计</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/css/jquery.fullPage.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/css/style.css">
</head>
<body>
<div id="starBg"><canvas id="stars"></canvas></div>
<div id="dowebok" class="fullpage-wrapper">
    <div class="section sec1">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/title1.png" alt=""></h1>
            <div class="border">
                <div id="caseBlanche">
                    <div id="moon">
                    <img src="<%=request.getContextPath() %>/manage/statistics/img/moon.png" alt="">
                    <div class="nowpeople">
                    <h2>当前在线人数</h2>
                    <div id="peoplenum">
                    <img src="<%=request.getContextPath() %>/manage/statistics/img/up.png" alt="" id="trend">
                    <span></span>
                    </div>
                    </div>
                    </div>
                </div>
                <div id="hishory">
                    <p id="maxOnlineNum">历史最高在线人数 <span></span>人</p>
                    <div id="nowtime">当前时间: <span id="time"></span></div>
                </div>
            </div>
        </div>
    </div>
    <div class="section sec2 ">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/title2.png" alt=""></h1>
            <div class="border border2">
                <div class="progress tl">
                    <h2>TOP5 城市</h2>
                    <ul id="top5City"></ul>
                </div>
                <div id="onlineArea"></div>
                <div id="china">
                    <div id="onlineChina"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="section sec3">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/title3.png" alt=""></h1>
            <div class="border">
                <div class="boxbg"></div>
                <h2 class="tl">融资金额的统计（万元）</h2>
                <div id="kLine"></div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/title4.png" alt=""></h1>
            <div class="border">
                <div class="boxbg"></div>
                <h2 class="tl">天府之星数据库</h2>
                 <div id="industry"></div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/title5.png" alt=""></h1>
            <div class="border">
                <div class="boxbg"></div>
                <h2 class="tl">天府之星数据库</h2>
                 <div id="scale"></div>
            </div>
        </div>
    </div>
    <div class="section section6">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/title6.png" alt=""></h1>
            <div class="border border2">
            	<p class="totalCompany">共有天府之星企业 <span id="totalCompanyCount"></span> 家 </p>
                <div class="progress tl">
                    <h2>TOP3 城市</h2>
                    <ul id="top5City2"></ul>
                </div>
                <div class="district tl">
                    <ul id="disLi">
                        <li>
                            <p></p>
                            <div class="prop"><img src="<%=request.getContextPath() %>/manage/statistics/img/prop1.png" alt=""><span></span></div>
                        </li>
                        <li>
                            <p></p>
                            <div class="prop"><img src="<%=request.getContextPath() %>/manage/statistics/img/prop2.png" alt=""><span></span></div>
                        </li>
                        <li>
                            <p></p>
                            <div class="prop"><img src="<%=request.getContextPath() %>/manage/statistics/img/prop3.png" alt=""><span></span></div>
                        </li>
                    </ul>
                </div>
                 <div id="area"></div>
            </div>
        </div>
    </div>
</div>

<script src="<%=request.getContextPath() %>/manage/statistics/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/jquery.fullPage.min.js"></script>
<script>
	//根元素字体大小
	$.fn.fontFlex = function(min, max, mid) {
	    var $this = this;
	    $(window).resize(function() {
	        var size = (window.innerWidth / mid).toFixed(2);
	        if (size < min) size = min;
	        if (size > max) size = max;
	        $this.css('font-size', size + 'px');
	    }).trigger('resize');
	};
	$('html').fontFlex(5, 80, 70);
	$('#dowebok').fullpage();
</script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/echarts.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/sichuan.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/china.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/countUp.min.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/main.js"></script>
</body>
</html>