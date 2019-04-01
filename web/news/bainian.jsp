<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.news.bean.News"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/video/swfobject.js"></script>
</head>
<body>


<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>






<!-- 资讯列表 -->
<div class="bgcolor" style="margin-top: 0px;">
	<div class="rmations widthbox video" style="z-index:1;">		
		<!-- <iframe style="overflow:hidden;" height=450 width=600 src="/video/bainian.wmv" frameborder=0 allowfullscreen></iframe>-->
		<p id="player1" style="width:720px;height:405px;margin:0 auto;">
		<embed pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" src="/video/bainian.swf" width="720" height="405" id="review_player" allownetworking="all" allowscriptaccess="always" wmode="transparent" allowfullscreen="true" quality="high" bgcolor="#000000" flashvars="pid=1&amp;tid=334&amp;autoLoad=1&amp;as=0&amp;lightBtn=0&amp;popBtn=0&amp;wideBtn=0&amp;tj=1&amp;head=0&amp;pic=&amp;continuePlayer=1&amp;actlogActive=0&amp;realfull=1&amp;oldApi=0&amp;moz=1&amp;autoPlay=1&amp;casualPlay=1&amp;thumbUrl=">
                <!-- <embed type="application/x-shockwave-flash" src="/video/flvplayer.swf" autostart="true" loop="true" width="640" height="480" style="undefined" id="single" name="single" quality="high" allowfullscreen="true" wmode="opaque" flashvars="file=/video/bainian.swf&amp;autostart=true&amp;displayheight=405&amp;backcolor=0x000000&amp;frontcolor=0xCCCCCC&amp;lightcolor=0x557722"> --></p>
            <script type="text/javascript">
                var s1 = new SWFObject("/video/flvplayer.swf", "single", "720", "405", "7");
                s1.addParam("allowfullscreen", "true"); //是否允许全屏播放: Request.Url.Port
                s1.addParam("wmode", "opaque");
                s1.addVariable("file", "/video/bainian.swf"); //单文件播放
                //s1.addVariable("stream", "rtmp://192.168.1.66/oflaDemo/5");
                //s1.addVariable("file","playlist.xml");//列表播放
                //s1.addVariable("image",imgSrc1);//背景图片
                s1.addVariable("autostart", "true");
                s1.addVariable("displayheight", "405"); //播放区域高度
                s1.addVariable("backcolor", "0x000000");
                s1.addVariable("frontcolor", "0xCCCCCC");
                s1.addVariable("lightcolor", "0x557722");
                //s1.addVariable("enablejs","true");//是否允许javascript脚本控制flash
                //s1.addVariable("javascriptid","javascript_id");//控制脚本javascriptid
                s1.write("player1");
            </script>
	</div>
</div>


<script>


</script>

          <%@ include file="../footer.jsp"%>
 

