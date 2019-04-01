<%@page import="com.winpow.core.system.bean.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
	body{background:#FFF !important;padding:0 20px;margin: 0;overflow: hidden;color: #3d3939;font-family: "微软雅黑"}
	.logo{float:left;line-height: 50px;font-size: 18px;font-weight:bold;padding-left:210px;cursor:pointer;background: url("/resource/zTree3.1/css/zTreeStyle/img/FZlogo.png") no-repeat 0 center;}
</style>
</head>

<body>
<span class="logo">
	${sessionsubstation}科技金融服务平台管理系统
</span>
</body>
</html>
