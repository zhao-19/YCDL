<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/bxinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<style>
		.ywcontent>li>a{padding-top:30px;font-size: 15px;}
	</style>
</head>

<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>
<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../leftnav.jsp"%>
	</div>
	<div class="list fr">
		<!--<div class="rightbox">-->
			<!--<div id="zaiquanxinxi-update" class="vipinfo" >-->
				<!--<div class="title">-->
					<!--<li>-->
						<!--<span class="t">数据报送汇总</span>-->
					<!--</li>-->
				<!--</div>-->
				<!--<div class="third-list"><span>金融机构数据报送<b>>></b></span>-->
					<!--<ul>-->
						<!--<li id='bxinfo'><a href='/userextend/getBxlist.html?t=v'>保险公司数据报送</a></li>-->
						<!--<li id='yhinfo'><a href='/userextend/getYhlist.html?t=v'>银行数据报送</a></li>-->
						<!--<li id='qsqhinfo'><a href='/userextend/getQsqhlist.html?t=v'>券商期货数据报送</a></li>-->
						<!--<li id='rzzninfo'><a href='/userextend/getRzznlist.html?t=v'>融资租赁数据报送</a></li>-->
						<!--<li id='ysscinfo'><a href='/userextend/getYssclist.html?t=v'>要素市场数据报送</a></li>-->
						<!--<li id='gqtzinfo'><a href='/userextend/getGqtzlist.html?t=v'>股权投资数据报送</a></li>-->
					<!--</ul>-->
				<!--</div>-->
				<!--<div class="third-list"><span>自贸区企业数据报送<b>>></b></span>-->
					<!--<ul>-->
						<!--<li id='qyinfo'><a href='/userextend/getQylist.html?t=v'>自贸区企业数据报送</a></li>-->
					<!--</ul>-->
				<!--</div>-->
			<!--</div>-->
			<div class="ywbox" style="border-bottom: 0;margin-top:40px;">
				<h2>金融机构数据报送</h2>
				<ul class="ywcontent ov">
					<li id='bxinfo'><a href='/userextend/getBxlist.html?t=v'>保险公司<br>数据报送</a></li>
					<li id='yhinfo'><a href='/userextend/getYhlist.html?t=v'>银行<br>数据报送</a></li>
					<li id='qsqhinfo'><a href='/userextend/getQsqhlist.html?t=v'>券商期货<br>数据报送</a></li>
					<li id='rzzninfo'><a href='/userextend/getRzznlist.html?t=v'>融资租赁<br>数据报送</a></li>
					<li id='ysscinfo'><a href='/userextend/getYssclist.html?t=v'>要素市场<br>数据报送</a></li>
					<li id='gqtzinfo'><a href='/userextend/getGqtzlist.html?t=v'>股权投资<br>数据报送</a></li>
				</ul>
			</div>
			<div class="ywbox" style="border-top: 0;">
				<h2>自贸区企业数据报送</h2>
				<ul class="ywcontent ov">
					<li id='qyinfo'><a href='/userextend/getQylist.html?t=v'>自贸区企业<br>数据报送</a></li>
				</ul>
			</div>
		</div>	
	</div>
</div>
 <%@ include file="../../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("jrindex");
 </script>
</body>
</html>