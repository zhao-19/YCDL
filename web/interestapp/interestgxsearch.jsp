<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>


<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/equity.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/skin/default/layer.css"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/tiexizhinan.js"></script>
     <style>
      .box-sizing{font-size:16px;}
     .box-sizing,.box-sizing *{ box-sizing: border-box;}
     .box-sizing b{font-weight:normal;}
      .box-sizing a{color:#666;}
     .tc{text-align:center;}
      .gxzc-title{margin:50px auto 40px;}
        .gxzc-searchBox{width:100%;height:100px;background:#f6f6f6;padding-top:30px;}
        .gxzc-search{width:605px;height:40px;margin:0 auto;}
        .gxzc-search input{height:100%;float:left;font-size: 16px;font-family:"微软雅黑";    box-sizing: border-box;}
        #gxzc-searchWord{width:505px;border:1px solid #ff6600;border-right:0;padding:0 13px;color:#666;background: #fff;}
        #gxzc-searchBtn{width:100px;background:#ff6600;color:#fff;cursor: pointer;}
        #gxzc-searchBtn:hover{background:#eb5404;}
        .gxzc-hotThree{width:1209px;margin:60px auto 10px;padding-left: 3px;    overflow: hidden;}/*因为最后一个li右侧阴影会被遮住*/
        .gxzc-hotThree li{width:385px;height:210px;float:left;position:relative;margin-right:22px;padding-top:6px;margin-bottom:35px;}
        .gxzc-hotThree li>div{border:1px solid #dfdfdf;padding:10px 13px;transition: 0.5s;}
        .gxzc-hotThree li:last-child{margin-right: 0;}
        .gxzc-hotThree li h2{font-size: 16px;height:65px;line-height: 23px;
            padding:10px 0 15px 58px;border-bottom:1px dashed #dfdfdf;transition: 0.3s;}
        .gxzc-hotThree li a{display: block;}
        .gxzc-hotThree li:hover h2,.gxzc-hotThree li:hover .gxzc-more {color:#ff6600;}
        .gxzc-hotThree li:hover>div{box-shadow:  3px 4px 9px rgba(0,0,0,0.1)}
        .gxzc-intro{height:85px;padding:13px 0;font-size:14px;color: #999;overflow: hidden;line-height: 22px;}
        .gxzc-more{font-size:14px;color: #999;}
        .gxzc-tip{position: absolute;top:0;left:8px;width:50px;height:77px; padding: 15px 0 0 8px;font-size: 14px;color: #fff;
            background: url("/icon/gxzc-tip.png") no-repeat;}
        .gxzc-res{margin:50px auto 30px;overflow: hidden;}
        .gxzc-res .lf{width:770px;}
        .gxzc-res .rt{width:385px;}
        .gxzc-res .rt>h3{font-size: 24px;color: #666;font-weight: normal;padding:10px 0;}
        .gxzc-res .gxzc-hotThree{width:385px;padding:0;margin:0;}
        .gxzc-res .gxzc-hotThree li:hover>div{box-shadow: none;}
        .gxzc-res .lf .res-tit{border-bottom:1px solid #dfdfdf;overflow: hidden;padding:10px 0;}
        .gxzc-res .lf .res-tit h2{font-size:24px;color:#333;font-weight: normal;}
        .gxzc-res .lf .res-tit span{font-size: 14px;margin-top:10px}
        .gxzc-res .lf .res-tit span>b{color:#ff6600;}
        .gxzc-res .lf ul{min-height:500px;}
        .gxzc-res .lf ul>p{color:#666;margin-top:20px;font-size:14px;}
        .resList>li{width: 100%;padding:20px;border-bottom:1px solid #dfdfdf; }
        .resList>li:hover{background: #f5f5f5;}
        .resList h4{color:#2f6eb6;font-size: 16px;font-weight: normal;}
        .resList>li:hover h4{color:#ff6600;}
        .resList>li a{display: block;}
        .resIntro{color:#848790;font-size: 14px;min-height:50px;overflow: hidden;margin:13px 0 15px;line-height: 25px;}
        .res-icon>span{margin-right:80px;font-size: 14px;}
        .res-icon>span:nth-child(1){padding-left:24px;background: url("/icon/gxzc-date.png") no-repeat 0 center;}
        .res-icon>span:nth-child(2){padding-left:21px;background: url("/icon/gxzc-zcss.png") no-repeat 0 center;}
        .res-icon>span>b{color: #666;}


        .mask{display:none;position:fixed;top:0;left:0;width: 100%;height:100%;background: rgba(0,0,0,0.8);    z-index: 1000;}
         .white{width:70%;height:70%;position: absolute;top:50%;left:50%;background:#efefef;/*margin-top:-50px;*/
            transform:translate(-50%,-50%) scale(0.5);transition: 0.3s ease-out 0.1s;overflow: hidden;
            color:#333;line-height: 33px;}
            .mask_content{height:86%;overflow-y: auto;padding:9px 30px;}
        .white b{font-weight: bold;}
        #maskClose{display: block;width:50px;height:27px;margin:10px auto;line-height:25px;text-align: center;border:1px solid #444;color:#333;font-size: 14px;cursor: pointer;}
        .white p{margin:10px 0;}
        #policy_name{font-size: 20px;}
        .gxzc-res{display: none;}
         .closeline{width: 94%;margin:15px auto !important;border-top:1px dashed #aaa;}
     </style>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>

<!-- 内容部分 -->
<div class="ycdata_bgimg">
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/data/zcsbbanner_02.png" alt="背景图">
</div>

<div class="box-sizing">
<div class="bl">
    <h2 class="tc gxzc-title"><img src="/icon/gxzc-title.png" alt=""></h2>
    <div class="gxzc-searchBox">
        <div class="gxzc-search">
            <input type="text" name="keyWord" id="gxzc-searchWord" value="" placeholder="请输入关键字查询高新区政策，如“贷款贴息”">
            <input type="button" id="gxzc-searchBtn" value="立即搜索">
        </div>
    </div>
</div>

<div class="gxzc-hotThree gxzc-hotThree-slide pup">
    <ul>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<div class="gxzc-res bl">

    <div class="lf fl">
       <div class="res-tit">
           <h2 class="fl">【<b id="serached-word">贷款贴息</b>】相关政策</h2>
           <span class="fr">共找到 <b id="totalCount">0</b> 个</span>
       </div>
        <ul class="resList pup">
            <!--<li>-->
                <!--<a href="">-->
                    <!--<h4>《推进成都高新区“贷款贴息”支持战略性新兴产业企业加快发展的若干政策》</h4>-->
                    <!--<div class="resIntro">-->
                        <!--推进成都高新区“三次创业”支持战略性新兴产业企业加快发展的若干政策》已经党工委管委会研究同意，予印发，请现予印发，请遵照-->
                        <!--推进成都高新区“三次创业”支持战略性新兴产业企业加快发展的若干政策》已经党工委管委会研究同意，予印发，请现予印发，请遵照-->
                    <!--</div>-->
                    <!--<p class="res-icon"><span>发布时间:2017-10-19</span><span>政策归属：<b>创新债权融资补贴</b></span></p>-->
                <!--</a>-->
            <!--</li>-->
        </ul>
        <div id="kkpager"></div>
    </div>
    <div class="rt fr">
        <h3>热门政策</h3>
        <div class="gxzc-hotThree pup">
            <ul>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>

</div>
<div class="mask"><!--黑色大背景-->
    <div class="white"> <!--白色弹框-->
     <div class="mask_content">
        <p><b id="policy_name">贷款贴息</b></p>
        <p><b>申报项目和标准：</b><span id="sub_describe"></span></p>
        <p><b>补贴金额：</b><span id="sub_amount"></span></p>
        <p><b>申报条件：</b><br><span id="sub_condition"></span></p>
        <p><b>申报资料：</b><br><span id="sub_materials"></span></p>
        <p><b>申报时间：</b><span id="sub_time"></span></p>
        <p><b>受理部门：</b><span id="accepting_department"></span></p>
        <p><b>申报网址：</b><span id="sub_platform"></span></p>  
	</div>
        <p class="closeline"> <span id="maskClose">关闭</span></p>

    </div>
</div>
</div>
<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/kkpager_orange.css">
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/kkpager.min.js"></script>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/pageNation.js"></script>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer2.js"></script>

<script>
function a(pageNum){
    if(!pageNum){pageNum=1;}
    var keyWord;
    if($('#gxzc-searchWord').val().trim()!=""){
    	keyWord=$('#gxzc-searchWord').val();
    }else{
    	keyWord="*";
    }
     /* $.ajax({
        cache: true,
        type: "POST",
        url:"https://credit.winpow.com/winpow/policy.do",
        data:{
            keyWord:keyWord,
            pageNum:pageNum,
            pageSize:10
        },
        async: false,
        error: function(request) {
            //alert("请求出错");
        },
        success: function(data) {
            $('.gxzc-hotThree-slide').slideUp(500);
            $('.gxzc-res').show();
            $('#totalCount').html(data.totalCount);
            $('#serached-word').html($('#gxzc-searchWord').val())
            if(!data.totalCount==0){
            var li="";
            for(var i=0;i<data.data.length;i++){
                li+='<li><a href="'+data.data[i].id+'"><h4>政策名称：'+data.data[i].policy_name+'</h4><div class="resIntro">'+data.data[i].sub_describe+'</div><p class="res-icon"><span>发布时间：'+data.data[i].pubdate.substr(0,10)+'</span><span>政策归属：<b>'+data.data[i].toptype_name+'&nbsp;'+data.data[i].type_name+'</b></span></p></a></li>';
            }
            $('.resList').html(li);
            
            pageNation(data.pageNum,data.totalCount,data.totalPage,function(n){
                a(n);
            });
            }else{
            	$('.resList').html("<p>抱歉，未搜索到结果。</p>");
            }
        }
    });  */
     $.ajax({
        cache: true,
        type: "POST",
        url:"/userextend/searchPolicy.html",
        data:{
            keyWord:keyWord,
            pageNum:pageNum,
            pageSize:10
        },
        async: false,
        error: function(request) {
            //alert("请求出错");
        },
        success: function(data) {
            $('.gxzc-hotThree-slide').slideUp(500);
            $('.gxzc-res').show();
            $('#totalCount').html(JSON.parse(data).totalCount);
            $('#serached-word').html($('#gxzc-searchWord').val())
            var object = JSON.parse(data);
            console.log(object);
            if(!object.totalCount==0){
            var li="";
            for(var i=0;i<object.data.length;i++){
            	console.log(object.data[i].sub_describe);
                li+='<li><a href="'+object.data[i].id+'"><h4>政策名称：'+object.data[i].policy_name+'</h4><div class="resIntro">'+object.data[i].sub_describe+'</div><p class="res-icon"><span>发布时间：'+object.data[i].pubdate.substr(0,10)+'</span><span>政策归属：<b>'+object.data[i].toptype_name+'&nbsp;'+object.data[i].type_name+'</b></span></p></a></li>';
            }
            $('.resList').html(li);

            pageNation(object.pageNum,object.totalCount,object.totalPage,function(n){
                a(n);
            });
            }else{
                $('.resList').html("<p>抱歉，未搜索到结果。</p>");
            }
        }
    });
}
	$('#gxzc-searchBtn').click(function(){
            a();
	});
	
	$("#gxzc-searchWord").keydown(function() {
	    if(event.keyCode == "13"){
	       a();
	    }
	});
    (function Top3(){
        $.ajax({
            cache: true,
            type: "POST",
            url:"/userextend/getPolicy.html?top=3",
//            data:{}
            async: false,
            error: function(request) {
               // alert("请求出错");
            },
            success: function(data) {
                var li="";
                for(var i=0;i<data.length;i++){
                    li+='<li><span class="gxzc-tip tc">高新区政策</span><div><a href="'+data[i].id+'"><h2>'+data[i].policy_name+'</h2><div class="gxzc-intro">'+data[i].sub_describe.substr(0,75)+'...</div> <span class="gxzc-more">更多>></span></a> </div> </li>'
                }
                $('.gxzc-hotThree ul').html(li);

            }
        });
    })();
    $('.pup').delegate('a','click',function(e){
        e.preventDefault();
        $.ajax({
            cache: true,
            type: "POST",
            url:"/userextend/getPolicy.html?id="+$(this).attr('href'),
//            data:{}
            async: false,
            error: function(request) {
               // alert("请求出错");
            },
            success: function(data) {
//                $('#policy_name').html(data[0].policy_name);
//                $('#sub_describe').html(data[0].sub_describe);
//                $('#sub_amount').html(data[0].sub_amount);
//                $('#sub_condition').html(data[0].sub_condition);
//                $('#sub_materials').html(data[0].sub_materials);
//                $('#sub_time').html(data[0].sub_time);
//                $('#accepting_department').html(data[0].accepting_department);
//                $('#sub_platform').html(data[0].sub_platform);
                var text='<b>申报项目和标准：</b>'+data[0].sub_describe+'<br><b>补贴金额：</b>'+data[0].sub_amount+'<br><b>申报条件：</b>'+data[0].sub_condition+'<br><b>申报资料：</b><br>'+data[0].sub_materials+'<br><b>申报时间：</b>'+data[0].sub_time+'<br><b>受理部门：</b>'+data[0].accepting_department+'<br><b>申报网址：</b>'+data[0].sub_platform
                layer.alert(text, {
//                    icon: 1,
                    btn:"关闭",
                    title:data[0].policy_name,
                    skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
                })
            }
        });

//        $('.mask').fadeIn(5);
//        $('.white').css('transform','translate(-50%,-50%) scale(1)');
//        $('.mask_content').scrollTop(0)

    });


    $('.mask').click(function(){
        $(this).hide();
//        $('.white').css('marginTop','-50px')
        $('.white').css('transform','translate(-50%,-50%) scale(0.5)');
       
       
    });
    $('#maskClose').click(function(){
        $('.mask').hide();
        $('.white').css('transform','translate(-50%,-50%) scale(0.5)');

    });

    $(".white").click(function(event) {
        event.stopPropagation();
    });

</script>
<style>
    .layui-layer-dialog {  width:65%;height:75%;}
    .layui-layer-title{font-size: 17px;  font-weight: bold;}
    .layui-layer-content{height:calc(100% - 140px)}
    .layui-layer-dialog .layui-layer-content{font-size: 15px;line-height: 32px; color:#444;}
    .layui-layer-dialog .layui-layer-content b{font-weight: bold;}
    .layui-layer-btn{text-align: center;border-top: 1px solid #eee;padding:8px 0 6px 0;width: 97%;margin:0 auto;}

</style>

<script>
    menu_init("interestapp");

</script>

<!--盈创活动end-->
<%@ include file="../footer.jsp" %>

</body>
</html>

 
