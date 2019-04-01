<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/help/help.css"/>
</head>
<body>
<%@ include file="../header.jsp"%>

<div class="bl helpbox">
    <div class="helpLeft">
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/helpcenter.png" alt="">
    <ul class="helpNav">
        <li class="active"><a href="/help/1.html">企业类政策申报 <span>></span></a></li>
        <li><a href="/help/2.html">金融类政策申报 <span>></span></a></li>
        <li><a href="/help/3.html">其他机构数据报送  <span>></span></a></li>
        
    </ul>
    </div>
    <div class="helpRight">
        <p><a href="/">首页</a> > <a href="#">帮助中心</a> > <b>企业类政策申报流程</b></p>
        <div id="menu">
            <!--根据item的个数遍历生成锚点链接-->
                <ul></ul>
       </div>
        <div id="content">
           <div id="item1" class="item">
               <h2>
                   1.注册企业账户（已注册的企业直接跳到第七步），点击首页右上角注册按钮，弹出注册页面。
               </h2>
               <ul>
                   <li><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy1.gif" alt=""/></li>
               </ul>
           </div>
           <div id="item2" class="item">
               <h2>2.注册成功后，自动返回首页界面。已注册过的企业直接点击首页右上角登录，填写账户信息完成登录。</h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy2.gif" alt=""/></a></li>
               </ul>
           </div>
           <div id="item3" class="item">
               <h2>3.登录完成后，点击首页右上角账户名称，进入个人账户后台管理。</h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy3.gif" alt=""/></a></li>
               </ul>
           </div>
           <div id="item4" class="item">
               <h2>4.在点击政策申报之前，需要完善企业基本信息（包括企业信息和财务报表）后才能进行操作。</h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy4.gif" alt=""/></a></li>
               </ul>
           </div>
           <div id="item5" class="item">
               <h2>5.点击左侧<企业信息>,填写企业基本情况后点<保存>（*为必填项）。</h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy5.gif" alt=""/></a></li>
               </ul>
           </div>
            <div id="item6" class="item">
                <h2>6.点击左侧<财务报表>,填写近三年度财务数据后点<保存>。</h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy6.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item7" class="item">
                <h2>7.点击左侧<政策申报>，填写完成<企业基本情况表>（其中带*为必填项），保存。</h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy7.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item8" class="item">
                <h2>8.点击左侧<政策申报汇总>，再点击<新增>,弹出申报项目的界面。</h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy8.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item9" class="item">
                <h2>9.在弹出的界面选择适合的申报项目，提交。其中支持金融服务实体经济里共有14个政策，支持提升金融产业能级里共有39个政策，支持构建金融 生态圈里11个政策。</h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy9.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item10" class="item">
                <h2>10.提交完成后会自动展示该项申报需要填写和上传的资料，完善后如果确认无误可以直接提交，如果需要二次修改可以点击保存。</h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy10.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item11" class="item">
                <h2>
                    11.完成所选申报项目需要填写的材料后，在企业后台，<政策申报>下的<政策申报汇总>内，可以查看对应申报项目的状态，如果已提交会显示 <审核中>，如果是保存待修改则显示为<未提交>，可以点击修改再次完善。
                </h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy11.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item12" class="item">
                <h2>
                    12. 在管理员对企业所提交的申报材料查验完毕后，会做出审批通过处理，此时企业在申报时填写的手机号会收到相应审批通过的短信。企业可以再 次登录盈创官网，登录账户后在企业后台->政策申报->政策申报汇总内，看到已提交的申报项目审核通过的信息。

                </h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy12.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item13" class="item">
                <h2>
                    13. 企业可以点击<生成材料>，点击后在<政策申报>下<文件下载>内，可以导出申报项目所提交材料的电子版，可以打印纸张报送。
                </h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy13.gif" alt=""/></a></li>
                </ul>
            </div>
       </div>
    </div>
</div>

<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/help/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/help/app.js"></script>
<script>
    var steps = ['注册','登录','进入用户中心','用户中心首页','企业基本信息','财务信息','企业基本','政策申报列表','选择政策','填报资料','提交','生成资料','下载资料'];
    var li="";
   for(var i=0;i<steps.length;i++){
      li+= ' <li><a href="#item'+(i+1)+'" class="page-scroll">'+(i+1)+'. '+steps[i]+'</a></li>'

    }
    $('#menu>ul').append(li);
</script>
<%@ include file="../footer.jsp"%>
</body>
</html>