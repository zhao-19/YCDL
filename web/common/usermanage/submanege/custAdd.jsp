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
	<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style>
	.msg{color:red;display: none;}
</style>

<body class="FZbPageBody">
<s:form action="" id="form" theme="simple" method="post">
	<table class="table table-condensed">
		<tr class="table_title">
            <td colspan="4" class="table_title">新增用户</td>
        </tr>
	    <tr>
	        <th class="td_right">用户名<span style="color:red">*</span></th>
	        <td style="text-align: left;">
	        	<input type="hidden" name="e.status2" value="4"/>
	            <input name="e.userid" id="userid" maxlength="16"/>
	            <span class="umsg msg">请正确输入用户名！</span>
	        </td>
	        <th class="td_right">密码<span style="color:red">*</span></th>
	        <td style="text-align: left;">
	            <input name="e.password" id="password" maxlength="16"/>
	            <span class="pmsg msg">请正确输入密码！</span>
	        </td>
	    </tr>
	    <tr>
	        <th class="td_right">客户类型<span style="color:red">*</span></th>
	        <td style="text-align: left;">
	        	<s:select list="%{#application.dic.khlx.childs}" id="usertype" listKey="id"
	                	listValue="name" name="e.usertype" label="客户类型" headerKey="" headerValue=""/>
	            <span class="tmsg msg">请选择客户类型！</span>
	        </td>
	        <th class="td_right">手机号<span style="color:red">*</span></th>
	        <td style="text-align: left;">
	        	<input name="e.cellphone" id="cellphone" maxlength="11"/>
	        	<span class="cmsg msg">请正确输入手机号！</span>
	        </td>
	    </tr>
	    <tr>
	        <th class="td_right">客户经理</th>
	        <td style="text-align: left;" colspan="3">
	        	<s:select list="%{#request.accountmanagelist}" id="custmanage" listKey="username"
                	listValue="username" name="e.custmanage" label="客户经理" headerKey="" headerValue=""/>
	        </td>
	    </tr>
	    
	    <tr>
            <td colspan="4" style="text-align: center;">
	            <a href="javascript:void(0);" class="btn btn-info" onclick="addcust()">
	                <i class="icon-ok icon-white"></i>新增
	            </a>
            </td>
        </tr>
	</table>
</s:form>
<script type="text/javascript">
	function addcust()	{
		$(".msg").hide();
		var sum = 1;
		var mobilex = /^[a-zA-Z0-9_@]+$/;
		var userid = $("#userid").val();
		if (userid.length < 6 || !mobilex.test(userid)) {
			$(".umsg").show();
			sum = 0;
		}
		var password = $("#password").val();
		if (password.length < 6 || !mobilex.test(password)) {
			$(".pmsg").show();
			sum = 0;
		}
		var usertype = $("#usertype").val();
		if (usertype == "") {
			$(".tmsg").show();
			sum = 0;
		}
	 	var mobile = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
		var cellphone = $("#cellphone").val();
		if (cellphone.length != 11 || !mobile.test(cellphone)) {
			$(".cmsg").show();
			sum = 0;
		}
		/* var regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		var email = $("#email").val();
		if (email != "" && !regex.test(email)) {
			$(".emsg").show();
			sum = 0;
		} */
		if (sum == 1) {
			$.ajax({
				type: 'post',
				url: "/manage/cust!register.action",
				dataType: "json",
				data: $("#form").serialize(),
				success: function(data) {
					alert(data.msg);
					if (data.msg == "新增用户成功！") {
						window.location = "/manage/cust!getList.action?init=y";
					}
				}
			});
		}
	}
</script>
</body>
</html>