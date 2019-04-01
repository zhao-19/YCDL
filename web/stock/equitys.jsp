<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.services.manage.guquan.bean.Guquan" %>
<%@page import="java.math.BigDecimal" %>
<%@ page import="com.winpow.core.FrontContainer" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ page import="com.winpow.core.ManageContainer" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="en-US">
<head>
    <title>盈创动力-国内领先的科技金融服务门户网站</title>

    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/equity.css" rel="stylesheet" type="text/css"/>
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/about.css" rel="stylesheet" type="text/css"/>
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<style type="text/css">
    .huise{min-height: 340px;}
	.attentionBox1 div{float: left;}
	.attentionStar1{width:80px;margin-top:1px;}
	.attentionStar1 b{float: left;font-weight: normal;}
	.attentionStar1 span{width:16px;float: left;height:16px;background: url("../image/stars.png") no-repeat 0px 0;;}
	.attentionStar1 span.full-star{background-position: -21px 0;}
	.attentionStar1 span.half-star{background-position: -42px 0;}
	.detailUl1 div{height:32px !important;line-height:32px !important;}
	.equitys .top .test .ytl span{width:16px;}
	.equitys .top .test .ytl{width:244px;}
    .equitys .info_left{background: #fff;}
    .equitys .bot{background:#ff721f;color: #fff;margin: 0;border-radius: 2px;width: 100%;}
    .equitys .bot:hover{background:#f96712;}
    .equitys .bot .size{font-size: 16px;}
    .equitys .hexinjingzhengli,.equitys .top .test .ytl span,.equitys .hangye .list1,.equitys .tianshi,.equitys .lunci,.equitys .top .test .ytl{color: #666;}
    .equitys .top{height: 60px;line-height: 60px;border-bottom: 1px solid  #ebebeb;margin:0;padding:0 20px;}
    .equitys .info_left .dkk{box-sizing:border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;
        margin-top: 0;    border-left: 1px solid #ebebeb;height:auto;padding:25px;width: 330px;}
    .equitys .list{margin-top: 40px;width: 870px;padding-left:0;}
    .equitys .list_bor{width: 20%;height: auto;}
    .equitys .attentionBox1,.equitys .hexinjingzhengli{margin-bottom: 15px;padding-left: 0;color: #666;}

    .equitys .list_bor{background: none;border:0;}
    .e_bottomb .e_bottomb_left .block .p{font-size: 20px;line-height: 60px;border-bottom: 1px solid  #ebebeb;padding:0 20px}
    .e_bottomb .e_bottomb_left .block{padding: 0 0 50px;}
    .e_bottomb .e_bottomb_left .block .cont{padding:0 20px;}
    .e_bottomb .e_bottomb_left{min-height: 0px;}
    .equitys .tianshi{font-size: 32px;font-weight: normal;color: #ff721f;}
    .equitys .tianshi>span{font-size: 14px; margin-left: 4px;}
    .equitys .lunci{margin-top:16px;color: #999;}
    #syjhs>img{max-width: 100%;margin: 15px 0;display: block;}
    .loginplease{position: absolute;bottom: 0;width: 100%;background: rgba(255,255,255,0.7);line-height: 200px;text-align: center}
    .loginplease>a{font-size: 17px;color: #ff721f;text-decoration: underline;}
    .loginplease>a:hover{text-decoration: underline;}

    .loginBg{display:none;width:100%;height:100%;position:fixed;top:0;left:0;z-index:10000;background:rgba(0,0,0,0.4);}
    .loginWindow{position:absolute;top:50%;left:50%;margin:-212px 0 0 -184px;}
    .loginWindow iframe{border:0;border-radius:4px;}
    #loginClose{position:absolute;top:10px;right:10px;font-size:18px;cursor: pointer;}
    #modal2{position: fixed;width: 100%;height: 100%;z-index: 2000;background: rgba(0,0,0,0.36);top: 0;left: 0;display: none;}
    #modal2 ul{background: #fff;}
    #modal2 ul>li{height:50px;display: flex;align-items: center;justify-content:center;}
    #modal2 ul>li:nth-child(odd){background: #f5f5f5;}
    #modal2>div{width:50%;max-height:70%;overflow-y: auto;position: absolute;top:50%;left:25%;transform: translateY(-50%);
        padding-top: 50px;  background: #fff url(../image/tjjg.png) no-repeat center 18px;  background-size: 170px auto;
    }
    .recmpno{cursor: pointer;}
    #closemodal{position: absolute; top: 20%; right: 20%; width: 23px; height: 23px; line-height: 22px; border-radius: 50%; background: #f5f5f5; color: #aaa; text-align: center; cursor: pointer; z-index: 10; font-size: 18px;}
    .layui-layer-setwin{top:-30px;  z-index: 100;}
    .layui-layer-page .layui-layer-content{overflow: visible;}
    .fixed{top:auto;bottom:10%!important;height:82px;}
    .equitys  #appoint_wk{float:right;margin-right:15px;border: 2px solid #f96712;width: 300px;background: none;padding:0;margin-top:0;margin-bottom: 20px;}
    .equitys  #appoint_wk .con .content input{background: none;border:1px solid #ddd;color: #666;font-size: 15px;}
    .equitys  #appoint_wk .con{width: 100%;}
    .equitys  #appoint_wk .con .content p{font-size: 14px;}
    .equitys  #appoint_wk .con .input input{font-size: 12px;}
    .equitys  #appoint_wk .con .input{margin-bottom: 10px;}
    .equitys  #appoint_wk .con .input input.sure,.equitys  #appoint_wk .con .input input.res{color: #fff;}
</style>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>
<div class="about_cj_banner">
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/box/equity_banner1.jpg"/>

</div>
<!-- 内容部分 -->
<div class="huise">
    <div class="equitys widthbox">
        <div class="info_left fl" >
            <div class="top">
                <img src="../image/box/eqs_img.png" alt="" style="width: 33px;height: 33px;float: left;margin-top: 13px;margin-right: 8px;">
                    <div style="overflow:hidden;">
                        <div style="text-align:left;font-size: 20px;float: left;" id="guquanmingchengid">
                            <s:property value="e.mingcheng"/>
                            <span style="padding-left: 10px;color: #999;font-size: 14px;"><s:property value="e.hexinjzl.substring(0,10)" /></span>
                        </div>

                    </div>
			<script type="text/javascript">
				$(function(){
					function getCount(count) {
						var num = 0;
						if (count <= 100) {
							num = 2;
						} else if(count <= 200) {
							num = 3;
						} else if(count <= 250) {
							num = 3.5;
						} else if(count <= 300) {
							num = 4;
						} else if(count <= 600) {
							num = 4.5;
						} else if(count > 600) {
							num = 5;
						}
						return num;
					}
					var star = $(".attentionStar1");
					var count = getCount(star.attr("name"));
			        var countInt=parseInt(count);
			        star.children('span:lt('+countInt+')').addClass('full-star');
			      	if(countInt!=count){
			          star.children('span:nth-child('+(countInt+1)+')').addClass('half-star');
			      	}
				});
			</script>
            </div>
            <div class="list">
                <div class="list_bor fl">
                    <div class="tianshi"><% out.print(AppUtil.getCodeName(request.getAttribute("e.rongzhijieduan")));%></div>
                    <div class="lunci">融资轮次</div>
                </div>
                <div class="list_bor fl">
                    <div class="tianshi"><s:property value="e.rongziedu"/><span>万</span></div>
                    <div class="lunci"> 融资金额</div>
                </div>
                <div class="list_bor fl">
                    <div class="tianshi"><s:property value="e.crgqbl"/><span>%</span></div>
                    <div class="lunci"> 股权出让比例</div>
                </div>
                <div class="list_bor fl">
                    <div class="tianshi"><% out.print(AppUtil.getCodeName(request.getAttribute("e.xiangmuzhuangtai")));%></div>
                    <div class="lunci"> 项目阶段</div>
                </div>
                <div class="list_bor fl recmpno">
                    <div class="tianshi">${fn:length(log)}<span>家</span><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/sanj.png" alt="" style="    margin-left: 5px; width: 10px;"></div>
                    <div class="lunci"> 已推荐机构</div>
                </div>
            </div>
            <div class="dkk">
                <%
                    Guquan g = (Guquan) request.getAttribute("e");

                    BigDecimal rzje = g.getRongziedu();
                    BigDecimal bookamt = g.getBookamt();
                    BigDecimal rongziedu = g.getRongziedu();

                    if (bookamt == null) {
                        bookamt = new BigDecimal(0);
                    }
                %>
                <div class="ytl" >
                    <div class='attentionBox1 ov' >
                        <div>关注度：</div>
                        <div class='attentionStar1' name="<s:property value='e.browsecount'/>">
                            <span></span><span></span><span></span><span></span><span></span>
                        </div>
                    </div>
                </div>
                <div class="hexinjingzhengli">
                    <div class="ytl">
                        浏览量：<span><s:property value="e.browsecount"/></span>
                        <!--已推荐机构：<span><s:property value="e.msg"/></span>-->
                        <!--约谈量：<span><s:property value="e.markcount"/></span> -->
                    </div>
                </div>
                <div class="hexinjingzhengli">
                    <div class="ytl" style="    width: 150px; overflow: hidden; height: 20px;">
                        发布时间：<span><s:property value="e.faburiqi"/></span>
                    </div>
                </div>
                <div class="jdtyy jdtyy2"></div>
                <div class="bot" id="appoint"><span class="size">立即约谈</span></div>
            </div>
            <div id="appoint_wk">
                <div id="close"></div>
                <div class="con">
                    <div class="content">
                        <input type="hidden" id="idval" name="id" value="<s:property value="e.id" />"/>
                        <p><span>拟投资金额：</span><input type="text" id="jeval" name="amt" maxlength="8"/><span>（万）</span>
                        </p>
                    </div>
                    <div class="input"><input id="res" class="res" type="button" value="取消"/><input id="sure" class="sure" type="button" value="提交"/></div>
                    <div id="ifsuccess"><span id="ifsuccess2"></span><span id="ifsuccess3"></span></div>
                </div>
            </div>
        </div>
        </div>
    </div>
<div class="e_bottomwk">
    <div class="e_bottomb">
        <div class="e_bottomb_left" style="width: 100%;">
            <div id="xmjs" class="block">
                <p class="p"> 项目产品介绍</p>
                <div class="cont">
                    <s:property value="e.jianjie"/>
                </div>
            </div>
            <div id="cpts" class="block" style="position: relative;">
                <p class="p">商业计划书</p>
                <div class="cont" id="syjhs">
                    <input type="hidden" value="<s:property value='e.picdeatil'/>">
                </div>
                   <div class="loginplease"><a href="/user/login.html" >登录查看完整内容</a></div>
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
<div class="loginBg">
    <div class="loginWindow">
        <span id="loginClose">&times;</span>
        <iframe src="/user/loginAjax.jsp" width="368" height="400" scrolling="no" name="iframe_name" id="loginAjaxIframe"></iframe>
    </div>
</div>
<div id="modal2">
    <b id="closemodal">&times;</b>
    <div>
        <ul>
        	<s:if test="#request.log.size != 0">
				<s:iterator value="#request.log">
					<li>${dest_name }</li>
				</s:iterator>		
			</s:if>
			<s:else>
				<li>暂无推荐机构</li>
			</s:else>
        </ul>
    </div>

</div>
<script>
    $(function () {
        var imgarr=$('#syjhs>input').val();

        if ('${user_info}' == "") {

                $("#loginAjaxIframe").contents().find("#loginAjax").val(1);

                if(imgarr!=""){
                    var imgs=imgarr.split(',');
                    $.each(imgs,function(i,v){
                        var img=' <img src="'+v+'"/>';
                        $('#syjhs').append(img);
                        if(i>=1){
                            return false;
                        }
                    })
                }else{
                     $('#syjhs').append('<p>无</p>');
                }

            $('.loginplease>a').click(function(e){
            	$("#loginAjaxIframe").contents().find("#loginAjax").val(window.location.pathname);
                e.preventDefault();
                $('.loginBg').fadeIn(300);
            })
            $('#loginClose').click(function(){
                $('.loginBg').fadeOut(300);
            })
            $('.loginBg').click(function(){
                $(this).fadeOut(300);
            });
            $(".loginWindow").click(function(event) {
                event.stopPropagation();
            });

        }else {
            if(imgarr!=""){
                var imgs=imgarr.split(',');
                $.each(imgs,function(i,v){
                    var img=' <img src="'+v+'"/>';
                    $('#syjhs').append(img);
                })
            }else{
                $('#syjhs').append('<p>无</p>');
            }
            $('.loginplease').hide();
        }
    })
    $('.recmpno').click(function () {
        $('#modal2').show();
    });

    $('#modal2').click(function (){
        $(this).hide();
    });
</script>
<script type="text/javascript">
    //点击预约提示下载app
//    $("#appoint").click(function () {
//        layer.open({
//            title:'提示',
//            type: 1,
//            area: ['310px', '298px'],
//            content: '<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/poperwm3.png" alt="" style="margin:0 30px;"'
//        });
//    });
     //老版点开弹出金额输入框  新版点击提示下载app进行预约 老版取消注释仍可用
     $("#appoint").click(function () {
         $("#appoint_wk").slideToggle(300);
         $("#jeval").focus();
     });
    $("#close").click(function () {
        $("#appoint_wk").slideUp(300);
        $("#jeval").val("");
    });
    $("#res").click(function () {
        $("#appoint_wk").slideUp(300);
        $("#jeval").val("");
    });
    $("#sure").click(function () {
        var idval = $("#idval").val();
        var jeval = $("#jeval").val();
        if (jeval.length < 1) {
            alert("请输入金额");
            $("#jeval").focus();
            return;
        }
        var regres = isNum(jeval);
        if (!regres) {
            alert("请输入数字！");
            $("#jeval").focus();
            return;
        }

        jQuery.ajax({
            type: "post",
            data: {id: $("#idval").val(), amt: $("#jeval").val(), guqanname: $("#guquanmingchengid").html()},
            url: "/stock/talk.html",
            dataType: "json",
            success: function (reslut) {
                //0,跳转到登录页面，-1，提示；-2，跳转到机构页面
                //alert(data);

                var timeId = 0;
                var timeLeft = 4;

                function countt() {
                    if (timeLeft <= 0) {
                        window.clearInterval(timeId);
                        $("#appoint_wk").slideUp(300);
                        $("#jeval").val("");
                        return;
                    } else {
                        $("#ifsuccess3").html(timeLeft).show();
                        //timeId = window.setInterval("countt()",1000);
                        timeLeft--;
                    }

                }


                if (reslut.code == 1) {
                    $("#ifsuccess2").html("恭喜，预约成功！");
                    /*setTimeout(function(){location.reload();},300);*/
                    timeId = setInterval(function () {
                        countt();
                    }, 1000);

                    return;
                }
                if (reslut.code == 0) {
                    $("#ifsuccess2").html("请先登录！");
                    timeId = setInterval(function () {
                        countt();
                    }, 1000);
                    return;
                }
                if (reslut.code == -1) {
                    $("#ifsuccess2").html("只有机构用户才能约谈！");
                    timeId = setInterval(function () {
                        countt();
                    }, 1000);
                    return;
                }
                if (reslut.code == -2) {
                    $("#ifsuccess2").html("请补充完整机构信息！");
                    timeId = setInterval(function () {
                        countt();
                    }, 1000);
                    return;
                }
                if (reslut.code == -3) {
                    if (confirm("您已经约谈过该融资项目，点击确定查看预约状态！")) {
                        location.href = "/usercenter/getAppointmentguquanapplist.html";
                    } else {
                        return false;
                    }
                    return;
                }

            },
            error: function (XmlHttpRequest, textStatus, errorThrown) {
                //$("#ifsuccess").html(XmlHttpRequest.responseText);
                $("#ifsuccess").html("失败！");
            }
        });


    });
    function isNum(a) {
        var reg = /^[-+]?\d+(\.\d+)?$/;
        return (reg.test(a));
    }


</script>


<%@ include file="../footer.jsp" %>

</body>
</html>
 