<%@page import="com.winpow.services.manage.catalog.bean.Catalog" %>
<%@page import="java.util.List" %>
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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
	<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
	<script type="text/javascript">
	    $(function () {
	        $("#tabs").tabs({});
	    });
	</script>
	<style type="text/css">
		.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
		#custTable a{color: blue;font-size: 10px;}
		.custmsg{color: red;}
	</style>
</head>
<body>
    <div style="text-align: center;">
	      	用户ID：<span class="badge badge-success"></span>
	       <button type="button" onclick="summitform();" class="btn btn-success">
	           <i class="icon-ok icon-white"></i> 保存
	       </button>
    </div>
    <div id="tabs">
        <ul>
            <li><a href="#tabs-4">用户信息</a></li>
        </ul>
        <div id="tabs-4">
             <table id="custTable" class="table table-condensed">
             	<s:iterator value="custList">
	             	<tbody>
		             <tr>
			            <td colspan="4" class="table_title">
			            	<input type="hidden" name="cust.id" value="${id }"/>
			            	用户信息<span class="custlength">1</span>&nbsp;
			            	<a href="javascript:void(0);" onclick="custdel(this);">删除</a>
			            </td>
			        </tr>
				    <tr>
				    	<th class="td_right">手机号<span style="color:red">*</span></th>
				        <td style="text-align: left;">
				        	<input name="cust.cellphone" onblur="checkcust(this);" value="${cellphone }"/>
				        </td>
				        <th class="td_right">客户类型<span style="color:red">*</span></th>
				        <td style="text-align: left;">
				        	<select name="cust.usertype" onchange="custtypechange(this);" value="${usertype }">
							    <option value=""></option>
							    <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001">企业客户</option>
							    <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003">投资机构</option>
							    <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008">其它机构</option>
							    <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002">个人用户</option>
							</select>
				        </td>
				    </tr>
				    </tbody>
			    </s:iterator>
            </table>
            <div><a href="javascript:void(0);" class="btn btn-info" onclick="addcust()"><i class="icon-plus icon-white"></i>添加用户</a></div>
            <br/><br/>
            <table id="qiyeTable" class="table table-condensed">
            	<tr>
		            <td colspan="4" class="table_title">企业信息<input type="hidden" name="qiye.pk_qiyeid" value="${qiye.pk_qiyeid }"/></td>
		        </tr>
			    <tr>
			    	<th class="td_right">组织机构代码<span style="color:red">*</span></th>
			        <td style="text-align: left;">
			            <input name="qiye.zzjgdm" onblur="checkqiye(this);" value="${qiye.zzjgdm }"/>
			        </td>
			        <th class="td_right">企业名称<span style="color:red">*</span></th>
			        <td style="text-align: left;">
			            <input name="qiye.qiyemingcheng" value="${qiye.qiyemingcheng }"/>
			        </td>
			    </tr>
			  </table>
        </div>
    </div>
<script type="text/javascript">
	function addcust() {
		var html = "<tbody><tr><td colspan=\"4\" class=\"table_title\"><input type=\"hidden\" name=\"cust.id\"/>用户信息<span class=\"custlength\"></span>&nbsp;<a href=\"javascript:void(0);\" onclick=\"custdel(this);\">删除</a></td></tr>";
		html += "<tr><th class=\"td_right\">手机号<span style=\"color:red\">*</span></th><td style=\"text-align: left;\"><input name=\"cust.cellphone\" onblur=\"checkcust(this);\"/></td>";
		html += "<th class=\"td_right\">客户类型<span style=\"color:red\">*</span></th><td style=\"text-align: left;\"><select name=\"cust.usertype\" onchange=\"custtypechange(this);\"><option value=\"\"></option>";
		html += "<option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001\">企业客户</option><option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003\">投资机构</option><option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008\">其它机构</option><option value=\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002\">个人用户</option></select></td></tr></tbody>";
		$("#custTable").append(html);
		custlength();
		custtypechange($("select[name='cust.usertype']:first"));
	}
	
	if ($.trim($("#custTable").html()) == "") {
		addcust();
	} else {
		$("select[name='cust.usertype']").each(function(){
			$(this).val($(this).attr("value"));
		});
	}
	
	function custlength() {
		$(".custlength").each(function(i){
			$(this).html(i + 1);
		});
	}
	function custdel(obj) {
		$(obj).parents('tbody').remove();
		custlength();
	}
	var submitcheck = true;
	function summitform() {
		$(".custmsg").remove();
		submitcheck = true
		var cust = new Array();
		var custlen = $(".custlength").length;
		if (custlen == 0) {
			alert("请添加用户。");
		}
		for (var i = 0; i < $(".custlength").length; i++ ) {
			var data = new Object();
			cust[i] = data;
		}
		var field = new Array("id", "usertype", "cellphone");
		var fcheck = new Array("0", "2", "3");
		for (var i = 0; i < field.length; i++) {
			$("[name='cust." + field[i] + "']").each(function(j){
				cust[j][field[i]] = checkPara(this, fcheck[i]);
			});
		}
		
		var qiye = new Object();
		var field2 = new Array("pk_qiyeid", "zzjgdm", "qiyemingcheng");
		var fcheck2 = new Array("0", "1", "2");
		for (var i = 0; i < field.length; i++) {
			qiye[field2[i]] = checkPara($("[name='qiye." + field2[i] + "']"), fcheck2[i]);
		}
		if (submitcheck) {
			var para = new Object();
			para.scust = JSON.stringify(cust);
			para.sqiye = JSON.stringify(qiye);
			$.ajax({
				type: 'post',
				url: "/manage/cust!saveAllData.action",
				data: para,
				dataType:"json",
				success: function(data){
					alert(data.msg);
				}
			});
		} else {
			alert("验证失败，请检查后重新提交");
		}
	}
	
	function checkPara (obj, num) {
		var val = $.trim($(obj).val());
		var err = "<span class='custmsg'>请正确输入</span>";
		var err1 = "<span class='custmsg'>请选择</span>";
		if (num == 1) {	// 组织机构代码
			var zzjgdm = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
			if (val == "" || !zzjgdm.test(val)) {
				$(obj).after(err);
				submitcheck = false;
			}
		} else if (num == 2) {	//不为空
			if (val == "") {
				$(obj).after(err1);
				submitcheck = false;
			}
		} else if (num == 3) {	// 手机号
			var mobile = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
			if (val.length != 11 || !mobile.test(val)) {
				$(obj).after(err);
				submitcheck = false;
			}
		}
		return val;
	}
	function custtypechange(obj) {
		$("select[name='cust.usertype']").each(function(){
			$(this).val($(obj).val());
		});
	}
	function checkcust(obj){
		var val = $.trim($(obj).val());
		if (val == "") {
			return;
		}
		$.ajax({
			type: 'post',
			url: "/manage/cust!checkcust.action",
			data: {"userid" : val},
			dataType: "json",
			success: function(data){
				if (data.msg != "succ") {
					if (confirm(data.msg)) { 
						$(obj).parents('tbody').find("input[name='cust.id']").val(data.id);
						$(obj).parents('tbody').find("input[name='cust.cellphone']").val(data.cellphone);
						var usertype = $(obj).parents('tbody').find("select[name='cust.usertype']");
						usertype.val(data.usertype);
						custtypechange(usertype);
						if (typeof(data.pk_qiyeid) != "undefined") {
							$("input[name='qiye.pk_qiyeid']").val(data.pk_qiyeid);
							$("input[name='qiye.zzjgdm']").val(data.zzjgdm);
							$("input[name='qiye.qiyemingcheng']").val(data.qiyemingcheng);
						}
					}
				} else {
					$(obj).parents('tbody').find("input[name='cust.id']").val("");
				}
			}
		});
	}
	function checkqiye(obj){
		var val = $.trim($(obj).val());
		if (val == "") {
			return;
		}
		$.ajax({
			type: 'post',
			url: "/manage/cust!checkzzjgdm.action",
			data: {"zzjgdm" : val},
			dataType:"json",
			success: function(data){
				if (data.msg != "succ") {
					if (confirm(data.msg)) { 
						$("[name='qiye.pk_qiyeid']").val(data.pk_qiyeid);
						$("[name='qiye.zzjgdm']").val(data.zzjgdm);
						$("[name='qiye.qiyemingcheng']").val(data.qiyemingcheng);
					}
				} else {
					$("[name='qiye.pk_qiyeid']").val("");
				}
			}
		});
	}
</script>

</body>
</html>
