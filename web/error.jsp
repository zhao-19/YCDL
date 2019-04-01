<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>


<!-- 网站头部 -->
	<%@ include file="header.jsp"%>
 

<div class="download widthbox" style="min-height: 250px; text-align: center;  margin-top: 120px; font-size: 24px;">   
  		<s:property value="#session.action_exception_error"  escapeHtml="false" />
 </div>



 
 

<!--盈创活动end-->
         <%@ include file="footer.jsp"%>

</body>
</html>
