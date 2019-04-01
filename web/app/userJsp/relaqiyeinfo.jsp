<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
	<jsp:param name="title" value="关联企业"/>
</jsp:include>
<body class="relaqiye">
<form id="relaqiyeform" action="/app/saveRelaqiyeinfo.action" method="post">
	<input type="hidden" name="token" value="${token }">
	<div class="group">
		<span>企业名称&nbsp;|</span><input type="text" placeholder="请输入企业名称" auto-complete auto-complete-data="autoCompleteData" maxlength="32" id="qiyename" name="qiyename" >
	</div>
	<div class="group">
		<span>统一社会信用代码&nbsp;|</span><input type="text" placeholder="请输入统一社会信用代码" id="zzjgdm" name="zzjgdm">
	</div>
	<div class="group">
		<span>企业类型&nbsp;|</span>
		<s:select list="%{#request.usertype}" theme="simple" name="usertype" headerKey="" headerValue=""/>
	</div>

	<input type="button" class="tj" value="保存" onclick="relasubmit()"/>
</form>
<p class="notice">重要提示：高新区金融机构数据报送请选择与之匹配的"企业类型"。</p>
<div class="tip">
	<p class="ifname">请正确输入企业名称</p>
	<p class="ifcode">请正确输入统一社会信用代码</p>
	<p class="ifkind">请选择企业类型</p>
</div>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
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
        } else {
            $('.group option').removeAttr("selected");
        }
        $(".group option[value='usertype" + type + "']").attr('selected');
    }



	function qiyeCheckCreditId(zzjgdm) {
		$.ajax({
			type: 'post',
			url: "/app/checkZzjgdm.action",
			dataType: "json",
			data: {
				"token" : '${token}',
				"zzjgdm": zzjgdm,
				"usertype": $("select[name='usertype']").val()
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
			url: "/app/relation.action",
			dataType: "json",
			data: {
				"token" : '${token}',
				"id"    : data.id,
				"relaId": data.relaId,
				"name"	: data.name,
				"relaSelf"	: data.relaSelf,
				"type"	: data.type
			},
			success: function(data) {
				alert(data.msg)
				window.location="/app/relaqiyesucc.action";		
			}
		});
	}
	
	function relasubmit() {
 		$(".tip,.ifname,.ifcode,.ifkind").hide();
 		var num = 1;
 		if ($.trim($("#qiyename").val()) == "") {
			$(".tip,.ifname").show(100,function(){
                setTimeout("$('.tip,.ifname').fadeOut(200);",2000);
			});
			num = 0;
		}
 		var zzjgdm = $.trim($("#zzjgdm").val());
 		var checkzz = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/; 
 		if (zzjgdm == "" || !checkzz.test(zzjgdm)) {
			$(".tip,.ifcode").show(100,function(){
                setTimeout("$('.tip,.ifcode').fadeOut(200);",2000);
			});
			num = 0;
		}
		if ($.trim($("select[name='usertype']").val()) == "") {
			$(".tip,.ifkind").show(100,function(){
                setTimeout("$('.tip,.ifkind').fadeOut(200);",2000);
			});
			num = 0;
		}
		if (num == 1) {
			qiyeCheckCreditId(zzjgdm);
		}
 	}
</script>

</body>
</html>