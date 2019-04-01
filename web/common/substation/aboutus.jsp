<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <s:if test="#session.sessionsubcode=='510117'">
        <!--郫都区-->
        <title>${sessionsubstation}综合金融服务平台</title>
    </s:if>
    <s:else>
        <title>${sessionsubstation}科技金融服务平台</title>
    </s:else>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script type="text/javascript" src="/resource/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/bPage/pageutil.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>
<%@ include file="../../header.jsp"%>
<!-- 内容部分 -->
<div class="ycdata_bgimg" style="position: relative;">
    <h2 style="   position: absolute;top:0;left:0;line-height: 200px;text-align: center;width: 100%;color: #fff;font-size: 50px;letter-spacing: 13px;">${pcaboutus.title }</h2>
    <a href="${aboutustopimg.url }" target="_black"><img id="aboutustopimg" src="${aboutustopimg.image }"></a>
</div>
<div class="bl" style="padding:30px 0;">
    ${pcaboutus.content }
</div>

<script type="text/javascript">
	$('#aboutustopimg').error(function(){
	    $(this).attr('src', "/image/fenzhan/banner_aboutus.jpg?${sysversion}");
	    $(this).parent().attr('href', "javascript:void(0);");
	});
    menu_init("aboutus");
</script>
<%@ include file="footer.jsp"%>

</body>
</html>