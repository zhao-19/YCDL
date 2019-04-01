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
	<%--<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>--%>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<style type="text/css">
		label{margin-right: 10px;}
		.zmsg,.qmsg,.umsg{color:red;display: none;}
	</style>
</head>
<body>
<%-- <script type="text/javascript">
$(window).load(function(){
	var backnotice = '${flag}';
	if (backnotice.length > 1) {
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
</script> --%>
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
				<form id="relaqiyeform" action="/usercenter/saveRelaqiyeinfo.html" method="post">
					<div class="title"><li><span class="t">关联企业</span></li></div>
					<div class="inputtest inputtestl inputtestlrow">
						<span class="leftname leftnamel" style="width: 180px;">企业名称：<span style="color:red">*</span></span>
						<span class="rightinfo" style="width: 400px;">
							<input style="width: 492px;" auto-complete auto-complete-data="autoCompleteData" maxlength="32" id="qiyename" name="qiyename" class="input inputrow" type="text"/>
							<span class="qmsg">请输入企业名称！</span>
						</span>
					</div>
					<div class="inputtest inputtestl inputtestlrow">
						<span class="leftname leftnamel" style="width: 180px;">统一社会信用代码：<span style="color:red">*</span></span>
						<span class="rightinfo" style="width: 400px;">
							<input style="width: 492px;" id="zzjgdm" name="zzjgdm" class="input inputrow" type="text"/>
							<span class="zmsg">请正确输入组织机构代码！</span>
						</span>
					</div>
					<div class="inputtest inputtestl" style="width: 100%">
						<span class="leftname leftnamel" style="width: 180px;">企业类型：<span style="color:red">*</span></span>
						<span class="rightinfo" style="width:520px">
							<s:radio list="%{#request.usertype}" theme="simple" name="usertype"/>
							<span class="umsg">请选择企业类型！</span>
						</span>
					</div>
	<p style="color:red;margin-left: 103px;">重要提示：高新区金融机构数据报送请选择与之匹配的"企业类型"。</p>
					<div class="revise" id="zqxxxgbtn"><input class="shenqingdkt shenqingdkthide" type="button" onclick="relasubmit();" value="保存"/></div>
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
                $('#zzjgdm').val(ui.item.code);
                checkusertype();
            },

            minLength: 2
        })
	</script>
 <%@ include file="../footer.jsp"%>

 <script type="text/javascript" >
 	leftnav_init("relaqiyeinfo");
 	function relasubmit() {
 		$(".zmsg,.qmsg,.umsg").hide();
 		var num = 1;
 		if ($.trim($("#qiyename").val()) == "") {
			$(".qmsg").show();
			num = 0;
		}
 		var zzjgdm = $.trim($("#zzjgdm").val());
 		var utype = $.trim($("input[name='usertype']:checked").val());
 		if (!(utype == "aaaaaaaaaaaaaaaaaaotherorgtype10" && zzjgdm == "")) {
 			var checkzz = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/; 
	 		if (zzjgdm == "" || !checkzz.test(zzjgdm)) {
				$(".zmsg").show();
				num = 0;
			}
 		}
		if (utype == "") {
			$(".umsg").show();
			num = 0;
		}
		if (num == 1) {
			qiyeCheckCreditId();
		}
 	}




 	function checkusertype() {
 		var name = $("#qiyename").val();
 		var type = "";
	 	if (name.indexOf("银行") != -1) {
	 		type = "aaaaaaaaaaaaaaaaaaotherorgtype02";
		} else if (name.indexOf("股权投资") != -1) {
			type = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003";
		} else if (name.indexOf("小额贷款") != -1) {
			type = "aaaaaaaaaaaaaaaaaaotherorgtype06";
		} else if (name.indexOf("担保") != -1) {
			type = "aaaaaaaaaaaaaaaaaaotherorgtype07";
		} else if (name.indexOf("保险") != -1) {
			type = "aaaaaaaaaaaaaaaaaaotherorgtype01";
		} else if (name.indexOf("证券") != -1) {
			type = "aaaaaaaaaaaaaaaaaaotherorgtype14";
		} else if (name.indexOf("期货") != -1) {
			type = "aaaaaaaaaaaaaaaaaaotherorgtype15";
		} else if (name.indexOf("租赁") != -1) {
			type = "aaaaaaaaaaaaaaaaaaotherorgtype03";
		} else if (name.indexOf("公司") != -1) {
			type = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001";
		} else {
			$('.rightinfo input[type="radio"]').removeAttr("checked");
		}
		$("label[for='usertype" + type + "']").click();
 	}

 	function qiyeCheckCreditId(zzjgdm) {
		$.ajax({
			type: 'post',
			url: "/usercenter/checkZzjgdm.html",
			dataType: "json",
			data: {
				"qiyename": $.trim($("#qiyename").val()),
				"zzjgdm": $.trim($("#zzjgdm").val()),
				"usertype": $("input[name='usertype']:checked").val()
			},
			success: function(data) {
				if (data.relaSelf == 1) {
					var msg = data.name + "已经注册，点击确认按钮自动关联到该公司";
					if (confirm(msg)) {
						qiyeRelation(data);
					}
				} else if (data.id != "") {
					var msg = data.name + "已经注册，点击确认按钮系统将发送请求到主用户（电话号码" + data.phone + "），待主用户审核,审核通过后即可自动关联";
					if (confirm(msg)) { 
						qiyeRelation(data);
					}
				} else {
					$("#relaqiyeform").submit();
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
				"relaSelf"	: data.relaSelf,
				"type"	: data.type
			},
			success: function(data) {
				alert(data.msg)
				window.location="/usercenter/usercenter.html?person.t=v";		
			}
		});
	}
 </script>
</body>
</html>
 