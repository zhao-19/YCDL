<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/help/help.css"/>
</head>
<body>
<%@ include file="../../header.jsp"%>

<div class="bl helpbox">
    <div class="helpLeft">
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/helpcenter.png" alt="">
    <ul class="helpNav">
        <li class="active"><a href="1.jsp">注册 <span>></span></a></li>
        <li><a href="2.jsp">登录 <span>></span></a></li>
        <li><a href="3.jsp">进入用户中心  <span>></span></a></li>
        <li><a href="4.jsp">用户中心首页  <span>></span></a></li>
        <li><a href="5.jsp">企业基本信息  <span>></span></a></li>
    </ul>
    </div>
    <div class="helpRight">
        <p><a href="/">首页</a> > <a href="#">帮助中心</a> > <b>注册</b></p>
        <div id="content">
           <div id="item1" class="item">
               <h2>
                   点击首页右上角注册按钮，弹出注册页面。
               </h2>
               <ul>
                   <li><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/fenzhan/qy1.gif" alt=""/></li>
               </ul>
           </div>
       </div>
    </div>
</div>

<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/help/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/help/app.js"></script>

<%@ include file="../../footer.jsp"%>
</body>
</html>