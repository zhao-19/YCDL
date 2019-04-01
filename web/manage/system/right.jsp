<%@page import="com.winpow.services.manage.order.bean.OrdersReport"%>
<%@page import="com.winpow.services.front.systemSetting.bean.SystemSetting"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css"  type="text/css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/jquery-1.5.1.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<style>
	a:link {text-decoration:underline;}
	a:visited {text-decoration:underline;}
	a:hover {text-decoration:underline;}
	a:active {text-decoration:underline;}

	.Afont22{
	font-weight: 700;font-size: 16px;color: #f50;
	}
	iframe{width: 100%;height: 100%;border: 0;}
	.ui-tabs .ui-tabs-panel{padding:1em 0;}
	.ui-tabs .ui-tabs-panel{padding:0;}
	#tabs{position: fixed;width: 85%;height: 90%;top:5%;left: 7.5%;}
	#tabs>div{height: 90%;}
</style>
<%
SystemSetting ssInfo = SystemManager.systemSetting;
if(ssInfo==null){
	ssInfo = new SystemSetting();
}
%>
<script>
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
});
</script>

</head>

<body
	style="background-color: #f7f7f7; text-align: center; margin: auto;">
	<div class="container">
	
		
		<div class="row" style="height: 30px;">
		</div>
		
		<div class="row">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1" style="font-size: 14px;">本日数据</a>
					<li><a href="#tabs-2" style="font-size: 14px;">本月数据</a></li>
					<li><a href="#tabs-3" style="font-size: 14px;">本年数据</a></li>
				</ul>
				<div id="tabs-1">
					<div style="margin-bottom: 3px;"><!-- <a href="/manage/user!statistics.action" target="_blank" style="color: blue;">大屏统计</a> -->
						<a href="/manage/user!statistics.action" target="_blank" class="btn btn-info">
							<i class="icon-th-list icon-white"></i>
							大屏统计
						</a>
					</div>
					<div class="alert alert-danger" style="margin-bottom: 2px;text-align: left;">
						<strong>登录统计</strong>
					</div>
					<table class="table table-bordered">
						<tr>
							<td>登录数量：<%=SystemManager.indexData.getLogincountday()%>  </td>
						</tr>

					</table>

					<div class="alert alert-danger" style="margin-bottom: 2px;text-align: left;">
						<strong>注册统计：</strong>
					</div>
					<table class="table table-bordered">
					 	<tr>
							<td>企业注册数量：<%=SystemManager.indexData.getCompregistcountday()%>  </td>
						</tr>
						<tr>
							<td> 机构注册数量:<%=SystemManager.indexData.getJigouregistcountday()%> </td>
						</tr>
						<tr>
							<td>工作室注册数量:<%=SystemManager.indexData.getStudioregistcountday()%> </td>
						</tr>
					</table>

					<div class="alert alert-info" style="margin-bottom: 2px;text-align: left;">
						<strong>业务统计</strong>
					</div>
					<table class="table table-bordered">
						<tr>
							<td>股权融资发布数量 ：<%=SystemManager.indexData.getGuquanshowcountday()%> （其中 &nbsp;<%=SystemManager.indexData.getGuquanshowpasscountday()%> &nbsp;已经审核通过） </td>
						</tr>
						<tr>
							<td>贷款申请数量 :<%=SystemManager.indexData.getProductappcountday()%> （其中 &nbsp;<%=SystemManager.indexData.getProductappcountday()%> &nbsp;已经初步审核通过）</td>
						</tr>
						<tr>
							<td>增值业务申请数量 :<%=SystemManager.indexData.getIncreappcountday()%> </td>
						</tr>
						<tr>
							<td>项目约谈数量 :<%=SystemManager.indexData.getGuquanappcountday()%> </td>
						</tr>
					</table>

				</div>
				<div id="tabs-2">
					<table class="table table-condensed">

					</table>
				</div>
				<div id="tabs-3">
					<table class="table table-condensed">

					</table>
				</div>
			</div>
			<!-- tab end -->
		</div>
	</div>
</body>
</html>
