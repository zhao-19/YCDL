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
	
	<%@ include file="/resource/common_html_meat.jsp"%>
	<link rel="stylesheet" href="../css/massage.css"/>
	
	<style type="text/css">
		.table TD{vertical-align:middle;}
		INPUT[type='text']{margin-bottom:0px;}
		.pageLink{padding-top:2px!important;}
		.selectPageLink {padding-top:3px!important;}
		.shjlTab{
		    display:none;
		    border-radius: 5px;z-index: 1000;height:60%;overflow: hidden;
		    width:700px;position: fixed;left:50%;top:50%;margin-left:-350px;border: 1px solid #e2e2e2;
		    transform:translateY(-50%);-ms-transform:translateY(-50%);-moz-transform:translateY(-50%); -webkit-transform:translateY(-50%);-o-transform:translateY(-50%);
		    background:#fff;box-sizing: border-box;  padding: 5px 25px 30px;  box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
		}
		#str input{width:150px}
	</style>
</head>
<body class="bPageBody" >
	<div class="bodyBox" style="padding-top:60px !important;">
	<table class="table table-bordered table-condensed table-search">
		<tr id="str">
			<td style="text-align: right;">业务名称</td>
			<td style="text-align: center;" >
				<s:textfield id="bus_name" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">申请人公司名称</td>
			<td style="text-align: center;" >
				<s:textfield id="companyname" readonly="false" theme="simple"/>
			</td>

			<td style="text-align: right;">当前处理人</td>
			<td style="text-align: center;" >
				<s:textfield id="dealuserid" readonly="false" theme="simple"/>
			</td>
			
			<td style="text-align: right;">节点名称</td>
			<td style="text-align: center;" >
				<s:textfield id="nodename" readonly="false" theme="simple"/>
			</td>
			<td>
				<button class="btn btn-primary" id="query" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
			</td>
		</tr>
	</table>
	<table
		class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th>系统</th>
				<th>前一处理人</th>
				<th>业务名称</th>
				<th>申请人公司名称</th>
				<th>当前处理人</th>
				<th>处理人名称</th>
				<th>节点名称</th>
				<th style="width: 115px">任务发送时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<div style="display: none" id="loaddata" onclick="getpage();"></div>	
<script type="text/javascript">
var querytype = '${querytype}';
var adminnow = '${adminnow}';
var load = false;
function getpage() {
	if (load) {
		return;
	}
	load = true;
	$('#pagebar').bPage({
	    url : 'user!getTaskListDate.action',
	    asyncLoad : true,
	    params : function() {
	        return {
	        	"querytype" : querytype,
	        	"bus_name" : $("#bus_name").val(),
	        	"companyname" : $("#companyname").val(),
	        	"dealuserid" : $("#dealuserid").val(),
	        	"issubstation" : '${issubstation}',
	        	"nodename" : $("#nodename").val()
	        };
	    },
	    render : function(data) {
			if (data.msg != "") {
				layer.alert(data.msg, {icon: 7, title : '提示'});
				return;
			}
	    	var html = new Array();
	    	for (var i = 0; i < data.list.length; i ++ ) {
	    		var row = data.list[i];
	    		var dealuserid = udf(row.dealuserid);
	    		var taskid = udf(row.taskid);
	    		var instanceid = udf(row.instanceid);
	    		var creator = udf(row.creator);
	    		var app_key = udf(row.app_key);
	    		var title = udf(row.title);
	    		html.push("<tr>");
	    		html.push("<td>" + udf(row.sys_id) + "</td>");
	    		html.push("<td>" + udf(row.senduserid) + "</td>");
	     		html.push("<td>" + udf(row.bus_name) + "</td>");
	    		html.push("<td>" + udf(row.companyname) + "</td>");
	    		html.push("<td>" + dealuserid + "</td>");
	    		html.push("<td>" + udf(row.dealusername) + "</td>");
	    		html.push("<td>" + udf(row.nodename) + "</td>");
	    		html.push("<td>" + udf(row.sendtime) + "</td>");
	    		html.push("<td style='white-space: nowrap;'>");
	    		if (querytype == 0 || querytype == 1) {
		    		html.push("<a onclick='toDetail(this)' href='javascript:void(0)' table='" + udf(row.app_table) + "' ");
		    		html.push("	instanceid='" + instanceid + "' pkid='" + app_key + "' creator='" + creator + "' ");
		    		html.push("	buttons='" + JSON.stringify(row.buttons) + "' titles='" + udf(row.title) + "' nodeid='" + udf(row.nodeid) + "' ");
		    		html.push("	taskid='" + taskid + "' buttonlistnum='" + udf(row.buttonlistnum) + "' buttonlistname='" + udf(row.buttonlistname) + "' ");
		    		html.push("	class=\"btn btn-mini btn-info czda\">详细信息</a>");
	    		}
	    		html.push("<span class='btn btn-mini btn-success moreoper'>更多操作 <i></i>");
	    		html.push("<ul class='moreoperlist'>");
	    		
	    		for (var j = 0; j < row.buttons.length; j ++ ) {
	    			var button = row.buttons[j];
	    			if (adminnow == 'B_admin' || adminnow == dealuserid || button.type == "14101" || button.type == "14102" || button.type == "14103") {
	    				html.push("<li><span taskid='" + taskid + "' apporpc='" + button.apporpc + "' type='" + button.type + "' ");
	    				html.push("instanceid='" + instanceid + "' userid='" + creator + "' buttonid='" + button.id + "' ");
	    				html.push("pkid='" + app_key + "' class='oper'><span>" + button.name + "</span> ");
	    				html.push("<div style='display:none;' class='title'>" + title + "</div></span></li> ");
	    			}
	    		}
	    		if (adminnow == 'B_admin' || adminnow == 'B_zoutao' || adminnow == dealuserid) {
	   				html.push("<li><span creator='" + creator + "' taskid='" + taskid + "' olduserid='" + dealuserid + "' class='radio'><span>替换办理人</span></span></li>");
	   			}
	    		html.push("</ul></span></td></tr>");
	    	}
	    	$('#bpagetbody').html(html.join(""));
	    	window.scrollTo(0, 0);
	    }
	});
}
var ahref = $('#tabs .ui-tabs-active a', parent.document).attr("href");
if ((ahref == "#tabs-0" && querytype == 0) || (ahref == "#tabs-1" && querytype == 1)){
	getpage()
};
</script>




<jsp:include   page="taskButton.jsp" flush="true"/>
<form style="display: none;" id="toAllDetail" action="user!toAllDetail.action" method="post">
	 <input type="hidden" name="instanceid"/>
	 <input type="hidden" name="taskid"/>
	 <input type="hidden" name="buttons"/>
	 <input type="hidden" name="title"/>
	 <input type="hidden" name="app_key"/>
	 <input type="hidden" name="app_table"/>
	 <input type="hidden" name="creator"/>
	 
	 <input type="hidden" name="e.id"/>
	 <input type="hidden" name="buttonlistnum"/>
	 <input type="hidden" name="buttonlistname"/>
	 <input type="hidden" name="incre.id"/>
	 <input type="hidden" name="product.id"/>
	 <input type="hidden" name="type"/>
</form>


<script type="text/javascript">
function toDetail(obj) {
	$("#tabHead",parent.document).css('display','none')
	var tablename=$(obj).attr("table");
	var pkid=$(obj).attr("pkid");
	var nodeid=$(obj).attr("nodeid");
	var taskid=$(obj).attr("taskid");
	var buttonlistnum=$(obj).attr("buttonlistnum");
	var buttonlistname=$(obj).attr("buttonlistname");
	var instanceid=$(obj).attr("instanceid");
	var buttons=$(obj).attr("buttons");
	var title=$(obj).attr("titles");
	var creator=$(obj).attr("creator");
	if ('${querytype}' == "1") {
		buttons = "[]";
	}
	$("input[name='instanceid']").val(instanceid);
	$("input[name='taskid']").val(taskid);
	$("input[name='buttons']").val(buttons);
	$("input[name='title']").val(title);
	$("input[name='app_key']").val(pkid);
	$("input[name='app_table']").val(tablename);
	$("input[name='creator']").val(creator);
	if (tablename=="tb_product_app"){
		$("#toAllDetail").attr("action", "/manage/productapp!toEdit2.action");
		$("input[name='e.id']").val(pkid);
	}else if (tablename=="tb_guquan"){
		$("#toAllDetail").attr("action", "/manage/guquan!toNewEdit.action");
		$("input[name='e.id']").val(pkid);
		$("input[name='buttonlistnum']").val(buttonlistnum);
		$("input[name='buttonlistname']").val(buttonlistname);
	}else if (tablename=="tb_incre"){
		$("#toAllDetail").attr("action", "/manage/appGoods!toEdit.action");
		$("input[name='incre.id']").val(pkid);
		$("input[name='type']").val(2);
	}else if (tablename=="tb_product"){
		$("#toAllDetail").attr("action", "/manage/appGoods!toEdit.action");
		$("input[name='product.id']").val(pkid);
		$("input[name='type']").val(3);
       } else {
       	$("#toAllDetail").attr("action", "/manage/user!toAllDetail.action");
	}
	layer.open({
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: '/manage/system/taskListform.jsp',
	    end:function(index){ 
	    	$("#tabHead",parent.document).css('display','block')
        }

	});
	//$("#toAllDetail").submit();
}

	$("#ctype").val('${ctype}');
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 7, title : '提示'});
	}
</script>
</body>
</html>
