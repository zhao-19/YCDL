<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
    <style>
		.td_right{text-align: right;width: 130px;}
		select{height: auto;}
		.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
		.smmk th,.smmk td{border: 1px solid #ddd;}
		input[type="text"]{width:302px;}
    </style>
   	<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<s:form action="/manage/tbsbpolicy!update.action" id="form" name="form" theme="simple" method="post">
    <table class="table table-bordered">
    	<tr>
            <td colspan="4" class="table_title">政策详情
            	<s:hidden name="e.id"/>
            </td>
        </tr>
    	<tr>
            <th class="td_right">政策名称</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.policy_name" maxlength="32"/></td>
            <th class="td_right">申报时间</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.sub_time" maxlength="128"/></td>
        </tr>
        <tr>
            <th class="td_right">大类编号</th>
            <td style="text-align: left;">
           		<s:select id="toptype_code" name="e.toptype_code" onchange="getsmall();" list="#request.bigcode" listKey="key" listValue="value" value="e.toptype_code" headerKey="" headerValue=""/> 	
           </td>
            <th class="td_right">大类名称</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.toptype_name" maxlength="32"/></td>
        </tr>
        <tr>
            <th class="td_right">小类编号</th>
            <td style="text-align: left;">
            	<s:select id="type_code" name="e.type_code" list="#request.smallcode" listKey="key" listValue="value" value="e.type_code" headerKey="" headerValue=""/>
           	</td>
            <th class="td_right">小类名称</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.type_name" maxlength="32"/></td>
        </tr>
        <tr>
            <th class="td_right">申报项目和标准</th>
            <td style="text-align: left;" colspan="3"><s:textarea theme="simple" rows="3" cols="120" name="e.sub_describe" maxlength="2048"/></td>
        </tr>
        <tr>
            <th class="td_right">补贴金额</th>
            <td style="text-align: left;" colspan="3"><s:textfield style="width:857px;" theme="simple" name="e.sub_amount" maxlength="128"/></td>
        </tr>
        <tr>
            <th class="td_right">申报条件</th>
            <td style="text-align: left;" colspan="3"><s:textarea theme="simple" rows="3" cols="120" name="e.sub_condition" maxlength="2048"/></td>
        </tr>
        <tr>
            <th class="td_right">申报资料</th>
            <td style="text-align: left;" colspan="3">
            	<s:textarea id="materials" theme="simple" rows="4" cols="120" name="e.sub_materials" maxlength="1024"/>
            	 <table class="table table-bordered smmk" style="border-collapse: collapse;">
            	 		<thead>
            	 			<tr>
	            	 			<th class="td_right"><s:select id="submas" style="width:300px;" list="#request.tplx" listKey="key" listValue="value" headerKey="" headerValue=""/></th>
	            	 			<td colspan="2"><button type="button" class="btn btn-info" onclick="addme();"><i class="icon-plus icon-white"></i>添加申报材料</button></td>
            	 			</tr>
            	 			<tr>
            	 				<th class="td_right">编号</th><td style="text-align: left;" colspan="2">名称</td>
            	 			</tr>
            	 		</thead>
            	 		<tbody id="matbody">
	            	 		<c:forEach var="e" items="${submap}">
			                    <tr><th class="td_right allkey">${e.key }</th><td style="text-align: left;">${e.value }</td><td style="text-align: left;"><button type="button" class="btn btn-info" onclick="delme(this);"><i class="icon-minus icon-white"></i>删除</button></td></tr>
			                </c:forEach>
		                </tbody>
			      </table>
            </td>
        </tr>
        <tr>
            <th class="td_right">受理部门</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.accepting_department" maxlength="128"/></td>
            <th class="td_right">申报平台</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.sub_platform" maxlength="128"/></td>
        </tr>
        <tr>
            <th class="td_right">是否开放申请</th>
            <td style="text-align: left;">
            	<s:select theme="simple" list="#{'1':'是','0':'否'}" name="e.open_stat" listKey="key" listValue="value"  headerKey="" headerValue=""/>
            </td>
            <th class="td_right">提示信息</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.tips" maxlength="128"/></td>
        </tr>
        <tr>
            <th class="td_right">是否加精</th>
            <td style="text-align: left;">
            	<s:select theme="simple" list="#{'1':'是','0':'否'}" name="e.ishot" listKey="key" listValue="value"  headerKey="" headerValue=""/>
            </td>
            <th class="td_right">排序</th>
            <td style="text-align: left;">
            	<s:select name="e.sort" list="#request.sortmap" listKey="key" listValue="value" value="e.sort" headerKey="" headerValue=""/>
            </td>
        </tr>
        <tr>
            <th class="td_right">申请类型</th>
            <td style="text-align: left;">
            	<s:select theme="simple" list="#{'1':'企业','2':'机构','4':'全部'}" name="e.policy_type" listKey="key" listValue="value"  headerKey="" headerValue=""/>
            </td>
            <th class="td_right">项目编号</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.policy_item" maxlength="16"/></td>
        </tr>
        <tr>
            <th class="td_right">申请链接</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.url" maxlength="128"/></td>
            <th class="td_right">政策表名</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.table_mame" maxlength="128"/></td>
        </tr>
        <tr>
            <th class="td_right">政策分类</th>
            <td style="text-align: left;">
            	<s:select name="e.relaid" list="#request.region" listKey="key" listValue="value" value="e.relaid"  headerKey="" headerValue=""/>
            </td>
            <th class="td_right">政策发布时间</th>
            <td style="text-align: left;">
            	<input type="text" class="Wdate" value="${e.pubdate }" name="e.pubdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss'  })"  />
            </td>
        </tr>
        <tr>
            <th class="td_right">政策来源名称</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.from_name" maxlength="128"/></td>
            <th class="td_right">政策来源网站</th>
            <td style="text-align: left;"><s:textfield theme="simple" name="e.from_sites" maxlength="128"/></td>
        </tr>
        <tr>
            <th class="td_right">录入时间</th>
            <td style="text-align: left;">${e.lurushijian }</td>
            <th class="td_right">录入人</th>
            <td style="text-align: left;">${e.inputuser }</td>
        </tr>
        <tr>
            <th class="td_right">修改时间</th>
            <td style="text-align: left;">${e.lastchgtime }</td>
            <th class="td_right"></th>
            <td style="text-align: left;"></td>
        </tr>
        <tr>
      		<td colspan="4" style="text-align: center;">
      			<button type="submit" class="btn btn-success"><i class="icon-ok icon-white"></i>保存</button>
      		</td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
	function getsmall() {
		var val = $("#toptype_code").val();
		if (val != "") {
			val = parseInt(val);
			var html = "<option value=\"\"></option>";
			for (var i = val + 1; i < val + 100; i ++ ) {
				html += "<option value=\"" + i + "\">" + i + "</option>";
			}
			$("#type_code").html(html);
		}
	}
	
	function setmaterials() {
		var arr = new Array();
		$(".allkey").each(function(i){
			arr[i] = $(this).html();
		});
		$("#materials").val(arr.join(","));
	}
	
	function addme() {
		var text = $("#submas").find("option:selected").text();
		var val = $("#submas").val();
		if (val != "") {
			var x = 0;
			$(".allkey").each(function(i){
				if ($(this).html()==val) {
					x = 1;
				}
			});
			if (x == 0) {
				$("#matbody").html($("#matbody").html() + "<tr><th class=\"td_right allkey\">" + val + "</th><td style=\"text-align: left;\">" + text + "</td>"
				+ "<td style=\"text-align: left;\"><button type=\"button\" class=\"btn btn-info\" onclick=\"delme(this);\"><i class=\"icon-minus icon-white\"></i>删除</button></td></tr>");
				setmaterials();
			}
		}
	}
	
	function delme(obj) {
		$(obj).parent().parent().remove()
		setmaterials();
	}
	setmaterials();
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
</body>
</html>