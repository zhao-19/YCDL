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
	.attentionBox1 div{float: left;}
	.attentionStar1{width:80px;margin-top:1px;}
	.attentionStar1 b{float: left;font-weight: normal;}
	.attentionStar1 span{width:16px;float: left;height:16px;background: url("../image/stars.png") no-repeat 0px 0;;}
	.attentionStar1 span.full-star{background-position: -21px 0;}
	.attentionStar1 span.half-star{background-position: -42px 0;}
	.detailUl1 div{height:32px !important;line-height:32px !important;}
	.equitys .top .test .ytl span{width:16px;}
	.equitys .top .test .ytl{width:244px;}
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
        <div class="info_left fl" style="position: absolute;width: 1200px;">
            <div class="top">
                <div class="image fl"><img src="../image/box/eqs_img.png" alt=""></div>
                <div class="test fl">
                    <div style="overflow:hidden;">
                        <div style="color:#fff;text-align:left;font-size: 16px;font-weight: bold;min-width: 315px;float: left;" id="guquanmingchengid">
                            <s:property value="e.mingcheng"/></div>
                        <div class="ytl" >
                        	<div class='attentionBox1'>
                        		<div>关注度：</div>
                        		<div class='attentionStar1' name="<s:property value='e.browsecount'/>">
                        			<span></span><span></span><span></span><span></span><span></span>
                        		</div>
                        	</div>
                        	<%-- 浏览量：<span><s:property value="e.browsecount"/></span> --%>
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
                    <div class="hexinjingzhengli">
                        <s:property value="e.hexinjzl.substring(0,10)" />
                        <div class="ytl">
                        	已推荐机构：<span><s:property value="e.msg"/></span>
                        	<%-- 约谈量：<span><s:property value="e.markcount"/></span> --%>
                        </div>

                    </div>

                    <div class="hangye">

                        <s:iterator value="e.biaoqian.split(' ')" status="st" var="as">
                            <div class="list1 fl"><s:property value="#as"/></div>
                        </s:iterator>
                    </div>

                    <%--<div class="jieshao"><s:property value="e.hexinjzl" /></div>

                --%></div>
            </div>
            <div class="list">
                <div class="list_bor fl">
                    <div class="tianshi"><s:property value="e.rongzhijieduan"/></div>
                    <div class="lunci">融资轮次</div>
                </div>
                <div class="list_bor fl">
                    <div class="tianshi"><s:property value="e.rongziedu"/>万</div>
                    <div class="lunci"> 融资金额</div>
                </div>
                <div class="list_bor fl">
                    <div class="tianshi"><s:property value="e.crgqbl"/>%</div>
                    <div class="lunci"> 股权出让比例</div>
                </div>
                <div class="list_bor fl">
                    <div class="tianshi"><s:property value="e.xiangmuzhuangtai"/></div>
                    <div class="lunci"> 项目阶段</div>
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
                <div class="jdtyy jdtyy2">
                    <%-- 当前进行到：<%=((bookamt.divide(rongziedu, 2, BigDecimal.ROUND_HALF_EVEN).movePointRight(2)))%>% --%>
                </div>
                <div class="bot" style="float: left;margin-left: 200px;" id="appoint"><span
                        class="size">约&nbsp;&nbsp;谈</span></div>
                <div class="jdtwkk jdtwkk2">
                    <div class="zqrzjdt" style=" float: right">
                        <%-- <div class="zqrzjdt_left"
                             style="width:<%=((bookamt.divide(rongziedu,2,BigDecimal.ROUND_HALF_EVEN).movePointRight(2)))%>%"></div>
                        <div class="zqrzjdt_right"
                             style="width:<%=(100-((bookamt.divide(rongziedu,2,BigDecimal.ROUND_HALF_EVEN).movePointRight(2))).intValue())%>%"></div> --%>
                    </div>
                </div>
            </div>

            <div id="appoint_wk">
                <div id="close"></div>
                <div class="con">
                    <div class="content">
                        <input type="hidden" id="idval" name="id" value="<s:property value="e.id" />"/>
                        <p><span>拟投资金额：</span><input type="text" id="jeval" name="amt" maxlength="8"/><span>(万)</span>
                        </p>
                    </div>
                    <div class="input"><input id="res" class="res" type="button" value="取消"/><input id="sure"
                                                                                                    class="sure"
                                                                                                    type="button"
                                                                                                    value="提交"/></div>
                    <div id="ifsuccess"><span id="ifsuccess2"></span><span id="ifsuccess3"></span></div>
                </div>
            </div>
        </div>
        <style>
            .layui-layer-setwin{top:-30px;  z-index: 100;}
            .layui-layer-page .layui-layer-content{overflow: visible;}
        </style>
            <script type="text/javascript">
                //点击预约提示下载app
                $("#appoint").click(function () {
//                    layer.alert('<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/poperwm2.png" alt="" style="margin:30px;"', { title : '下载盈创动力APP'});

                    layer.open({
                        title:'提示',
                        type: 1,
                        area: ['310px', '298px'],
                        content: '<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/poperwm3.png" alt="" style="margin:0 30px;"'
                    });
                });

                 // 老版点开弹出金额输入框  新版点击提示下载app进行预约 老版取消注释仍可用
                 // $("#appoint").click(function () {
                 //     $("#appoint_wk").slideToggle(300);
                 //     $("#jeval").focus();
                 // });

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

        </div>
    </div>


    <!-- 从这里往下的都重新写 -->
<div class="e_bottomwk">
    <div class="e_bottomb">
        <div class="e_bottomb_left">
            <%--项目产品介绍--%>
            <div id="xmjs" class="block">
                <p class="p"><i class="fa fa-camera-retro"></i> 项目产品介绍</p>
                <div class="cont">

                    <s:property value="e.jianjie"/>

                </div>
            </div>

            <%--产品图示--%>
            <div id="cpts" class="block">
                <p class="p"><i class="fa fa-camera"></i> 产品图示</p>
                <div class="cont">
                    <img class="contimg" src='<s:property value="e.leftpic"/>'/>

                </div>
            </div>

            <%--明星团队--%>
            <div id="mxtd" class="block block2">
                <p class="p"><i class="fa fa-users"></i> 明星团队</p>
                <div class="cont">
                    <div class="wkk wf-main" id="wf-main">

                        <s:iterator value="e.guquanchengyuanList" status="st" var="as">

                            <div class="wk wf-cld">
                                <div class="pic">
                                    <img class="contimg" src='<s:property value="#as.tupian"/>'/>
                                </div>
                                <p class="title"><s:property value="#as.xingming"/></p>
                                <div class="jj">

                                    <s:property value="#as.jianjie"/>

                                </div>

                            </div>

                        </s:iterator>
                        

                    </div>
                </div>
    <style>
	    .wf-main{
	        position: relative;
	        overflow: hidden;
	    }
	    .wf-main .wf-cld{
	        position: absolute;
	        overflow: hidden;
	    }            
    </style>
    <script type="text/javascript">
	
    //单独设置明星团队简介的高度，改为瀑布流排版
    $(function(){
        
	    function Waterfall(param){
	        this.id = typeof param.container == 'string' ? document.getElementById(param.container) : param.container;
	        this.colWidth = param.colWidth;
	        this.colCount = param.colCount || 4;
	        this.cls = param.cls && param.cls != '' ? param.cls : 'wf-cld';
	        this.init();
	    }
	    Waterfall.prototype = {
	        getByClass:function(cls,p){
	            var arr = [],reg = new RegExp("(^|\\s+)" + cls + "(\\s+|$)","g");
	            var nodes = p.getElementsByTagName("*"),len = nodes.length;
	            for(var i = 0; i < len; i++){
	                if(reg.test(nodes[i].className)){
	                    arr.push(nodes[i]);
	                    reg.lastIndex = 0;
	                }
	            }
	            return arr;
	        },
	        maxArr:function(arr){
	            var len = arr.length,temp = arr[0];
	            for(var ii= 1; ii < len; ii++){
	                if(temp < arr[ii]){
	                    temp = arr[ii];
	                }
	            }
	            return temp;
	        },
	        getMar:function(node){
	            var dis = 0;
	            if(node.currentStyle){
	                dis = parseInt(node.currentStyle.marginBottom);
	            }else if(document.defaultView){
	                dis = parseInt(document.defaultView.getComputedStyle(node,null).marginBottom);
	            }
	            return dis;
	        },
	        getMinCol:function(arr){
	            var ca = arr,cl = ca.length,temp = ca[0],minc = 0;
	            for(var ci = 0; ci < cl; ci++){
	                if(temp > ca[ci]){
	                    temp = ca[ci];
	                    minc = ci;
	                }
	            }
	            return minc;
	        },
	        init:function(){
	            var _this = this;
	            var col = [],//列高
	                    iArr = [];//索引
	            var nodes = _this.getByClass(_this.cls,_this.id),len = nodes.length;
	            for(var i = 0; i < _this.colCount; i++){
	                col[i] = 0;
	            }
	            for(var i = 0; i < len; i++){
	                nodes[i].h = nodes[i].offsetHeight + _this.getMar(nodes[i]);
	                iArr[i] = i;
	            }
	
	            for(var i = 0; i < len; i++){
	                var ming = _this.getMinCol(col);
	                nodes[i].style.left = ming * _this.colWidth + "px";
	                nodes[i].style.top = col[ming] + "px";
	                col[ming] += nodes[i].h;
	            }
	
	            _this.id.style.height = _this.maxArr(col) + "px";
	        }
	    };
		   /* new Waterfall({
		        "container":"wf-inner",
		        "colWidth":77,
		        "colCount":3,
		        "cls":"inner"
		    });*/
		    new Waterfall({
		        "container":"wf-main",
		        "colWidth":249,
		        "colCount":3
		    });
    });
</script>
            </div>
            <% Cust cus = (Cust) session.getAttribute(FrontContainer.USER_INFO);%>


            <%--目标用户--%>
            <div id="mbyh" class="block">
                <p class="p"><i class="fa fa-user"></i> 目标用户</p>
                <div class="cont">
                    <s:if test="e.mubiaoyonghu != null">
                    	<s:property value="e.mubiaoyonghu"/>
                    </s:if><s:else>暂无</s:else>
                </div>
            </div>


            <%--市场及用户情况--%>
            <div id="scqk" class="block">
                <p class="p"><i class="fa fa-map-marker"></i> 市场及用户情况</p>
                <div class="cont">
                	<s:if test="e.shichangfenxi != null">
                    	<s:property value="e.shichangfenxi"/>
                    </s:if><s:else>暂无</s:else>
                </div>
            </div>


            <%--行业分析--%>
            <div id="hyfx" class="block">
                <p class="p"><i class="fa fa-industry"></i> 行业分析</p>
                <div class="cont">
                	<s:if test="e.hangyejingzheng != null">
                    	<s:property value="e.hangyejingzheng"/>
                    </s:if><s:else>暂无</s:else>
                </div>
            </div>


            <%--发展计划--%>
            <div id="fzgh" class="block">
                <p class="p"><i class="fa fa-globe"></i> 发展计划</p>
                <div class="cont">
                	<s:if test="e.weilaifazhanjihua != null">
                    	<s:property value="e.weilaifazhanjihua"/>
                    </s:if><s:else>暂无</s:else>
                </div>
            </div>

            <%--其它信息--%>
            <div id="qtxx" class="block">
                <p class="p"><i class="fa fa-bar-chart-o"></i> 其它信息</p>
                <div class="cont">
                	<s:if test="e.qitaxinxi != null">
                    	<s:property value="e.qitaxinxi"/>
                    </s:if><s:else>暂无</s:else>
                </div>
            </div>

        </div>
        <div class="e_bottomb_right">
            <div class="txmdt">
                <div class="title">项目动态</div>
                <ul>
                    <s:iterator value="e.guquanjingchengList" status="st" var="as">
                        <li><b></b><span class="span"><a href="javascript:void(0)" style="cursor:context-menu;" title='<s:property value="#as.shijian"/>'><s:property
                                value="#as.shijian"/></a></span><span class="span1 fr">   <s:property
                                value="#as.riqi"/></span></li>

                    </s:iterator>
                </ul>
            </div>
            <%--栏目列表--%>
            <div class="barlist">
                <ul>
                    <a name="xmjs" href="javascript:void(0);" class="active">项目介绍</a>
                    <a name="cpts" href="javascript:void(0);">产品图示</a>
                    <a name="mxtd" href="javascript:void(0);">明星团队</a>
                    <a name="mbyh" href="javascript:void(0);">目标用户</a>
                    <a name="scqk" href="javascript:void(0);">市场情况</a>
                    <a name="hyfx" href="javascript:void(0);">行业分析</a>
                    <a name="fzgh" href="javascript:void(0);">发展规划</a>
                    <a name="qtxx" href="javascript:void(0);">其它信息</a>
                    <% if ((cus != null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003".equals(cus.getUsertype())) || session.getAttribute(ManageContainer.manage_session_user_info) != null) { %>
                    <a href="<s:property value='e.jihuashu' />">BP</a>
                    <% } else { %>
                    <a href="javascript:void(0)">BP</a>
                    <% } %>
                </ul>
            </div>
        </div>

    </div>
</div>


<%--







<div class="baise">
    <div class="dynamics widthbox">
        <div class="dynamics_left fl">
            <img src="<s:property value="e.leftpic"/>" alt="">
        </div>
        <div class="dynamics_right fl">
            <div class="title">项目动态</div>
             <div class="timess">
                <ul>
                
              		 <s:iterator value="e.guquanjingchengList" status="st" var="as">  
 	                    <li><b></b><span class="span"><a href=""><s:property value="#as.shijian"/></a></span><span class="span1 fr">   <s:property value="#as.riqi"/></span></li>
		  				
					 </s:iterator> 
					 
						 
                    
                 </ul>
            </div>
        </div>
    </div>
    <div class="introduction">
        <div class="auto">
           
        </div>
        <div class="testxmjs widthbox">项目介绍</div>
            <div class="xiangmubg widthbox">
                <div class="width990">
                    <img src="<s:property value="e.leftpic"/>" alt="">
                    <div class="title">项目名称： <s:property value="e.mingcheng" /> </div>
                    <div class="xmcpjs">项目/产品介绍</div>
                    <div class="content">
                        <li>  <s:property value="e.jianjie" /> </li>
                    </div>
                    <div class="xuqiuxinxi">
                        <div class="xuqiu">
                            <li class="rzxq">融资需求</li>
                            <li class="rzxqinfo fl">项目进程：  <s:property value="e.rongzizhuangtai" /></li>
                            <li class="rzxqinfo fl">信息有效期：长期</li>
                            <li class="rzxqinfo fl">融资类别：股权融资</li>
                            <li class="rzxqinfo fl">融资金额（万元）：<s:property value="e.rongziedu" /> 万</li>
                            <li class="rzxqinfo fl">出让股权比例：<s:property value="e.crgqbl" />%</li>
                            <li class="rzxqinfo fl">投资机构：投资机构</li>
                        </div>
                      <div class="xuqiu">
                            <li class="rzxq">企业基本信息</li>
                            <li class="rzxqinfo fl">企业名称：*****</li>
                           <!--  <li class="rzxqinfo fl">所属行业：互联网网络服务即时通信</li>
                            <li class="rzxqinfo fl">注册资本（万元）：500万</li>
                            <li class="rzxqinfo fl">工商注册地：四川省成都市高新区</li>
                            <li class="rzxqinfo fl">经营地址：长益路13号</li>
                            <li class="rzxqinfo fl">发展阶段：初创期</li> -->
                        </div>
                          
                    </div>
                </div>
            </div>  
            <div class="testtdjs widthbox">团队介绍</div>
            <div class="tdlist widthbox">
            
            
             <s:iterator value="e.guquanchengyuanList" status="st" var="as">  
		  						 
                <div class="tdlistinfo fl">
                    <img src='<s:property value="#as.tupian"/>'>
                    <div class="title"><s:property value="#as.xingming"/></div>
                    <div class="content">
                        <li> <s:property value="#as.jianjie"/> </li>
                    </div>
                </div>
                
			 </s:iterator> 
					 
					 
			
                
            </div>
    </div>
</div>



--%>


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

    //barlist下的a标签点击事件
    var sbzf = 0;
    $('.barlist a').click(function () {
        sbzf = 1;
        //先加css样式
        $('.barlist a').removeClass('active');
        $(this).addClass('active');
        //然后通过name，找区域id，获取其高度，让页面文档的scrollTop回滚到对应的位置。
        var blockName = $(this).attr('name');
        if (blockName) {
            var blockTop = ($("#" + blockName).position().top) - 30;
            $('body,html').stop().animate({
                scrollTop: blockTop

            }, 500, function () {
                sbzf = 0;
            });
            //
            return false;
        } else {
            //点击的是bp
        }


    });

    //鼠标滚动时判断滚动条的高度是否大于等于barlist框的top值
    var barlistTop = $('.barlist').position().top;
    //alert(barlistTop);
    $(window).scroll(function () {
        if (sbzf) {
            return;
        }
        //alert(2);
        //1.当滚动条的高度大于等于barlist的高度就让barlist浮起来
        var scrollTop = $(window).scrollTop();
        //$(document).attr("title",scrollTop);
        if (scrollTop > barlistTop) {
            $('.barlist').addClass('barlistfixed');
        } else {
            $('.barlist').removeClass('barlistfixed');
        }

        //2.获取每个区域块的高度，组成一个数组。用滚动条的高度分别减去区域块的高度，从最底部的区域块（也就是最大那个值开始）开始比。找到大于于条件
        if (($('#qtxx').length > 0)) {
            var qtxxTop = $('#qtxx').position().top;
        }
        if ($('#mbyh').length > 0) {
            var mbyhTop = $('#mbyh').position().top;
        }
        if ($('#scqk').length > 0) {
            var scqkTop = $('#scqk').position().top;
        }
        if ($('#fzgh').length > 0) {
            var fzghTop = $('#fzgh').position().top;
        }
        if ($('#hyfx').length > 0) {
            var hyfxTop = $('#hyfx').position().top;
        }


        var mxtdTop = $('#mxtd').position().top;
        var cptsTop = $('#cpts').position().top;
        var xmjsTop = $('#xmjs').position().top;

        scrollTop = scrollTop + 60;//本来加30就刚好是边界，但实际往回滑动的效果不是很好，所以多加一点
        if (scrollTop >= qtxxTop) {
            $('.barlist a[name=qtxx]').addClass('active').siblings().removeClass('active');
        } else if (scrollTop >= fzghTop) {
            $('.barlist a[name=fzgh]').addClass('active').siblings().removeClass('active');
        }
        else if (scrollTop >= hyfxTop) {
            $('.barlist a[name=hyfx]').addClass('active').siblings().removeClass('active');
        }
        else if (scrollTop >= scqkTop) {
            $('.barlist a[name=scqk]').addClass('active').siblings().removeClass('active');
        }
        else if (scrollTop >= mbyhTop) {
            $('.barlist a[name=mbyh]').addClass('active').siblings().removeClass('active');
        }
        else if (scrollTop >= mxtdTop) {
            $('.barlist a[name=mxtd]').addClass('active').siblings().removeClass('active');
        }
        else if (scrollTop >= cptsTop) {
            $('.barlist a[name=cpts]').addClass('active').siblings().removeClass('active');
        }
        else if (scrollTop >= xmjsTop) {
            $('.barlist a[name=xmjs]').addClass('active').siblings().removeClass('active');
        }


        //alert(scrollTop);
    });

    menu_init("stock");

</script>
<%@ include file="../footer.jsp" %>

</body>
</html>
 