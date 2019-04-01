<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/tbnewecoinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none;background:none;}
	label.error{border: 1px solid #f5694b!important;background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px;line-height: 20px;}
	#alert{position: fixed;width:100%;height:100%;top:0;left:0;background:rgba(0,0,0,0.4);display: none;text-align:left;z-index:1000000;}
	#alert11{position: fixed;width:100%;height:100%;top:0;left:0;background:rgba(0,0,0,0.4);display: none;text-align:left;z-index:1000000;}
	#alertTxt{width:550px;height:400px;padding:30px 20px 20px 35px;;position: absolute;;top:50%;left:50%;margin-top:-200px;margin-left:-275px;border-radius: 5px;-webkit-border-radius: 5px;-moz-border-radius: 5px;background:#fff;font-size:15px;box-sizing: border-box;line-height: 30px;}
	#alertTxt ol{margin:15px 0 25px;font-weight: bold;}
	#alertTxt ol li{list-style-type:decimal;margin-bottom:10px;}
	#alertTxt ol li p{font-weight: normal;}
	.closeAlert{cursor:pointer;color:#aaa;}
	.closeAlert11{cursor:pointer;color:#aaa;}
	.closeAlert1{text-align: right;display: block;font-size:22px;margin:-10px -2px 0 0;}
	.closeAlert:hover{color:#333;border-color:#333;}
	.closeAlert11:hover{color:#333;border-color:#333;}
	.closeAlert2{cursor:pointer;display: inline-block;border:1px solid #aaa;padding:3px 12px;font-size:14px;line-height: 20px;margin-left:-15px;}
	.finamsg{color: red;display: none;line-height: 20px;font-weight: bold;}
	#ycacti{width: 97.4%}
	#ycacti tbody tr td{text-align:left;}
	#ycacti tbody tr td input{background-color:white;border:2px inset;}
</style>
<body>
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
			<form id="tbnewecoFormInfo" action="/usercenter/saveNewEco.html" method="post">
				<div class="title">
					<li>
						<span class="t">新经济企业入库</span>
						<span class="t ecomsg" style="margin-left:50px;color:red;display: none;">本次新经济企业入库，<span style="font-weight:bold;">您已经填报成功！</span></span>
						<a href="/usercenter/getNewEco.html?t=u" class="readOnly"><span id="tbnewecoupdate" class="update">修改</span></a>
					</li>
					<div class="finamsg ecomsg">
						<br/><a style="color:red;" href="/usercenter/getQiyeinfo.html?qiye.t=v">如果您想获得盈创动力更多的服务，如股权融资或者政策性贷款，请完善更多企业资料。点击左侧的【账户信息】-【企业信息】进行完善。</a>
					</div>
				</div>
				<input type="hidden" name="tbneweco.id" value="${tbneweco.id }"/>
				<input type="hidden" name="tbneweco.status" value="${tbneweco.status }"/>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">企业名称：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.qiyemingcheng" type="text"  value="${tbneweco.qiyemingcheng }"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">注册地址：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<textarea class="input" style="width: 492px;min-height:60px" maxlength="64" name="tbneweco.address">${tbneweco.address }</textarea>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">经营地址：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<textarea class="input" style="width: 492px;min-height:60px" maxlength="128" name="tbneweco.dizhi">${tbneweco.dizhi }</textarea>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">主营业务：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<textarea class="input" style="width: 492px;min-height:60px" maxlength="256" name="tbneweco.zhuyingyewu">${tbneweco.zhuyingyewu }</textarea>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">主要产品：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<textarea class="input" style="width: 492px;min-height:60px" maxlength="128" name="tbneweco.main_product">${tbneweco.main_product }</textarea>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">创投机构投资情况：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<textarea placeholder="如未获得请填写“无”，如果有请填写机构名称、投资金额、所占份额" class="input" style="width: 492px;min-height:60px" maxlength="128" name="tbneweco.invest_status">${tbneweco.invest_status }</textarea>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">企业法人：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input maxlength="64" style="width: 492px;" class="input inputrow" name="tbneweco.legal_person" type="text"  value="${tbneweco.legal_person}"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">所属行业：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<s:select onchange="selectnewecofield();" cssClass="select" list="%{#application.dic.hangyeid.childs}" listKey="id" headerKey="" headerValue="" listValue="name" name="tbneweco.hangyeid"  />
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">
					新经济领域：
						<%-- <a href="javascript:void(0)" id="showAlert11" style="color: red;" title="">（领域说明）</a>
						<div id="alert11">
					        <div id="alertTxt">
					            <span class="closeAlert11 closeAlert1">&times;</span>
					            <ol>
					                <li><p><b>数字经济、智能经济</b>:以新技术为核心，包括人工智能、虚拟现实、传感控制、增材制造、云计算、物联网、大数据、机器人、无人机等方面的企业。</p></li>
					                <li><p><b> 平台经济、分享经济</b>:以新模式为支撑，包括电子商务平台、互联网社交平台、交易所、共享出行、共享租房等方面的企业。</p></li>
					                <li><p><b>跨界经济、融合经济</b>:以新业态为特征，包括“互联网+”、金融科技、生物芯片、移动支付等方面的企业。</p></li>
					                <li><p><b>结算经济、 IP 经济</b>:以新价值为导向的高端服务业的企业。</p></li>
					            </ol>
					           <p style="text-align: center;"> <span class="closeAlert11 closeAlert2">关闭</span></p>
					        </div>
					    </div> --%>
					<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<s:select cssClass="select" disabled="true" list="%{#application.dic.newecofield.childs}" listKey="id" headerKey="" headerValue="" listValue="name" name="tbneweco.new_eco_field"  />
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">企业人数：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.yuangongshu" type="text"  value="${tbneweco.yuangongshu}"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">科技活动人员数：
						<a href="javascript:void(0)" id="showAlert" style="color: red;" title="">（情况说明）</a>
						<div id="alert">
					        <div id="alertTxt">
					            <span class="closeAlert closeAlert1">&times;</span>
					            <ol>
					                <p>科技活动人员：指企业在报告年度直接从事或参与科技活动的人员，包括参加科技项目人员、从事科技活动管理和为科技活动提供直接服务的人员。科技活动人员不包括全年累计从事科技活动时间不足制度工作时间10%的人员。</p>
					            </ol>
					           <p style="text-align: center;"> <span class="closeAlert closeAlert2">关闭</span></p>
					        </div>
					    </div>
					<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.science_num" type="text"  value="${tbneweco.science_num}"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">成立时间：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
					<input style="width: 492px;" class="input stext laydate-icon" id="tbneweco.chengliriqi" name="tbneweco.chengliriqi" type="text"  value="${fn:substring(tbneweco.chengliriqi, 0, 10)}"/>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">2016年研发投入（万元）：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.rdinput2016" type="text"  value="${tbneweco.rdinput2016}"/></span>
				</div>
				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead>
					<tr class="TT">
						<td>时间</td>
						<td>2015年</td>
						<td>2016年</td>
						<td>预计2017年</td>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td>营业收入（万元）</td>
							<td><input class="input inputrow" name="tbneweco.incom2015" type="text" value="${tbneweco.incom2015}"/></td>
							<td><input class="input inputrow" name="tbneweco.incom2016" type="text" value="${tbneweco.incom2016}"/></td>
							<td><input class="input inputrow" name="tbneweco.incom2017" type="text" value="${tbneweco.incom2017}"/></td>
						</tr>
						<tr>
							<td>利润（万元）</td>
							<td><input class="input inputrow" name="tbneweco.profit2015" type="text" value="${tbneweco.profit2015}"/></td>
							<td><input class="input inputrow" name="tbneweco.profit2016" type="text" value="${tbneweco.profit2016}"/></td>
							<td><input class="input inputrow" name="tbneweco.profit2017" type="text" value="${tbneweco.profit2017}"/></td>
						</tr>
						<tr>
							<td>税收（万元）</td>
							<td><input class="input inputrow" name="tbneweco.taxamt2015" type="text" value="${tbneweco.taxamt2015}"/></td>
							<td><input class="input inputrow" name="tbneweco.taxamt2016" type="text" value="${tbneweco.taxamt2016}"/></td>
							<td><input class="input inputrow" name="tbneweco.taxamt2017" type="text" value="${tbneweco.taxamt2017}"/></td>
						</tr>
					</tbody>
				</table>
				<div class="inputtest inputtestl inputtestlrow" style="margin-top: 10px;">
					<span class="leftname leftnamel" style="width: 240px;">企业估值（万元）：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.valuation" type="text"  value="${tbneweco.valuation }"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">是否高新技术企业：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<select class="select" name="tbneweco.high_tech">
							<option value=""></option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">是否上规入库：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;">
						<select class="select" name="tbneweco.inbase">
							<option value=""></option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">联系人：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.xingming" type="text"  value="${tbneweco.xingming}"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">联系方式（手机）：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.yidongdianhua" type="text"  value="${tbneweco.yidongdianhua}"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">电子邮箱：<span style="color:red">*</span></span>
					<span class="rightinfo" style="width: 400px;"><input style="width: 492px;" class="input inputrow" name="tbneweco.email" type="text"  value="${tbneweco.email}"/></span>
				</div>
				<div class="inputtest inputtestl inputtestlrow">
					<span class="leftname leftnamel" style="width: 240px;">备注：</span>
					<span class="rightinfo" style="width: 400px;">
						<textarea class="input" style="width: 492px;min-height:60px" maxlength="128" name="tbneweco.memo">${tbneweco.memo }</textarea>
					</span>
				</div>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbnewecobutton" type="button" onclick="tbnewecoSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbnewecobutton" type="button" onclick="tbnewecoSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
				</div>
			</form>
				</div>
		</div>	
	</div>
</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript">
	 $("[name='tbneweco.inbase']").val('${tbneweco.inbase}');
	 $("[name='tbneweco.high_tech']").val('${tbneweco.high_tech}');
	if ('${flag}' != "") {
		alert('${flag}');
	}
	if ($("[name='tbneweco.id']").val() != "") {
		$(".ecomsg").show();
	}
	!function(){
		laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
		laydate({elem: '#tbneweco.chengliriqi'});//绑定元素
	}();
	function tbnewecoSubmit(val) {
		var status = $("input[name='tbneweco.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbnewecoFormInfo").submit();
	}	
	
	var t = '${t}'; //v 查看   u 修改  a 新增
	if (t == 'v') {
		$("#tbnewecoFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$(".tbnewecobutton").hide();
	} else {
		tbnewecoInfo();
	}
$('#showAlert').click(function(e){
    e.preventDefault();
    $('#alert').fadeIn(200);
});
$('.closeAlert').click(function(){
    $('#alert').hide();
}) 
$('#showAlert11').click(function(e){
    e.preventDefault();
    $('#alert11').fadeIn(200);
});
$('.closeAlert11').click(function(){
    $('#alert11').hide();
})

	function selectnewecofield() {
		var hangyeid = $("select[name='tbneweco.hangyeid']");
		var text = hangyeid.val();
		if (text.length == 32) {
			$("select[name='tbneweco.new_eco_field'] option").each(function(){
				var  val = $(this).val();
				if(val.length == 32 && val.substring(29, 30) == text.substring(29, 30)){
					$(this).attr("selected",true);
				}
			});
		}
		var ecofield = $("select[name='tbneweco.new_eco_field']");
		if (hangyeid.find("option:selected").text() == "其它") {
			ecofield.attr("disabled", false);
		} else {
			ecofield.attr("disabled", true);
		}
	}
 </script> 
 <script type="text/javascript" >
 	leftnav_init("tbnewecoinfo");
 </script>
</body>
</html>