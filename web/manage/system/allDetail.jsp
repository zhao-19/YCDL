<%@page import="com.winpow.services.manage.catalog.bean.Catalog"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/progressBar.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/massage.css" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/message3.0.js"></script>
<style>
#insertOrUpdateMsg{border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;}
select{height: auto;}
#tabs-3 input{width: 104px;margin: 10px 0px;}
#tabs-3 td{vertical-align: middle;}
.n-ok .n-icon{margin-top: 12px;}
#layui-layer1{margin-left: 40%;}
iframe, .iframebox{width: 100%;height: 100%;border: 0;}
.iframebox{padding: 15px;overflow: auto;box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;}
.ui-tabs .ui-tabs-panel{padding: 1em 0;}
.ui-tabs .ui-tabs-panel{padding: 0;}
#tabs{position: fixed;width: 99%;height: 91%;left: 0%;}
#tabs>div{height: 90%;}
.layui-layer-lan{margin-left: 1% !important;top:1% !important}
.layui-layer-lan .layui-layer-content{height:90%}
.layui-layer-rim{margin-left: 25% !important;}
.layui-layer-dialog{margin-left: 30% !important;}
.allocation{margin: 1% !important;}
.allocation .layui-layer-content{height:80%;}
</style>
</head>
<body style="padding: 5px;">
	<div style="text-align: center;margin-bottom:3px;">
		<s:iterator value="#request.buttons">
			<s:if test="apporpc != 2 && type!=14101">
				<span apporpc="${apporpc }" buttonid="${id }" type="${type }" class="btn btn-info buoper"> 
					<i class="icon-ok icon-white "></i><span>${name }</span>
				</span>
			</s:if>
		</s:iterator>
	</div>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-8">流程信息</a></li>
			<c:if test="${fn:contains(title.paradetail.releid, '=')}">
				<li><a href="#tabs-10">详细信息</a></li>
			</c:if>
		</ul>
		<div id="tabs-8">
			<div class="iframebox">
				<img src="${wfimg }rest/showflowpic?instanceid=${instanceid}" />
				<table class="table table-condensed table-bordered">
					<tr>
						<th class="td_right">业务数据id</th>
						<td style="text-align: left;">${result.data.app_key }</td>
						<th class="td_right">业务表</th>
						<td style="text-align: left;">${result.data.app_table }</td>
					</tr>
					<tr>
						<th class="td_right">业务编号</th>
						<td style="text-align: left;">${result.data.bus_id }</td>
						<th class="td_right">业务名称</th>
						<td style="text-align: left;">${result.data.bus_name }</td>
					</tr>
					<tr>
						<%-- <th class="td_right">流程id</th>
						<td style="text-align: left;">${result.data.flowid }</td> --%>
						<th class="td_right">分类</th>
						<td style="text-align: left;">${result.data.bustype }</td>
						<th class="td_right">流程名称</th>
						<td style="text-align: left;">${result.data.flowname }</td>
					</tr>
					<tr>
						<th class="td_right">申请人公司名称</th>
						<td style="text-align: left;">${result.data.companyname }</td>
						<th class="td_right">实例id</th>
						<td style="text-align: left;">${result.data.instanceid }</td>
					</tr>
					<tr>
						<th class="td_right">系统编号</th>
						<td style="text-align: left;">${result.data.sys_id }</td>
						<th class="td_right">数据的总条数</th>
						<td style="text-align: left;">${result.data.total }</td>
					</tr>
					<tr>
						<th class="td_right">申请人id</th>
						<td style="text-align: left;">${result.data.userid }</td>
						<th class="td_right">状态名</th>
						<td style="text-align: left;">${result.data.statusname }</td>
					</tr>
				</table>

				<table class="table table-condensed table-bordered">
				<thead>
					<tr style="display: none;">
						<td>
							<span id="agencyid">${title.paradetail.agencyid }</span>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="td_right">${title.paradetail.top }</th>
						<td style="text-align: left;">${title.paradetail.title }</td>
					</tr>
				</thead>
				<s:iterator value="#request.title.paradetail.dlist">
					<tr>
						<th class="td_right">${name }</th>
						<td style="text-align: left;">${val }</td>
					</tr>
				</s:iterator>
			</table>
				
				<table class="table table-condensed table-bordered">
					<thead>
						<tr style="background-color: #dff0d8">
							<th>业务名称</th>
							<th style="max-width: 200px;">审批意见</th>
							<th>流程名称</th>
							<th>节点id</th>
							<th>节点名称</th>
							<th>操作名称</th>
							<th>用户id</th>
							<th>处理人id</th>
							<th>处理人名称</th>
							<th>任务发送时间</th>
							<th>任务处理时间</th>
						</tr>
					</thead>
					<s:iterator value="#request.result.data.rows">
						<tr>
							<td>${bus_name }</td>
							<td>${comments }</td>
							<td>${flowname }</td>
							<td>${nodeid }</td>
							<td>${nodename }</td>
							<td>${operation }</td>
							<td>${senduserid }</td>
							<td>${dealuserid }</td>
							<td>${dealusername }</td>
							<td>${sendtime }</td>
							<td>${dealtime }</td>
						</tr>
					</s:iterator>
				</table>
				<div></div>
			</div>
		</div>
		<c:if test="${fn:contains(title.paradetail.releid, '=')}">
			<div id="tabs-10">
				<iframe src="${title.paradetail.releid }" width="100%" height="100%"></iframe>
			</div>
		</c:if>
	</div>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/newlayer/layer.js"></script>

<script type="text/javascript">
	if ($("#agencyid").html() == "") {
		$("span[type='14103']").hide();
	}
	
	$(function() {$( "#tabs" ).tabs({});});
	$('.buoper').click(function(){
	    var buttonid = $(this).attr("buttonid");
	    var type = $(this).attr("type");
	    if (type == "14101") {				// 审批记录(已屏蔽)
	    	
	    } else if (type == "14102") {		// 用户信息
	        getuserinfo('${creator}');
	    } else if (type == "14103") {		// 银行信息
		    getuserinfo($("#agencyid").html());
	    } else if (type == "14104") {		// 审核（通过，取消，退回）
	    	checkwf(type, buttonid);
	    } else if (type == "14105") {		// 审核(填原因)
	    	checkwf(type, buttonid);
	    } else if (type == "14106") {		// 审核(填金额)
	    	checkwf(type, buttonid);
	    } else if (type == "14107") {		// 推荐银行
	    	allocation(buttonid);
	    } else if (type == "14108") {		// 流程终止
	    	stopwf(buttonid);
	    }
	});
	
function allocation(buttonid) {
	$.ajax({
         type: "post",
         url:"/manage/user!getWFList.action",
         data: {
        		app_table : '${app_table}',
        		app_key : '${app_key}',
        		agencyid  : $("#agencyid").html()
         },
         dataType: "json",
         success: function(data) {
             var html = "<table class='table table-condensed table-bordered'><tr><td></td><td>头像</td><td>用户ID</td><td>用户名</td><td>机构名</td><td>手机号</td></tr>";
             for (var i=0;i<data.length;i++) {
             	var da = data[i]; 
             	html += "<tr><td><input type='checkbox' data='" + JSON.stringify(da) + "' name='allos'/></td><td><img src='" + da.agencylogo + "' style='max-width:50px;max-height:50px;'/></td><td>" + da.userid + "</td><td>" + da.username + "</td><td>" + da.agencyname + "</td><td>" + da.mobile + "</td></tr>"
             }
             html+="</table>"
             layer.open({
		        type:  1 ,
		        title:'流程分配',
		        skin:'layui-layer-lan allocation',
		        area: ['98%', '96%'],
		        content: html,
		        btn:['提交','取消'],
		        btn1: function (index, layero) {
		        	var arr = new Array();
		        	$("input[name='allos']:checked").each(function(i){
		        		arr[i] = $.parseJSON($(this).attr("data"));
		        	});
		        	if (arr.length==0) {
		        		layer.alert('请选择后重新提交！', {icon: 7, title : '提示'});
		        		return;
		        	}
		        	$.ajax({
			            type: "post",
			            url:"/manage/user!saveUserInfo.action",
			            data: {
		            		taskid : '${taskid}',
		            		app_table : '${app_table}',
		            		app_key : '${app_key}',
		            		userinfo 	: JSON.stringify(arr),
		            		buttonid : buttonid
			            },
			            dataType: "json",
			            success: function(data) {
			                alert(data.msg);
			                if (data.code == 100) {
			                	parent.parent.location.reload();
			                }
			            }
			        });
		    	},
		        btn2:function (index, layero) {
		        	 layer.close(index);
		        }
		    });
         }
     });	
}

function checkwf(type, buttonid) {
	var ti = "备注";
	var checkmark = "提交"; 
	if (type == "14105") {
		ti = "原因";
		checkmark = ""; 
	} else if (type == "14106") {
		ti = "金额";
		checkmark = "已放款XX万元"; 
	}
	var html = "<div style='width: 420px;margin:10px;'><span>" + ti + "&nbsp;：&nbsp;</span><input id='checkmark' style='width:300px;' type='text' value='" + checkmark + "'></div>";
	layer.open({
		id: 1 ,
        type:  1 ,
        title:'流程审核',
        skin:'layui-layer-rim',
        area:['450px', 'auto'],
        content: html,
        btn:['提交','取消'],
        btn1: function (index, layero) {
        	var remark = $("#checkmark").val();
        	if (remark == "" || (remark == checkmark && remark != "提交")) {
        		layer.alert('请填写' + ti, {icon: 7, title : '提示'});
        		return;
        	}
        	$.ajax({
	            type: "post",
	            url:"/manage/user!saveUserInfo.action",
	            data: {
            		taskid : '${taskid}',
            		app_table : '${app_table}',
            		app_key : '${app_key}',
            		remark 	: remark,
            		buttonid : buttonid
	            },
	            dataType: "json",
	            success: function(data) {
	                alert(data.msg);
	                if (data.code == 100) {
	                	parent.parent.location.reload();
	                }
	            }
	        });	
    	},
        btn2:function (index, layero) {
        	 layer.close(index);
        }
    });
}

function getuserinfo(userid) {
	layer.open({
         title: '用户信息',
         type: 2,
         skin: 'layui-layer-lan',
         area: ['98%', '98%'],
         fix: false,
         maxmin: false,
         content: "cust!toEditByUserid.action?userid=" + userid
     });
}

function stopwf(buttonid) {
	layer.confirm("是否终止该流程？", {
		title : "提示",
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		$.ajax({
			type : "post",
			url : "/manage/user!stopInstance.action",
			data : {
				taskid : '${taskid}',
				buttonid : buttonid
			},
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				if (data.code == 100) {
					parent.parent.location.reload();
				}
			}
		});
	});
}

if ('${msg}' != "") {
    layer.alert('${msg}', {icon: 7, title : '提示'});
}
</script>
</body>
</html>