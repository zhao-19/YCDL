<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/newlayer/layer.js"></script>
</head>
<body class="bPageBody">
	<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
		<tr>
			<td style="text-align: right;">状态</td>
			<td style="text-align: left;" > 
					<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"  
                            listValue="name" label="状态"  
                            headerKey="" headerValue="" theme="simple" id="stat"/>  
            </td>   
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield id="qiyemingcheng" readonly="false"  theme="simple"/>
			</td>
			<td>
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="manage/declare_base!exportExcel.action?type=txdb" class="btn btn-success">
						<i class="icon-white  icon-download-alt"></i>导出
					</a>
			</td>
		</tr>
	</table>
	<table
		class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th style="display: none;">id</th>
				<th>批次</th>
				<th>企业名称</th>
				<th>补贴区间</th>
				<th>更新时间</th>
				<th>利息补贴金额</th>
				<th>担保补贴金额</th>
				<th>资料是否完整</th>
				<th>审批状态</th>
 				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/interestapp!getListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"interestapp.stat" : $("#stat").val(),
        	"interestapp.qiyemingcheng" : $("#qiyemingcheng").val()
        };
    },
    render : function(data) {
    	var sf =  $.parseJSON('${application.diccode.sf}');
    	var zqsqzt =  $.parseJSON('${application.diccode.zqsqzt}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		var lxjsksrq = timeformat(row.LXJSKSRQ);
    		var time = timeformat(row.lurushijian).substring(0, 7).replace('-', '');
    		var color = "";
    		if (time <= ${zcsbpichi}) {
    			color = "style='color:lightgray;'";
    		}
    		html.push("<tr " + color + " lang='" + lxjsksrq.substring(0, 10) + "' accesskey='" + row.lxjsjzrq + "'>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.id + "'/></td>");
    		html.push("<td style='display: none;'>" + row.id + "</td>");
    		html.push("<td>" + udf(row.pichi) + "</td>");
    		html.push("<td>" + udf(row.qiyemingcheng) + "</td>");
    		html.push("<td>" + lxjsksrq.substring(0, 10) + "到" + timeformat(row.lxjsjzrq).substring(0, 10) + "</td>");
    		html.push("<td>" + timeformat(row.lastchgtime) + "</td>");
    		html.push("<td>" + udf(row.inteamt) + "元</td>");
    		html.push("<td>" + udf(row.dbfamt) + "元</td>");
    		html.push("<td>" + udf(sf[row.zlsfwz]) + "</td>");
    		html.push("<td class='checkcolor'>" + udf(zqsqzt[row.stat]) + "</td>");
    		html.push("<td>");
    		html.push("	<a href='javascript:void(0);' onclick=\"toDetail('" + row.id + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>审核</a>");
    		html.push("	<a href=\"javascript:showreviews('" + row.id + "')\" class='btn btn-mini btn-success'>查看审核记录</a>");
    		html.push("</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});

function showreviews(id) {
	$.ajax({
         type: "post",
         url:"allPolicyApply!getReviewLog.action",
         data: {id : id, policyid : "717fe76c435d48dc82557e17ecf7a118"},
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
function toDetail(id) {
	layer.open({
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: 'interestapp!toEdit.action?e.id=' + id
	});
}
</script>
</body>
</html>
