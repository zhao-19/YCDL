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
</head>
<body>


<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 背景图片 -->
<div class="ycdata_bgimg">
	<img src="../image/box/rm_bg.png" alt="背景图">
</div>




<!-- 资讯列表 -->
<div class="bgcolor">
	<div class="rmations widthbox">
		<div class="rmations_left fl">
			<div class="tiltle"><span>热门资讯</span>
			
			
			 
				 
				   <% for (int i = 0;i<SystemManager.indexPage.getNewsList().size();i++) {
			  		if(i>=5){
			  			break;
			  		}
					News n = SystemManager.indexPage.getNewsList().get(i);
					 String title = n.getTitle();
					 String newsid = n.getId();
					if(i==0) {
				 
						out.print("<div class=\"hotimg\">");
						out.print("<img class=\"rmsimg fl\"  src=\""+n.getCover()+"\" alt=\""+title+"\">");
 						out.print("</div>");
						out.print("<div class=\"content\">");
						out.print("<div class=\"dian fl\"></div>");
						out.print("<div class=\"text fl\"><a  alt=\""+title+"\" href=\"/newsdetail/"+newsid+".html\">"+title+"</a></div>");
						out.print("<div class=\"time\">"+n.getSendtime().substring(0,10)+"</div>");
						out.print("</div>");
					}else {
						out.print("<div class=\"content\">");
						out.print("<div class=\"dian fl\"></div>");
						out.print("<div class=\"text fl\"><a  alt=\""+title+"\" href=\"/newsdetail/"+newsid+".html\">"+title+"</a></div>");
						out.print("<div class=\"time\">"+n.getSendtime().substring(0,10)+"</div>");
						out.print("</div>");
 						
		 
				
					
					}
 
				}%>
				 
				 
				 
				 
			</div>
		</div>


		<div class="rmations_right fr">
			<div class="title"><s:property value="#request.zc.mingcheng"/></div>
			<div class="info_icon">
				<div class="icon fl"></div>
				<div class="time fl">发布时间：<s:property value="#request.zc.lurushijian.substring(0,10)"/></div>
				<div class="laiyuan fl">来源：<s:property value="#request.zc.laiyuan"/></div>
				<div class="fl downloadfile"><a href="/download.action?number=3&id=<s:property value="#request.zc.id"/>">政策下载</a></div>
			</div>

			<div class="content fl">
<s:property value="#request.zc.neirong" escapeHtml="false"/>
			</div>
		</div>
	</div>
</div>


<script>
 menu_init("interestapp");

</script>

          <%@ include file="../footer.jsp"%>
 

