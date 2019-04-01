<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<%@page import="com.winpow.services.manage.guquan.bean.Guquan"%>
<%@page import="com.winpow.services.manage.jigou.bean.Jigou"%>
 
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

   <style>
        .dktishi{ animation: change 1s  linear infinite      ;    }
        @keyframes change {
             0%{ color:#fff}
            100%{ color:#000}
        }
    </style>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>

<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/box/cre_bg.png" alt="背景图">
</div>

<!-- 信息展示 -->

<div class="bgcolor">
<div class="creditors widthbox">
	<div class="creditors_left fl">
		<div class="title">
			<div class="titles">最热项目推荐</div>
			
			<!-- 
			<img src="../image/box/crs_bg.png" alt="">
			<div class="list">
				<ul>
					<li><div class="icon fl"></div><a href="">家装O2O平台“惠装”获千万美元A+轮融</a></li>
					<li><div class="icon fl"></div><a href="">家装O2O平台“惠装”获千万美元A+轮融</a></li>
					<li><div class="icon fl"></div><a href="">家装O2O平台“惠装”获千万美元A+轮融</a></li>
					<li><div class="icon fl"></div><a href="">家装O2O平台“惠装”获千万美元A+轮融</a></li>
					<li><div class="icon fl"></div><a href="">家装O2O平台“惠装”获千万美元A+轮融</a></li>
				</ul>
			</div>
			
			 -->
			
			
		  
      			  <% for (int i = 0;i<SystemManager.indexPage.getGuquanList().size();i++) {
					 	
 						Guquan g = SystemManager.indexPage.getGuquanList().get(i);
					 		
					 	if(i==0) {
					 		 out.print("<a href=/stockdetail/"+g.getId()+".html> <img style=\"width:288px;height:176px\" src=\""+g.getDetailpic()+"\" alt=\"\" ></a>");
					 		 out.print("<div class=\"list\">");
				 			 out.print("<ul>");
					 	}else {
							 out.print("<li><div class=\"icon fl\"></div><a href=/stockdetail/"+g.getId()+".html>"+g.getMingcheng()+"</a></li>");
					 	}	
					}
					 out.print("</ul>");
					 out.print("</div>");
					
			 
 
				%>
				
				
				
		</div>
		<div class="huise"></div>
		<div class="top">
			<div class="title fl">top推荐机构</div>
			<div class="li">
				<ul>
				
				
				
				<%  
			 			int i=0 ;
						out.print("<li><div class=\"topicon1 fl\">1</div>"+SystemManager.indexPage.getJigouList().get(i++).getJigoumingcheng()+"</li>");
						
						out.print("<li><div class=\"topicon2 fl\">2</div>"+SystemManager.indexPage.getJigouList().get(i++).getJigoumingcheng()+"</li>");
						out.print("<li><div class=\"topicon3 fl\">3</div>"+SystemManager.indexPage.getJigouList().get(i++).getJigoumingcheng()+"</li>");
						out.print("<li><div class=\"topicon0 fl\">4</div>"+SystemManager.indexPage.getJigouList().get(i++).getJigoumingcheng()+"</li>");
 			 

				 %>
				
				 
				</ul>
			</div>
			
		</div>

	</div>
	<div class="creditors_right fr">
		<div class="type">
			<div class="title fl"><s:property value="e.prodname"/></div>
			
				<s:iterator value="e.biaoqian.split(' ')" status="st" var="as">  
 							<div class="fkk fl"><s:property value="#as"/></div>
			 </s:iterator> 
			 
		 
			<div class="dked">贷款额度（万元）：<s:property value="e.loanamt"/>万 - <s:property value="e.loanamtmax"/>万</div>
			<div class="list">

				<s:if test='e.loanterm==e.loantermmax' >
					<div class="li fl"><div class="dian fl"></div>贷款期限：<s:property value="e.loanterm"/>  月</div>
				</s:if>
				<s:else>
					<div class="li fl"><div class="dian fl"></div>贷款期限：<s:property value="e.loanterm"/>-<s:property value="e.loantermmax"/>月</div>
				</s:else>
				<div class="li fl"><div class="dian fl"></div>还款方式： <s:property value="e.retutype"/> </div> 
				<div class="li fl"><div class="dian fl"></div>担保方式： <s:property value="e.loangur"/> </div>
				<div class="li fl"><div class="dian fl"></div>使用地区：<s:property value="e.loanarea"/></div>
 				
			</div>
			<div class="ljsqdk">
				<a href="/usercenter/toAppProductappinfo.html?proid=${e.flowno }&pid=${e.id }">立即申请贷款</a>
			</div>
			<div class="dktishi"><%=request.getAttribute("productStr")%></div>
		</div>
		<div class="content">
			<div class="title">
				<div class="text">贷款须知</div>
			</div>
			 
				<div class="biaoti"><div class="dayu fl"></div>产品特点</div>
			<div class="info">
				<div class="neirong">
					<s:iterator value="e.productdetail.split(' ')" status="st" var="as">  
			  			
<div class="dainli"><div class="dayu fl"></div> <s:property value="#as"/> </div>

					 </s:iterator> 
			</div>
			</div>
			 
				<div class="biaoti"><div class="dayu fl"></div>申请条件</div>
			<div class="info">
			<s:iterator value="e.loancondition.split(' ')" status="st" var="as">  
			  			
<div class="dainli"><div class="dayu fl"></div> <s:property value="#as"/> </div>
					 </s:iterator> 
					 
			</div>
			<div class="biaoti"><div class="dayu fl"></div>服务流程</div>
			<img style="margin-top:20px;margin-left:35px;max-width:700px;" src="<s:property value="e.banliliuc"/>"/>
		</div>
	</div>
</div>
</div>

<div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;height:82px;}
</style>
<script>
 menu_init("product");
</script>
 

<!-- 网站尾部 -->
          <%@ include file="../footer.jsp"%>

 