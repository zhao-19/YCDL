<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>
<%@page import="java.math.BigDecimal"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.oscache.Dynamic"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.news.bean.News"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.services.manage.guquan.bean.Guquan"%>
<%@page import="com.winpow.services.manage.product.bean.Product"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>
<%@page import="com.winpow.services.manage.jigou.bean.Jigou"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<%@page import="com.winpow.core.util.DateTimeUtil"%>
<%@page import="com.winpow.core.FrontContainer"%>
<%@page import="com.winpow.services.common.HtmlUtil"%>
<%@ page import="com.winpow.services.manage.guquanfinancing.bean.GuquanFinancing" %>
<%@ page import="java.util.List" %>
<%@ page import="com.winpow.core.system.bean.Config" %>

<!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd”>
<html xmlns=”http://www.w3.org/1999/xhtml”>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <meta name="keywords" content="企业贷款,贷款,盈创,盈创动力,盈创动力服务平台,高投创投,中小企业融资,科技企业融资,科技金融服务中心,风险投资,政府投融资平台,投融资金融服务平台,企业发展服务平台,知识产权服务平台,人才培训服务平台,共性技术支撑平台,债权融资,股权融资,上市融资,投融资服务,债权,股权,投资,融资,投融资,投资项目,项目,项目融资,统借统还,基金,天使基金,融资顾问,项目监理,金融服务,投融资综合服务提供商,路演中心,投资信息,数据库,企业发展咨询,知识产权,知识产权服务,人才培训,企业培训,技术支撑,同业工会,财富俱乐部,创业投资研究所,投资事件,IPO事件,并购事件,募资事件,贷款,担保,活动,培训" /><meta name="description" content="致力打造国内领先的科技金融服务门户网站,提供债权投资,股权投资,风险投资,担保,小贷等金融信息服务,为创业者,创业企业与机构搭建了沟通与信息交流的平台。" />
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/skitter.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.slideBox.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index2.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.6.4.min.js" ></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.skitter.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/creditor.js"></script>

	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate-1.13.1.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/fbrzxq.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.SuperSlide.2.1.1.js"></script>

	<link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<!--会员注册成功提示registerok-->
<!--	<input type="hidden" id="registerok" value="<s:property value="#request.registerok"/>">
	<input type="hidden" id="custmanage" value="<s:property value="#request.custmanage"/>">
	<div class="registerok_wk">
		<div class="registerok">
			
		</div>
	</div>-->
	
	<!--顶部广告-->
	<!-- <div id="top-guanggao-wk">
		<div class="top-guanggao">
			<a href="/news/bainian.jsp" id="top-guanggao-a"></a>
			<i id="topclose" class="fa fa-times"></i>
		</div>
	</div>
	 -->
	
<style>
.error {
    border: none;
    background:none;
    }
    #err{color: #F67653;}
    #err2{color: #F67653;}
label.error {
   /*  border: 1px solid #F67653!important; */
    background:none;
	color: #F67653;
	padding: 0 2px;
	display:inline-block;
    }
</style>
<!--我要参加弹出框 start-->
<div id="ldksq">
    <div id="ldksq_c">
    <form  name="fbrzxq" id="fbrzxq" action="" method="post">
        <div id="ldksq_lose"></div>
        <div class="t"><span class="btn" onclick="window.location='/user/login.html'">我已注册</span><span>发布融资需求</span><span class="xiaozi">无需注册、快速审核</span></div>
        <div class="rad">
        	<div class="leixing">类型：<span style="color:red">*</span></div>
        	<div class="l grad gr"><label><input type="radio" id="leixing" name="leixing" value="股权融资">发布股权融资</label></div>
               
                <div class="l grad gs"><label><input type="radio" name="leixing" name="leixing" value="债权融资">发布债权融资</label></div>
       	</div>
       	<div class="con">
       	 	<p class="fir1"><span class="pt t1">企业名称：<span style="color:red">*</span></span><span class="pc"><input style="width: 360px;" type="text" id="mingcheng" name="mingcheng"></span></p>
       		<p class="fir1">
	       		<span class="pt t1">姓名：<span style="color:red">*</span></span><span class="pc"><input type="text" id="xingming" name="xingming"></span>
	       		<span class="pt t2">手机：<span style="color:red">*</span></span><span class="pc"><input type="text" id="dianhuan" name="dianhuan"></span>
       		</p>
       		<p class="fir1">
	       		<span class="pt t1" style="margin-left: 0;width: 99px;">金额(万元)：<span style="color:red">*</span></span><span class="pc"><input type="text" id="jine" name="jine"></span>
	       		<span class="pt t2">成立日期：<span style="color:red">*</span></span><span class="pc"><input id="chegnliriqi" class=" laydate-icon" type="text" name="chegnliriqi"></span>
       		</p>
       		<div class="remark">
       			<p>企业情况：<span style="color:red;    display: inline;">*</span></p>
       			<div class="tex">
       				<textarea id="qiyeqingkuang" name="qiyeqingkuang"></textarea>
       			</div>
       		</div>
       		<div class="remark">
       			<p>融资用途：<span style="color:red;    display: inline;">*</span></p>
       			<div class="tex">
       				<textarea id="rongziyongtu" name="rongziyongtu"></textarea>
       			</div>
       		</div>
       		<p class="fir1">
	       		<span class="pt t1">联系地址：<span style="color:red">*</span></span><span class="pc"><input style="    width: 182px;" type="text" id="address" name="address"></span>
       			<span class="errorts" id="err"></span><span style= "margin-left: 8px;" id="err2"></span>
       		</p>
			<p class="fir1"><span class="pt t1">验证码：<span style="color:red">*</span></span><span class="pc"><input type="text" id="txyzm" name="txyzm"></span><span class="pc"><img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()" alt="" style="cursor:pointer;width:100px;height:26px;margin-left: 10px;margin-bottom: -6px"/></span></p>
       	</div>
       	<div class="tjdiv"><input type="reset"  class="res tj"  value="取消"/><input id="rztjan"  type="submit"  class="sure tj" value="提交"/></div>
    </form>
    </div>
</div>
<!--我要参加弹出框 end-->
<script type="text/javascript">
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#chegnliriqi'});//绑定元素
	//laydate({elem: '#fksj'});//绑定元素
	//laydate({elem: '#dqsj'});//绑定元素
}();

//日期范围限制
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};

var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，充值开始日的最大日期
    }
};
laydate(start);
laydate(end);

//自定义日期格式
laydate({
    elem: '#test1',
    format: 'YYYY年MM月DD日',
    festival: true, //显示节日
    choose: function(datas){ //选择日期完毕的回调
        alert('得到：'+datas);
    }
});

//日期范围限定在昨天到明天
laydate({
    elem: '#hello3',
    min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
    max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
});
</script>






<!-- 网站头部 -->
<div class="nav widthbox">
    <div class="logo fl"><img src="image/index/logo.jpg" alt="logo"></div>
    <div class="nav_right fr">
      
                 <%@ include file="userinfo.jsp"%>
        
         <%@ include file="menu.jsp"%>
    </div>
</div>



<div class="index_banner_box">
    <!--总首页导航-->
    <div class="categorysone">
	    <div class="index_nav_box categorys">
	        <dl class="all_nav">
	            <dd class="zen_icon">
	                <a href="/product/toList.html" target="_blank" class="big_nav">债权融资</a>
	                <a href="/productdetail/3.html" target="_blank">成长贷</a>
	                <a href="/productdetail/4.html" target="_blank">壮大贷</a>
	            </dd>
	            <dd class="gu_icon">
	                <a href="/stock/toList.html" target="_blank" class="big_nav">股权融资</a>
	                <a href="/stock/toList.html" target="_blank">股权项目</a>
	                <a href="/data/toJigouList.html" target="_blank">投资机构</a>
	         <!--        <a href="">发布项目</a> -->
	            </dd>
	            <dd class="zhai_icon">
	                <a href="/incre/toList.html" target="_blank" class="big_nav">增值服务</a>
	           
	                 <a href="/incredetail/16.html" target="_blank">商标注册</a> 
	                 <a href="/incredetail/17.html" target="_blank"> 发明专利</a> 
	            </dd>
	            <dd class="last">
	                <a href="/data/toJigouList.html" target="_blank" class="big_nav">投资机构</a>
	                <a href="/data!getJigouInfo.action?e.id=38f9616306b5435192757ef6731d3e3a" target="_blank">高投创业</a>
	                <a href="/data!getJigouInfo.action?e.id=2a0e4cc023034af1ab2d6d2ea5f7647f" target="_blank">盈创兴科</a>
	            </dd>
	        </dl>
	        <div class="cate-content-list" style="display: none;">
	            <div class="cate-mc fore1" style="display: none">
	                <p class="p1"><a href="/productdetail/1.html" target="_blank">开行统借统还</a></p>
	                <p class="p2"><a href="/productdetail/2.html" target="_blank">口行统借统还</a></p>
	                <p class="p3"><a href="/productdetail/3.html" target="_blank">成长贷</a></p>
	                <p class="p4"><a href="/productdetail/4.html" target="_blank">壮大贷</a></p>
	                <p class="p5"><a href="/productdetail/5.html" target="_blank">新创贷</a></p>
	            </div>
	            <div class="cate-mc fore2" style="display: none">
	               <p class="p1"><a href="/stock/toList.html" target="_blank">股权项目</a></p>
	                <p class="p2"><a href="/data/toJigouList.html" target="_blank">投资机构</a></p>
	            </div>
	            <div class="cate-mc fore3" style="display: none">
	                <p class="p1"><a href="/incredetail/16.html" target="_blank">商标注册</a></p>
	                <p class="p2"><a href="/incredetail/17.html" target="_blank">发明专利</a></p>
	                <p class="p3"><a href="/incredetail/18.html" target="_blank">实用新型专利</a></p>
	                <p class="p4"><a href="/incredetail/20.html" target="_blank">股权融资服务</a></p>
	                <p class="p5"><a href="/incredetail/21.html" target="_blank">借款企业评级</a></p>
	            </div>
	            <div class="cate-mc fore4" style="display: none">
	                <p class="p1"><a href="/data!getJigouInfo.action?e.id=38f9616306b5435192757ef6731d3e3a" target="_blank">高投创业</a></p>
	                <p class="p2"><a href="/data!getJigouInfo.action?e.id=2a0e4cc023034af1ab2d6d2ea5f7647f" target="_blank">盈创兴科</a></p>
	                <p class="p3"><a href="/data!getJigouInfo.action?e.id=433f5da8a70349ffbef3032adf680398" target="_blank">盈创德弘</a></p>
	                <p class="p4"><a href="/data!getJigouInfo.action?e.id=c7df269cf84b4c699451f7acc741cd80" target="_blank">盈创泰富</a></p>
	            </div>
	
	        </div>
	        
	
	        
	        
	    </div>
    
	    <!-- 左边广告 -->
	    <a id="left_small"><img src="image/guanggao/left_small.png"/></a>
	    <div id="left_big"><a href="/news/zhongchou.jsp"><img src="image/guanggao/left_big.jpg"/></a><i id="left_big_close" class="fa fa-times"></i></div>
    </div>

    <!--轮播内容-->
    <div class="focusBox">
        <ul class="pic">
        <!-- 	<li><a href="/collegedetail/932.html" target="_blank"><img src="image/index/ac2.jpg"></a></li> -->
        	
        	<li><a href="http://www.winpow.com/newsdetail/16634.html" target="_blank" target="_blank"><img src="image/index/b_banjiang.jpg"></a></li>
            <li><a href="#" target="_blank" target="_blank"><img src="image/index/index_banner01.jpg"></a></li>
            <li><a href="#" target="_blank" target="_blank"><img src="image/index/index_banner1.jpg"></a></li>
            <li><a href="http://mp.weixin.qq.com/s?__biz=MzA3MjUwMTQwOQ==&mid=2650028531&idx=1&sn=c92f53399472cf8ebe7c18c277174509&chksm=871dc83db06a412b8ae1aa45f8f38b0ca052d27f158319dbb9b8b5ee68f190b30098ca80cbf7#rd" target="_blank" target="_blank"><img src="image/index/bangdan.jpg"></a></li>
            <li><a href="#" target="_blank" target="_blank"><img src="image/index/index_banner2.jpg"></a></li>
          <!-- 	   <li><a href="#" target="_blank"><img src="image/index/index_banner3.jpg"></a></li>-->
        </ul>
        <!-- <a class="prev" href="javascript:void(0)" style="opacity: 0.2; display: inline;"></a>
        <a class="next" href="javascript:void(0)" style="opacity: 0.2; display: inline;"></a> -->
        <ul class="hd">
	        <li class="on"></li>
	        <li class=" "></li>
	        <li class=" "></li>
	        <li class=" "></li>
	        <li class=" "></li>
	       <!--  <li class=" "></li>-->
	      <!--   <li class=" "></li> -->
        </ul>
    </div>
    

    
    
</div>

<!--banner-->
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.SuperSlide.js"></script>
<script type="text/javascript">
    jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});
</script>


<!-- 内容显示 --><!-- 数据展示 -->
<!-- <div class="data_show widthbox">
    <ul>
        <div class="data_list">
            <li>服务企业数</li>
            <li class="data_num"><span class="timer count-title" id="count-number" data-to="<%=SystemManager.indexPage.getHisdata().getHistcomp() %>" data-speed="1500"></span><span class="jia">家</span></li>
        </div>
        <div class="data_list">
            <li>债权融资额</li>
            <li class="data_num"><span class="timer count-title" id="count-number2" data-to="<%=SystemManager.indexPage.getHisdata().getHistloanamt() %>" data-speed="1500"></span><span class="jia">万</span></li>
        </div>
        <div class="data_list">
            <li>债权融资数</li>
            <li class="data_num"><span class="timer count-title" id="count-number6" data-to="<%=SystemManager.indexPage.getHisdata().getHistloancount() %>" data-speed="1500"></span><span class="jia">笔</span></li>
        </div>
        <div class="data_list">
            <li>股权融资项目数</li>
            <li class="data_num"><span class="timer count-title" id="count-number3" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquancount() %>" data-speed="1500"></span><span class="jia">个</span></li>
        </div>     
        <div class="data_list">
            <li>股权融资金额</li>
            <li class="data_num"><span class="timer count-title" id="count-number4" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquanamt() %>" data-speed="1500"></span><span class="jia">万</span></li>
        </div>  
        <div class="data_list">
            <li>合作投资机构数</li>
            <li class="data_num"><span class="timer count-title" id="count-number5" data-to="<%=SystemManager.indexPage.getHisdata().getHistvccount() %>" data-speed="1500"></span><span class="jia">家</span></li>
        </div>
    </ul>
</div>--><!-- data_show结束 -->

<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/huadong.js"></script>
<div class="show_data">
    <div class="wrap">
        <span><label class="odometer_name">服务<br/>企业</label> <span class="odometer" id="Span4"><%=SystemManager.indexPage.getHisdata().getHistcomp() %></span>  <label class="odometer_name" >家</label></span>
        <span><label class="odometer_name">债权<br/>融资</label><span class="odometer" id="Span5"><%=SystemManager.indexPage.getHisdata().getHistloanamt() %></span><label class="odometer_name" >万</label></span>
        <span><label class="odometer_name">债权<br/>融资</label><span class="odometer" id="Span6"><%=SystemManager.indexPage.getHisdata().getHistloancount() %></span><label class="odometer_name" >笔</label></span>
        <span><label class="odometer_name">股权<br/>项目</label><span class="odometer" id="Span7"><%=SystemManager.indexPage.getHisdata().getHistguquancount() %></span><label class="odometer_name" >个</label></span>
        <span><label class="odometer_name">股权<br/>融资</label><span class="odometer" id="Span8"><%=SystemManager.indexPage.getHisdata().getHistguquanamt() %></span><label class="odometer_name" >万</label></span>

        <span><label class="odometer_name">合作<br/>机构</label><span class="odometer" id="Span1"><%=SystemManager.indexPage.getHisdata().getHistvccount() %></span><label class="odometer_name" >家</label></span>
    </div>
</div>



<!-- 推荐和data数据start-->
<!-- 
<div class="rdata widthbox">
		<div class="divlwk">
			<div class="divl">
				<div class="divlist">
					<a target="_blank" href="/incredetail/22.html">
						<p class="ptitle"><span><img src="image/index/hot.gif" alt=""></span>&nbsp;政策补贴贷款贴息评级</p>
						<p class="pjj">联系电话 028-83222661</p>
						<p class="pimg"><img src="image/index/txpj.png" alt=""></p>
					</a>
        		</div>
        		<div class="divlist">
        			<a target="_blank" href="/incredetail/25.html">
						<p class="ptitle">企业信用信息服务</p>
						<p class="pjj">企业征信服务</p>
						<p class="pimg"><img src="image/index/xxfw.png" alt=""></p>
					</a>
        		</div>
        		<div class="divlist">
        			<a target="_blank" href="/incredetail/29.html">
						<p class="ptitle">专项审计报告</p>
						<p class="pjj">为企业出具专项审计报告</p>
						<p class="pimg"><img src="image/index/sjbg.png" alt=""></p>
					</a>
        		</div>
        	</div>
        </div>
        <div class="divrwk">
        	<div class="divr">
        		<ul>
        			<li>服务企业数<b><span class="timer count-title" id="count-number" data-to="<%=SystemManager.indexPage.getHisdata().getHistcomp() %>" data-speed="1500"></span></b>家</li>
        			<li>债权融资额<b><span class="timer count-title" id="count-number2" data-to="<%=SystemManager.indexPage.getHisdata().getHistloanamt() %>" data-speed="1500"></span></b>万</li>
        			<li>债权融资数<b><span class="timer count-title" id="count-number6" data-to="<%=SystemManager.indexPage.getHisdata().getHistloancount() %>" data-speed="1500"></span></b>笔</li>
        			
        		</ul>
        		<ul>
        			
        			<li>股权融资项目数<b><span class="timer count-title" id="count-number3" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquancount() %>" data-speed="1500"></span></b>个</li>
        			<li>股权融资金额<b><span class="timer count-title" id="count-number4" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquanamt() %>" data-speed="1500"></span></b>万</li>
        			<li>合作投资机构数<b><span class="timer count-title" id="count-number5" data-to="<%=SystemManager.indexPage.getHisdata().getHistvccount() %>" data-speed="1500"></span></b>家</li>
        		</ul>
        		<div class="clear"></div>
        	</div>
        </div>
</div>-->
<!-- 推荐和data数据end-->


<div class="info_content widthbox"><!-- 信息内容 -->
    

    <div class="information fl"><!-- 盈创资讯 -->
        <div class="dynamic_title"><!-- 盈创资讯标题 -->
            <div class="dynamic_title_left fl"><img src="image/index/yczx.png" style="margin-top: 4px;"/></div>
            <div class="dynamic_title_right fr">
                <div class="dynamic_title_right_text fl"><a href="/news/toList.html" target="_blank" target="_blank">盈创资讯</a><span class="rzeglish"> / DYNAMIC</span></div>
                <a href="/news/toList.html" target="_blank" target="_blank"><div class="dynamic_title_right_img fr"></div></a>
                <div class="dynamic_title_right_backgroundimg fr"></div>
            </div>
        </div>
        <div class="information_list"><!-- 盈创资讯列表 -->
        			
				<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.slideBox.min.js" type="text/javascript"></script>
        		<div class="informationpic">
        			<div class="picqh">
                    	<div class="banner_left">
				            <div id="wrap">
				                <div id="fade_focus">
				                    <div class="loading" style="border:none!important"></div>
				                    <ul>
				                        <!--网站轮播图-->
				                            
				                            
				                            
				                            
  <% for (int i = 0;i<SystemManager.indexPage.getNewsList().size() && i<3;i++) {
  							News n = SystemManager.indexPage.getNewsList().get(i);
  							String cover = n.getCover();
						 String title = n.getTitle();
							 String newsid = n.getId();
  							if(cover!=null && !"".equals(cover)){
  							
  				                          out.print(" <li>");
			                              out.print(" <a target=\"_blank\" href=\"/newsdetail/"+newsid+".html\" target=\"_blank\">");
			                              out.print("     <img src="+cover+" width=\"344\" height=\"200\" />");
		                                  out.print("   <div class=\"newtt\"></div>");
		                                  out.print("   <div class=\"newtt2\" title='"+title+"'><p>"+title+"</p></div>");
			                              out.print("</a>");
				                          out.print("  </li>");
  							}
  
				 
 
				}%>
				                       
				                    </ul>
				                </div>
				            </div>
        				</div>
                	</div>
        		</div>
        		
        		
        		
        
      			  <% for (int i = 0;i<3;i++) {
					News n = SystemManager.indexPage.getNewsList().get(i);
					out.print("<ul>");
					out.print("<li>");
					if(n == null)
						break;
					if(DateTimeUtil.isLater(n.getSendtime(),7+"")){
						 out.print("<div class=\"information_list_bor information_list_bor2\"><span class=\"new\">&nbsp;</span></div>");
					}else {
						 out.print("<div class=\"information_list_bor\"></div>");
					}
					 String title = n.getTitle();
					 String newsid = n.getId();
					 String cataid = n.getCataid();
					 if(title.length()>11) {
 					 	out.print("<a href=\"/newsdetail/"+newsid+".html\" target=\"_blank\" title=\""+title+"\" class=\"information_list_info\"><span class=\"tsss\">["+SystemManager.treeNodeMap.get(cataid).getName()+"]</span>"+title.substring(0,10)+"...</a>");
					 }else {
					 	out.print("<a href=\"#\"  target=\"_blank\" title=\""+title+"\"  class=\"information_list_info\"><span class=\"tsss\">["+SystemManager.treeNodeMap.get(cataid).getName()+"]</span>"+title.substring(0,title.length()>12?12:title.length())+"</a>");
					 }
					 
					out.print("<span class=\"information_list_date fr\">["+n.getSendtime().substring(0,10)+"]</span>");
					out.print("</ul>");
					out.print("</li>");
							
 
				}%>
 
 
  
        </div>


    </div>



    <div class="college fl"><!-- 盈创活动 -->
        <div class="dynamic_title"><!-- 盈创活动标题 -->
            <div class="dynamic_title_left fl"><img src="image/index/ychd.png" style="margin-top: 4px;"/></div>
            <div class="dynamic_title_right fr">
             <div class="dynamic_title_right_text fl"><a href="/college/colleges.html" target="_blank" target="_blank">盈创活动</a><span class="rzeglish"> / ACTIVITY</span></div> 
                <a href="/college/colleges.html" target="_blank" target="_blank"> <div class="dynamic_title_right_img fr"></div></a>
               <div class="dynamic_title_right_backgroundimg fr"></div>
               
            </div>
        </div>
        <div class="college_info">
    
        	
        	
        	
        	
  <% for (int i = 0;i<SystemManager.indexPage.getActivitiesList().size();i++) {
        	  Activities a = SystemManager.indexPage.getActivitiesList().get(i);
             
             
             
             	//是否已经举办过
		String cutime = DateTimeUtil.getStringDate();
		String endtime  = a.getEndtime();
		
		
		
            	out.print("<ul class=\"information_list\"  >");
        		out.print("<li>");
        		
        		if(endtime.compareTo(cutime)>0) {
             out.print("<a target=\"_blank\" href=\"collegedetail\\"+a.getId()+".html\"> <h3 class=\"cur new\"  title=\""+a.getActivities_name()+"\" >"+a.getActivities_name()+"</h3></a>");
 			
 			
		}else {
             out.print("<a target=\"_blank\" href=\"collegedetail\\"+a.getId()+".html\"> <h3 class=\"cur\"  title=\""+a.getActivities_name()+"\" >"+a.getActivities_name()+"</h3></a>");
		}
		
                       out.print(" <div style=\"display: block;\" class=\"information_content\">");
                          out.print(" <div class=\"information_time\">");
                              out.print(" <p>"+a.getLurushijian().substring(8,10)+"</p>");
                               		out.print(a.getLurushijian().substring(0,7));                    
                          out.print(" </div>");
                           out.print("<p class=\"information_text\">");
								out.print(HtmlUtil.takeoffHTML(a.getActivities_detail(),32)+"<a target=\"_blank\" href=\"/collegedetail\\"+a.getId()+".html\">详细</a>");
                          out.print(" </p>");
                       out.print("</div>");
              out.print("  </li>");
        	out.print("</ul>");
        	
        	 
				}
				%>
				
				 
               
        </div>
    </div>
    
    
    <div class="dynamic fl"><!-- 融资交易 -->
        <div class="dynamic_title"><!-- 融资交易标题 -->
            <div class="dynamic_title_left fl"><img src="image/index/rzjy.png" style="margin-top: 4px;"/></div>
            <div class="dynamic_title_right fr">
                <div class="dynamic_title_right_text fl"><a href="/data/getRzjyList.html" target="_blank">融资交易</a><span class="rzeglish"> / FINAN</span></div>
                <a href="/data/getRzjyList.html" target="_blank"><div class="dynamic_title_right_img fr"></div></a>
                <div class="dynamic_title_right_backgroundimg fr"></div>
            </div>
        </div>



        <div class="dynamic_list" id="scrollDiv"><!-- 融资交易列表-->
        <a href="/data/getRzjyList.html" target="_blank">
             <ul>
             <!-- SystemManager.indexPage.getDynamicList().size() -->
             <% for (int i = 0;i<SystemManager.indexPage.getDynamicList().size();i++) {
					Dynamic d = SystemManager.indexPage.getDynamicList().get(i);
					out.print("<li>");
					//类型
					 String str = ""; 
					if(d.getDytype().equals("1")) {  //债权融资
						str = "申请"+d.getDytypedetail();
					}else if(d.getDytype().equals("2")) {//增值业务
						str ="订购增值业务"+d.getDytypedetail();
					}else if(d.getDytype().equals("3")) { //股权融资
						str ="约谈项目"+d.getDytypedetail();
					}else if(d.getDytype().equals("5")) { //基金申请
						str ="申请基金"+d.getDytypedetail();
					}else{  //发布融资
						str ="发布"+d.getDytypedetail();
					} 
                     
                     //公司名称
                     out.print(" <div class=\"dynamic_list_info fl\" >"+d.getCompName()+str+"</div> ");
                      //小图标
					 out.print("<div class=\"dynamic_list_timeimg fl\"></div>");
					 //状态  		
				     out.print(" <span class=\"dynamic_list_condition fl\">"+d.getDystatus()+"</span>");		 
 					 //时间日期
 					 out.print("<span class=\"dynamic_list_date fr\">["+d.getDytime().substring(0,10)+"]</span>");
					 
					out.print("</li>");

				}%>
				
			  
              </ul>
              </a>
        </div>

            

    </div><!-- dynamic -->
    
    
    
    
</div>

<!-- middle_add start-->
<div class="middle_addwk">
	<div class="middle_add">
		<img src="image/box/mdimg.jpg" />
	</div>
</div>
<!-- middle_add end -->

<!-- info_content -->

<div class="debt_info widthbox middle_guanggao"><!-- 债权融资项目 -->
    <div class="debt_info_img fl">
    	<p class="gqrzxmp">债权融资产品</p>
    	<ul class="gqrzxmul">
    		<li class='zq'><a href="/product/toList.html">统借统还产品</a></li>
    		<p><a href="/productdetail/1.html">开行统借统还贷款</a></p>
    		<p><a href="/productdetail/2.html">口行统借统还贷款</a></p>
    		<li class='zq'><a href="/product/toList.html">政策性产品</a></li>
    		<p><a href="/productdetail/3.html">成长贷</a></p>
    		<p><a href="/productdetail/4.html">壮大贷</a></p>
    		<p><a href="/productdetail/5.html">新创贷</a></p>
    		<p><a href="/productdetail/6.html">国家专项建设基金</a></p>
    		<p><a href="/productdetail/7.html">园保贷</a></p>
    		<li class='zq'><a href="/product/toList.html">商业化产品</a></li>
    	</ul>
    </div> 
    <div class="debt_info_right fr mr_frbox"> 
    <div class="mr_frBtnL prev"><img  src="image/mfrL.jpg" width="17" height="40" /></div>
        <div class="debt_info_right_bor ">
                <a href="/product/toList.html" target="_blank" class="debt_info_right_gd fr">+更多</a><br/>
                <div class="debt_info_right_date mr_frUl"><ul>
                   
                   
                    
                    
                    
			<% for (int i = 0;i<SystemManager.indexPage.getProductList().size();i++) {
			
			Product p = SystemManager.indexPage.getProductList().get(i);
			
			String biaoqian = p.getBiaoqian();
			
			     	out.print("<li class=\"debt_info_right_datea index_cj_flg fl \"><div class=\"binline\">");
				if(biaoqian!=null && !"".equals(biaoqian)){
					String[] biaoqianArray = biaoqian.split(" ");
					for(int j=0;j<biaoqianArray.length;j++) {
				     	 out.print("<div class=\"shuxing\"><span>"+biaoqianArray[j]+"</span></div>");
					}
				}	
                        out.print("</div><div class=\"debt_info_right_datea_title\" style=\"margin-left:0px;\">"+p.getProdname()+"</div>");
                        out.print("<div style=\"height:154px;overflow:hidden;\">");
                            out.print("<p class=\"debt_info_right_datea_info fl liw\" style=\"width:178px;\"><i>合作银行：</i>");
                               out.print(" <span class=\"debt_info_right_datea_img\">");
			                             String arrays[] = p.getBanks().split(",");
								 for(int j=0;j<arrays.length;j++){
                                  out.print("  <img src=\"image/index/"+SystemManager.treeNodeMap.get(arrays[j]).getId()+".jpg\" alt=\""+SystemManager.treeNodeMap.get(arrays[j]).getName()+"\" />");
								 	
								 }
                               out.print("</span>");
                            out.print(" </p>");
                           out.print(" <p class=\"debt_info_right_datea_info\">还款方式：<span class=\"debt_info_right_datea_test\">"+p.getRetutype()+"</span></p>");
                          out.print("  <p class=\"debt_info_right_datea_info\">贷款额度：<span class=\"debt_info_right_datea_test\">"+p.getLoanamt()+"-"+p.getLoanamtmax()+"万</span></p>");
                          
                          if(p.getLoanterm()==p.getLoantermmax() ) {
                        	  out.print("  <p class=\"debt_info_right_datea_info\">贷款期限：<span class=\"debt_info_right_datea_test\">"+p.getLoanterm()+"个月</span></p>");
                          }else {
	                          out.print("  <p class=\"debt_info_right_datea_info\">贷款期限：<span class=\"debt_info_right_datea_test\">"+p.getLoanterm()+"-"+p.getLoantermmax()+"个月</span></p>");
                          }
                          
                       
                          out.print("  <p class=\"debt_info_right_datea_info\">利率(年)：<span class=\"debt_info_right_datea_test\">"+p.getLoanrate()+"</span></p>");
                       out.print(" </div>");
                       out.print(" <div class=\"debt_info_right_datea_bot\"><a target=\"_blank\" href=\"/productdetail/"+p.getId()+".html\">立即申请</a></div>");
                   		out.print(" </li>");
                    
				}%>
				
				
                    </ul>
                </div>
            </div>
            <div class="mr_frBtnR next" ><img src="image/mfrR.jpg" width="17" height="40" /></div>
        </div>
      <!-- 在这个“债权融资”块放的广告，放到底部去 -->  
        <!-- 底部广告-->
	<div id="footer_big">
	
		<div class="footer_c">
		<a href="/product/toList.html">
			<div class="ti">
				<div class="main">
					<ul>
						<li>
							
						</li>
						<li>
							
						</li>
						<li>
							
						</li>
						<li>
							
						</li>
						<li>
							
						</li>
					</ul>
				</div>
			</div>
			</a>
			<i id="footerclose" class="fa fa-times"></i>
		</div>
		
	</div>
        
        
        
</div><!-- debt_info结束 -->

<!-- 债券融资产品右边切换 -->
<style>
.mr_frBtnL{float:left;width:20px;margin:160px 0px 0px 0px;cursor:pointer;display:inline;}
.mr_frBtnL img{display:none;}
.mr_frBtnR{float:right;width:19px;margin-top:160px;cursor:pointer;margin-left:1px;}
.mr_frBtnR img{display:none;}
.neikuang{width:221px;}
.prevStop img{display:none!important;}
.nextStop img{display:none!important;}
</style>
<script type="text/javascript">
$(".mr_frbox").hover(function(){
	$(".mr_frBtnL img").show().stop();
	$(".mr_frBtnR img").show().stop();
},function(){
	$(".mr_frBtnL img").hide().stop();
	$(".mr_frBtnR img").hide().stop();
}
);


jQuery(".mr_frbox").slide({titCell:"",mainCell:".mr_frUl ul",autoPage:true,autoPlay:true,effect:"left",vis:4,pnLoop:false,trigger:"click"});
/*
$(".mr_frbox").slide({
	titCell:"",
	
	easing:"swing",
	delayTime:700,
	mainCell:".mr_frUl ul",
	autoPage:true,
	effect:"leftLoop",
	autoPlay:true,
	pnLoop:false
	//vis:1

}); */
</script>

<div class="thigh_info widthbox"> <!-- 股权融资 -->
    <div class="thigh_info_left_img fl">
    	<p class="gqrzxmp">股权融资项目</p>
    	<ul class="gqrzxmul" id="guquanFinancingHtmlId">
            <%--加载股权融资项目--%>
            <%
                List<GuquanFinancing> guquanFinancings = SystemManager.indexPage.getGuquanFinancings();

                for(GuquanFinancing gf : guquanFinancings) {
                    out.print("<li><a href='guquan_financing!toEdit.action?e.id="+ gf.getId() +"'>"+ gf.getName() +"</a></li>");
                }
            %>
    		<%--<li><a href="/news/guquanrongzidetail.jsp">天使投资基金</a></li>--%>
    		<%--<li><a href="/news/guquanrongzidetail.jsp">创业投资基金</a></li>--%>
    		<%--<li><a href="/news/guquanrongzidetail.jsp">私募投资基金</a></li>--%>
    		<%--<li><a href="/news/guquanrongzidetail.jsp">产业投资基金</a></li>--%>
    	</ul>
    	<div class="woshichuangyezhe woshi woshif"><a href="/user/login.html?bzf=c">我是创业者</a></div>
    </div>  <!-- dsafasdfasdfasdf -->
    <div class="thigh_info_right fr">
        <div class="thigh_info_right_bor">
            <div class="thigh_info_right_gd fr"><a href="/stock/toList.html" target="_blank">+更多</a></div>
            <div class="thigh_info_right_center">
            
            
            
               
                
                
                
      			  <% for (int i = 0;i<SystemManager.indexPage.getGuquanList().size();i++) {
					 	
 						Guquan g = SystemManager.indexPage.getGuquanList().get(i);
					 		
					 	if(i%2==0) {
					 		 out.print(" <div class=\"thigh_info_right_center1 fl\">");
					 	}else {
 							 out.print(" <div class=\"thigh_info_right_center2 fr\">");
					 	}
					 	

                 	     out.print(" <div class=\"thigh_info_right_center1_img fl\"><img style=\"width:179px;height:248px\" src=\""+g.getTuijianpic()+"\" alt=\"\"></div>");
               	         out.print("  <div class=\"thigh_info_right_center1_test fr\">");
                  		 out.print("    <div class=\"thigh_info_right_center1_test_title\">"+g.getMingcheng()+"</div>");
                   		 out.print("    <div class=\"thigh_info_right_center1_test_info\">");
                      	 out.print("      <ul>");
                          out.print("      <div class=\"li\">行业："+g.getHangye()+"</div>");
                          
                          out.print("      <div class=\"li\">融资额度："+g.getRongziedu()+"万</div>");
                          out.print("      <div class=\"li\">出让股权比例："+g.getCrgqbl()+"%</div>");
                          BigDecimal bookamt = g.getBookamt();
                          BigDecimal rongziedu = g.getRongziedu();
                          out.print("  <div class=\"jdtyy\" style=\"bottom:-4px!important;left:inherit;right:0!important;display:block;\">"+((bookamt.divide(rongziedu,4,BigDecimal.ROUND_HALF_EVEN).movePointRight(2)))+"%</div><div class=\"zqrzjdt\" style=\"width: 70%;margin-bottom: 10px;\";><div class=\"zqrzjdt_left\" style=\"width:"+((bookamt.divide(rongziedu,4,BigDecimal.ROUND_HALF_EVEN).movePointRight(2)))+"%\"></div><div class=\"zqrzjdt_right\" style=\"width:"+(100-((bookamt.divide(rongziedu,4,BigDecimal.ROUND_HALF_EVEN).movePointRight(2))).doubleValue())+"%\"></div></div>");
                          out.print("    </ul>");
                          out.print("   </div>");
		                   out.print("    <a target=\"_blank\" href=/stockdetail/"+g.getId()+".html>  <div class=\"thigh_info_right_center1_test_but\">");
		                   out.print("        <li>查看详情</li>");
		                   out.print("     </div></a>");
		                  out.print("  </div>");

          				  out.print("   </div>");
                
                
                
 
				}%>
				
				
				
            </div>
        </div>
    </div>
</div><!-- thigh_info结束 -->
<style>
.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_info ul .li {
    margin-bottom: 15px;
}
</style>


<div class="serve_info widthbox"><!-- 增值服务 -->
    <div class="serve_info_left_img fl">
    	<p class="gqrzxmp">增值服务产品</p>
    	<ul class="gqrzxmul">
    		<li class='zz'><a href="#">创业辅导服务</a></li>
    		<li class='zz'><a href="/incredetail/25.html">信用信息服务</a></li>
    		<li class='zz'><a href="#">培训教育服务</a></li>
    		<li class='zz'><a href="#">融资中介服务</a></li>
    		<li class='zz'><a href="#">改制上市服务</a></li>
    	</ul>
    </div>
    <div class="serve_info_right fr">
        <div class="serve_info_right_bor">
            <div class="serve_info_right_gd fr"><a href="/incre/toList.html" target="_blank">+更多</a></div><br/>
            <div class="serve_info_right_content">
                <div class="serve_info_right_content1"><!-- 水平左边整块二合一 -->                   



				<% for (int i = 0;i<SystemManager.indexPage.getIncreList().size();i++) {
					Incre g = SystemManager.indexPage.getIncreList().get(i);
					
						out.print("<a target=\"_blank\" href=\"/incredetail/"+g.getId()+".html\">");
                        out.print("<div class=\"serve_info_right_content2_bor_left fl\"> ");
                           out.print(" <div class=\"serve_info_right_content2_img\">");
                           
                                out.print("<img src=\"image/index/zzywicon"+i+".jpg\" alt=\"\">");
                           out.print(" </div>");

                           out.print(" <div class=\"serve_info_right_content2_info\">");
                               out.print(" <ul>");

                                    out.print("<li class=\"serve_info_right_content2_info_title\">"+g.getIncrename()+"</li>");
                                   out.print(" <li class=\"serve_info_right_content2_info_info\">"+g.getIncredescrip()+"</li>");
                               
                                out.print("</ul>");
                           out.print(" </div>");
                       out.print(" </div>");
					out.print("</a>");
					
					 

				}%>
				
						
                       

            </div>
            	
    		<%--out.print(" <li class=\"serve_info_right_content2_info_vel\">￥<span>"+g.getIncreprice()+"</span>起</li>"); --%>


            </div>
        </div>
    </div>
</div><!-- serve_info结束 -->

<div class="invest_info widthbox">
    <div class="invest_info_title">
        <ul>
            <li class="invest_info_titletest fl">投资机构</li>
            <li class="invest_info_titlegd fr"><a href="/data/toJigouList.html" target="_blank">+更多</a></li>
        </ul>
    </div>
    <div class="invest_info_list">



				<% for (int i = 0;i<SystemManager.indexPage.getJigouList().size();i++) {
					Jigou j = SystemManager.indexPage.getJigouList().get(i);
			 
					
					 out.print("<div class=\"invest_info_list"+(i+1)+" fl\"><a target=\"_blank\" href=\"/data!getJigouInfo.action?e.id="+j.getId()+"\">");
            out.print("<div class=\"invest_info_list1_top\">");
	            String jigoulogo = j.getJigoulogo();
	            if(jigoulogo==null||"".equals(jigoulogo)) {
	            	out.print("<img src=\"image/index/tx.jpg\" alt=\"\">");
	            }else {
	            out.print("<img src=\""+jigoulogo+"\" alt=\"\">");
	            }
                
               out.print(" <div class=\"invest_info_list1_top_info fr\">");
                    out.print("<div class=\"invest_info_list1_top_info1\">"+StringUtil.subshow(j.getJigoumingcheng(),14)+"</div>");
                  out.print("  <div class=\"invest_info_list1_top_info1_name\">");
                   out.print("     <span class=\"namemain\">"+j.getXingming()+"</span>");
                   out.print(" </div>");
                out.print("</div>");
            out.print("</div>");

          out.print("  <div class=\"invest_info_list1_bottom"+(i+1)+"\">");     
             out.print("   <div class=\"invest_info_list1_bottom_test\">");
            out.print("    <span>简介："+StringUtil.subshow(j.getJigoujianjie(),36));
             out.print("   </span>");
             out.print("   </div>");
          out.print("  </div>");
      out.print(" </a> </div>");
         

				}%>

 
        
    </div>
</div>

<hr/>

<div class="partner widthbox">
    <div class="partner_title fl">合作机构</div>
    <div class="partner_type">
         <ul>
            <li>
                     <img src="image/index/index_1.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_2.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_3.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_4.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_5.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_6.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_7.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_8.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_9.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_10.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_11.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_12.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_13.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_14.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_15.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_16.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_17.jpg"/>
             </li>
             <li>
                     <img src="image/index/index_18.jpg"/>
             </li>

         </ul>

    </div>
</div>


         <%@ include file="footer.jsp"%>
    <!--      <div class="fixedleft">
         	<a href="http://mp.weixin.qq.com/s?__biz=MzA3MjUwMTQwOQ==&mid=2650028531&idx=1&sn=c92f53399472cf8ebe7c18c277174509&chksm=871dc83db06a412b8ae1aa45f8f38b0ca052d27f158319dbb9b8b5ee68f190b30098ca80cbf7#rd" target="_blank"></a>
         </div>
 -->
<div class="fixed" id="totop">
    <div class="publish" id="addcreditor">
        <div class="fixed_img">
            <a href="#" ><img src="image/index/publish.png" alt=""></a>
        </div>
        <div class="fixed_test">发融资需求</div>
    </div>
    <div class="investor">
        <div class="fixed_img">
            <a href="/aboutus/yjfk.html" target="_blank"><img src="image/index/investor.png" alt=""></a>
        </div>
        <div class="fixed_test">意见反馈</div>
    </div>
    <div class="investor">
        <div class="fixed_img fixed_img1">
            <a href="javascript:void(0)" target="_blank"><img src="image/index/tel.png" alt=""></a>
            <p>85139195</p>
        </div>
        <div class="fixed_test">投诉热线</div>
    </div>
    <div class="investor">
        <div class="fixed_img fixed_img2">
            <a href="javascript:void(0)" target="_blank"><img src="image/index/tianping.png" alt=""></a>
            <p>83159999</p>
        </div>
        <div class="fixed_test">廉洁监察</div>
    </div>
    <div class="code">
        <div class="fixed_img">
            <img src="image/index/code.jpg" alt="">
        </div>
        <div class="fixed_test">二维码</div>
    </div>
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>

<!--数字动画-->
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/digital.js"></script>
<%@ include file="browsercheck.jsp"%>

<%
    String c = SystemManager.CONFIGS.get(Config.GUANGGAO_KEY);
    int index = 0;

    try {

        if (c != null) {
            index = Integer.parseInt(c.trim());
        }
    } catch (Exception e1) {
        e1.printStackTrace();
    }

    if (index == 1) {
%>
<!--首页特别推荐广告【800*494px】，加载完时弹出5秒【左下角有立即关闭按钮，右下角有5秒倒计时】后浮动到左边，再次点击左边时又弹出显示5秒后浮动到左边-->
<div id="topad_wk">
	<div id="topad">
		<div id="topad_img"><img src="image/box/2016120801.jpg" /></div>
		<div id="topad_bottom">
			
			<div id="topad_countdown"><span id="toptime">5</span>秒后关闭</div>
			<div id="topad_close"><span>&times;</span>关闭广告</div>
		</div>
		
	</div>
</div>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.cookie.js"></script>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/topad.js"></script>
<% } %>




</body>
</html>