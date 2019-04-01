<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<head>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    
</head>
<div class="txt-left">盈创动力科技金融服务平台在线申报</div>

<div class="txt-right">
<%  Cust acc =(Cust)session.getAttribute(com.winpow.core.FrontContainer.USER_INFO);
if(acc==null){
 out.print("<li class=\"fl\"><a href=\"/user/login.html\" class=\"login\">登录</a>|<a href=\"/user/register.html\" class=\"register\">注册</a>sdfasdfasdfsadfs</li>");
 }
else { 
	out.print("<li class=\"fl\">欢迎 &nbsp;<a href=\"/usercenter/usercenter.html\"  target=\"_blank\"   class=\"login\" style='color:#FF8C69;'>"+acc.getUserid()+"</a>&nbsp;&nbsp;<a href=\"/user/loginout.html\" target=\"outframe\" class=\"register\" style='color:#000;margin-left:10px;'>退出</a></li>");
;}%>
</div>

	
