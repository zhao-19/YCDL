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
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.dialogBox.js"></script>
	<style>
		.fwxq-cont{font:14px/25px '微软雅黑';color:#444;padding:25px;}
		.fwxq-cont .zjbox{width:100%;background: #eee;}
		.fwxq-cont .zjbox>h2{background: #fff;padding: 15px 0;}
		.tzq-cont{background: #fff;}
		.tzq-cont .tzq-text{border:1px solid #d1dfff;}
		.tzq-cont .tzq-text>p{display: flex; padding: 10px 0;}
		.tzq-cont .tzq-text>p:first-child>span{color:#6185d6;}
		.tzq-cont .tzq-text>p>span{width: 20%;white-space: normal;padding:0 10px;color:#666;box-sizing: border-box;}
		.tzq-cont .tzq-text>p>span:nth-child(2){width: 80%;}
		.tzq-cont .tzq-text2>p>span:nth-child(2){width: 60%;}
		.tzq-cont .tzq-text>p:nth-child(even){background-color: #fff ;}
		.tzq-cont .tzq-text>p:nth-child(odd){background-color: #eef2fb;}
		.tzq-cont .tzq-text>p{background: url("/app/images/linepoint.png") repeat-y 20% 0;  }
		.tzq-cont .tzq-text2>p{background-image: url("/app/images/linepoint.png"),url("/app/images/linepoint.png");
			background-repeat: repeat-y;
			background-position: 20% 0,80% 0;
		}
		.tzq-cont .tzq-text{margin:0.1rem 0;}
		.tzq-cont h4{margin: 15px 0 10px;font-size: 16px;}
		.zizhi{overflow: hidden;}
		.zizhi>img{width: 49%;float:left;margin-right: 2%;}
		.zizhi>img:nth-child(even){margin-right: 0;}
		.img{position: relative;}
		.img img{background: #f9f9f9;}
		.img i{position: absolute;top:0;left:0;width: 140px;height: 36px;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/box/zjactip.png") no-repeat;}
	</style>

</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>
<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<a href="/incre/toacList.html" target="_blank" > <img src="../image/box/zjbanner.jpg" alt="背景图"></a>
</div>
<div class="bgcolor">
	<div class="increases widthbox">
		<div class="increases_left fl">
		<div class="title">热门推荐服务</div>
				<% for (int i = 0;i<SystemManager.indexPage.getIncreList().size();i++) {
					if(i>=3){
						break;
					}
					Incre g = SystemManager.indexPage.getIncreList().get(i);
					
					
					out.print("<div class=\"infobox\">");
					out.print("<div class=\"infoimg\">");
					out.print("<a href=\"/incredetail/"+g.getId()+".html\">	<img src="+g.getPicture()+"></a>");
					out.print("</div>");
					out.print("<h3><div class=\"content\">   "+g.getIncrename()+" </div> </h3>");
					out.print("<div class=\"qian\">￥"+g.getIncreprice()+"</div>");
					out.print("	</div>");
					 

				}%>
				
				
		</div>

		<div class="increases_right fr">
			<div class="infobox">
				<div class="img fl">
					<img src='<s:property value="e.picture" />' alt="">
					<s:if test="e.joinactivity==10001">
						<i></i>
					</s:if>
				</div>
				<div class="textinfo fr">
					<div class="title"><s:property value="e.increname" />
						<s:if test="e.joinactivity==10001">
							<i>感恩回馈</i>
						</s:if>
					</div>
					<div class="daikuan fl"> <input type="hidden" id="increid" value="<s:property value="e.id" />"/> <input type="hidden" id="incename" value="<s:property value="e.increname" />"/>
						<s:if test="e.joinactivity==10001">
							<div class="zongjia fl">服务总价：</div><div class="jiacu fl">￥<b><s:property value="e.activityprice" /></b>起</div>
							<s>￥<s:property value="e.increprice" /></s>
						</s:if>
						<s:if test="e.joinactivity!=10001">
							<div class="zongjia fl">服务总价：</div><div class="jiacu fl">￥<b><s:property value="e.increprice" /></b>起</div>
						</s:if>
						
					</div>	
				  <s:property value="e.incredescrip" />
					<!-- 数量： -->
				 <br/>
				 <br/>
					<div class="bot fl">
						<div class="imgbot" id="btn-typesss">立即订购</div>
						<div id="type-dialogBox"></div>
					</div>
					<script>
						$('#btn-typesss').click(function(){
							$('#type-dialogBox').dialogBox({
								type: 'correct',  //three type:'normal'(default),'correct','error',
								width: 400,
								height: 200,
								hasMask: true,
								hasClose: true,
								//autoHide: true,
								time: 500,
								hasBtn: true,
								effect: 'sign',
								title: '小窗为您服务！',
								content: '订购后，盈创动力管理员会在3个小时内联系您，非工作时间顺延，请保持电话畅通!'
							});
						})
						
						
					</script>




				</div>
			</div>

		<br/>


		<div class="fwxq-cont">
		  <s:property value="e.increcontenttext" escapeHtml="false"/> 
		
		</div>
			
			<!-- 
			<div class="beijing">
				<div class="xqjs fl">详情介绍</div>
			</div>
			<div class="content_fwlr">
				<li class="content_title">服务内容</li>
				<li class="content_fwlrinfo"> 
	 	<s:iterator value="e.increcomtent.split(' ')" status="st" var="as">  
			  			
				<s:property value="#as"/>
					<br/>
			 </s:iterator>
		
				</li>
				<li class="content_title" style="margin-bottom:5px;">服务流程</li>
				<img style="margin-left:45px;" src="../image/zzfwlc_02.png"/>
			</div>
			 -->


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
 menu_init("incre");
</script>


<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>

