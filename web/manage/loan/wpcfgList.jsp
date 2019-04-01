<%@page import="com.winpow.core.PrivilegeUtil"%>
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
.product-name {
	display: inline-block;
	width: 250px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
</style>

</head>

<body>
	<s:form action="wpcfg" namespace="/manage" method="post" theme="simple">
		<input type="hidden" value="<s:property value="e.catalogID"/>" id="catalogID"/>
		<table class="table table-bordered table-condensed">
			<tr>
				<td colspan="20">
 
						<s:a method="toAdd" cssClass="btn btn-success">
							<i class="icon-plus-sign icon-white"></i> 添加
						</s:a>
				</td>
			</tr>
		</table>

		<table class="table table-bordered table-condensed table-hover">
			<tr style="background-color: #dff0d8">
				<th nowrap="nowrap">生效日期</th>
				<th>当前工作日</th>
				<th>半年期利率</th>
				<th>一年期利率</th>
				<th>三年期利率</th>
				<th>五年期利率</th>
				<th>超过五年期利率</th>
			</tr>
			<s:iterator value="pager.list">
				<tr>
					<td>&nbsp; <s:date name="eff_day" format="yyyy-MM-dd"/></td>
					<td>&nbsp; <s:date name="work_day" format="yyyy-MM-dd"/></td>
					<td>&nbsp;<s:property value="rate_m_6" /> %</td>
					<td>&nbsp;<s:property value="rate_y_1" />%</td>
					<td>&nbsp;<s:property value="rate_y_3" />%</td>
					<td>&nbsp;<s:property value="rate_y_5" />%</td>
					<td>&nbsp;<s:property value="rate_y_99" />%</td>	 
					 
				</tr>
			</s:iterator>

			<tr>
				<td colspan="70" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</s:form>
	
<script type="text/javascript">
	$(function() {
		selectDefaultCatalog();
	});
	function selectDefaultCatalog(){
		var _catalogID = $("#catalogID").val();
		if(_catalogID!='' && _catalogID>0){
			$("#catalogSelect").attr("value",_catalogID);
		}
	}
</script>
</body>
</html>
