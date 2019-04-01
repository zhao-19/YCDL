<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <c:if test="${param.title!=null and param.title !=''}">
    <title>${param.title}</title>
  </c:if>
  <meta charset="utf-8">
  <meta name="keywords" content="盈创动力">
  <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
  <meta name="timeout" content="5000" lizardexpansion="true">
  <meta name="format-detection" content="telephone=no">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <link rel="shortcut icon" href="/favicon.ico" >
  <link href="/app/css/reset.css?${sysversion}" rel="stylesheet" />
  <link href="/app/css/style.css?${sysversion}" rel="stylesheet" />
  <link href="/app/css/app.css?${sysversion}" rel="stylesheet" />
  <script src="${pageContext.request.contextPath}/app/js/jquery-1.8.3.js"></script>
  <script type="text/javascript">
    var basepath = "${pageContext.request.contextPath}";
  </script>
  <script src="${pageContext.request.contextPath}/app/js/common.js?<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>"></script>
  <script src="${pageContext.request.contextPath}/app/js/pinchzoom.js?<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>"></script>
  <script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js "></script>
  <script src="${pageContext.request.contextPath}/app/js/jq.wxShare_data.js"></script>
  <script src="${pageContext.request.contextPath}/app/js/jq.wxShare.js"></script>
</head>
