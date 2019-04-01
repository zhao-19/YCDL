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
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css" />
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" />
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css" />
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/drag/dragImg.js"></script>
</head>
<body>
<!--公共提示框-->
<!--<div class="ggts"></div> -->
<div id="ggts2"></div>
<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
<input type="hidden" id="t" value="<s:property value="qiye.t"/>">
<style>
.error {border: none;background:none;}
label.error {  border: 1px solid #f5694b!important;  background:none;  color: #f5694b;  padding: 0 2px;  display:inline-block;  height:20px;  line-height:20px;  }
.finamsg{color: red;display: none;line-height: 20px;font-weight: bold;}
</style>
<!-- 网站头部 -->
<%@ include file="../header.jsp"%>
<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl"><%@ include file="leftnav.jsp"%></div>
	<div class="list fr">
		<div class="rightbox">
			<!-- 债权信息修改    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			<form id="form1" action="/usercenter/saveQiyeinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">企业信息</span>
						<a href="/usercenter/getQiyeinfo.html?qiye.t=u" class="qiyeSave1">
							<span id="CreateTBpxhd" class="update">企业信息修改</span>
						</a>
					</li>
				</div>
				<div id="finareadonly" class="finamsg">
					<br/>你好，当前登录用户暂不能修改企业信息。
				</div>
				<br/>
				<input type="hidden" name="qiye.pk_qiyeid" value="<s:property value='qiye.pk_qiyeid'/>"/>
				<input type="hidden" name="qiye.iscomplete" id="iscomplete"/>
				<div class="inputtest inputtestl row">
					<span class="leftname leftnamel">企业名称：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 599px;"><input onblur="qiyeCheckCreditId();" isNotNull="" isZcNotNull="企业名称" isLength="[0,128]" auto-complete auto-complete-data="autoCompleteData" id="qiyename" class="input"  name="qiye.qiyemingcheng" type="text" style="width: 599px;" value="<s:property value='qiye.qiyemingcheng'/>" /></span>
				</div>
				<div class="inputtest inputtestl row">
					<span class="leftname leftnamel">统一社会信用代码：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 599px;"><input onblur="qiyeCheckCreditId();" isNotNull="" isZcNotNull="统一社会信用代码"   isZuzhi="统一社会信用代码"  isLength="[0,18]" id="zzjgdm" class="input inputrow" name="qiye.zzjgdm" type="text" style="width: 599px;" value="<s:property value='qiye.zzjgdm'/>"/></span>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">成立日期：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull=""  isLength="[0,10]" class="input stext laydate-icon"  id="qiye.chengliriqi"  name="qiye.chengliriqi" type="text"  value="<s:property value='qiye.chengliriqi'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">办公(经营)地址：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull=""  isLength="[0,64]" class="input" name="qiye.dizhi" type="text" value="<s:property value='qiye.dizhi'/>"/></span>
					</div>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">法人代表姓名：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull="" isLength="[0,64]" class="input" name="qiye.faren" type="text" value="<s:property value='qiye.faren'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">注册资本(万元)：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull="" isLength="[0,18]"  isBankZZint="isBankZZint"  onchange="this.value=formatNum(this.value)" class="input" name="qiye.zhuceziben" type="text" value="<s:property value='qiye.zhuceziben'/>"/></span>
					</div>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">注册资金币种：<span style="color:red">*</span></span>
						<span class="rightinfo"><s:select isNotNull=""  list="%{#application.dic.aadf63ab73e949859574f6ed6bf34b4d.childs}" listKey="id"
														  listValue="name" name="qiye.zczjbz"
														  headerKey="" headerValue="" cssClass="select iselect"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">企业性质：<span style="color:red">*</span></span>
						<span class="rightinfo">
							<select isNotNull=""  class="select" name="qiye.qiyexingzhiid" id="qiye.qiyexingzhiid">
								<option value=""></option>
							<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa120").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>国有</option>
								<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa121").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>民营</option>
								<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa122").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>外资</option>
								<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa123").equals(request.getAttribute("qiye.qiyexingzhiid"))) { out.print("selected=selected");} %>>其他</option>
							</select>
						</span>
					</div>
				</div>
					<div class="gszcddiv">
						<span class="leftname leftnamel">工商注册地：<span style="color:red">*</span></span>
						<span class="rightinfo" id="gszcdspan" style="display: inline-block;margin-right:6px; width:152px;">
							 <select isNotNull="省份" class="ssx" id="gszcd_province" name="qiye.gszcd_province" style="width:100%;"><s:property value="qiye.gszcd_province"/></select>
						 </span>
						<span class="rightinfo" id="gszcdspan" style=" display: inline-block;margin-right:6px; width:152px;">
							 <select isNotNull="市级" class="ssx" id="gszcd_city" name="qiye.gszcd_city"  style="width:100%;"><s:property value="qiye.gszcd_city"/></select>
						 </span>
						<span class="rightinfo" id="gszcdspan" style="display: inline-block;margin-right:6px;width:152px;">
							 <select isNotNull="区县" class="ssx" id="gszcd_county" name="qiye.gszcd_county"  style=" width:100%;"><s:property value="qiye.gszcd_county"/></select>
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
				<div class="row">

					<div class="inputtest inputtestl">
					<span class="leftname leftnamel">所属行业：<span style="color:red">*</span></span>
					<span class="rightinfo">
						<select  isNotNull="" class="select" name="qiye.hangyeid" id="qiye.hangyeid">
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
							<select  isNotNull="" class="select" name="qiye.suchujieduanid" id="qiye.suchujieduanid">
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
				</div>
				<!--<div class="inputtest inputtestl">-->
					<!--<span class="leftname leftnamel">主营业务：<span style="color:red">*</span></span>-->
					<!--<span class="rightinfo"><input isNotNull="" type="text" class="input" name="qiye.zhuyingyewu"  value="<s:property value='qiye.zhuyingyewu'/>"/></span>-->
				<!--</div>-->
				<!--<div class="inputtest inputtestl" style="width: 100%;">-->
					<!--<span class="leftname leftnamel">经营范围：<span style="color:red">*</span></span>-->
					<!--<span class="rightinfo tstextarea" style="width: 625px;"><textarea isNotNull="经营范围" class="input" name="qiye.jingyingfanwei" style="width: 600px;height: 60px;"> <s:property value='qiye.jingyingfanwei'/></textarea></span>-->
				<!--</div>-->
				<!--<div class="inputtest inputtestl" style="width: 100%;">-->
					<!--<span class="leftname leftnamel">企业基本介绍：<span style="color:red">*</span></span>-->
					<!--<span class="rightinfo" style="width: 625px;"><textarea isNotNull="企业基本介绍" class="input" name="qiye.qiyejieshao" style="width: 600px;height: 60px;"> <s:property value='qiye.qiyejieshao'/></textarea></span>-->
				<!--</div>-->

				<div class="inputtest inputtestl inputtestlrow">
                         <span class="leftname leftnamel" style="width: 139px;">主营业务：<span style="color:red">*</span></span>
					<span class="rightinfo tstextarea" style="width: 599px;"><textarea class="input" isNotNull="" isLength="[0,512]" style="width: 599px;min-height:60px;display: block;margin-bottom: 2px;" name="qiye.zhuyingyewu"><s:property value='qiye.zhuyingyewu'/></textarea></span>
				</div>

				<div class="inputtest inputtestl inputtestlrow">
                         <span class="leftname leftnamel" style="width: 139px;">经营范围：<span style="color:red">*</span></span>
					<span class="rightinfo tstextarea" style="width: 599px;"><textarea class="input" isNotNull="" isLength="[0,512]" style="width: 599px;min-height:60px;display: block;margin-bottom: 2px;" name="qiye.jingyingfanwei"><s:property value='qiye.jingyingfanwei'/></textarea></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
                         <span class="leftname leftnamel"style="width: 139px;" >企业基本介绍：<span style="color:red">*</span></span>
					<span class="rightinfo tstextarea" style="width: 599px;"><textarea class="input" isNotNull="" isLength="[0,2048]" style="width: 599px;min-height:60px;display: block;margin-bottom: 2px;" name="qiye.qiyejieshao"><s:property value='qiye.qiyejieshao'/></textarea></span>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">兼营业务：</span>
						<span class="rightinfo"><input type="text" class="input"  isLength="[0,256]" name="qiye.jianyingyewu"  value="<s:property value='qiye.jianyingyewu'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">企业认证：</span>
						<span class="rightinfo"><input class="input"  isLength="[0,64]"  name="qiye.qiyerenzheng" type="text" value="<s:property value='qiye.qiyerenzheng'/>"/></span>
					</div>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel" style="width: 147px;margin-right: 2px;">大专以上技术人员数：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull=""  isZZint="大专以上技术人员数"  class="input" name="qiye.dazhuanrenshu" type="text"  value="<s:property value='qiye.dazhuanrenshu'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">从事研发人数：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull=""  isZZint="从事研发人数"  class="input" name="qiye.yanfarenshu" type="text"  value="<s:property value='qiye.yanfarenshu'/>"/></span>
					</div>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel"  style="width: 173px;margin-right: 0px;text-align: left;">本科以上占管理比例(%)：<span style="color:red">*</span></span>
						<span class="rightinfo" style="width: 215px;"><input isNotNull=""  isZZint="本科以上占管理比例" style="width: 176px;" class="input" name="qiye.bkzglbl" type="text" value="<s:property value='qiye.bkzglbl'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">是否有上市计划：<span style="color:red">*</span></span>
						<span class="rightinfo">
							<select isNotNull=""  class="select" name="qiye.shangshijihua">
								<option value=""></option>
								<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004").equals(request.getAttribute("qiye.shangshijihua"))) { out.print("selected=selected");} %>>是</option>
								<option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005").equals(request.getAttribute("qiye.shangshijihua"))) { out.print("selected=selected");} %>>否</option>
							</select>
						</span>
					</div>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">网址：</span>
						<span class="rightinfo"><input class="input" name="qiye.wangzhi"  isLength="[0,32]" type="text"  value="<s:property value='qiye.wangzhi'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">联系人姓名：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull=""  isLength="[0,16]" class="input" name="qiye.xingming"  type="text"  value="<s:property value='qiye.xingming'/>"/></span>
					</div>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">职务：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull=""   isLength="[0,25]"  type="text" class="input" name="qiye.bumenzhiwu"  value="<s:property value='qiye.bumenzhiwu'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">移动电话：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull="" isPhone="移动电话" isLength="[0,12]"  type="text" class="input" name="qiye.yidongdianhua"  value="<s:property value='qiye.yidongdianhua'/>"/></span>
					</div>
				</div>
				<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">固定电话：</span>
						<span class="rightinfo"><input isLandline="固定电话"  type="text" class="input" placeholder="028-88888888" name="qiye.gudingdianhua"  value="<s:property value='qiye.gudingdianhua'/>"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">联系人Email：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull="" isEmail="联系人Email" isLength="[0,32]"   type="text" class="input" name="qiye.email"  value="<s:property value='qiye.email'/>"/></span>
					</div>
				</div>
				<!--<div class="inputtest inputtestl showImg">-->
				<!--&lt;!&ndash;-->
				<!--<span class="leftname leftnamel">企业LOGO：</span>-->
				<!--<span class="rightinfo"><input class="input" name="qiye.logo" type="text"  value="<s:property value='qiye.logo'/>"/></span>-->
				<!--&ndash;&gt;-->
				<!--<span class="leftname leftnamel"><input type="button" name="filemanager"  id="filemanager" value="企业logo：" class="btn btn-success"/></span>-->
				<!--<span class="rightinfo"><input readonly="readonly" type="text" class="input" id="logo" name="qiye.logo" value="<s:property value='qiye.logo'/>"/> </span>-->
				<!--<div  class="none"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>${qiye.logo}"/></div>-->
				<!--</div>-->

				<script>
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
                                        K('.imgbox>#bigimg').show();
                                        K('#topic_content>img').attr('src', url);
                                        K('#topic_content').css('background','none');
                                        editor.hideDialog();
                                        removError(val);
                                    }
                                });
                            });
                        });
                        K('#yybcard').click(function () {
                            val = $(this).attr("id");
                            editor.loadPlugin('image', function () {
                                editor.plugin.imageDialog({
                                    showRemote : false,
                                    insertfile: K('#yybcard').val(),
                                    clickFn: function (url, title) {
                                        K('#yybcard').val(url);
                                        K('#yybcard2').val(url);
                                        K('.yyimgbox>#yybigimg').show();
                                        K('#yytopic_content>img').attr('src', url);
                                        K('#yytopic_content').css('background','none');
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
				<div class="row">
				<div class="inputtest inputtestl showImg">
                    <span class="leftname leftnamel">营业执照：<span style="color:red">*</span></span>
                    <span class="rightinfo bcard" >
                        <input type="button" class="input" isNotNull=""  id="yybcard" name="qiye.license" value="<s:property value='qiye.license'/>" />
                     </span>
                    <span class="rightinfo bcard">
                          <input readonly="readonly"  type="hidden" class="input"  id="yybcard2" name="qiye.license" value="<s:property value='qiye.license'/>"/>
                     </span>
                    <div class="yyimgbox">
                        <div id="yytopic_content">
                            <img src="${qiye.license}">
							<!--<s:if test="qiye.license!=null&&qiye.license!=''"><img src="${qiye.license}"></s:if>-->
                        </div>
                        <i style="font-style:normal;font-size:12px;color:#bbb;display:none;" id="yybigimg">点击图片查看大图</i>
                    </div>
                </div>

				<div class="inputtest inputtestl showImg">
					<span class="leftname leftnamel">企业logo：</span>
					<span class="rightinfo bcard" >
                        <input type="button" class="input"  id="bcard" name="qiye.logo" value="<s:property value='qiye.logo'/>" />
                     </span>
					<span class="rightinfo bcard">
                          <input readonly="readonly"  type="hidden" class="input"  id="bcard2" name="qiye.logo" value="<s:property value='qiye.logo'/>"/>
                     </span>
					<div class="imgbox">
						<div id="topic_content">
							<img src="${qiye.logo}">
							<!--<s:if test="qiye.logo!=null&&qiye.logo!=''"><img src="${qiye.logo}"></s:if>-->

						</div>
						<i style="font-style:normal;font-size:12px;color:#bbb;display:none;" id="bigimg">点击图片查看大图</i>
					</div>
				</div>
				</div>
				<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/drag/yydragImg.js"></script>




				<style>
					.row{width: 100% !important;float:left;}
					#form1 input,radio,select,textarea,checkbox{border:0;}
					.creditor .vipinfo .inputtest .rightinfo.bcard{display:none;width: 240px;}
					.creditor .vipinfo .inputtest .rightinfo.bcard .error{margin:4px 0 0 6px;}
					/*营业执照按钮*/
					#bcard,#yybcard{float:left;color:transparent;background:#FF5722 url(<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/upload.png) no-repeat 47% 7px;width: 152px; cursor:pointer;padding-left:31px;border-radius:2px;}
					#bcard:hover,#yybcard:hover{opacity: 0.8;}
					.showImg{position:relative; overflow:visible !important;cursor:pointer;}
					.showImg div.none{width:80%;text-align:center;position:absolute;top:38px;left:50%;/*border:1px solid #ddd;*/background: #fff;
						transform:translateX(-50%);-ms-transform:translateX(-50%); 	-moz-transform:translateX(-50%); -webkit-transform:translateX(-50%); -o-transform:translateX(-50%);
						box-shadow: 1px 2px 6px rgba(0,0,0,0.2)
					}
					.showImg .rightinfo{text-overflow: ellipsis;overflow: hidden;}
					/*缩略图*/
					.imgbox,.yyimgbox{width:150px;height:150px;text-align:center;margin:6px 0 0 149px;}
					.imgbox #topic_content,.yyimgbox #yytopic_content{width:100%;height:80%;border:1px solid #ddd;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/sc-default.jpg") no-repeat 0 0;}
					.imgbox #topic_content>img,.yyimgbox #yytopic_content>img{width:100%;height:100%;}
					/*全屏放大图*/
					#imglayer_bg,#yyimglayer_bg {position:fixed;top:0;left:0;width:100%;height:100%;background:#000 url(/image/imglayer_loading.gif) no-repeat center center;;opacity:0.7;filter:alpha(opacity=70);z-index:9995;display:none;}
					#imglayer_border,#yyimglayer_border {max-width:60%;height:100%;position:fixed;top:0;left:0;z-index:9996;margin:20px;display:none;}
					#imglayer_zoom,#yyimglayer_zoom {display:block;border:0;max-height: 100% !important;}
					#imglayer_x,#yyimglayer_x {display:block;position:absolute;width:40px;height:40px;z-index:9997;outline:none;right:-20px;top:-20px;background:url(http://static.epaidai.com/images/bbs/topic/imglayer_ico.png) no-repeat;}
					#imglayer_x:hover,#yyimglayer_x:hover {background-position:0 -40px;}
				</style>
				<p class="jiange">党建信息</p>
				<div class="xkk djbox">
					<div class="row">
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">公司人数：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull="" isZZint="公司人数" class="input" name="qiye.yuangongshu" type="text"  value="${qiye.yuangongshu }"/></span>
					</div>
					<div class="inputtest inputtestl">
						<span class="leftname leftnamel">党员人数：<span style="color:red">*</span></span>
						<span class="rightinfo"><input isNotNull="" isZZint="党员人数" class="input" name="qiye.party_num" type="text"  value="${qiye.party_num }"/></span>
					</div>
					</div>
					<div class="row">
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel">法人代表是否党员：<span style="color:red">*</span></span>
							<span class="rightinfo"><s:select isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="is_party" theme="simple"
									  listValue="name" name="qiye.is_party" label="法人代表是否党员" headerKey="" headerValue="" class="select"/></span>
						</div>
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel">高管人数：<span style="color:red">*</span></span>
							<span class="rightinfo"><input isNotNull="" isZZint="高管人数" class="input" name="qiye.lead_num" type="text"  value="${qiye.lead_num }"/></span>
						</div>
					</div>
					<div class="row">
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel">去年党费总额(元)：<span style="color:red">*</span></span>
							<span class="rightinfo"><input isNotNull="" isBankZZint="isBankZZint"  onchange="this.value=formatNum(this.value)" class="input" name="qiye.last_party_cost" type="text"  value="${qiye.last_party_cost }"/></span>
						</div>
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel" style="width: 148px;">是否愿意设立党支部：<span style="color:red">*</span></span>
							<span class="rightinfo"><s:select style="width: 214px;" isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="will_set_party" theme="simple"
									  listValue="name" name="qiye.will_set_party" label="是否愿意设立党支部" headerKey="" headerValue="" class="select"/></span>
						</div>
					</div>
					<div class="row">
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel">高管党员人数：<span style="color:red">*</span></span>
							<span class="rightinfo"><input isNotNull="" isZZint="高管党员人数" class="input" name="qiye.lead_party_num" type="text"  value="${qiye.lead_party_num }"/></span>
						</div>
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel">是否设立党支部：<span style="color:red">*</span></span>
							<span class="rightinfo"><s:select isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="is_party_branch" theme="simple" onchange="hidebranchtime();"
									  listValue="name" name="qiye.is_party_branch" label="是否设立当支部" headerKey="" headerValue="" class="select"/></span>
						</div>
					</div>
					<div class="row">
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel branchtime">党支部设立时间：</span>
							<span class="rightinfo branchtime"><input class="input stext laydate-icon"  id="qiye.party_branch_time"  name="qiye.party_branch_time" type="text"  value="${qiye.party_branch_time }"/></span>
						</div>
						<div class="inputtest inputtestl"></div>
					</div>
				</div>

				<div class="revise" id="zqxxxgbtn" style="margin-bottom: 0;">
					<div>
						<input class="shenqingdkt shenqingdkthide qiyeZc" type="button" value="暂存"/>
						<input class="shenqingdkt shenqingdkthide qiyeSave" type="button" value="保存"/>
					</div>
					<div class="fbbox">
						<input class="shenqingdkt upbacktoguquan qiyeExcept" type="button"  value="发布股权融资"/>&nbsp;&nbsp;
						<input class="shenqingdkt upbacktozhaiquan qiyeExcept" type="button"  value="发布债权融资"/>&nbsp;&nbsp;
						<input class="shenqingdkt upbacktozhengce qiyeExcept" type="button"  value="&nbsp;&nbsp;填写基本情况表（政策申报）"/>&nbsp;&nbsp;
					</div>
				</div>
			</form>
		</div>
		</div>
		</div>
</div>
<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery-ui.min.css"/>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-ui.min.js"></script>
<script>
    $('#qiyename').autocomplete({
        source: function(request, response) {
            var key = $("#qiyename").val();
            if ($.trim(key) == "") {
                return;
            }
            $.ajax({
                type: 'post',
                url: "/userextend/creditsearch.html",
                dataType: "json",
                data: {
                    "key": key
                },
                success: function(data) {
                    console.log(data);
                    var reg = /<span style='color:red'>|<\/span>/ig;
                    $.each(data.data,
                        function(i, v) {
                            v.company_name = v.company_name.replace(reg, '')
                        })
                    response($.map(data.data,
                        function(item) {
                            return {
                                label: item.company_name,
                                value: item.company_name,
                                code: item.credit_code
                            }
                        }));
                }
            });
        },
        select: function(event, ui) {
            if(ui.item.code){
                $('#zzjgdm').siblings(".error").html("").hide();
			}
            $('#zzjgdm').val(ui.item.code);
        },

        minLength: 2
    })
</script>
<div id="imglayer_bg"></div>
<div id="imglayer_border">
	<a href="javascript:;" id="imglayer_x" hidefocus="true"></a>
	<img id="imglayer_zoom" src="">
</div>
<div id="yyimglayer_bg"></div>
<div id="yyimglayer_border">
	<a href="javascript:;" id="yyimglayer_x" hidefocus="true"></a>
	<img id="yyimglayer_zoom" src="">
</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("qiyeinfo");
 </script>
<script type="text/javascript">
    if($('#topic_content>img').attr('src')){
        $('.imgbox>#bigimg').show();
        $('#topic_content').css('background','none');
    }
    if($('#yytopic_content>img').attr('src')){
        $('.yyimgbox>#yybigimg').show();
        $('#yytopic_content').css('background','none');
    }
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
        if(t=='v'){
            //表示查询
            $("#form1 input,radio,select,textarea,checkbox").attr('disabled',true);
            $(".shenqingdkt").attr("disabled",false);
            $(".shenqingdkthide").hide();
            //$("#zqxxxgbtn").hide();
            $("#form1 input,radio,textarea,checkbox").each(function(){
                $(this).parent("span").html($(this).val());
                $('.gszcddiv .rightinfo').css('width', 'auto')
            });
            $("#form1 select").each(function(){
                var text = $(this).find("option:selected").text();
                $(this).parent("span").html(text == "请选择" ? "" : text);
            });
            if (!$('#topic_content>img').attr('src')) {
                $('.imgbox').hide();
            }else{
                $('#topic_content').css('background','none');
            }
            if (!$('#yytopic_content>img').attr('src')) {
                $('.yyimgbox').hide();
            }else{
                $('#yytopic_content').css('background','none');
            }
        }
        else if(t=='a'){
            //表示新增（在返回没有数据的情况可以新增）
            $(".shenqingdkt").hide();
            $(".shenqingdkthide").show();
           // $(".shenqingdkthide").val("确认提交");
            $('#form1 input,radio,select,textarea,checkbox').css('border', '1px solid #E0E0E0');
            $('#form1 #bcard,#form1 #yybcard').css('border','0');
            $('.shenqingdkt').css('border',0)
            $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
            $('.imgbox').css('marginTop', '40px')
            $('.yyimgbox').css('marginTop', '40px')
//		qiyeappinfo();
        }else if(t=='u'){
            $("#form1").attr("action","/usercenter/updateQiyeinfo.html");
            $('#form1 input,radio,select,textarea,checkbox').css('border', '1px solid #E0E0E0');
            $('#form1 #bcard,#form1 #yybcard').css('border','0');
            $('.shenqingdkt').css('border',0)
            $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
            $('.imgbox').css('marginTop', '40px')
            $('.yyimgbox').css('marginTop', '40px')
            //表示修改
//		qiyeappinfo();
        } else if(t=='o'){ //只读
            $("#form1 input,radio,select,textarea,checkbox").not(".qiyeExcept").attr('disabled',true);
            $(".qiyeSave1").remove();
            $(".finamsg").show();
            $("#form1 input,radio,textarea,checkbox").each(function () {
                $(this).parent("span").html($(this).val());
            });
            $('.gszcddiv .rightinfo').css('width', 'auto');
            $("#form1 select").each(function () {
                var text = $(this).find("option:selected").text();
                $(this).parent("span").html(text == "请选择" ? "" : text);
            });
            if (!$('#topic_content>img').attr('src')) {
                $('.imgbox').hide();
                $('.yyimgbox').hide();
            }else{
                $('#topic_content').css('background','none');
            }
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
    //暂存,不验证isNotNull
    $('.qiyeZc').click(function () {
        $("#iscomplete").val('10002');
        if (DataCheck.isZcNotNull()) {
            if (DataCheck.isLength()) {
                if (DataCheck.isInt()) {

                    if (DataCheck.isFint()) {

                        if (DataCheck.isZint()) {

                            if (DataCheck.isZuzhi()) {

                                if (DataCheck.isPhone()) {

                                    if (DataCheck.isEmail()) {
                                        if (DataCheck.isBankZint()) {
                                            if (DataCheck.isBankZZint()) {
                                            if (DataCheck.isZZint()) {
                                                if (DataCheck.idCard()) {
                                                    //检测如果没填小框框内容，则把inputdname去掉，避免传到后台。
                                                    //alert("可以保存!");
                                                    //判断上传文件
                                                    //alert(checkfilehidden(true))
                                                    //return;
                                                    buttonDefaultValue = $(this).val();
                                                    countDown(this, 5);
                                                    nativeNum("isBankZint"); //还原为数字
                                                    // nativeNum("isBankZZint"); //还原为数字
                                                    $("#form1").submit(); //改变链接并提交
                                                } else {
                                                    alert("不可以保存!");
                                                }
                                            }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    });
    //    保存,sb_base.jsp页面只有一个按钮，是当成提交处理。
    $('.qiyeSave').click(function () {
        $("#iscomplete").val('10001');
        $('#notsave').val('0');
        //点击保存提交对其它融资方式的判断，判断是否显示，且判断其值是否符合要求
        var qtrzfsinput = $(".qtrzfs .rightinfo input");
        if (DataCheck.isNotNull()) {

            if (DataCheck.isLength()) {

                if (DataCheck.isInt()) {

                    if (DataCheck.isFint()) {

                        if (DataCheck.isZint()) {

                            if (DataCheck.isZuzhi()) {

                                if (DataCheck.isPhone()) {

                                    if (DataCheck.isEmail()) {

                                        if (DataCheck.isBankZint()) {
                                            if (DataCheck.isBankZZint()) {
                                            if (DataCheck.isZZint()) {

                                                if (DataCheck.idCard()) {
                                                    //alert("可以提交!");
                                                    if (!checkEachNeedDate("form1")) {
                                                        return;
                                                    }
                                                    //判断上传文件
                                                    if (checkfilehidden(true)) {

                                                        buttonDefaultValue = $(this).val();
                                                        countDown(this, 5);
                                                        nativeNum("isBankZint"); //还原为数字
                                                        //nativeNum("isBankZZint"); //还原为数字
                                                        $("#form1").submit(); //改变链接并提交
                                                    } else {
                                                        //alert("提交失败!");
                                                        return;
                                                    }
                                                } else {
                                                    alert("不可以提交!");
                                                }
                                            }

                                        }
                                    	}
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    });
    //点击保存按钮时检查每个文件框是否都已经传值
    function checkfilehidden() {
        var picimgupspan = $(".upspan");
        var ifreturn = 0;
        var tolength = picimgupspan.length;
        picimgupspan.each(function(i, v) {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            var ifqsc = $(this).children(".qsc").attr("class"); //提示未上传的情况再提交不能再加提示了
            var picval = picimgss.attr("class");

            //if((i+1)<tolength && (i+1) != 2 && (i+1) != 3 && (i+1) != 4){
            if ((i + 1) <= tolength) {
                if (!picval) {
                    if (!ifqsc) {
                        $(this).append("<div class='qsc'>请上传文件！</div>");
                    }
                    ifreturn = 1;
                }
            }

        });
        if (ifreturn) {
            return false;
        } else {
            return true;
        }
    }
</script>

<!--日期-->
<script type="text/javascript">
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#qiye.chengliriqi'});//绑定元素
	laydate({elem: '#qiye.party_branch_time'});//绑定元素
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
<!--检测并绑定关联号-->
<script>
$(function() {//看不懂
	var zczjbz = $('#qiye_zczjbz').val();
	if (zczjbz == '') {
		$('#qiye_zczjbz').val('e66405d84c9d4f03b1f87624938174e3');
	}
})

//输入信用代码后 检测有无关联账号
	function qiyeCheckCreditId() {
		var zzjgdm = $("input[name='qiye.zzjgdm']").val();
		if (zzjgdm == "") {
    		return;
    	}
		$.ajax({
			type: 'post',
			url: "/usercenter/checkCreditId.html",
			dataType: "json",
			data: {
				"id": zzjgdm
			},
			success: function(data) {
				if (data.relaSelf == 1) {
					var msg = data.name + "已经注册，点击确认按钮自动关联到该公司";
					if (confirm(msg)) {
						$("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
						$(".shenqingdkthide,#zqxxxgbtn").hide();
						qiyeRelation(data);
					}
				} else if (data.relaSelf == 2) {
					var msg = data.name + "的子账号数已经到达上限，不能再增加子账号。";
					alert(msg);
				} else if (data.id != "") {
					var msg = data.name + "已经注册，点击确认按钮系统将发送请求到主用户（电话号码" + data.phone + "），待主用户审核,审核通过后即可自动关联";
					if (confirm(msg)) {
						$("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
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
	function hidebranchtime() {
		if ($("select[id='is_party_branch']").val() == "10001") {
			$(".branchtime").show();
		} else {
			$(".branchtime").hide();
		}
	}
	hidebranchtime();
</script>

</body>
</html>
