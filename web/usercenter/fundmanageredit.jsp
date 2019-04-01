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
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css"/>
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	.rightbox td span.error,.rightinfo span.error{padding:0;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:block;height: 20px; line-height: 20px;}
	.maintable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #form1 input:not(.fundmanagerExcept),#form1 select,#form1 textarea{border:1px solid #aaa;background-color: white !important;height: 30px;width: 200px; padding: 0 5px; box-sizing: border-box;}
	#form1 textarea{width: 100%; height: 100px;padding:12px;font-family: "微软雅黑";}
	.creditor .vipinfo .adddel,.creditor .vipinfo .addde2{width: auto;height: auto;white-space: nowrap;margin-right: 0;color:#fff !important;
	}
	.creditor .vipinfo .adddel{background: #03b488;}
	.creditor .vipinfo .adddel:hover{background: #029f78;}
	.creditor .vipinfo .addde2{background: #e96a67;}
	.creditor .vipinfo .addde2:hover{background: #d76061;}
	.creditor .vipinfo .sharemoney~.adddel,.creditor .vipinfo .holdmoney~.adddel{margin-left:5px;width: 25px;height: 25px;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/usercenter/jjgl_add1.png") no-repeat 0 center;background-size: 22px auto;}
	.creditor .vipinfo .sharemoney~.adddel:hover,.creditor .vipinfo .holdmoney~.adddel:hover{background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/usercenter/jjgl_add2.png");background-size: 22px auto;}
	.creditor .vipinfo .sharemoney~.addde2,.creditor .vipinfo .holdmoney~.addde2{width: 25px;height: 25px;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/usercenter/jjgl_remove1.png") no-repeat 0 center;background-size: 22px auto;}
	.creditor .vipinfo .sharemoney~.addde2:hover,.creditor .vipinfo .holdmoney~.addde2:hover{background-image:  url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/usercenter/jjgl_remove2.png");background-size: 22px auto;}
	.creditor .vipinfo .inputtest .input{padding:0;}
	.basiclist{border:1px dashed red;margin-bottom:25px;padding:10px;}
	.sharemoney,.holdmoney{width:130px !important;}

	/*{#03b488,#e96a67}*/
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#fundmanagerSub,#fundmanagerSave").remove();
	} else {
        // fundinfo();
	}
});
</script>

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
			<div id="zaiquanxinxi-update" class="vipinfo" >
			<form id="form1" action="/userextend/saveFundInfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">高新区私募基金管理</span>
					</li>
				</div>
				<input type="hidden" name="fundmanager.pkid" value="${fundmanager.pkid }"/>
				<input type="hidden" name="fundmanager.userid" value="${fundmanager.userid }"/>
				<input type="hidden" name="fundmanager.releid" value="${fundmanager.releid }"/>
				<input type="hidden" name="fundmanager.shareholder" value="${fundmanager.shareholder }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">高新区私募基金管理人基本情况表</span>
				</div>
				<br/>
				<table id="fundmanagerTable" class="maintable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>公司名称：<span style="color:red">*</span></td>
						<td><input isNotNull="公司名称" isLength="[0,64]" name="fundmanager.qiyename" value="${fundmanager.qiyename }" class="input" type="text"/></td>
						<td>统一信用代码：<span style="color:red">*</span></td>
						<td><input  isNotNull="统一信用代码"  isZuzhi="统一社会信用代码" onblur="checkFundCredit();" name="fundmanager.creditid" value="${fundmanager.creditid }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>法定代表人：<span style="color:red">*</span></td>
						<td><input  isNotNull="法定代表人" name="fundmanager.corp" value="${fundmanager.corp }" class="input" type="text"/></td>
						<td>成立日期：<span style="color:red">*</span></td>
						<td><input isNotNull="成立日期" name="fundmanager.regdate" value="${fundmanager.regdate }" class="input laydate-icon" type="text" id="date"/></td>
					</tr>
					<tr>
						<td>经营期限：<span style="color:red">*</span></td>
						<td><input isNotNull="经营期限" name="fundmanager.operatetime" value="${fundmanager.operatetime }" class="input" type="text"/></td>
						<td>公司类型：<span style="color:red">*</span></td>
						<td>
							<s:select isNotNull="公司类型" list="%{#application.dic.qiyetype.childs}" headerKey="" headerValue="" theme="simple"
								listKey="id" listValue="name" id="fundmanager.qiyetype" name="fundmanager.qiyetype"/>
						</td>
					</tr>
					<tr>
						<td>注册资本(万元)：<span style="color:red">*</span></td>
						<td>
							<input isNotNull="注册资本" isBankZint="isBankZint" name="fundmanager.regfunds" value="${fundmanager.regfunds }" class="input" type="text"/>
						</td>
						<td>公司性质：<span style="color:red">*</span></td>
						<td>
							<s:select isNotNull="公司性质" list="%{#application.dic.qiyequality.childs}" headerKey="" headerValue="" theme="simple"
								listKey="id" listValue="name" id="fundmanager.qiyequality" name="fundmanager.qiyequality"/>
						</td>
					</tr>
					<tr>
						<td>备案类型：<span style="color:red">*</span></td>
						<td>
							<s:select isNotNull="备案类型" list="%{#application.dic.recordtype.childs}" headerKey="" headerValue="" theme="simple"
								listKey="id" listValue="name" id="fundmanager.filetype" name="fundmanager.filetype"/>
						</td>
						<td>公司状态：<span style="color:red">*</span></td>
						<td>
							<s:select isNotNull="公司状态" list="%{#application.dic.qiyestatus.childs}" headerKey="" headerValue="" theme="simple"
							listKey="id" listValue="name" id="fundmanager.qiyestatus" name="fundmanager.qiyestatus"/>
						</td>
					</tr>
					<tr>
						<td>公司地址：<span style="color:red">*</span></td>
						<td><input isNotNull="公司地址" name="fundmanager.address" value="${fundmanager.address }" class="input" type="text"/></td>
						<td>办公面积(平方米)：<span style="color:red">*</span></td>
						<td><input  isNotNull="办公面积" isInt='isInt' name="fundmanager.acreage" value="${fundmanager.acreage }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>联系人：<span style="color:red">*</span></td>
						<td><input  isNotNull="联系人" name="fundmanager.linkman" value="${fundmanager.linkman }" class="input" type="text"/></td>
						<td>联系电话：<span style="color:red">*</span></td>
						<td><input  isNotNull="联系电话" isPhone="移动电话" name="fundmanager.linktel" value="${fundmanager.linktel }" class="input" type="text"/></td>
					</tr>
					<c:forEach items="${fundmanager.shareholderObject}" var="datas">
						<tr class='sharetr'>
							<td>股东名：<span style='color:red'>*</span></td>
							<td><input  isNotNull='股东名' class='input sharename' type='text' value="${datas.sharename}"/></td>
							<td>金额：<span style='color:red'>*</span></td>
							<td><input  isNotNull='金额' isBankZint="isBankZint" class='input sharemoney' type='text' value="${datas.sharemoney}"/>
								<input class='adddel fundmanagerExcept' title='增加一行' type='button' value='' onclick='addshare();'>
									<input class='addde2 fundmanagerExcept' title='删除一行' type='button' value='' onclick='delshare(this);'>
							</td>
						</tr>
					</c:forEach>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">投资项目情况表</span>
				</div>
				<br/>
				<table class="maintable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>总投资金额<span style="font-size: 12px;">(万元)</span>：<span style="color:red">*</span></td>
						<td><input isNotNull="总投资金额" isLength="[0,64]" name="fundmanager.inamount" value="${fundmanager.inamount }" class="input" type="text"/></td>
						<td>高新区投资金额<span style="font-size: 12px;">(万元)</span>：<span style="color:red">*</span></td>
						<td><input isNotNull="高新区投资金额" isLength="[0,64]" name="fundmanager.techinamount" value="${fundmanager.techinamount}" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>被投企业总数<span style="font-size: 12px;">(个)</span>：<span style="color:red">*</span></td>
						<td><input isNotNull="被投企业总数" isLength="[0,64]" name="fundmanager.qiyenum" value="${fundmanager.qiyenum }" class="input" type="text"/></td>
						<td>高新区被投企业数<span style="font-size: 12px;">(个)</span>：<span style="color:red">*</span></td>
						<td><input isNotNull="高新区被投企业数" isLength="[0,64]" name="fundmanager.techqiyenum" value="${fundmanager.techqiyenum}" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>退出比例<span style="font-size: 12px;">(%)</span>：<span style="color:red">*</span></td>
						<td><input isNotNull="退出比例" name="fundmanager.exitrate" value="${fundmanager.exitrate}" class="input" type="text"/></td>
						<td>高新区被投企业退出数<span style="font-size: 12px;">(个)</span>：<span style="color:red">*</span></td>
						<td><input isNotNull="高新区被投企业退出数" name="fundmanager.techexitnum" value="${fundmanager.techexitnum}" class="input" type="text"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">高新区私募基金基本情况</span>
				</div>
				<br/>
				<div id="fundbasics">
				<c:forEach items="${fundmanager.fundbasicList}" var="datas" varStatus="status">
					<div class='basiclist'>
						<input type='hidden' index='pkid' value='${datas.pkid}'>
						<input type='hidden' index='fundscale' value='${datas.fundscale}'>
						<input type='hidden' index='shareholder' value='${datas.shareholder}'>
						<div class='inputtest inputtestl'>
							<span class='leftname leftnamel'>基金名称：</span> 
							<span class='rightinfo'>
								<input  isNotNull="基金名称" index='fundname' value='${datas.fundname}' type='text' class='input' />
							</span>
						</div>
						<div class='inputtest inputtestl'>
							<span class='leftname leftnamel'>成立日期：</span> 
							<span class='rightinfo'>
								<input  isNotNull="成立日期" index='regdate' value='${datas.regdate}' type='text' class='input laydate-icon' id="date${status.index+1}"/>
							</span>
						</div>
						<div class='inputtest inputtestl'>
							<span class='leftname leftnamel'>经营期限：</span> 
							<span class='rightinfo'>
								<input  isNotNull="经营期限" index='operatetime' value='${datas.operatetime}' type='text' class='input' />
							</span>
						</div>
						<div class='inputtest inputtestl'>
							<span class='leftname leftnamel'>基金备案号：</span> 
							<span class='rightinfo'>
								<input  isNotNull="基金备案号" index='fundnum' value='${datas.fundnum}' type='text' class='input' />
							</span>
						</div>
						<div class='holders'>
							<c:forEach items="${datas.shareholderObject}" var="data">
							<div class='holder'>
								<div class='inputtest inputtestl'>
									<span class='leftname leftnamel'>股东名：</span> 
									<span class='rightinfo'>
										<input  isNotNull="股东名" type='text' class='holdname' class='input' value="${data.holdname }"/>
									</span>
								</div>
								<div class='inputtest inputtestl'>
									<span class='leftname leftnamel'>金额：</span> 
									<span class='rightinfo'>
										<input  isNotNull="金额" isBankZint="isBankZint" type='text' class='holdmoney' class='input' value="${data.holdmoney }"/>
										<input class='adddel fundmanagerExcept' title='增加一行' type='button' value='' onclick='addholder(this);'>
										<input class='addde2 fundmanagerExcept' title='删除一行' type='button' value='' onclick='delholder(this);'>
									</span>
								</div>
							</div>
							</c:forEach>
						</div>

						<div style='text-align:right;overflow: hidden;clear: both;padding: 15px;'>
							<input class='adddel fundmanagerExcept' title='增加一组' type='button' value='增加一组' onclick='addbasic();'>&nbsp;
							<input class='addde2 fundmanagerExcept' title='删除一组' type='button' value='删除一组' onclick='delbasic(this);'>
						</div>
					</div>
				</c:forEach>
				</div>


				<div class="revise readOnly" id="zqxxxgbtn">
					<!-- <input class="shenqingdkt shenqingdkthide fundmanagerExcept" id="fundmanagerSave" type="button" onclick="fundmanagerSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/> -->
					<input class="shenqingdkt shenqingdkthide fundmanagerExcept" id="fundmanagerSub" type="button" onclick="fundmanagerSubmit();" value="提交"/>
				</div>
			</form>
		</div>
		</div>	
	</div>
</div>
 <%@ include file="../../footer.jsp"%>
 <script type="text/javascript">
	if ('${flag}' != "") {
		alert('${flag}');
	}
    //点击保存按钮时检查每个文件框是否都已经传值
    function checkfilehidden() {
        var picimgupspan = $(".upspan");
        var ifreturn = 0;
        var tolength = picimgupspan.length;
        picimgupspan.each(function (i, v) {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            var ifqsc = $(this).children(".qsc").attr("class");//提示未上传的情况再提交不能再加提示了
            var picval = picimgss.attr("class");

            //if((i+1)<tolength && (i+1) != 2 && (i+1) != 3 && (i+1) != 4){
            if ((i + 1) <= tolength) {
                if (!picval) {
                    if (!ifqsc) {
                        $(this).append("<div class='qsc'>请上传图片！</div>");
                    }
                    ifreturn = 1;
                }
            }

        });
        if (ifreturn) {
            return false;
        } else {
            return true;
            //document.getElementById("sb_base").submit();
        }
    }
	function fundmanagerSubmit() {
		var basics = ["pkid", "fundscale", "shareholder", "fundname", "regdate", "operatetime", "fundnum"];
		for (var i = 0;i < basics.length; i++) {
		    // console.log(basics[i] )
			$("input[index='" + basics[i] + "']").each(function(j){
				$(this).attr("name", "fundmanager.fundbasicList[" + j + "]." + basics[i]);
			});
		}
		$(".basiclist").each(function(){
			var allholdmoney = 0;
			var holdarr = new Array();
			var hnum = 0;
			$(this).find(".holder").each(function(){
				var holdname = $(this).find(".holdname").val();
				var holdmoney = parseInt($(this).find(".holdmoney").val());
				allholdmoney += holdmoney;
				var holdobj = new Object();
				holdobj.holdname = holdname;
				holdobj.holdmoney = holdmoney;
				holdarr[hnum++] = holdobj;
			});
			$(this).find("input[index='fundscale']").val(allholdmoney);
			$(this).find("input[index='shareholder']").val(JSON.stringify(holdarr));
		});
		var sharearr = new Array();
		var snum = 0;
		$(".sharetr").each(function(){
			var sharename = $(this).find(".sharename").val();
			var sharemoney = $(this).find(".sharemoney").val();
			var shareobj = new Object();
			shareobj.sharename = sharename;
			shareobj.sharemoney = sharemoney;
			sharearr[snum++] = shareobj;
		});
		$("input[name='fundmanager.shareholder']").val(JSON.stringify(sharearr));
        //点击提交,sb_base.jsp页面只有一个按钮，是当成提交处理。
        // console.log($("#form1").serialize());
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
                                                            // buttonDefaultValue = $(this).val();
                                                            // countDown(this, 5);
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

	}

	function addbasic() {
	    var a=$('#fundbasics .laydate-icon').length+1;
		$("#fundbasics").append("<div class='basiclist'><input type='hidden'index='pkid'><input type='hidden'index='fundscale'><input type='hidden'index='shareholder'><div class='inputtest inputtestl'><span class='leftname leftnamel'>基金名称：</span><span class='rightinfo'><input  isNotNull=\"基金名称\"index='fundname'type='text'class='input'/><span class='error'></span></span></div><div class='inputtest inputtestl'><span class='leftname leftnamel'>成立日期：</span><span class='rightinfo'><input  isNotNull=\"成立日期\"index='regdate'type='text'class='input laydate-icon' id='date"+a+"'/><span class='error'></span></span></div><div class='inputtest inputtestl'><span class='leftname leftnamel'>经营期限：</span><span class='rightinfo'><input  isNotNull=\"经营期限\" index='operatetime'type='text'class='input'/><span class='error'></span></span></div><div class='inputtest inputtestl'><span class='leftname leftnamel'>基金备案号：</span><span class='rightinfo'><input  isNotNull=\"基金备案号\"index='fundnum'type='text'class='input'/><span class='error'></span></span></div><div class='holders'><div class='holder'><div class='inputtest inputtestl'><span class='leftname leftnamel'>股东名：</span><span class='rightinfo'><input  isNotNull=\"股东名\"type='text'class='holdname'class='input'/><span class='error'></span></span></div><div class='inputtest inputtestl'><span class='leftname leftnamel'>金额：</span><span class='rightinfo'><input isNotNull=\"金额\" isBankZint=\"isBankZint\" type='text'class='holdmoney'class='input'/><span class='error'></span>&nbsp;<input class='adddel fundmanagerExcept' title='增加一行'type='button'value=''onclick='addholder(this);'>&nbsp;<input class='addde2 fundmanagerExcept' title='删除一行'type='button'value=''onclick='delholder(this);'></span></div></div></div><div style='text-align:right;overflow: hidden;clear: both;padding: 15px;'><input class='adddel fundmanagerExcept'title='增加一组'type='button'value='增加一组'onclick='addbasic();'>&nbsp;<input class='addde2 fundmanagerExcept'title='删除一组'type='button'value='删除一组'onclick='delbasic(this);'></div></div>");
	}
	function delbasic(obj) {
		$(obj).parents(".basiclist").remove();
		checkbasic();
	}
	
	function checkbasic() {
		if ($(".basiclist").length == 0) {
			addbasic();
		}
	}
	checkbasic();
	
	if ($(".basiclist").length == 0) {
		addbasic();
	}
	
	function addholder(obj) {
		$(obj).parents(".holders").append("<div class=\"holder\"><div class=\"inputtest inputtestl\"><span class=\"leftname leftnamel\">股东名：</span><span class=\"rightinfo\"><input   isNotNull=\"股东名\"type=\"text\"class=\"holdname\"/><span class='error'></span></span></div><div class=\"inputtest inputtestl\"><span class=\"leftname leftnamel\">金额：</span><span class=\"rightinfo\"><input  isNotNull=\"金额\" isBankZint=\"isBankZint\"type=\"text\"class=\"holdmoney\"/><span class='error'></span>&nbsp;<input class=\"adddel fundmanagerExcept\"title=\"增加一行\"type=\"button\"value=\"\"onclick=\"addholder(this);\">&nbsp;<input class=\"addde2 fundmanagerExcept\"title=\"删除一行\"type=\"button\"value=\"\"onclick=\"delholder(this);\"></span></div></div>");
	}
	
	function delholder(obj) {
		if ($(obj).parents(".holders").find(".holder").length == 1) {
			$(obj).parents(".holder").find("input[type='text']").val("");
		} else {
			$(obj).parents(".holder").remove();
		}
	}

	function addshare() {
		$("#fundmanagerTable").append("<tr class='sharetr'><td>股东名：<span style='color:red'>*</span></td><td><input isNotNull='股东名' class='input sharename' type='text'/><span class='error'></span></td><td>金额：<span style='color:red'>*</span></td><td><input isNotNull='金额'  isBankZint='isBankZint' class='input sharemoney' type='text'/><span class='error'></span><input class='adddel fundmanagerExcept' title='增加一行' type='button' value='' onclick='addshare();'><input class='addde2 fundmanagerExcept' title='删除一行' type='button' value='' onclick='delshare(this);'></td></tr>");
	}
	
	function delshare(obj) {
		$(obj).parents("tr").remove();
		checkshare();
	}
	function checkshare() {
		if ($(".sharetr").length == 0) {
			addshare();
		}
	}
	checkshare();
    //动态调用日期插件
    var gdqkinputs_inamex = $("#form1 input.laydate-icon");
    gdqkinputs_inamex.live('click', function () {
        if ('${t}' == 'v'){
            return;
        }
        var naowdate = $(this).attr("id");

        laydate({elem: '#' + naowdate});//绑定元素


    });


    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        //laydate({elem: '#jigou.zhuceshijian'});//绑定元素
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
        choose: function (datas) {
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
        choose: function (datas) {
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
        choose: function (datas) { //选择日期完毕的回调
            alert('得到：' + datas);
        }
    });

    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });


    window.onload=function(){
        $('.rightinfo,.sharetr td').each(function(i,v){
            if($(this).find('.error').length>1){
                $(this).find('.error')[0].remove();
			}
		})
	}

	function checkFundCredit(){
    	var creditid = $("input[name='fundmanager.creditid']").val();
    	if (creditid == "") {
    		return;
    	}
    	$.ajax({
			type: 'post',
			url: "/userextend/checkFundCredit.html",
			data: {"creditid": creditid},
			dataType:"json",
			success: function(data){
				if (data.code == 200) {
					layer.confirm("当前数据已存在，是否关联后继续编辑？", {
						title:"提示",btn:['确定', '取消'],area: ['300px', '180px']
						,cancel: function(index, layero){
						  	$("input[name='fundmanager.creditid']").val("");
						 }
			        }, function(index) {
			            layer.close(index);
			            location.href = "/userextend/releFund.html?pkid=" + data.pkid;
			        }, function(index) {
			            layer.close(index);
			            $("input[name='fundmanager.creditid']").val("");
			        });
				} else if (data.code == 300) {
					layer.confirm("当前数据已存在并已被其它用户关联，不可继续编辑！", {
						title:"提示",icon: 0, btn:['确定'],area: ['300px', '180px']
						,cancel: function(index, layero){
						  	location.href = "/userextend/getFundList.html";
						 }
			        }, function(index) {
			            layer.close(index);
			            location.href = "/userextend/getFundList.html";
			        });
			        $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
					$("#fundmanagerSub,#fundmanagerSave").remove();
				}
			}
		});
    }
 </script>
 <script type="text/javascript" >
 	leftnav_init("fundinfo");
 </script>
</body>
</html>