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
		<%--<div class="rmations_left fl">
			<div class="tiltle"><span></span>
			
			
			 
				 
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
		</div>--%>


		<div class="rmations_right fr" style="width: auto;">
			<div class="title"><s:property value="e.title"/>网上申请</div>
			<div class="info_icon">
				<%--<div class="icon fl"></div>
				--%><%--<div class="time fl">发布时间：<s:property value="e.sendtime"/></div>
				<div class="laiyuan fl">来源：<s:property value="e.source"/></div>
			--%></div>

			<div class="content" style="width: auto;">
<s:property value="e.contents" escapeHtml="false"/>
<img style="width: 600px;height: 200px;display: block;margin-bottom: 15px;" src="../image/222.jpg"/>
项目或机构，登录平台，注册账号，填写基础信息。2016年10月10日，高投集团总经理许君如带领高投担保公司、高投创业公司、高投盈创公司、高投科贷公司主要负责人及相关工作人员赴雅安对盈创动力雅安工作站前期盈创动力科技金融服务模式推广工作进行回访。雅安市副市长赵京东及雅安市科技和知识产权局、雅安市科技情报所、雅安市金融办、雅安市经信委、雅安经开区等相关部门领导全程陪同并参加座谈交流。
此行，许君如总经理一行首先参观了雅安市规划馆，对雅安市灾后重建情况和城市及产业布局规划进行了了解，加深了对雅安市城市规划、产业布局、工业园区等情况的认识。随后，双方在雅安市政府对工作站前期工作情况和下一步深入合作进行了座谈交流，高投盈创公司对盈创动力雅安工作站前期工作情况进行了汇报，高投担保公司、高投创业公司、高投科贷公司对各自公司及业务情况进行了介绍，雅安市各部门详细介绍了雅安市科技、金融、工业、产业发展、城市规划等情况并提出了下一步深入合作期望。
赵京东副市长对前期盈创动力雅安工作站取得的成绩给予了充分肯定，并希望在接下来工作站要发挥出更大的作用，也希望接下来与高投集团开展更多的合作。
许君如总经理在听取了前期工作站情况汇报和雅安市合作交流意愿后。
			</div>
		</div>
	</div>
</div>


<script>
 menu_init("news");

</script>

          <%@ include file="../footer.jsp"%>
 

