<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css" type="text/css">
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.dialogBox.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/personappinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/drag/dragImg.js"></script>

<script type="text/javascript">
$(window).load(function(){
	var backnotice = $("#backnotice").val();
	if(backnotice.length>1){
        var a = document.getElementById("ggts2");//获取div块对象
        var Height=document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
        var Width=document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
        var gao1 = a.offsetHeight;//获取div块的高度值
        var gao2 = a.offsetWidth;//获取div块的宽度值
        var Sgao1= (Height - gao1)/2-110+"px";
        var Sgao2= (Width - gao2)/2+"px";
        a.style.top=Sgao1;
        a.style.left=Sgao2;
	    ggts2(backnotice);
	}
});
	
$(document).ready(function(){
	var t = $("#t").val();//v 查看   u 修改  a 新增
	//alert(t);
	if(t=='v'){
		//表示查询
		$("#personappinfo input,radio,select,textarea,checkbox").attr('disabled',true);
		$(".shenqingdkt").attr("disabled",false);
		$(".shenqingdkthide").hide();
		$("#zqxxxgbtn").hide();
		//$("#applypro").hide();
		$(".star").hide();
		$("#personappinfo input,radio,textarea,checkbox").each(function(){
			$(this).parent("span").html($(this).val());			
		});
		$("#personappinfo select").each(function(){
			var text = $(this).find("option:selected").text();
			$(this).parent("span").html(text == "请选择" ? "" : text);			
		});
        if ($('#topic_content>img').attr('src')) {
            $('#topic_content').css('background','none');
        }else{
        	$('#topic_content>img').css('display','none');
        }
	}
	else if(t=='a'){
		//表示新增（在返回没有数据的情况可以新增）
		$(".shenqingdkt").hide();
		$(".shenqingdkthide").show();
//		$(".shenqingdkthide").val("提交");
		personappinfo();
        $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
        $('.perSonHeadImg').css('paddingTop','190px')
        $('.update').hide();
	}else if(t=='u'){ 
		//表示修改
		personappinfo();
        $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
        $('.perSonHeadImg').css('paddingTop','190px')
        $('.update').hide();

	}else if(t=='x'){ 
		//表示修改
		//$("#applypro").hide();
		personappinfo();
        $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
        $('.perSonHeadImg').css('paddingTop','190px')
		$("#appa").attr("href","/usercenter/usercenter.html?person.t=v");
		$("#appa span").html("返回");
        if ($('#topic_content>img').attr('src')) {
            $('#topic_content').css('background','none');
        }else{
        	$('#topic_content>img').css('display','none');
        }
        $('.update').hide();
	}
	$(".upback").click(function(){
		location.href = "/usercenter/getJigouinfo.html?person.t=v";
	});
});

function discriCard(){ 
	var UUserCard = $("#orgid").val(); //获取输入身份证号码 
	var birthday = UUserCard.substring(6, 10) + "-" + UUserCard.substring(10, 12) + "-" + UUserCard.substring(12, 14); 
	$(".birthday").eq(0).val(birthday); //获取出生日期 
	if (parseInt(UUserCard.substr(16, 1)) % 2 == 1) { //获取性别 
		$("#sexman").attr('checked','true'); 	//男
	} else { 
		$("#sexwomen").attr('checked','true'); 	//女
	} 
} 
</script>
<style>
.error {
    border: none;
    background:none;
    }
label.error {
    border: 1px solid #f5694b!important;
    background:none;
	color: #f5694b;
	padding: 0 2px;
	display:inline-block;
	height: 20px;
    line-height: 20px;
    }
</style>
<style type="text/css">
	#appa{display:inline-block;width:100%;height:36px;line-height: 36px;color:#fff;border-radius: 5px;
		background:#61bce8 url("../icon/helpMark.png") no-repeat 130px center;  text-indent: 14px;
	}
	#appa:hover{background-color:#299ed7; }
	.appaBox .answer{position:relative;border:1px solid #f4d19f;background: #fff6ea;color:#775730;
		margin-top:10px;border-radius: 5px;padding:10px;font-size: 11px;display: none;}
	.appaBox .answer img{width:6px;height:7px;position: absolute;top:-7px;left:134px;border-radius: 5px;

	}
	.appaBox:hover .answer{display: block;}
	.usercompletemap{width:160px;height:10px;border-radius: 5px;background: #eeeeee;}
	.usercompletemap>span{display:block;height:100%;background: #f66718;border-radius: 5px;}
	.usercompletetxt>span{color:#666;font-size: 12px;}
	.perSonHeadImg>div{margin:10px 0;}
	.update{display:inline-block;background: #f66718;color:#fff;border-radius: 5px;padding:8px 46px;margin:40px 0 75px 134px;}
	.creditor .vipinfo .inputtest .rightinfo,.creditor .vipinfo .inputtest .input,.creditor .vipinfo .inputtest .select{width:190px;box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing:border-box;}
	.sbhz_mask,.sbhz_mask *{box-sizing:border-box;font-size:14px;color: #333;}
	.sbhz_mask{display:none;position:fixed;top:0;left:0;z-index:10000;overflow:hidden;width: 100%;height:100%;background: rgba(0,0,0,0.6)}
	.sbhz_box{width:45%;height:60%;position: absolute;top:50%;left:50%;background:#fff;transform:translate(-50%,-50%);transition: 0.3s ease-out 0.1s;padding:25px 30px 0;color:#333;line-height: 33px;}
	.sbhz_box li ul{padding-bottom:15px;border-bottom: 1px dashed #ddd;}
	.sbhz_box li{float:left;}
	.sbhz_all{position:relative;border:1px solid #dfdfdf;width:100%;height: 83%;border-radius: 5px;}
	.sbhz_tj{text-align:center;cursor: pointer;border-radius:3px;display: inline-block;width:60px;height:30px;line-height:30px;margin:10px 5px;color:#fff;background:#ff6600;}
	#sbhz_tj.f{background:#ff6600;}
	#sbhz_tj{background:#dcdfe1;}
	.sbhz_tj:hover{background:#eb5404;}
	.ceinput{border:1px solid #E0E0E0;padding:6px 8px;      width: 200px;}
	.sbhz_all>div{margin-bottom:15px;}
	.sbhz_all input{font-family:"微软雅黑";margin-left:5px;font-size:14px;color:#666;}
	#sendcode{ margin-left: 15px;  font-size: 14px;cursor:pointer;color:#ff6600;}
	#sendcode:hover{color:#177bbb;}
	.sbhz_tj{font-family:"微软雅黑";margin-top:15px;}
	#shenbao{display: none;}
	
	.leftnamel{max-width: 90px !important;}
	.base-icons{border-top: 0px}
	.star{color:red;}
	
	.btn-success {
	  color: rgb(91, 183, 91);
	  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	  background-color: #5bb75b;
	  *background-color: #51a351;
	  background-image: -moz-linear-gradient(top, #62c462, #51a351);
	  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#51a351));
	  background-image: -webkit-linear-gradient(top, #62c462, #51a351);
	  background-image: -o-linear-gradient(top, #62c462, #51a351);
	  background-image: linear-gradient(to bottom, #62c462, #51a351);
	  background-repeat: repeat-x;
	  border-color: #51a351 #51a351 #387038;
	  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff51a351', GradientType=0);
	  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	}
	.btn {
	  display: inline-block;
	  *display: inline;
	  padding: 4px 12px;
	  margin-bottom: 0;
	  *margin-left: .3em;
	  font-size: 14px;
	  line-height: 20px;
	  color: #333333;
	  text-align: center;
	  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	  vertical-align: middle;
	  cursor: pointer;
	  background-color: #f5f5f5;
	  *background-color: #e6e6e6;
	  background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
	  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
	  background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
	  background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
	  background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
	  background-repeat: repeat-x;
	  border: 1px solid #cccccc;
	  *border: 0;
	  border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	  border-bottom-color: #b3b3b3;
	  -webkit-border-radius: 4px;
	     -moz-border-radius: 4px;
	          border-radius: 4px;
	  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
	  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	  *zoom: 1;
	  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
	     -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
	          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
	}
	
	#example img{position:fixed;top:50%;left:50%;z-index:10;display:none;transform:translate(-50%,-50%);width:300px;
-ms-transform:translate(-50%,-50%); 	/* IE 9 */
-moz-transform:translate(-50%,-50%); 	/* Firefox */
-webkit-transform:translate(-50%,-50%); /* Safari 和 Chrome */
-o-transform:translate(-50%,-50%); }
	#example img.showsl{display:block;}

	/*营业执照按钮*/
	.creditor .vipinfo .inputtest .rightinfo.bcard{display:none;}
	.creditor .vipinfo .inputtest .rightinfo.bcard .error{margin:4px 0 0 6px;}
	#bcard{float:left;color:transparent;background:#FF5722 url(<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/upload.png) no-repeat 47% 7px;width: 160px; cursor:pointer;padding-left:31px;border-radius:2px;border:0!important;}
	#bcard:hover{opacity: 0.8;}
	.showImg{position:relative; overflow:visible !important;cursor:pointer;}
	.showImg div.none{width:80%;text-align:center;position:absolute;top:38px;left:50%;/*border:1px solid #ddd;*/background: #fff;
		transform:translateX(-50%);-ms-transform:translateX(-50%); 	-moz-transform:translateX(-50%); -webkit-transform:translateX(-50%); -o-transform:translateX(-50%);
		box-shadow: 1px 2px 6px rgba(0,0,0,0.2)
	}
	.showImg .rightinfo{text-overflow: ellipsis;overflow: hidden;}
	/*缩略图*/
	.imgbox{width:160px;height:160px;text-align:center;}
	.imgbox #topic_content{width:100%;height:100%;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/default_headimg.png") no-repeat center;}
	.imgbox #topic_content>img{width:100%;height:100%;}
	/*全屏放大图*/
	#imglayer_bg {position:fixed;top:0;left:0;width:100%;height:100%;background:#000 url(/image/imglayer_loading.gif) no-repeat center center;;opacity:0.7;filter:alpha(opacity=70);z-index:9995;display:none;}
	#imglayer_border {max-width:60%;height:100%;position:fixed;top:0;left:0;z-index:9996;margin:20px;display:none;}
	#imglayer_zoom {display:block;border:0;max-height: 100% !important;}
	#imglayer_x {display:block;position:absolute;width:40px;height:40px;z-index:9997;outline:none;right:-20px;top:-20px;background:url(http://static.epaidai.com/images/bbs/topic/imglayer_ico.png) no-repeat;}
	#imglayer_x:hover {background-position:0 -40px;}
	.showImg .bcard{position: absolute;}
</style>
<script type="text/javascript">

KindEditor.ready(function (K) {
    var editor = K.editor({
        allowFileManager: false
    });
    var val = "";
    K('#bcard').click(function () {
        val = $(this).attr("id");
        editor.loadPlugin('image', function () {
            editor.plugin.imageDialog({
                showRemote : false,
                insertfile: K('#bcard').val(),
                clickFn: function (url, title) {
                    K('#bcard').val(url);
                    K('#bcard2').val(url);
                    K('#topic_content>img').attr('src', url);
                    K('#topic_content').css('background','none');
                    K('#topic_content>img').css('display','block');
                    editor.hideDialog();
                    removError(val);
                }
            });
        });
    });
});
//如果填写之前有error错误提示，则用日期或时间插件完成时，若框框有值了，需要手动移除这个错误提示。框框本身不能手写。
function removError(val) {
    $('#' + val).next().remove();
    var thisclass = $('#' + val).attr("class");
    var endIndex = thisclass.indexOf("error");
    var nowClass = thisclass.substring(0, endIndex);
    if (nowClass) {
        $('#' + val).attr("class", nowClass);
        //然后动态关闭jQuery.validate验证
        $('#' + val).rules("remove");
    }
}
</script>
</head>
<body>
<div id="ggts2"></div>
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
<input type="hidden" id="t" value="<s:property value="person.t"/>">
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 个人中心 -->
<div class="background"></div>
	<div class="creditor widthbox">
		<div class="show fl">
			<%@ include file="leftnav.jsp"%>
		</div>
		<div class="list fr">
			<div class="rightbox">
				<div class="personHello ov">
					<div class="fl helloMsg">
						<h2>${e.userid}，您好！</h2>
						<% if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002".equals(u.getUsertype())){%>
							<p>您还未关联企业，请立即<a href="/usercenter/relaqiyeinfo.html">关联企业！</a></p>
						<%}%>
					</div>
					<div class="fr relaBtn">
						<% if(u!=null && "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002".equals(u.getUsertype())){%>
							<a href="/usercenter/relaqiyeinfo.html">关联企业123</a>
						<%}%>
					
					
					
					
					</div>
				</div>
				<div class="vipinfo" id="jibenxinxi" style="display:block;border-top: 2px solid #f66718;border-radius: 0;padding:20px;">
				<!--<div class="title"><li><span class="t">个人信息</span>-->
					<!--<s:if test="person.approve!='10001'">-->
							<!--<a href="/usercenter/usercenter.html?person.t=x" id="appa"><span class="update">申请成为融资导师</span></a>-->
					<!--</s:if>-->
					<!--<a href="/usercenter/usercenter.html?person.t=u"><span class="update" style="margin-right: 15px;">个人信息修改</span></a>-->
				<!--</li></div>-->

					<div class="basicbg" style="border-radius:0;border:0;padding:0;">
						<div class="fl perSonHeadImg" style="padding-top:160px;">
							<div class="usercompletetxt"><span>个人信息完成度 </span>${usercomplete}%</div>
							<div class="usercompletemap">
								<span style="width:${usercomplete}%"></span>
							</div>
							<s:if test="person.approve!='10001'">
								<div class="appaBox">
									<a href="/usercenter/usercenter.html?person.t=x" id="appa">申请成为融资导师</a>
									<div class="answer">
										<img src='<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/icon/answer_sj.png'/>
										<!--融资导师审核通过后，可以将您的信息展现在盈创动力APP端的"投资圈"，您可以点评股权项目以及参与融资辅导讨论。-->
										融资导师审核通过后，可以将您的信息展现在“盈创动力APP”端的"股权项目"模块，企业可以向您咨询融资问题，以及APP上的股权项目会优先推荐给您。
									</div>
								</div>
							</s:if>

						</div>
						<div class="fr perSonInfo" style="width: 600px;">


						<div class="inputtest">
							<span class="leftname">&nbsp;帐 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</span> <span
								class="rightinfo"><s:property value="e.userid" /></span>
						</div>
						<div class="inputtest">
							<span class="leftname">&nbsp;类 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</span> <span
								class="rightinfo"> <s:property value="e.usertype" />
							</span>
						</div>
						<div class="inputtest inputtest2">
							<span class="leftname" style="width:92px;">手机号码：</span> <span class="rightinfo">${e.cellphone }&nbsp;
								<a href="javascript:void(0);" onclick="$('.sbhz_mask').fadeIn(300);" style="font-weight:normal;">修改</a>
							</span>
						</div>
						<div class="inputtest">
							<span class="leftname">&nbsp;客户经理：</span> <span class="rightinfo"><s:property
									value="e.custmanage" /></span>
						</div>



			<form id="personappinfo" action="/usercenter/savePersoninfo.html" method="post">
				<input type="hidden" name="person.id" value="<s:property value='person.id'/>"/>
				<input type="hidden" name="person.approve" value="${person.approve }"/>
				<div class="inputtest inputtestl  showImg" style="    position: absolute;left: 20px;border-bottom: 0;width:160px;">

								<span class="rightinfo bcard">
                        		  <input readonly="readonly"  type="hidden" class="input"  id="bcard2" name="person.headimg" value="<s:property value='person.headimg'/>"/>
                   			    </span>
					<div class="imgbox">
						<div id="topic_content">
							 <img src="${person.headimg}">
							<!--<s:if test="person.headimg!=null&&person.headimg!=''"><img src="${person.headimg}"></s:if>-->
						</div>
						<!--<i style="font-style:normal;font-size:12px;color:#bbb;display:none;" id="bigimg">点击图片查看大图</i>-->
					</div>
					<span class="rightinfo bcard" >
                      			  <input type="button" class="input"   id="bcard" name="person.headimg" value="<s:property value='person.headimg'/>" />
                    			</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<span class="star">*</span></span>
					<span class="rightinfo"><input class="input" id="person.username" name="person.username" type="text"  value="<s:property value='person.username'/>" /></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：<span class="star">*</span></span>
					<span class="rightinfo">
						<select class="select" name="person.education" id="person.education">
							<option value=""></option>
							<option value="小学" <%if (("小学").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>小学</option>
							<option value="初中" <%if (("初中").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>初中</option>
							<option value="高中" <%if (("高中").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>高中</option>
							<option value="大学专科" <%if (("大学专科").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>大学专科</option>
							<option value="大学本科" <%if (("大学本科").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>大学本科</option>
							<option value="硕士" <%if (("硕士").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>硕士</option>
							<option value="博士" <%if (("博士").equals(request.getAttribute("person.education"))) { out.print("selected=selected");} %>>博士</option>
						</select>
					</span>
				</div>
				<%-- <div class="inputtest inputtestl">
					<span class="leftname leftnamel">身份证号码：<span class="star">*</span></span>
					<span class="rightinfo"><input class="input" id="orgid" name="person.orgid" type="text"  onblur="discriCard()" value="<s:property value='person.orgid'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<span class="star">*</span></span>
					<span class="rightinfo leftnamesex" style="line-height: 38px;"><input class="input rad" id="sexman" name="person.sex" type="radio" value="男"  <%if ("男".equals(((com.winpow.services.manage.person.bean.Person)request.getAttribute("person")).getSex())) { out.print("checked=checked");} %> />男<input  id="sexwomen" class="input rad" name="person.sex" type="radio" value="女"  <%if ("女".equals(((com.winpow.services.manage.person.bean.Person)request.getAttribute("person")).getSex())) { out.print("checked=checked");} %>/>女</span>
				</div>--%>
				<!-- <div style="clear:both;" ></div> -->
				<%-- <div class="inputtest inputtestl">
					<span class="leftname leftnamel">出生日期：<span class="star">*</span></span>
					<span class="rightinfo"><input class="input laydate-icon birthday"  name="person.birthday" id="person.birthday" type="text" value="<s:property value='person.birthday.substring(0,10)'/>"/></span>
				</div> --%>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">用户类型：<span class="star">*</span></span>
					<span class="rightinfo leftnamesex" style="line-height: 38px;">
						<s:select cssClass="select" list="%{#application.dic.persontype.childs}" listKey="id" headerKey="" headerValue="" listValue="name" name="person.persontype"/>							
					</span>
				</div>
				
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<span class="star">*</span></span>
					<span class="rightinfo">
						<input class="input" name="email" id="email" type="text"  value="${e.email }"/>
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系地址：<span class="star">*</span></span>
					<span class="rightinfo">
						<input class="input" name="person.address" type="text"  value="<s:property value='person.address'/>"/>
					</span>
				</div>
				<div style="clear:both;" ></div>
				<!-- <div class="inputtest inputtestl" id="applypro" style="color:blue;cursor:pointer;" onclick="$('#prodiv').show();$('#prodiv input,#prodiv textarea').attr('disabled', false);">申请成为融资导师</div> -->
				<div style="clear:both;" ></div>
				<div id="prodiv">
					<div style="clear:both;" ></div>



					<div style="clear:both;" ></div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">所在机构：<span class="star">*</span></span>
						<span class="rightinfo">
							<input class="input" name="person.org" type="text"  value="${person.org }" placeholder="当前您的工作单位"/>
						</span>
					</div>
					<div class="inputtest inputtestl" id="example">
						<span class="leftname leftnamel"></span>
						<span class="rightinfo">
							<a href="javascript:void(0);" class="btn" style="color:#666;">查看示例
						
							</a>
							
						<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/userexample.jpg" />
							
						</span>
						
					</div>
					<div style="clear:both;" ></div>
					<div class="inputtest inputtestl" style="width:100%;">
						<span class="leftname " style="white-space: nowrap;width: 108px;">标签 <span style="font-size: 12px;">(空格分隔)</span>：<span class="star">*</span></span>
						<span class="rightinfo" style="float:left; width:473px;" >
							<input class="input" name="person.label" type="text"  value="${person.label }" style="width:473px;"/>
						</span>
					</div>
					<div style="clear:both;" ></div>
					<div class="inputtest inputtestl" style="width: 100%">
						<span class="leftname leftnamel">&nbsp;行&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<span class="star">*</span></span>
						<span class="rightinfo tstextarea" style="width: 490px;">
							<input type="text" class="input" name="person.profession" value="${person.profession }" style="width: 490px;"/>
						</span>
					</div>
					<div style="clear:both;" ></div>
					<div class="inputtest inputtestl" style="width: 100%">
						<span class="leftname leftnamel">个人简介：<span class="star">*</span></span>
						<span class="rightinfo tstextarea" style="width: 490px;">
							<textarea class="input" name="person.introduce" style="min-height: 100px;width: 490px;">${person.introduce }</textarea>
						</span>
					</div>
					<div style="clear:both;" ></div>
					<div class="inputtest inputtestl" style="width:100%">
						<span class="leftname leftnamel">详细介绍：<span class="star">*</span></span>
						<span class="rightinfo tstextarea" style="width:81.4%;;margin-left: 99px;margin-top: -38px;">
							<s:textarea name="person.investment" style="width:100%;height:400px;visibility:hidden;"></s:textarea>
						</span>
					</div>
					<div style="clear:both;" ></div>
					
				
				</div>
				
				
				<%-- <div class="gszcddiv gszcddiv3 ">
					<span class="leftname leftnamel leftnamelt">所在省份：<span class="star">*</span></span> 
					<span class="rightinfo" id="gszcdspan">
						<span><select class="ssx" id="gszcd_province" name="person.person_province"><s:property value="person.person_province"/></select></span>  
					    <span><select class="ssx" id="gszcd_city" name="person.person_city" ><s:property value="person.person_city"/></select>  </span>
					    <span><select class="ssx" id="gszcd_county" name="person.person_county"><s:property value="person.person_county"/></select></span>
					</span>
					<input type="hidden" id="province" value='<s:property value="person.person_province"/>'/>
					<input type="hidden" id="city" value='<s:property value="person.person_city"/>'/>
					<input type="hidden" id="county" value='<s:property value="person.person_county"/>'/>
					<input type="hidden" id="custtype" value='productczdfirst'/>
					<script type="text/javascript">var custtype = 'productczdfirst';</script>
					<script src="../resource/js/area.js"></script>
					<script type="text/javascript">_init_area();</script>
				</div>
				
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">毕业院校：<span class="star">*</span></span>
					<span class="rightinfo"><input class="input" name="person.graduate" type="text"  value="<s:property value='person.graduate'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">&nbsp;专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<span class="star">*</span></span>
					<span class="rightinfo"><input class="input" name="person.subject" type="text"  value="<s:property value='person.subject'/>"/></span>
				</div> --%>
				<div>
					<a href="/usercenter/usercenter.html?person.t=u" class="update">修改</a>
				</div>

				<div class="revise" id="zqxxxgbtn" style="text-align: left;margin-top:60px;margin-bottom:75px;"><input class="shenqingdkt shenqingdkthide" type="submit" value="保存" style="margin-left:134px;"/></div>
			</form>


					<!--<hr/>
						<div class="inputtest inputtest2">
							<span class="leftname"><img src="/icon/base-wait-num.png"
								alt="">&nbsp;债权融资待审：</span> <span class="rightinfo"><s:property
									value="" /> <a href="/usercenter/getProductapplist2.html">${proNum }</a>（个）&nbsp;&nbsp;
								<a href="/usercenter/getProductapplist2.html">查看详情</a> </span>
						</div>
						<div class="inputtest inputtest2">
							<span class="leftname"><img src="/icon/base-wait-num.png"
								alt="">&nbsp;政策申报待审：</span> <span class="rightinfo"><s:property
									value="" /> <a href="/declare_base/selectAllBT.html">${baseNum }</a>（个）&nbsp;&nbsp;
								<a href="/declare_base/selectAllBT.html">查看详情</a></span>
						</div>

						<ul class="base-icons">
							<li><a href="/usercenter/getProductapplist2.html">我要贷款</a></li>
							<li><a
								href="/declare_base/selectAllBT.html?type=allbt&init=y">政策申报
									<img src="/icon/hot-fire.gif"
									style="position: absolute;margin: -20px 0 0 -10px;" />
							</a></li>
							<li><a href="/usercenter/getNewEco.html?t=v">企业入库</a></li>
							<li><a href="/usercenter/getPublishguquanlist.html">股权融资</a></li>
						</ul>-->
					</div>

				</div>
					</div>
			</div>
		</div>
	</div>

<div class="sbhz_mask">
    <div class="sbhz_box">
        <div class="sbhz_all" style="padding-left: 105px;padding-top: 77px;">
        	<div><span>密&#12288;&#12288;码：</span><input class="ceinput" name="password" type="password"/></div>
        	<div><span>新手机号：</span><input class="ceinput" name="phone" type="text"/><input value="获取验证码" id="sendcode" type="button" onclick="getcode();"/></div>
        	<div><span>验&nbsp;&nbsp;证&nbsp;码&nbsp;：</span><input class="ceinput" name="code" type="text" value="" /></div>
            <!-- <div><input class="yes_change" type="button" onclick="modify()" value="确认"/></div> -->
        </div>
		<p style="text-align:center;">
		    <span><input class="sbhz_tj" type="button" onclick="modify()" value="确认"/></span>
			<span onclick="$('.sbhz_mask').hide();" class="sbhz_tj">取消</span>
		</p>
    </div>
</div>

<div id="imglayer_bg"></div>
<div id="imglayer_border">
	<a href="javascript:;" id="imglayer_x" hidefocus="true"></a>
	<img id="imglayer_zoom" src="">
</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("basicinfo");
 	$('#example a').hover(function(){$('#example img').toggleClass('showsl')})
 	function modify() {
 		var password = $.trim($("input[name='password']").val());
 		var phone = $.trim($("input[name='phone']").val());
 		var code = $.trim($("input[name='code']").val());
 		var message = ""; 
 		if (password == "") {
 			message += "请输入密码！\n";
 		}
 		if (!checkphone(phone)) {
 			message += "手机号不正确！\n";
 		}
 		if (code == "") {
 			message += "请输入验证码！\n";
 		}
 		if (message != "") {
	 		alert(message);
	 		return;
 		}
 		$.ajax({
 			type : "POST",
 			dataType : "text",
 			url : '/user/mpdifycellphone.html',
 			data : {
 				"password" : password,
 				"phone" : phone,
 				"code" : code
 			},
 			success : function(msg) {
				alert(msg);
				if (msg == "手机号修改成功！") {
					location.reload();				
				}
 			}
 		});
 	}
 
 	var InterValObj; //timer变量，控制时间
 	var count = 60; //间隔函数，1秒执行
 	var curCount; //当前剩余秒数
 	function getcode() {
 		var cellphone = $("input[name='phone']").val();
 		if (!checkphone(cellphone)) {
 			alert("手机号不正确，请重新输入！")
 			return;
 		}
 		curCount = count;
 		$("#sendcode").attr("disabled", "true");
 		$("#sendcode").val(curCount + "秒后重新发送");
 		InterValObj = window.setInterval(SetRemainTime, 1000);
 
 		$.ajax({
 			type : "POST",
 			dataType : "text",
 			url : '/user/sendMsgCode3.html',
 			data : "e.cellphone=" + cellphone,
 			error : function(XMLHttpRequest, textStatus, errorThrown) {},
 			success : function(msg) {
 				if (msg == '0') {
 					//发送成功
 				} else {
 					alert(msg);
 					window.clearInterval(InterValObj); //停止计时器
		 			$("#sendcode").removeAttr("disabled"); //启用按钮
		 			$("#sendcode").val("重新发送验证码");
 				}
 			}
 		});
 	}
 
 	//timer处理函数
 	function SetRemainTime() {
 		if (curCount == 0) {
 			window.clearInterval(InterValObj); //停止计时器
 			$("#sendcode").removeAttr("disabled"); //启用按钮
 			$("#sendcode").val("重新发送验证码");
 		} else {
 			curCount--;
 			$("#sendcode").val(curCount + "秒后可重新发送验证码");
 		}
 	}
 	
 	function checkphone(phone) {
 		var mobile = /^((0\d{2,3}-\d{7,8})|(1[34578]\d{9}))$/;
 		if (phone.length == 11 && mobile.test(phone)) {
 			return true;
 		} else {
 			return false;
 		}
 	}
 </script>
 
 <script type="text/javascript">
     if($('#topic_content>img').attr('src')){
         $('#topic_content').css('background','none');
     }else{
    	 $('#topic_content>img').css('display','none');
     }

 function checkmingcheng(){
 	
 
 
 }
 
 
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#person.birthday'});//绑定元素
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
 
 <!-- 在线申报系统关闭提示 -->
<!--
<div id="shenbao"><%out.print(SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO));%></div>
<script>
var change=$.trim($('#shenbao').text());

if(change==1){
	layer.alert('《成都高新区关于加快国际科技金融创新中心建设的若干政策》在线申报功能将于今天（2017年11月17日）下午18:00关闭，【未提交】和【驳回】状态的数据请及时提交，系统关闭后将不能新增、修改、提交数据。', {icon: 7, title : '提示'});
}
</script>-->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="person.investment"]', {
			allowFileManager : true
		});
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=isEmpty]').click(function(e) {
			alert(editor.isEmpty());
		});
		K('input[name=getText]').click(function(e) {
			alert(editor.text());
		});
		K('input[name=selectedHtml]').click(function(e) {
			alert(editor.selectedHtml());
		});
		K('input[name=setHtml]').click(function(e) {
			editor.html('<h3>Hello KindEditor</h3>');
		});
		K('input[name=setText]').click(function(e) {
			editor.text('<h3>Hello KindEditor</h3>');
		});
		K('input[name=insertHtml]').click(function(e) {
			editor.insertHtml('<strong>插入HTML</strong>');
		});
		K('input[name=appendHtml]').click(function(e) {
			editor.appendHtml('<strong>添加HTML</strong>');
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
	if ($("#showimga").attr("href") == "") {
		$("#showimga").hide();
	}
	if ('${person.t}' != 'x') {
		if ('${person.approve}' != "10001" && '${person.investment}' == "") {
			$('#prodiv').hide();
			$("#prodiv input,#prodiv textarea").attr("disabled", true);
		} else {
			//$("#applypro").hide();
		}
	}
</script>
</body>
</html>