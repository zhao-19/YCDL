<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
	.td_right{text-align: right;}
</style>
 
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
	<s:form action="guquanjingcheng" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 	 
 				
 								<tr>
				<th class="td_right">关联的股权项目编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.guquanid" id="guquanid" readonly="false" data-rule="关联的股权项目编号:required;guquanid;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">事件进程时间点</th>
				<td style="text-align: left;">

				<input id="d4311" class="Wdate search-query input-small" type="text" name="e.riqi"
					value="<s:property value="e.riqi" />"
					onFocus="WdatePicker()" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">事件内容</th>
				<td style="text-align: left;">
				<s:textfield name="e.shijian" id="shijian" readonly="false" size="80" data-rule="事件内容:required;shijian;length[2~128]"/>
				</td>
				</tr>
 				
 			 
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="guquanjingcheng!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
						<button onclick="history.go(-1)" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 返回
						</button>
					</s:if>
					<s:else>
						<button method="guquanjingcheng!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
