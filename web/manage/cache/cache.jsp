<%@page import="com.winpow.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
#frameDiv iframe{height:35px;width:350px;}
</style>
</head>

<body>
	<table class="table table-bordered">
		 <tr style="font-weight: bold;text-align: center !important;font-size: 20px;">
			<td>刷新本地</td>
			<td>刷新生产</td>
		</tr>
	
		<tr>
			<td>
				<a href="javascript:void(0);" onclick="setUrl('cacheImpl.jsp');" class="btn btn-primary">
					<i class="icon-refresh icon-white"></i>缓存
				</a>
			</td>
			<td>
				<a href="javascript:void(0);" onclick="setUrl('https://www.winpow.com/manage/cache/cacheImpl.jsp');" class="btn btn-primary">
					<i class="icon-refresh icon-white"></i>www.winpow.com
				</a>
				<a href="javascript:void(0);" onclick="setUrl('https://apps.winpow.com/manage/cache/cacheImpl.jsp');" class="btn btn-primary">
					<i class="icon-refresh icon-white"></i>apps.winpow.com
				</a>
				<br class="canhide"/>
				<br class="canhide"/>
				<a href="javascript:void(0);" onclick="setUrl('http://10.0.153.2/manage/cache/cacheImpl.jsp');" class="btn btn-primary canhide">
					<i class="icon-refresh icon-white"></i>10.0.153.2
				</a>
				<a href="javascript:void(0);" onclick="setUrl('http://10.0.153.3/manage/cache/cacheImpl.jsp');" class="btn btn-primary canhide">
					<i class="icon-refresh icon-white"></i>10.0.153.3
				</a>
				<a href="javascript:void(0);" onclick="setUrl('http://10.0.153.21/manage/cache/cacheImpl.jsp');" class="btn btn-info canhide">
					<i class="icon-refresh icon-white"></i>10.0.153.21
				</a>
				<a href="javascript:void(0);" onclick="setUrl('http://10.0.153.22/manage/cache/cacheImpl.jsp');" class="btn btn-info canhide">
					<i class="icon-refresh icon-white"></i>10.0.153.22
				</a>
			</td>
		</tr>
		 
		 <tr>
			<td>
				<a href="javascript:void(0);" onclick="setUrl('/app/appuser!refreshAppCache.action');" class="btn btn-success">
					<i class="icon-refresh icon-white"></i>APP缓存
				</a>
			</td>
			<td>
				<a href="javascript:void(0);" onclick="setUrl('https://apps.winpow.com/app/appuser!refreshAppCache.action');" class="btn btn-primary">
					<i class="icon-refresh icon-white"></i>apps.winpow.com
				</a>
				<br class="canhide"/><br class="canhide"/>
				<a href="javascript:void(0);" onclick="setUrl('http://10.0.153.21/app/appuser!refreshAppCache.action');" class="btn btn-success canhide">
					<i class="icon-refresh icon-white"></i>APP10.0.153.21缓存
				</a>
				<a href="javascript:void(0);" onclick="setUrl('http://10.0.153.22/app/appuser!refreshAppCache.action');" class="btn btn-success canhide">
					<i class="icon-refresh icon-white"></i>APP10.0.153.22缓存
				</a>
			</td>
		</tr>
		<!-- <tr>
			<td>
				<a href="/userextend/QiyeDistUpdate.html" target="_blank" class="btn btn-success">
					<i class="icon-refresh icon-white"></i>企业分布
				</a>
			</td>
			<td>
				<a href="https://www.winpow.com/userextend/QiyeDistUpdate.html" target="_blank" class="btn btn-success">
					<i class="icon-refresh icon-white"></i>企业分布
				</a>
			</td>
		</tr> -->
		<tr>
            <td>
                <a href="javascript:void(0);" onclick="setUrl('/manage/refreshMongo.action');" class="btn btn-success">
					<i class="icon-refresh icon-white"></i>刷新mongodb
				</a>
            </td>
            <td>
                <a href="javascript:void(0);" onclick="setUrl('https://www.winpow.com/manage/refreshMongo.action');" class="btn btn-success">
					<i class="icon-refresh icon-white"></i>刷新mongodb
				</a>
            </td>
        </tr>
	</table>
	
	<table class="table table-bordered">
		 <tr style="font-weight: bold;text-align: center !important;font-size: 20px;">
			<td>十周年活动，获取成功数据</td>
		</tr>
	
		<tr>
			<td>
				<input id="tendata" class="Wdate search-query input-small" type="text" onFocus="WdatePicker()"/>
				<a href="javascript:void(0);" onclick="tendata();" class="btn btn-warning">
					<i class="icon-refresh icon-white"></i>刷新数据
				</a>
			</td>
		</tr>
		 
		
	</table>
	
	<div id="frameDiv"></div>
<script type="text/javascript">
	function setUrl(url) {
		var html = "<iframe src='" + url + "'></iframe>";
		$("#frameDiv").append(html);
	}
	if (window.location.protocol == "https:") {
		$(".canhide").hide();
	}
	function tendata() {
		var tendata = $("#tendata").val();
		if (tendata == "") {
			alert("请选择刷新时间！");
			return;
		}
		setUrl("/userextend/chackten.html?tendata=" + tendata);
	}

</script>
	
</body>
</html>
