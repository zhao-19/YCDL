<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>科技金融服务平台数据统计</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/css/jquery.fullPage.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/css/styleTV.css">
</head>
<body>

<div id="starBg"><canvas id="stars"></canvas></div>
<p id="countDown"><span>9</span>秒后进入下一页</p>
<div id="dowebok" class="fullpage-wrapper">
    <div class="section ">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/TVtitle3.png" alt=""></h1>
            <div class="border border2">
                <div id="hishory">
                    <p id="peoplenum">当前在线人数 <span></span> 人</p>
                    <p id="maxOnlineNum">历史最高在线人数 <span></span> 人</p>
                    <div id="nowtime">当前时间  <span id="time"></span></div>
                </div>
                <p class="totalCompany">共有天府之星企业 <span id="totalCompanyCount"></span> 家 </p>
                <div class="progress tl">
                    <h2>TOP3 城市</h2>
                    <ul id="top5City2">
                        <!--<li>-->
                        <!--<div>-->
                        <!--成都市-->
                        <!--<div class="progress-line">-->
                        <!--<div class="line">-->
                        <!--<div class="div" w="60"></div>-->
                        <!--</div>-->
                        <!--</div>-->
                        <!--48%-->
                        <!--</div>-->
                        <!--</li>-->

                    </ul>
                </div>
                <div class="district tl">
                    <ul id="disLi">
                        <li class="wuhou">
                            <p>武侯区</p>
                            <div class="prop"><img src="<%=request.getContextPath() %>/manage/statistics/img/prop1.png" alt=""> <span>50%</span></div>
                        </li>
                        <li class="chenghua">
                            <p>成华区</p>
                            <div class="prop"><img src="<%=request.getContextPath() %>/manage/statistics/img/prop2.png" alt=""> <span>30%</span></div>

                        </li>
                        <li class="jinniu">
                            <p>金牛区</p>
                            <div class="prop"><img src="<%=request.getContextPath() %>/manage/statistics/img/prop3.png" alt=""><span>15%</span></div>

                        </li>
                    </ul>
                </div>
                <div id="area"></div>

            </div>
        </div>
    </div>
    <div class="section ">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/TVtitle2.png" alt=""></h1>
            <div class="border">
                <div class="boxbg"></div>
                <h2 class="tl">工作流统计</h2>
                <div class="tabBox tabBox1">
                    <ul class="ulTab ulTit">
                        <li>
                            <ol>
                                <li>姓名</li>
                                <li>待办事项<i>（个）</i></li>
                                <li>已办事项<i>（个）</i></li>
                                <li>办结事项<i>（个）</i></li>
                                <li>平均每笔待办耗时<i>（小时）</i></li>
                            </ol>
                        </li>
                    </ul>
                    <div class="bd">
                        <ul class="ulTab ulTxt ulPerson">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="container">
            <h1><img src="<%=request.getContextPath() %>/manage/statistics/img/TVtitle1.png" alt=""></h1>
            <div class="border">
                <div class="boxbg"></div>
                <h2 class="tl">站点统计</h2>
                <div class="tabBox tabBox2">
                    <ul class="ulTab ulTit ulTit2">
                        <li>
                            <ol>
                                <li>站点</li>
                                <li>债权融资产品数<i>（个）</i></li>
                                <li>债权融资申请笔数<i>（笔）</i></li>
                                <li>债权融资申请金额<i>（万）</i></li>
                                <li>培训活动举办次数<i>（次）</i></li>
                                <li>培训活动参加人数<i>（个）</i></li>
                            </ol>
                        </li>
                    </ul>
                    <div class="bd2">
                        <ul class="ulTab ulZhan">

                        </ul>
                    </div>

                </div>

            </div>
        </div>
    </div>

</div>
<script src="<%=request.getContextPath() %>/manage/statistics/js/loading.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/echarts.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/sichuan.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/china.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/jquery.fullPage.min.js"></script>
<script src="<%=request.getContextPath() %>/manage/statistics/js/mainTV.js"></script>

<!--<script src="<%=request.getContextPath() %>/manage/statistics/js/jquery.pack.js"></script>-->
<!--<script src="<%=request.getContextPath() %>/manage/statistics/js/jquery.SuperSlide.js"></script>-->
</body>
</html>