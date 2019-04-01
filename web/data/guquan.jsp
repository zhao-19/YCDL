<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/echarts.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>



<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/ycdata-banner.png" alt="背景图">
</div>

<hr class="line">
<div class="ycData">
    <div class="box box1">
        <ul class="bl">
            <li>
               <div class="kind">
                    <h2>天府之星数据库</h2>
                    <p>TIANFU STAR DATABASE</p>
                   <a href="https://credit.winpow.com/index.do#/queryGrowth//l/1" target="_blank" class="lookmore">
                     <button type="submit" class="action">查看详情</button>
                   </a>
               </div>
            </li>
            <li>
                <a href="https://credit.winpow.com/index.do#/queryDetail/3282c21b2642fbbb91d0df1fcc0b315d"  target="_blank" class="oneStar">
                    <div class="ov">
                        <div class="fl imgbox"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/ycdata-logo.jpg" alt=""></div>
                        <div class="fl companyName">
                            <p><span>成都清数科技有限公司</span></p>
                            <p><span>行业：计算机</span></p>
                            <p><span>竞争力：<b class="score">63</b></span></p>
                        </div>
                    </div>
                    <div class="companyIntro">
                        <span style="color:#666;">主营业务：</span>计算机信息技术领域的技术开发、技术转让、技术咨询及技术服务；计算机软硬件开发及维护；电子产品的研发及销售；计算机网络工程及技术服务（工程类凭资质许可证经营）；计算机系统集成...
                    </div>

                </a>
            </li>
        </ul>
    </div>
    <div class="box box2">
        <ul class="bl">
            <li>
                <div class="datacircle">
                   <div class="circles">
                        <div class="mapBox  trans5">
                            <div id="kLine6" class="lines"></div>
                        </div>
                    </div>
                    <div class="circleBg">标准组织数据库</div>
                    <span class="one">国际TC</span>
                    <span class="two">国际WG</span>
                    <span class="three">国际SC</span>
                </div>
            </li>
            <li>
                <div class="kind">
                    <h2>标准组织数据库</h2>
                    <p>STANDARD  STRUCTURE DATABASE</p>
                    <a href="/data/toBiaozhun1List.html" class="lookmore">
                     <button type="submit" class="action">查看详情</button>
                   </a>
                </div>
            </li>
        </ul>
    </div>
    <div class="box box3">
        <ul class="bl">
            <li>
                <div class="kind">
                    <h2>标准定制数据库</h2>
                    <p>STANDARD CUSTOM DATABASE</p>
                    <a href="/data/toBiaozhun2List.html" class="lookmore">
                     <button type="submit" class="action">查看详情</button>
                   </a>
                </div>
            </li>
            <li>
                <table class="ycDataTable ycDataTable1 tc trans5">
                    <thead>
                        <tr>
                            <th>企业名称</th>
                            <th>标准名称</th>
                            <th>标准类型</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>成都大唐线缆有限公司</td>
                        <td>ITU-T L.60(2004) 光纤/金属传输线混合缆的结构</td>
                        <td>国际标准</td>
                    </tr>
                    <tr>
                        <td>成都大唐线缆有限公司</td>
                        <td>ITU-T L.79 用于微管气吹安装的光纤光缆及组件</td>
                        <td>国际标准</td>
                    </tr>
                    </tbody>
                </table>
            </li>
        </ul>
    </div>
    <div class="box box4">
        <ul class="bl">
            <li>
                <table class="ycDataTable ycDataTable2 tc trans5">
                    <thead>
                    <tr>
                        <th>企业名称</th>
                        <th>增信权重</th>
                        <th>授信额度</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>成都大唐线缆有限公司</td>
                        <td>20%</td>
                        <td>200万元</td>
                    </tr>
                    <tr>
                        <td>成都市华为赛门铁克科技有限公司</td>
                        <td>15%</td>
                        <td>200万元</td>
                    </tr>
                    </tbody>
                </table>
            </li>
            <li>
                <div class="kind">
                    <h2>标准增信数据库</h2>
                    <p>STANDARD CREDIT DATABASE</p>
                    <a href="/data/toBiaozhun3List.html" class="lookmore">
                     <button type="submit" class="action">查看详情</button>
                   </a>
                </div>
            </li>
        </ul>
    </div>
     <div class="box box7">
        <ul class="bl">
            <li>
                <div class="kind">
                    <h2>党建增信数据库</h2>
                    <p>PARTY CONSTRUCTION CREDIT DATABASE</p>
                    <a href="/data/toBiaozhun4List.html" class="lookmore">
                     <button type="submit" class="action">查看详情</button>
                   </a>
                </div>
            </li>
            <li>
                <table class="ycDataTable ycDataTable1 tc trans5">
                    <thead>
                        <tr>
                            <th>企业名称</th>
                            <th>党支部设立时间</th>
                            <th>党员人数</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>迈普通信技术股份有限公司</td>
                        <td>2002-11-06</td>
                        <td>243</td>
                    </tr>
                    <tr>
                        <td>成都前锋电子有限责任公司</td>
                        <td>2000-10-12</td>
                        <td>126</td>
                    </tr>
                    </tbody>
                </table>
            </li>
        </ul>
    </div>
    <div class="box box5">
        <ul class="bl">
         	<li>
                <ol id="accountBar">
                    <li>01</li>
                    <li>02</li>
                    <li>03</li>
                    <li>04</li>
                    <li>05</li>
                    <li>06</li>
                    <li>07</li>
                    <li>08</li>
                    <li>09</li>
                    <li>10</li>
                </ol>
            </li>
            <li>
                <div class="kind">
                    <h2>会计师事务所</h2>
                    <p>ACCOUNTING FIRM</p>
                    <a href="/sbdirectdata/kuaijishi.html" class="lookmore">
                     <button type="submit" class="action">查看详情</button>
                   </a>
                </div>
            </li>
        </ul>
    </div>
    <div class="box box6">
        <ul class="bl">
         	<li>
                <div class="kind">
                    <h2>评级机构</h2>
                    <p>RATING AGENCIES</p>
                    <span class="lookmore" style="visibility: hidden;">
                     <button type="submit" class="action">查看详情</button>
                   </span>
                </div>
            </li>
            <li>
                <ol class="jigou tc">
                    <li>
                        <div><p>四川远东资信评估有限公司</p></div>
                        <div><p>四川椰都信用管理评估有限公司</p></div>
                    </li>
                    <li>
                        <div><p>联合信用管理有限公司四川分公司</p></div>
                        <div><p>中国诚信信用管理有限公司四川分公司</p></div>
                    </li>
                    <li>
                        <div><p>四川中诚信用评估有限公司</p></div>
                        <div><p>大华国信资信评估有限公司成都分公司</p></div>
                    </li>
                    <li>
                        <div><p>四川省大证信用评估服务事务所有限公司</p></div>
                        <div><p>四川省金通咨询资信评估有限责任公司</p></div>
                    </li>
                    <li>
                        <div><p>四川正平信用评估有限公司</p></div>
                        <div><p style="padding:0 2px;">东方金诚国际<br>信用评估有限<br>公司四川分公司</p></div>
                    </li>
                </ol>
                <p class="tc"><span class="notice">注：其公司表示为入围评级机构</span></p>
            </li>
        </ul>
    </div>
</div>

<script>
function doquery(){
    var query = $('#contentquery').val();
 	if(query=='') {
		
	}else {
		var url = '/data/toGuquanList.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
 }
</script>

<div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
table,td{border-collapse:collapse;  border: 0;text-align:center;}
.tc{text-align: center;}
.trans5{transition: 0.5s;  -webkit-transition: 0.5s;  -moz-transition: 0.5s;  -o-transition: 0.5s;}
.fixed{top:auto;bottom:10%!important;height:82px;}
        
 .circles{width:264px;height:264px;border-radius: 50%;border:1px solid #7F8078;position: absolute;top:0;left:20%; z-index: 100;}
  button[type="submit"].action {
            width: 100%;
            height: 43px;
            border: none;
            border-radius: 5px;
            font-family: "微软雅黑";
            font-size: 16px;
            color: #fff;
            letter-spacing: 0.1em;
            overflow: hidden;
            text-overflow: ellipsis;
            background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzY2YWFmZiIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzRkOWNmZiIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
            background-size: 100%;
            background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #66aaff), color-stop(100%, #4d9cff));
            background-image: -moz-linear-gradient(#66aaff, #4d9cff);
            background-image: -webkit-linear-gradient(#66aaff, #4d9cff);
            background-image: linear-gradient(#26bbed , #00b1ec);
            color: white;
            /*border-bottom: 1px solid #1793bc;*/
            cursor: pointer;
        }
        button[type="submit"].action:hover {
            background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzRkOWNmZiIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzMzOGVmZiIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
            background-size: 100%;
            background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #4d9cff), color-stop(100%, #338eff));
            background-image: -moz-linear-gradient(#4d9cff, #338eff);
            background-image: -webkit-linear-gradient(#4d9cff, #338eff);
            background-image: linear-gradient(#00b1ec , #00a6dd);
        }
        button[type="submit"].action:active {
            background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzMzOGVmZiIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzRkOWNmZiIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
            background-size: 100%;
            background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #338eff), color-stop(100%, #4d9cff));
            background-image: -moz-linear-gradient(#338eff, #4d9cff);
            background-image: -webkit-linear-gradient(#338eff, #4d9cff);
            background-image: linear-gradient(#00a6dd , #00b1ec);
            border-bottom: 0;
            margin-top: 1px;
            height: 42px;
            -moz-box-shadow: inset 0 1px 5px 1px rgba(0, 0, 0, 0.2);
            -webkit-box-shadow: inset 0 1px 5px 1px rgba(0, 0, 0, 0.2);
            box-shadow: inset 0 1px 5px 1px rgba(0, 0, 0, 0.2);
        }
        button[type="submit"].action:focus {
            outline: none;
        }
        .banner{width:100%;height:70px;background: lightblue;}
        .line{border:0;width:100%;height:1px;background: #dcdcdc;margin: 0; }
        .ycData{color:#333;}
        .ycData li{float:left;}
        .ycData *{box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;}
        .ycData .box{width:100%;height:500px;}
        .ycData .box:nth-child(even){background: #f4f4f4;}
        .ycData .box>ul{padding:0 34px;height:100%;}
        .ycData .box>ul>li{width:50%;height:100%;}
        .ycData .box6>ul{padding-right:0;}
        .ycData .box6>ul>li:first-child{width:559px;}
        .ycData .box6>ul>li:last-child{width:607px;}
        .ycData .box1{padding-top:120px;}
        .ycData .box2{padding-top:130px;}
        .ycData .box3,.ycData .box4,.ycData .box7{padding-top:140px;}
        .ycData .box5{padding-top:125px;}
        .ycData .box6{padding-top:55px;}
        .ycData .box6 li:nth-child(1) .kind{padding-top:115px;}
        .ycData  li:nth-child(even) .kind{float:right;}
        .ycData .kind h2{font-size:36px;font-weight: normal;}
        .ycData .box1 .kind{margin-top:10px;}
        .ycData .kind p{font-size:16px;margin:50px 0 70px;}
        .ycData .kind .lookmore{display: inline-block;width:258px;}
        .ycData .box1 .oneStar{display:block;width:545px;height:260px;border-radius: 5px;border:2px solid #87d1f5;background:#f7fdfe;
            padding:30px 30px 0;
        }
        .ycData .box1 .oneStar:hover{background: #F2FAFD;border-color:#1eaef4;}
        .ycData .oneStar .imgbox{width:224px;height:119px;border:1px solid #e3e3e3;background: #fff;margin-right:27px;}
        .ycData .oneStar .imgbox img{width:100%;height:100%;}
        .ycData .oneStar .companyName p>span{display:inline-block;font-size:15px;color:#fff;height:35px;line-height:35px;background:#87d1f5;margin-top:7px;padding:0 20px 0 10px; }
        .ycData .oneStar .companyName p:first-child>span{font-size:16px;background: #00b1ec url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/ycdata-companyname-point.png") no-repeat 4px center;margin-top:0;width:230px;padding-left:17px;}
        .ycData .oneStar .companyName .score{font-size:20px;font-weight: normal;}
        .ycData .oneStar .companyIntro{font-size:14px;color:#444;margin-top:15px;line-height: 25px;}
        .datacircle{position: relative;width:440px;}
        .datacircle .circleBg{opacity: 0;line-height:264px;width: 100%;font-size:18px;text-align:center;}
        .datacircle>span{padding-left:30px;padding-right:30px;display:inline-block;opacity:0;line-height:40px;width:160px;height:60px;color:#dd3535;font-size:20px;position: absolute;}
        .datacircle>span.one{transition-delay: 0.5s;top:31px;left:-30px;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/path1.png") no-repeat right 0;}
        .datacircle>span.two{transition-delay: 1s;text-align:right;top:8px;left:273px;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/path2.png") no-repeat 0 0;}
        .datacircle>span.three{transition-delay: 1.5s;width:150px;padding-top:45px;text-align:right;top:177px;left:310px;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/path3.png") no-repeat 0 0;}

        .ycDataTable{font-family:"Adobe 黑体 Std",hei,"微软雅黑";width:100%;margin-top: 5px;border-radius:  8px 8px 0 0;}
        .ycDataTable:hover{box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);}
        .ycDataTable thead th{height:76px;font-size:21px;font-weight: normal;}
        .ycDataTable thead th:first-child{border-top-left-radius: 8px;}
        .ycDataTable thead th:last-child{border-top-right-radius: 8px;}
        .ycDataTable1 thead th:first-child{width:170px;}
        .ycDataTable2 thead th:nth-child(2){width:170px;}
        .ycDataTable thead th:last-child{width:150px;}
        .ycDataTable thead th:nth-child(odd){background: #87d1f5;}
        .ycDataTable thead th:nth-child(even){background: #00b1ec;}
        .ycDataTable td{height:82px;padding:0 15px;font-size:14px;color:#666;}
        .ycDataTable tr:nth-child(even) td:nth-child(odd){background: #e3e3e3;}
        .ycDataTable tr:nth-child(even) td:nth-child(even){background: #ebebeb;}
        .ycDataTable tr td:last-child,.box4 .ycDataTable tr td:nth-child(2){color:#dd3535;}
        .box6 .jigou{width:100%;height:373px;font-family: "Adobe 黑体 Std","微软雅黑";font-size: 15px;margin-bottom:22px;}
        .box6 .jigou>li{width:115px;margin-right:8px;height:100%;opacity: 0;
            transition: 0.5s;  -webkit-transition: 0.5s;  -moz-transition: 0.5s;  -o-transition: 0.5s;
        }
        .box6 .jigou>li:nth-child(1){transition-delay: 0s;}
        .box6 .jigou>li:nth-child(2){transition-delay: 0.5s;}
        .box6 .jigou>li:nth-child(3){transition-delay: 1s;}
        .box6 .jigou>li:nth-child(4){transition-delay: 1.5s;}
        .box6 .jigou>li:nth-child(5){transition-delay: 2s;}
        .box6 .jigou>li:last-child{margin-right:0;}
        .box6 .jigou>li:nth-child(odd){padding-top:223px;background:url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/ycdata-down.png") no-repeat center 178px;}
        .box6 .jigou>li:nth-child(even){background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/ycdata-up.png") no-repeat center 170px;}
        .box6 .jigou>li>div{position:relative;width:112px;height:67px;margin:0 auto 15px;line-height: 20px;border:1px dashed #87d1f5;}
        .box6 .jigou>li>div>p{line-height: 19px;padding:0 10px;width:100%;position: absolute;top:50%;left:50%;transform: translate(-50%,-50%)}
        .box6 .notice{display: inline-block;color:#666;font-size:16px;padding-left:21px;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/gray-point.png") no-repeat 0 center;}
        .box5 #accountBar{height:260px;position: relative;}
        #accountBar>li{position:absolute;bottom:0;width:40px;height:0;margin-right:10px;color:#fff;font-family: "Adobe 黑体 Std","微软雅黑";font-size:17px;text-align:center;background: #00b1ec;
            transition: 1s ease-out;  -webkit-transition: 1s ease-out;  -moz-transition: 1s ease-out;  -o-transition: 1s ease-out;

        }
        #accountBar>li:nth-child(even){background: #87d1f5;}
        #accountBar>li:nth-child(1){left:0;}
        #accountBar>li:nth-child(2){left:50px;}
        #accountBar>li:nth-child(3){left:100px;}
        #accountBar>li:nth-child(4){left:150px;}
        #accountBar>li:nth-child(5){left:200px;}
        #accountBar>li:nth-child(6){left:250px;}
        #accountBar>li:nth-child(7){left:300px;}
        #accountBar>li:nth-child(8){left:350px;}
        #accountBar>li:nth-child(9){left:400px;}
        #accountBar>li:nth-child(10){left:450px;}
        #accountBar.accountBar_on>li:nth-child(1){height:100%;}
        #accountBar.accountBar_on>li:nth-child(2){height:93%;}
        #accountBar.accountBar_on>li:nth-child(3){height:88%;}
        #accountBar.accountBar_on>li:nth-child(4){height:83%;}
        #accountBar.accountBar_on>li:nth-child(5){height:76%;}
        #accountBar.accountBar_on>li:nth-child(6){height:70%;}
        #accountBar.accountBar_on>li:nth-child(7){height:63%;}
        #accountBar.accountBar_on>li:nth-child(8){height:57%;}
        #accountBar.accountBar_on>li:nth-child(9){height:51%;}
        #accountBar.accountBar_on>li:nth-child(10){height:45%;}
        .lines{width:350px;height:350px;margin:-45px 0 0 -45px;}
        .lines canvas{background:transparent;}
        .mapBox{opacity: 0;}
        .box7 .ycDataTable tr td:last-child{color:#666;}

</style>

<script>
 menu_init("data");

</script>
<script>
function myChart6(){
    var myChart = echarts.init(document.getElementById("kLine6"));
    option = {
        series: [
            {
                name:'访问来源',
                type:'pie',
                radius: ['50%','60%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:[


                    {value:15, name:'联盟广告'},
                    {value:25, name:'邮件营销'},
                    {value:60, name:'直接访问'}

                ]
            }
        ],
        color: ['#7B7C74','#00B1EC','#87D1F5']
    };


    myChart.setOption(option);
}


    var box2=$('.box2').offset().top;
    var box5=$('.box5').offset().top;
    var box6=$('.box6').offset().top;
    
    $(window).scroll(function(){
        if($(window).scrollTop()>=box2-600){
        	 $('.circleBg').css('transform','rotate(360deg)').css('opacity','1');
        	 $('.mapBox').css('opacity','1');
        
             $('.datacircle>span').addClass('trans5').css('opacity','1').css('paddingLeft','0').css('paddingRight','0');
             myChart6();
        }
        if($(window).scrollTop()>=box5-600){
           $('#accountBar').addClass('accountBar_on');
        }
        if($(window).scrollTop()>=box6-600) {
            $('.box6 .jigou>li').css('opacity','1');
        }
    })
    
     
</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>


