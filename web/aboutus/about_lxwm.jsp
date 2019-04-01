<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的的科技金融服务门户网站</title>
    <link href="../css/equity.css" rel="stylesheet" type="text/css" />
    <link href="../css/about.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" rel="stylesheet" type="text/css" />
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/index.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>

<!-- 内容部分 -->

<div class="about_cj_banner">
     <img src="../image/box/about_banner1.jpg"/>
</div>

 <br/>
<div class="about_type widthbox">
   
    
     <li  ><a style="display: inline-block;width: 100%;" href="/aboutus/about.html">盈创介绍</a></li>
    <li  ><a  style="display: inline-block;width: 100%;" href="/aboutus/rczp.html">发展历程</a></li>
    <li><a style="display: inline-block;width: 100%;"  href="/aboutus/flsm.html">法律声明</a></li>
    <li  ><a  style="display: inline-block;width: 100%;" href="/aboutus/yjfk.html" >意见反馈</a></li>
    <li class="type_bgc type_lxwm fr"><a  style="display: inline-block;width: 100%;" href="/aboutus/lxwm.html">联系我们</a></li>
    
</div>

<div class="widthbox">


<div class="lx_info">
    <div class="lx_bgc">
        <img src="../image/ab/lx_img1.png" alt="背景图">
        <div class="lx_hezuo">
            <li class="lx_hezuo_text">联系我们 & 金融合作</li>
            <li class="lx_hezuo_email">Email：winpower@winpow.com</li>
        </div>
    </div>
    <div class="lx_text">
        <li>地址：成都高新区锦城大道539号盈创动力大楼A座5楼</li>
        <li>邮编：610041</li>
        <li>电话：028-83159999</li>
        <li>Email：admin@winpow.com</li>
    </div>
 
 <iframe src="/resource/kindeditor-4.1.7/plugins/baidumap/index.html?center=104.068476%2C30.581253&zoom=19&width=758&height=360&markers=104.068476%2C30.581253&markerStyles=l%2CA" frameborder="0" style="width:760px;height:362px;">
</iframe>
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
 menu_init("aboutus");

</script>
 


         <%@ include file="../footer.jsp"%>

</body>
</html>
 