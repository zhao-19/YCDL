<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js?${sysversion}"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
</head>
<body class="bPageBody">
	<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
		<tr class="searchshort">
			<td style="text-align: right;">用户编号</td>
            <td style="text-align: left;">
                <s:textfield id="userid" readonly="false" theme="simple"/>
            </td>
            <td style="text-align: right;">企业名称</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" id="cmpname" readonly="false"/>
            </td>
            <td style="text-align: right;">批次</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" id="pichi" readonly="false"/>
            </td>
            <td style="text-align: right;">政策名称</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" id="policy_name" readonly="false"/>
            </td>
         </tr>
         <tr>
            <td style="text-align: right;">审核状态</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"
                          listValue="name" theme="simple" label="状态" id="status"
                          headerKey="" headerValue="" />
            </td>
            <td style="text-align: right;">是否编号</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.whether.childs}" listKey="id"
                          listValue="name" theme="simple" label="是否编号" id="passnumber"
                          headerKey="" headerValue="" />
            </td>
			<td colspan="6">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
	            <th>批次</th>
	            <th>用户号</th>
	            <th style="width: 20%;">企业名称</th>
	            <th style="width: 64px;">申报时间</th>
	            <th style="width: 20%;">申报项目</th>
	            <th>审核金额</th>
	            <th>审核状态</th>
	            <th>编号</th>
	            <th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>

<form id="receipt_form" method="post" action="/manage/allPolicyApply!downxls.action" style="display: none;">
	<input name="receipt_userid" type="hidden"/>
	<input name="receipt_xtjsje" type="hidden"/>
	<input name="receipt_name" type="hidden"/>
	<input name="receipt_policyid" type="hidden"/>
</form>

<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/allPolicyApply!getListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.userid" : $("#userid").val(),
        	"e.status" : $("#status").val(),
        	"e.cmpname" : $("#cmpname").val(),
        	"e.pichi" : $("#pichi").val(),
        	"e.policy_name" : $("#policy_name").val(),
        	"e.passnumber" : $("#passnumber").val()
        };
    },
    render : function(data) {
		var zqsqzt =  $.parseJSON('${application.diccode.zqsqzt}');
		var gray = " style='color: lightgray;'";
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		var color = "";
    		var text = stimeformat(row.lurushijian) + stimeformat(row.date);
    		if (text.length == 11 && text.replace("-", "").substr(0, 6) < ${zcsbpichi}) {
				color = gray
			}
    		html.push("<tr" + color + ">");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.id + "'/></td>");
    		html.push("<td>" + udf(row.pichi) + "</td>");
    		html.push("<td>" + udf(row.userid) + "</td>");
    		html.push("<td>" + udf(row.cmpname) + "</td>");
    		html.push("<td>" + stimeformat(row.lurushijian) + stimeformat(row.date) + "</td>");
    		html.push("<td>" + udf(row.type) + "</td>");
    		html.push("<td>" + udf(row.xtjsje) + "</td>");
    		html.push("<td>" + udf(zqsqzt[row.status]) + "</td>");
    		html.push("<td>" + udf(row.passnumber) + "</td>");
    		html.push("<td nowrap='nowrap'>");
    		html.push("	<a href=\"javascript:showreviews('" + row.id + "','" + row.policyid + "')\" class='btn btn-mini btn-success'>审核记录</a>");
    		html.push("	<a href=\"javascript:downxls('" + row.userid + "','" + row.policyid + "','" + row.type + "','" + udf(row.xtjsje) + "')\" class='btn btn-mini btn-warning'><i class='icon-white icon-print'></i>下载收据</a>");
    		html.push("</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});

function downxls(userid, policyid, type, xtjsje) {
	if (xtjsje == "") {
		layer.alert("审核金额为空，不能导出！", {icon: 1, title : '提示', offset: ['20%', '35%']});
		return;
	}
	$("input[name='receipt_userid']").val(userid);
	$("input[name='receipt_xtjsje']").val(xtjsje);
	$("input[name='receipt_name']").val(type);
	$("input[name='receipt_policyid']").val(policyid);
	$("#receipt_form").submit();
}

function showreviews(id, policyid) {
	$.ajax({
         type: "post",
         url:"allPolicyApply!getReviewLog.action",
         data: {id : id, policyid : policyid},
         dataType: "json",
         success: function(data) {
             var html = "<table class='table table-striped table-bordered table-hover table-condensed'><tr><td>时间</td><td>动作</td><td>处理人</td><td style='width:70%;'>意见</td></tr>";
             for (var i = 0; i < data.length; i ++ ) {
             	html += "<tr><td>" + data[i].inputtime + "</td><td>" + data[i].result + "</td><td>" + data[i].inputuser + "</td><td>" + data[i].review_opinion + "</td></tr>"
             }
             html += "</table>"
             layer.open({
		        type:  1 ,
		        title:'审核记录',
		        skin:'layui-layer-lan bpagenarrowtitle',
		        area: ['90%', '90%'],
		        content: html,
		        btn:['关闭'],
		        btn1:function (index, layero) {
		        	 layer.close(index);
		        }
		    });
         }
     });	
}
</script>
</body>
</html>
