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
<head>
    <title>盈创动力</title> 
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/qiyeappinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>

	<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />

<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

<script>
	 	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : false
				});


				K('#filemanager').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#logo').val(),
							clickFn : function(url, title) {
								console.log(url,title)
								K('#logo').val(url);
								editor.hideDialog();
							}
						});
					});
				});





				//项目图片：
		K('#logo').click(function() {
			if(t=='v'){
				return;
			}
			var val = $(this).attr("id");
			//重新获取窗口宽高
			var inHeight = window.innerHeight;
			var inWidth = window.innerWidth;
			var outHeight = window.outerHeight;
			var outWidth = window.outerWidth;

			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					insertfile : K('#logo').val(),
					clickFn : function(url, title) {
						K('#logo').val(url);
						editor.hideDialog();
						<%--removError(val)--%>
					}
				});
				//重新定位上传图片弹出框在浏览器窗口中居中
				var dlgH = $(".ke-dialog-default").height();
				var dlgW = $(".ke-dialog-default").width();
				//以下公式是计算出浏览器的居中位置
				var nTop = (inHeight - dlgH) / 2;
				var nLeft = (inWidth - dlgW) / 2;
				$('.ke-dialog-default').css({"top":nTop,"left":nLeft});
			});
		});


			});
</script>

</head>
<body>
<!--公共提示框-->
<!--
	<div class="ggts"></div> -->
	<div id="ggts2"></div>





<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
<input type="hidden" id="t" value="<s:property value="qiye.t"/>">
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
	        // $("#ggts2").show();
	    ggts2(backnotice);
	}

	var t = $("#t").val();//v 查看   u 修改  a 新增
	//alert(t);
	if(t=='v'){
		//表示查询
		$("#qiyeappinfo input,radio,select,textarea,checkbox").attr('disabled',true);
		$(".shenqingdkt").attr("disabled",false);
		$(".shenqingdkthide").hide();
		//$("#zqxxxgbtn").hide();
		$("#qiyeappinfo input,radio,textarea,checkbox").each(function(){
				$(this).parent("span").html($(this).val());
		});
		$("#qiyeappinfo select").each(function(){
			var text = $(this).find("option:selected").text();
			$(this).parent("span").html(text == "请选择" ? "" : text);
		});
	}
	else if(t=='a'){
		//表示新增（在返回没有数据的情况可以新增）
		$(".shenqingdkt").hide();
		$(".shenqingdkthide").show();
		$(".shenqingdkthide").val("确认提交");
		qiyeappinfo();
	}else if(t=='u'){
		$("#qiyeappinfo").attr("action","/usercenter/updateQiyeinfo.html");
		//表示修改
		qiyeappinfo();
	} else if(t=='o'){ //只读
		$("#qiyeappinfo input,radio,select,textarea,checkbox").not(".qiyeExcept").attr('disabled',true);
		$(".qiyeSave").remove();
		$(".finamsg").show();
	}

	$(".upbacktoguquan").click(function(){
		location.href = "/usercenter/getPublishguquanlist.html";
	});
	$(".upbacktozhaiquan").click(function(){
		location.href = "/usercenter/getProductapplist2.html";
	});
	$(".upbacktozhengce").click(function(){
		location.href = "/declare_base/toFrontBase.html?t=v";
	});



});
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
	height:20px;
	line-height:20px;
    }
    .finamsg{color: red;display: none;line-height: 20px;font-weight: bold;}
</style>
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

			<!-- 债权信息修改    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
					<form id="qiyeappinfo" action="/usercenter/saveQiyeinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">企业信息</span>
						<a href="/usercenter/getQiyeinfo.html?qiye.t=u" class="qiyeSave">
							<span id="CreateTBpxhd" class="update">企业信息修改</span>
						</a>
					</li>
				</div>
				<div id="finareadonly" class="finamsg">
					<br/>你好，当前登录用户未成功关联主账号，暂不能查看修改企业信息。
				</div>
				<br/>


				<input type="hidden" name="qiye.pk_qiyeid" value="<s:property value='qiye.pk_qiyeid'/>"/>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">统一社会信用代码：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input onblur="qiyeCheckCreditId(this);" style="width: 492px;" class="input inputrow" name="qiye.zzjgdm" type="text"  value="<s:property value='qiye.zzjgdm'/>"/></span>
				</div>

				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业名称：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="qiye.qiyemingcheng" name="qiye.qiyemingcheng" type="text"  value="<s:property value='qiye.qiyemingcheng'/>" /></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">成立日期：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input stext laydate-icon"  id="qiye.chengliriqi"  name="qiye.chengliriqi" type="text"  value="<s:property value='qiye.chengliriqi'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">办公(经营)地址：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="qiye.dizhi" type="text" value="<s:property value='qiye.dizhi'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">法人代表姓名：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="qiye.faren" type="text" value="<s:property value='qiye.faren'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">注册资本(万元)：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="qiye.zhuceziben" type="text" value="<s:property value='qiye.zhuceziben'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">注册资金币种：<span style="color:red">*</span></span>
					<span class="rightinfo"><s:select  list="%{#application.dic.aadf63ab73e949859574f6ed6bf34b4d.childs}" listKey="id"
													  listValue="name" name="qiye.zczjbz"
													  headerKey="" headerValue="" cssClass="select iselect"/></span>
				</div>
				<div class="gszcddiv">
					<span class="leftname leftnamel">工商注册地：<span style="color:red">*</span></span>
					<span class="rightinfo" id="gszcdspan">
						<span><select class="ssx" id="gszcd_province" name="qiye.gszcd_province"><s:property value="qiye.gszcd_province"/></select></span>
					    <span><select class="ssx" id="gszcd_city" name="qiye.gszcd_city" ><s:property value="qiye.gszcd_city"/></select></span>
					    <span><select class="ssx" id="gszcd_county" name="qiye.gszcd_county"><s:property value="qiye.gszcd_county"/></select></span>
					</span>

					<input type="hidden" id="province" value='<s:property value="qiye.gszcd_province"/>'/>
					<input type="hidden" id="city" value='<s:property value="qiye.gszcd_city"/>'/>
					<input type="hidden" id="county" value='<s:property value="qiye.gszcd_county"/>'/>
					<input type="hidden" id="custtype" value='productczdfirst'/>

					<script type="text/javascript">var custtype = 'productczdfirst';</script>
					<script src="../resource/js/area.js"></script>
					<script type="text/javascript">
					//var custtype = '<s:property value="userType"/>';
					_init_area();


					</script>

				</div>

				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业性质：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select class="select" name="qiye.qiyexingzhiid" id="qiye.qiyexingzhiid">
							<option value=""></option>
						<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>国有</option>
						<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>民营</option>
						<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>外资</option>
						<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>其他</option>
						</select>
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">所属行业：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select class="select" name="qiye.hangyeid" id="qiye.hangyeid">
							<option value=""></option>
							    <option value="07c03490e7684357a5987df50f37bd8b" <%if (("07c03490e7684357a5987df50f37bd8b").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>物流行业</option>
								<option value="137793478df9420984f81f2779b00bbb" <%if (("137793478df9420984f81f2779b00bbb").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>ＩＴ行业</option>
								<option value="16ea7663dd1143e6b1e923ee39af6238" <%if (("16ea7663dd1143e6b1e923ee39af6238").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>汽车行业</option>
								<option value="4f603cfd18e44ada8d7d3f0bcdeaaebb" <%if (("4f603cfd18e44ada8d7d3f0bcdeaaebb").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>旅游行业</option>
								<option value="520d8eac872e453a81049b4f12a15934" <%if (("520d8eac872e453a81049b4f12a15934").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>能源行业</option>
								<option value="583678e290a548abb4cd1ccda8448cc3" <%if (("583678e290a548abb4cd1ccda8448cc3").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>制造行业</option>
								<option value="5b366288961a47bdb3a0aedcf0f9f8fa" <%if (("5b366288961a47bdb3a0aedcf0f9f8fa").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>医疗健康</option>
								<option value="5c95443347794b2e8e39c94fea453cb1" <%if (("5c95443347794b2e8e39c94fea453cb1").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>化学工业</option>
								<option value="621a385c93f94580831814bbad4ec5e6" <%if (("621a385c93f94580831814bbad4ec5e6").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>研究咨询</option>
								<option value="66287346fd924ab08bd447f2ab99443a" <%if (("66287346fd924ab08bd447f2ab99443a").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>教育行业</option>
								<option value="67b1f13ab5d54f929b5e610076e02a58" <%if (("67b1f13ab5d54f929b5e610076e02a58").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>传媒娱乐</option>
								<option value="73317fb74630465d88056f84d0b1e785" <%if (("73317fb74630465d88056f84d0b1e785").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>农林牧渔</option>
								<option value="7a74a5afc1f94ffea16b6c54acea5b31" <%if (("7a74a5afc1f94ffea16b6c54acea5b31").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>房地产业</option>
								<option value="7b65958a27db481ba25157c31870258b" <%if (("7b65958a27db481ba25157c31870258b").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>电信及增值</option>
								<option value="8e3d1c95e9ba449dbecfe8434f9a20cc" <%if (("8e3d1c95e9ba449dbecfe8434f9a20cc").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>互联网络</option>
								<option value="8ff85aabe0c349edbb3d7da17fc14203" <%if (("8ff85aabe0c349edbb3d7da17fc14203").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>食品饮料</option>
								<option value="cd1f63f3d3de431e96814f6a8efeb5a4" <%if (("cd1f63f3d3de431e96814f6a8efeb5a4").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>家居建材</option>
								<option value="db191b4f4ed146e89db90655650efdf8" <%if (("db191b4f4ed146e89db90655650efdf8").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>金融行业</option>
								<option value="eb2b59709bd646da8e2566afd34a09d6" <%if (("eb2b59709bd646da8e2566afd34a09d6").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>投资行业</option>
								<option value="f9c910cd1cad4fe9ba9c04c9766a9de2" <%if (("f9c910cd1cad4fe9ba9c04c9766a9de2").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>连锁经营</option>
								<option value="4bf0ee4adaa04c73940ae4f9b940b008" <%if (("4bf0ee4adaa04c73940ae4f9b940b008").equals(request.getAttribute("qiye.hangyeid"))) { out.print("selected=selected");} %>>其他行业</option>

						</select>
					</span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">所处阶段：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select class="select" name="qiye.suchujieduanid" id="qiye.suchujieduanid">
							<option value=""></option>
							<option value="19c5f970887f46d68d0a8485369eb3f7" <%if (("19c5f970887f46d68d0a8485369eb3f7").equals(request.getAttribute("qiye.suchujieduanid"))) { out.print("selected=selected");} %>>扩张期</option>
							<option value="5e925266bed846f8a62767ee55b724a7" <%if (("5e925266bed846f8a62767ee55b724a7").equals(request.getAttribute("qiye.suchujieduanid"))) { out.print("selected=selected");} %>>初创期</option>
							<option value="643f7f5a409a472bbd70076234fd6b35" <%if (("643f7f5a409a472bbd70076234fd6b35").equals(request.getAttribute("qiye.suchujieduanid"))) { out.print("selected=selected");} %>>其他</option>
							<option value="95d09bbacb7641c9a6a7522ef0d6030c" <%if (("95d09bbacb7641c9a6a7522ef0d6030c").equals(request.getAttribute("qiye.suchujieduanid"))) { out.print("selected=selected");} %>>成熟期</option>
							<option value="add7b7b24eab4c69b65e2959b705fecb" <%if (("add7b7b24eab4c69b65e2959b705fecb").equals(request.getAttribute("qiye.suchujieduanid"))) { out.print("selected=selected");} %>>成长期</option>
							<option value="b24e48c757bc433998bceb88cc9628ac" <%if (("b24e48c757bc433998bceb88cc9628ac").equals(request.getAttribute("qiye.suchujieduanid"))) { out.print("selected=selected");} %>>上市筹备期</option>
						</select>
					</span>
				</div>
								<div class="inputtest inputtestl">
					<span class="leftname leftnamel">主营业务：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="qiye.zhuyingyewu"  value="<s:property value='qiye.zhuyingyewu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">经营范围：<span style="color:red">*</span></span>
					<span class="rightinfo"><textarea class="input" name="qiye.jingyingfanwei" type="text"> <s:property value='qiye.jingyingfanwei'/></textarea></span>
				</div>

				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业基本介绍：<span style="color:red">*</span></span>
					<span class="rightinfo"><textarea type="text" class="input" name="qiye.qiyejieshao"> <s:property value='qiye.qiyejieshao'/></textarea></span>
				</div>

				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">兼营业务：</span>
					<span class="rightinfo"><input type="text" class="input" name="qiye.jianyingyewu"  value="<s:property value='qiye.jianyingyewu'/>"/></span>
				</div>

				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">企业认证：</span>
					<span class="rightinfo"><input class="input" name="qiye.qiyerenzheng" type="text" value="<s:property value='qiye.qiyerenzheng'/>"/></span>
				</div>

			<div class="inputtest inputtestl">
					<span class="leftname leftnamel">员工数：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="qiye.yuangongshu" type="text"  value="<s:property value='qiye.yuangongshu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel" style="width: 147px;margin-right: 20px;">大专以上技术人员数：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="qiye.dazhuanrenshu" type="text"  value="<s:property value='qiye.dazhuanrenshu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">从事研发人数：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="qiye.yanfarenshu" type="text"  value="<s:property value='qiye.yanfarenshu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel"  style="width: 169px;margin-right: 0px;">本科以上占管理比例(%)：</span>
					<span class="rightinfo" style="width: 222px;"><input style="width: 198px;" class="input" name="qiye.bkzglbl" type="text" value="<s:property value='qiye.bkzglbl'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">是否有上市计划：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select class="select" name="qiye.shangshijihua">
							<option value="">--请选择--</option>
							<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004").equals(request.getAttribute("qiye.shangshijihua"))) { out.print("selected=selected");} %>>是</option>
							<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005").equals(request.getAttribute("qiye.shangshijihua"))) { out.print("selected=selected");} %>>否</option>
						</select>
					</span>
				</div>
				<div class="inputtest inputtestl showImg">
				<!--
					<span class="leftname leftnamel">企业LOGO：</span>
					<span class="rightinfo"><input class="input" name="qiye.logo" type="text"  value="<s:property value='qiye.logo'/>"/></span>
					 -->
					<span class="leftname leftnamel"><input type="button" name="filemanager"  id="filemanager" value="企业logo" class="btn btn-success"/></span>
					<span class="rightinfo"><input readonly="readonly" type="text" class="input" id="logo" name="qiye.logo" value="<s:property value='qiye.logo'/>"/> </span>
					<div  class="none"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>${qiye.logo}"/></div>
				</div>
				<style>
				.showImg{position:relative; overflow:visible !important;cursor:pointer;}
				.showImg div.none{width:80%;text-align:center;position:absolute;top:38px;left:50%;/*border:1px solid #ddd;*/background: #fff;
					transform:translateX(-50%);-ms-transform:translateX(-50%); 	-moz-transform:translateX(-50%); -webkit-transform:translateX(-50%); -o-transform:translateX(-50%);
					box-shadow: 1px 2px 6px rgba(0,0,0,0.2)
				}
				.showImg .rightinfo{text-overflow: ellipsis;overflow: hidden;}
				</style>
				<script>
					if( $("#t").val()!='u'){
						$('.showImg').hover(function(){
							$(this).find('div.none').toggle();
						})
					}
				</script>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">网址：</span>
					<span class="rightinfo"><input class="input" name="qiye.wangzhi" type="text"  value="<s:property value='qiye.wangzhi'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系人姓名：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" name="qiye.xingming" type="text"  value="<s:property value='qiye.xingming'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">职务：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="qiye.bumenzhiwu"  value="<s:property value='qiye.bumenzhiwu'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">移动电话：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="qiye.yidongdianhua"  value="<s:property value='qiye.yidongdianhua'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">固定电话：</span>
					<span class="rightinfo"><input type="text" class="input" placeholder="028-88888888" name="qiye.gudingdianhua"  value="<s:property value='qiye.gudingdianhua'/>"/></span>
				</div>
				<div class="inputtest inputtestl">
					<span class="leftname leftnamel">联系人Email：<span style="color:red">*</span></span>
					<span class="rightinfo"><input type="text" class="input" name="qiye.email"  value="<s:property value='qiye.email'/>"/></span>
				</div>

				<div class="revise" id="zqxxxgbtn" >
					<input class="shenqingdkt upbacktoguquan qiyeExcept" type="button" style="background-color:#00f;" value="发布股权融资"/>&nbsp;&nbsp;
					<input class="shenqingdkt upbacktozhaiquan qiyeExcept" type="button" style="background-color:#f00;" value="发布债权融资"/>&nbsp;&nbsp;
					<input class="shenqingdkt upbacktozhengce qiyeExcept" type="button" style="width: auto;background-color:#0f0;" value="&nbsp;&nbsp;填写基本情况表（政策申报）"/>&nbsp;&nbsp;
					<input class="shenqingdkt shenqingdkthide qiyeSave" type="submit" value="保存"/>
				</div>
			</form>
				</div>

		</div>

		</div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("qiyeinfo");
 </script>

<script type="text/javascript">
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#qiye.chengliriqi'});//绑定元素
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
	$(function() {
		var zczjbz = $('#qiye_zczjbz').val();

		if (zczjbz == '') {
			$('#qiye_zczjbz').val('e66405d84c9d4f03b1f87624938174e3');
		}
	})

	function qiyeCheckCreditId(obj) {
		if ($(obj).val() == "") {
    		return;
    	}
		$.ajax({
			type: 'post',
			url: "/usercenter/checkCreditId.html",
			dataType: "json",
			data: {
				"id": $(obj).val()
			},
			success: function(data) {
				if (data.relaSelf == 1) {
					var msg = data.name + "已经注册，点击确认按钮自动关联到该公司";
					if (confirm(msg)) {
						$("#qiyeappinfo input,radio,select,textarea,checkbox").attr('disabled', true);
						$(".shenqingdkthide,#zqxxxgbtn").hide();
						qiyeRelation(data);
					}
				} else if (data.relaSelf == 2) {
					var msg = data.name + "的子账号数已经到达上限，不能再增加子账号。";
					alert(msg);
				} else if (data.id != "") {
					var msg = data.name + "已经注册，点击确认按钮系统将发送请求到主用户（电话号码" + data.phone + "），待主用户审核,审核通过后即可自动关联";
					if (confirm(msg)) {
						$("#qiyeappinfo input,radio,select,textarea,checkbox").attr('disabled', true);
						$(".shenqingdkthide,#zqxxxgbtn").hide();
						qiyeRelation(data);
					}
				}
			}
		});
	}
	function qiyeRelation(data) {
		$.ajax({
			type: 'post',
			url: "/usercenter/relation.html",
			dataType: "json",
			data: {
				"id"    : data.id,
				"relaId": data.relaId,
				"name"	: data.name,
				"relaSelf"	: data.relaSelf
			},
			success: function(data) {
				alert(data.msg)
				window.location.reload();				
			}
		});
	}
	if ('${qiye.pk_qiyeid}' == "") {
		$("select[name='qiye.gszcd_province']").val("四川省").trigger("change");
		$("select[name='qiye.gszcd_city']").val("成都市").trigger("change");
		$("select[name='qiye.gszcd_county']").val("高新区").trigger("change");
	}
</script>

</body>
</html>
 