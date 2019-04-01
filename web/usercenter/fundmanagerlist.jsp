<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
	<style type="text/css">
		#ycacti{margin-top: 35px;}
		#ycacti *{box-sizing: border-box;}
	</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			<div id="zaiquanxinxi-update" class="vipinfo" >
				<div class="title"><li><span class="t">高新区私募基金管理人基本情况</span><a href="/userextend/getFundInfo.html?t=a" id="addA"><span class="update">添加</span></a></li>
				</div>
				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead>
					<tr class="TT">
			            <td>公司名称</td>
			            <td>统一信用代码</td>
			            <td>法定代理人</td>
			            <td>录入时间</td>
			            <td>操作</td>
					</tr>
					</thead>
					<tbody>
 					<s:iterator value="#request.funds">
						<tr>
			                <td>&nbsp;${qiyename }</td>
			                <td>&nbsp;${creditid }</td>
			                <td>&nbsp;${corp }</td>
			                <td>&nbsp;${fn:substring(lurushijian, 0, 10)}</td>
			                <td>
				                <input class="an ck op opr" type="button" value="查看" onclick="$('#hideA').attr('href','/userextend/getFundInfo.html?pkid=${pkid}&t=v')[0].click();"/>
			                	<input type="button" value="修改" class="an xg op opl" onclick="$('#hideA').attr('href','/userextend/getFundInfo.html?pkid=${pkid}')[0].click();"/>
			                </td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
				<a style="display: none" id="hideA"></a>
			</div>
		</div>	
	</div>
</div>
 <%@ include file="../../footer.jsp"%>
 <script type="text/javascript">
 	if ($.trim($("#ycacti tbody").html()) == "") {
 		$("#ycacti tbody").html("<tr><td colspan=" + $('#ycacti tr.TT').children().length + ">暂无</td></tr>");
 	}
 	if ('${flag}' != "") {
		layer.alert('${flag}', {icon: 7, title : '提示'});
	}
 </script>
 <script type="text/javascript" >
 	leftnav_init("fundinfo");
 </script>
</body>
</html>