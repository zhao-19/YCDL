<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<style type="text/css">
	.table TD{vertical-align:middle;}
	INPUT[type='text']{margin-bottom:0px;}
	.pageLink{padding-top:2px!important;}
	.selectPageLink {padding-top:3px!important;}
</style>
</head>

<body>
<s:form action="productczdbase!selectGZLList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<input name="cname" value="${cname }" type="text"/>
			</td>
			<td style="text-align: right;">类型</td>
			<td style="text-align: left;" >
				<select name="ctype" id="ctype">
				    <option value="1">待办事项</option>
				    <option value="2">所有事项</option>
				</select>
			</td>
		</tr>
		<!--按钮-->
		
		<tr>
			<td colspan="4">
				<%if(PrivilegeUtil.check(request.getSession(), "productczdbase!selectGZLList.action")){%>
					<button method="productczdbase!selectGZLList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
				</div>
			</td>
		</tr>
	</table>
	
	<!--列表部分-->
		<table class="table table-bordered table-hover">
			<thead>
				<s:if test="#request.ctype==1">
					<tr style="background-color: #dff0d8">
						<th>用户id</th>
						<!-- <th>业务数据id</th>
						<th>业务表</th> -->
						<th>业务名称</th>
						<th>申请人公司名称</th>
						<th>处理人id</th>
						<th>处理人名称</th>
						<th>节点名称</th>
						<th>任务发送时间</th>
						
						<!-- <th>业务编号</th>
						<th>处理人类别</th>
						<th>流程id</th>
						<th>实例id</th>
						<th>节点id</th>
						<th>用户名称</th>
						<th>用户类别</th>
						<th>系统编号</th>
						<th>任务id</th>
						<th>标题</th> -->
						<th nowrap="nowrap">操作</th>
					</tr>
				</s:if>
				<s:else>
					<tr style="background-color: #dff0d8">
						<th>业务编号</th>
						<th>业务名称</th>
						<th>公司名称</th>
						<th>流程名称</th>
						<th>节点名称</th>
						<th>状态</th>
						<th>创建人</th>
						<th>创建时间</th>
						
						<!-- <th>业务ID</th>
						<th>业务表</th>
						<th>创建人名称</th>
						<th>流程ID</th>
						<th>实例ID</th>
						<th>系统编号</th>
						<th>标题</th> -->
						<th nowrap="nowrap">操作</th>
					</tr>
				</s:else>
			</thead>
			<s:if test="#request.ctype==1">
				<s:iterator value="#request.result.data.rows">
					<tr>
						<td>${senduserid }</td>
						<%-- <td>${app_key }</td>
						<td>${app_table }</td> --%>
						<td>${bus_name }</td>
						<td>${companyname }</td>
						<td>${dealuserid }</td>
						<td>${dealusername }</td>
						<td>${nodename }</td>
						<td>${sendtime }</td>
						
						<%-- <td>${bus_id }</td>
						<td>${dealusertype }</td>
						<td>${flowid }</td>
						<td>${instanceid }</td>
						<td>${nodeid }</td>
						<td>${sendusername }</td> 
						<td>${sendusertype }</td>
						<td>${sys_id }</td>
						<td>${taskid }</td>
						<td>${title }</td> --%>
						<td>
						<s:if test='nodename == "客户经理审批"'>
						<s:a  href="productapp!toEdit.action?e.id=%{app_key}&instanceid=%{instanceid}&taskid=%{taskid}&buttonlistnum=%{buttonlistnum}&buttonlistname=%{buttonlistname}" class="btn btn-mini btn-info"><i class="icon-white icon-check"></i>审核</s:a>
						</s:if><s:else>
						<s:a href="productczdbase!selectGZLEdit.action?e.id=%{app_key}&instanceid=%{instanceid}&taskid=%{taskid}&buttonlistnum=%{buttonlistnum}&buttonlistname=%{buttonlistname}" class="btn btn-mini btn-info"><i class="icon-white icon-check"></i>审核</s:a>
						</s:else>
						</td>
					</tr>
				</s:iterator>
			</s:if>
			<s:else>
				<s:iterator value="#request.result.data.rows">
					<tr>
						<td>${bus_id }</td>
						<td>${bus_name }</td>
						<td>${companyname }</td>
						<td>${flowname }</td>
						<td>${nodename }</td>
						<td>${status_ }</td>
						<td>${creator }</td>
						<td>${created }</td>
						
						<%-- <td>${app_key }</td>
						<td>${app_table }</td>
						<td>${creatorname }</td>
						<td>${flowid }</td>
						<td>${instanceid }</td>
						<td>${sys_id }</td>
						<td>${title }</td> --%>
						<td><s:a class="czda btn btn-mini btn-info" href="productczdbase!selectGZLEdit.action?e.id=%{app_key}&instanceid=%{instanceid}&taskid=%{taskid}"></s:a>
						</td>
					</tr>
				</s:iterator>
			</s:else>
			<tr>
				<td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</s:form>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/newlayer/layer.js"></script>
	<script type="text/javascript">
		$("#ctype").val('${ctype}');
		if ('${msg}' != "") {
			layer.alert('${msg}', {icon: 7, title : '提示'});
		}
		$(".czda").each(function(){
			$(this).attr("href", $(this).attr("href") + "&ctype=${ctype}");	
		});
	</script>
</body>
</html>
