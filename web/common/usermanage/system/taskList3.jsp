<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
	<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
	<link rel="stylesheet" href="/js/bPage/b.page.css?${sysversion}">
    <link rel="stylesheet" href="/js/bPage/b.page.css?${sysversion}">
    <link rel="stylesheet" href="/css/massage.css?${sysversion}"/>
	<script type="text/javascript" src="/js/bPage/b.page.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/newlayer/layer.js?${sysversion}"></script>
	
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
	</style>
</head>
<body  class="bPageBody FZbPageBody">
<div class="bodyBox" style="padding-top:60px !important;">
	<table class="table  table-condensed table-search">
		<tr>
			<td style="text-align: right;">业务名称</td>
			<td style="text-align: center;" >
				<s:textfield id="bus_name" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">申请人公司名称</td>
			<td style="text-align: center;" >
				<s:textfield id="companyname" readonly="false" theme="simple"/>
			</td>
			<td>
				<button class="btn btn-warning" id="query" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
			</td>
		</tr>
	</table>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr class="table_title">
				<th>系统</th>
                <th>业务名称</th>
                <th>业务类别</th>
                <th>申请人公司名称</th>
                <th>创建人id</th>
                <th>创建人名称</th>
                <th>状态名</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
<div style="display: none" id="loaddata" onclick="getpage();"></div>	
<script type="text/javascript">
var querytype = '${querytype}';
var load = false;
function getpage() {
	if (load) {
		return;
	}
	load = true;
	$('#pagebar').bPage({
	    url : '/usermanage/getTaskListDate.html',
	    asyncLoad : true,
	    params : function() {
	        return {
	        	"querytype" : querytype,
	        	"bus_name" : $("#bus_name").val(),
	        	"companyname" : $("#companyname").val(),
	        	"issubstation" : '${issubstation}'
	        };
	    },
	    render : function(data) {
			if (data.msg != "") {
				layer.alert(data.msg, {icon: 7, title : '提示'});
				return;
			}
			var msgdata =  $.parseJSON('${application.diccode.msgdata}');
	    	var html = new Array();
	    	for (var i = 0; i < data.list.length; i ++ ) {
	    		var row = data.list[i];
	    		html.push("<tr>");
	    		html.push("<td>" + udf(row.sys_id) + "</td>");
	     		html.push("<td>" + udf(row.bus_name) + "</td>");
	    		html.push("<td>" + udf(msgdata[row.bustype]) + "</td>");
	    		html.push("<td>" + udf(row.companyname) + "</td>");
	    		html.push("<td>" + udf(row.creator) + "</td>");
	    		html.push("<td>" + udf(row.creatorname) + "</td>");
	    		html.push("<td>" + udf(row.statusname) + "</td>");
	    		
	    		html.push("<td style='white-space: nowrap;'>");
	    		html.push("<a onclick='toDetail(this)' href='javascript:void(0)' table='" + udf(row.app_table) + "' ");
	    		html.push("	instanceid='" + udf(row.instanceid) + "' pkid='" + udf(row.app_key) + "' creator='" + udf(row.creator) + "' ");
	    		html.push("	buttons='" + JSON.stringify(row.buttons) + "' titles='" + udf(row.title) + "' nodeid='" + udf(row.nodeid) + "' ");
	    		html.push("	taskid='" + udf(row.taskid) + "' buttonlistnum='" + udf(row.buttonlistnum) + "' buttonlistname='" + udf(row.buttonlistname) + "' ");
	    		html.push("	class='btn btn-mini btn-info czda'>详细信息</a>");
	    		for (var j = 0; j < row.buttons.length; j ++ ) {
	    			var button = row.buttons[j];
	    			if (button.type != 14101) {
	    				html.push("<span taskid=\"" + udf(row.taskid) + "\" class=\"oper btn btn-mini btn-border\" apporpc=\"" + button.apporpc + "\" ");
			    		html.push("type=\"" + button.type + "\" instanceid=\"" + udf(row.instanceid) + "\" userid=\"" + udf(row.creator) + "\" buttonid=\"" + button.id + "\" ");
			    		html.push("pkid=\"" + udf(row.app_key) + "\"><span>" + button.name + "</span></span>");
	    			}
	    		}
	    		html.push("</span></td></tr>");
	    	}
	    	$('#bpagetbody').html(html.join(""));
	    	window.scrollTo(0, 0);
	    }
	});
}
var ahref = $('#tabs .ui-tabs-active a', parent.document).attr("href");
if ((ahref == "#tabs-2" && querytype == 2) || (ahref == "#tabs-3" && querytype == 3)){
	getpage()
};
</script>

<%@ include file="/manage/system/taskButton.jsp"%>

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

    <script type="text/javascript" src="<%=request.getContextPath() %>/js/newlayer/layer.js"></script>
    <script>
               
            </script>
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
		//$("#toAllDetail").submit();
		layer.open({
		    title: '< 返回上一级',
		    type: 2,
		    skin: 'layui-layer-lan bpagenarrowtitle',
		    area: ['100%', '100%'],
		    content: '/manage/system/taskListform.jsp',
		    end:function(index){ 
		    	$("#tabHead",parent.document).css('display','block')
	        }
		});
	}

        $("#ctype").val('${ctype}');
        if ('${msg}' != "") {
            layer.alert('${msg}', {icon: 7, title : '提示'});
        }
    </script>
    </div>
</body>
</html>
