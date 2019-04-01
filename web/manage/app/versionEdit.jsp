<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <style>
		.td_right{text-align: right;width: 130px;}
		select{height: auto;}
		.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/artDialog/art_dialog1.js"></script>
	<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
</head>
<body>
<s:form action="/manage/appCommon!update.action" id="form" name="form" theme="simple" method="post">
    <table class="table table-bordered">
    	<tr>
            <td colspan="4" class="table_title">版本管理<span style="color:red;font-size:12px">（谨慎操作，否则可能导致APP不可用。）</span></td>
        </tr>
        <tr>
            <th class="td_right">设备类型<s:hidden name="e.pkid"/></th>
            <td style="text-align: left;">
            	<select name="e.genre" id="genre">
				    <option value="android">android</option>
				    <option value="ios">ios</option>
				</select>
            </td>
            <th class="td_right">版本</th>
            <td style="text-align: left;">
            	<s:textfield name="e.version" id="version" readonly="false"/>（格式举例：2.1.5）
            	<s:hidden name="e.long_version" id="longversion"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">是否生效</th>
            <td style="text-align: left;">
				<s:select list="%{#application.dic.whether.childs}" listKey="id" id="chstatus"
                                  listValue="name" name="e.chstatus" label="是否激活"/>
            </td>
            <th class="td_right">是否需要更新</th>
            <td style="text-align: left;">
            	<select name="e.isupdate" id="isupdate">
				    <option value="10601">不需要</option>
				    <option value="10602">推荐更新</option>
				    <option value="10603">强制更新</option>
				</select>
            </td>
        </tr>
        <tr>
            <th class="td_right">更新信息</th>
            <td style="text-align: left;" colspan="3">
            	<s:textarea rows="6" cols="120" name="e.info" id="info" readonly="false"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">录入时间</th>
            <td style="text-align: left;">${fn:substring(e.create_time, 0, 19)}</td>
            <th class="td_right">录入人</th>
            <td style="text-align: left;">${e.publisherid }</td>
        </tr>
        <tr>
            <th class="td_right">修改时间</th>
            <td style="text-align: left;" colspan="3">${fn:substring(e.update_at, 0, 19)}</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
	            <button type="button" class="btn btn-success" onclick="submitver();">
	                <i class="icon-ok icon-white"></i> 保存
	            </button>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
	$("#genre").val('${e.genre}')
	$("#isupdate").val('${e.isupdate}')
	if ('${e.pkid}' == "") {
		$("#form").attr("action", "/manage/appCommon!insert.action");
	}
	
	function submitver() {
		var ver = $.trim($("#version").val());
		var ve = ver.split(".");
		if (ver == "" || ve.length!=3) {
			alert("版本号不正确！");
			return;
		}
		var longver = "";
		for (var i = 0;i < ve.length; i ++ ) {
			var v = ve[i];
			if (v.length == 1) {
				v = "00" + v;
			} else if (v.length == 2){
				v = "0" + v;
			} else if (v.length != 3) {
				alert("版本号不正确！");
				return;
			}
			longver += v;
		}
	    if (/^[0-9]*$/.exec(longver) == null) {
	        alert("版本号不正确！");
	        return;
	    }
		$("#longversion").val(longver);
		$("#form").submit();
	}
</script>
</body>
</html>