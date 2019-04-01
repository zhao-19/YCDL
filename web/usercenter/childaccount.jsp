<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="/css/common.css?${sysversion}"/>
    <link rel="stylesheet" href="/css/index.css?${sysversion}"/>
    <script type="text/javascript" src="/resource/js/jquery-1.9.1.min.js?${sysversion}"></script>
    <script type="text/javascript" src="/js/index.js?${sysversion}"></script>
    <script type="text/javascript" src="/js/jquery.min.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/script.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/jquery.validate.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/laydate.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/common/layer/layer.js"></script>
</head>
<style>
.error {
    border: none;
    background:none;
    }
label.error {
    border: 1px solid #f5694b!important;
    background:none;
	color: #f5694b;
	padding: 0 2px;
	display:inline-block;
	height: 20px;
    line-height: 20px;
    }
</style>
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
				<div class="title"><li><span class="t">我的同事</span></li></div>
				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead>
					<tr class="TT">
						<td>账号类型</td>
						<td>登录名</td>
						<td>客户类型</td>
						<td>手机号</td>
						<td>关联状态</td>
						<td>注册时间</td>
						<td>操作</td>
					</tr>
					</thead>
					<tbody>
					<s:iterator value="#request.userlist">
						<tr>
							<td>
								<s:if test="main_user_stat==''"><span style="color:">主账号</span></s:if>
								<s:elseif test="main_user_stat==0"><span style="color:">子账号</span></s:elseif>
								<s:else><span style="color:">主账号</span></s:else>
							</td>
							<td><s:property value="userid"/></td>
							<td>
								<s:if test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001'">企业客户</s:if>
								<s:elseif test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002'">个人客户</s:elseif>
								<s:elseif test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003'">投资机构</s:elseif>
								<s:elseif test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008'">其它机构</s:elseif>
							</td>
							<td><s:property value="cellphone"/></td>
							<td>
								<s:if test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa007'"><span style="color:blue">未关联</span></s:if>
								<s:else><span style="color:red">已关联</span></s:else>
							</td>
							<td><s:property value="adddate.substring(0,10)"/></td>
							<td>
								<s:if test="delbotton == '10001'">
									<button onclick="cancelRelaChild(this);" name="${id }" class="btnDefault">取消关联</button>
								</s:if>
								<s:if test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa007' && #request.mainuserid==true">
									<button onclick="relaChild(this);" name="${id }">关联</button>
								</s:if>
							</td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
			</div>
		</div>	
	</div>
</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript">
 function relaChild(obj) {
	layer.confirm("确认关联？", {
		title: "提示",btn : [ '确定', '取消' ]
     }, function(index) {
         layer.close(index);
         $.ajax({
			type: 'post',
			url: "/usercenter/relaChild.html",
			dataType: "json",
			data: {"id":$(obj).attr("name")},
			success: function(data) {
				layer.confirm(data.msg, {
					title:"提示",btn:['确定'],area: ['200px', '180px']
		        }, function(index) {
		            layer.close(index);
		            window.location.reload();
		        });
			}
		});
    });
 }
 function clearTbody() {
 	if ($.trim($("#ycacti tbody").html()) == "") {
 		$("#ycacti tbody").html("<tr><td colspan='7'>暂无</td></tr>");
 	}
 }
 clearTbody();
 function cancelRelaChild(obj){
	 layer.confirm("确认取消关联？", {
		title: "提示",btn : [ '确定', '取消' ]
     }, function(index) {
         layer.close(index);
         $.ajax({
			type: 'post',
			url: "/usercenter/cancelRelaChild.html",
			dataType: "json",
			data: {"id":$(obj).attr("name")},
			success: function(data) {
				layer.confirm(data, {
					title:"提示",btn:['确定'],area: ['200px', '180px']
		        }, function(index) {
		            layer.close(index);
		            window.location.reload();
		        });
			}
		});
     }, function(index) {
        layer.close(index);
     }); 
 }
 </script>
 
 <script type="text/javascript" >
 	leftnav_init("childaccount");
 </script>
</body>
</html>