<%@page import="com.winpow.services.manage.catalog.bean.Catalog" %>
<%@page import="java.util.List" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
</head>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.min.css"/>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<style>
	.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
	.msg{color:red;display: none;}
	td,th{padding:15px !important;}
</style>

<body>
<s:form action="" id="form" theme="simple" method="post">
	<table class="table table-condensed">
		<tr>
            <td colspan="2" class="table_title">新增企业
            <input type="hidden" id="dizhi" name="dizhi"/>
            <input type="hidden" id="zhuceziben" name="zhuceziben"/>
            <input type="hidden" id="faren" name="faren"/>
            <input type="hidden" id="chengliriqi" name="chengliriqi"/>
            <input type="hidden" id="jingyingfanwei" name="jingyingfanwei"/>
            </td>
        </tr>
	    <tr>
	        <th class="td_right">企业名称<span style="color:red">*</span></th>
	        <td style="text-align: left;">
	        	<input name="qiyename" id="qiyename" maxlength="128" style="width: 70%" auto-complete auto-complete-data="autoCompleteData"/>
	            <span class="umsg msg">请正确输入企业名称！</span>
	        </td>
	    </tr>
	    <tr>
	        <th class="td_right">统一社会信用代码<span style="color:red">*</span></th>
	        <td style="text-align: left;">
	            <input name="zzjgdm" id="zzjgdm" maxlength="36" style="width: 70%"/>
	            <span class="pmsg msg">请正确输入统一社会信用代码！</span>
	        </td>
	    </tr>
	    <tr>
	        <th class="td_right">手机号<span style="color:red">*</span></th>
	        <td style="text-align: left;">
	        	<input name="cellphone" id="cellphone" maxlength="11" style="width: 70%"/>
	        	<span class="cmsg msg">请正确输入手机号！</span>
	        </td>
	    </tr>
	    <tr>
            <td colspan="4" style="text-align: center;">
	            <a href="javascript:void(0);" class="btn btn-info" onclick="addqiye()">
	                <i class="icon-ok icon-white"></i>新增
	            </a>
            </td>
        </tr>
	</table>
</s:form>
<script type="text/javascript">
	function addqiye()	{
		$(".msg").hide();
		var sum = 1;
		if ($("#qiyename").val() == "") {
			$(".umsg").show();
			sum = 0;
		}
		var zzjgdm = $("#zzjgdm").val();
		var zzcheck = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
		if (!zzcheck.test(zzjgdm)) {
			$(".pmsg").show();
			sum = 0;
		}
	 	var mobile = /^((0\d{2,3}-\d{7,8})|(1[3456789]\d{9}))$/;
		var cellphone = $("#cellphone").val();
		if (cellphone.length != 11 || !mobile.test(cellphone)) {
			$(".cmsg").show();
			sum = 0;
		}
		if (sum == 1) {
			$.ajax({
				type: 'post',
				url: "/manage/cust!addQiyeImpl.action",
				dataType: "json",
				data: $("#form").serialize(),
				success: function(data) {
					layer.confirm(data.msg, {
						title:"提示",btn:['确定'],area: ['200px', '200px']
			        }, function(index) {
			            layer.close(index);
			            if (data.msg == "新增企业成功！") {
							window.parent.location = "/manage/cust!getList.action?init=y";
						}	
			        });
				}
			});
		}
	}
	
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
                                   code: item.credit_code,
                                   dizhi: item.address,
                                   zhuceziben: item.regist_capi,
                                   faren: item.oper_name,
                                   chengliriqi: item.term_start,
                                   jingyingfanwei: item.business_scope
                               }
                           }));
                   }
               });
           },
           select: function(event, ui) {
           	   var riqi = ui.item.chengliriqi;
               $('#zzjgdm').val(ui.item.code);
               $('#dizhi').val(ui.item.dizhi);
               $('#zhuceziben').val(ui.item.zhuceziben);
               $('#faren').val(ui.item.faren);
               $('#chengliriqi').val((riqi == null || riqi.length < 10) ? riqi : riqi.substr(0,10));
               $('#jingyingfanwei').val(ui.item.jingyingfanwei);
           },
           minLength: 2
       });
</script>
</body>
</html>