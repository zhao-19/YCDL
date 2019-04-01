<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<style type="text/css">
		#ycacti{margin-top: 35px;}
		#ycacti *{box-sizing: border-box;}
	</style>
</head>
<body>
<%@ include file="../../header.jsp"%>
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			<div id="zaiquanxinxi-update" class="vipinfo" >
				<div class="title"><li><span class="t">要素市场数据报送</span><a href="/userextend/getYsscinfo.html?t=a" id="addA"><span class="update">添加</span></a></li>
				</div>
				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead>
					<tr class="TT">
			            <td>数据时点</td>
			            <td>全年交易额</td>
			            <td>职工人数</td>
			            <td>审核状态</td>
			            <td>修改时间</td>
			            <td>操作</td>
					</tr>
					</thead>
					<tbody>
 					<s:iterator value="tbjrysscList">
						<tr>
			                <td>&nbsp;${time_port }</td>
			                <td>&nbsp;${transaction_amount }</td>
			                <td>&nbsp;${staff_count }</td>
			                <td>&nbsp;
			                	<s:if test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080'">未提交</s:if>
								<s:elseif test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081'">审批中</s:elseif>
								<s:elseif test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083'">审批通过</s:elseif>
								<s:elseif test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084'">驳回</s:elseif>
			                </td>
			                <td>&nbsp;${fn:substring(lastchgtime, 0, 10)}</td>
			                <td>
				                <input type="button" value="查看" class="an ck op opr" onclick="$('#hideA').attr('href','/userextend/getYsscinfo.html?t=v&queryid=${id}')[0].click();"/>
				                <s:if test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080'"><input type="button" value="修改" class="an xg op opl" onclick="$('#hideA').attr('href','/userextend/getYsscinfo.html?queryid=${id}')[0].click();"/></s:if>
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
		alert('${flag}');
	}
 </script>
 <script type="text/javascript" >
 	leftnav_init("ysscinfo");
 </script>
</body>
</html>