<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
</head>

<body>
	<s:form action="guquanhuangtai" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">状态</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuagntai" id="zhuagntai" readonly="false" data-rule="状态:required;zhuagntai;length[2~5]"/>
				</td>
			</tr>
 				
 							 
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="guquanhuangtai!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="guquanhuangtai!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
