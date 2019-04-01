<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>   
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
.td_right{text-align: right;width: 130px;}
select{height: auto;}
.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
</style>
</head>

<body>
<s:form action="/manage/policyApply!update.action" id="form" name="form" theme="simple" method="post">
	<table class="table table-bordered">
		<tr>
            <td colspan="4" class="table_title">政策申报审核
            	<s:hidden name="e.pkid"/>
            	<s:hidden name="e.policyname"/>
            	<s:hidden name="e.userid"/>
            	<s:hidden name="e.chno"/>
            	<s:hidden name="e.chstatus" id="chstatus"/>
            </td>
        </tr>
        <tr>
        	<td class="td_right">政策名称</td>
            <td style="text-align: left;">${e.policyname }</td>
            <td class="td_right">企业名称</td>
            <td style="text-align: left;">${e.cmpname }</td>
        </tr>
        <tr>
            <td class="td_right">用户名称</td>
            <td style="text-align: left;">${e.userid }
            	&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${e.userid }')" 
				class="btn btn-secondary round" type="button" value="查看详情"/>
            </td>
            <td class="td_right">批次</td>
            <td style="text-align: left;">${e.pichi }</td>
        </tr>
        <tr>
            <td class="td_right">申请金额</td>
            <td style="text-align: left;">${e.amount }万元</td>
            <td class="td_right">审核状态</td>
            <td style="text-align: left;">
            <% TreeNode x = SystemManager.treeNodeMap.get(request.getAttribute("e.chstatus")); if( x != null){out.print(x.getName());}%>
            </td>
        </tr>
		<tr>
            <td class="td_right">申请时间</td>
            <td style="text-align: left;">${fn:substring(e.createdate, 0, 19)}</td>
            <td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(e.updatedate, 0, 19)}</td>
        </tr>
        <tr>
            <td class="td_right">审核人</td>
            <td style="text-align: left;">${e.reviwer_id }
         	 	&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${e.reviwer_id }')" 
				class="btn btn-secondary round" type="button" value="查看详情"/>
            </td>
            <td class="td_right">审核时间</td>
            <td style="text-align: left;">${fn:substring(e.reviwer_date, 0, 19)}</td>
        </tr>
        <tr>
            <td class="td_right">审核备注</td>
            <td style="text-align: left;" colspan="3">
            	<s:textarea rows="3" cols="80" name="e.reviwer_remark" id="reviwer_remark" theme="simple" readonly="false"/>
            </td>
        </tr>
       <tr>
           <td colspan="4" style="text-align:center;">
               <button type="button" class="btn btn-success" onclick="sub(1);">
                   <i class="icon-ok-sign icon-white"></i> 通过
               </button>
               
               <button type="button" class="btn btn-danger" onclick="sub(2);">
                   <i class="icon-remove-sign icon-white"></i>驳回
               </button>
           </td>
       </tr>
	</table>
</s:form>
</body>
<script type="text/javascript">
	function sub(num) {
		var msg = "";
		if (num == 1) {
			msg = "确定通过?";
			$("#chstatus").val(10302);
		} else {
			msg = "确定驳回?";
			$("#chstatus").val(10303);
		}
		if (confirm(msg)) {
			$("#form").submit();
		}
	}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script>
<script type="text/javascript">
	 function toUserinfo(userid) {
        layer.open({
            title: '用户详情',
            type: 2,
            skin: 'layui-layer-lan',
            area: ['1100px', '600px'],
            fix: false,
            maxmin: false,
            content: 'appCommon!toUserinfo.action?userid=' + userid
        });
    }
</script>
</html>
