<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <style type="text/css">
		.table td{vertical-align: middle;}
		input[type='text']{margin-bottom: 0px;}
		.pageLink{padding-top: 2px !important;}
		.selectPageLink{padding-top: 3px !important;}
    </style>
</head>
<body>
<s:form action="tbjrqsqh!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
        	<td style="text-align: right;">机构名称</td>
            <td style="text-align: left;">
                <s:textfield name="tbjrqsqh.org_name" id="org_name" readonly="false"/>
            </td>
            <td style="text-align: right;">数据时点</td>
            <td style="text-align: left;">
                <s:textfield name="tbjrqsqh.time_port" id="time_port" readonly="false"/>
            </td>
            <td style="text-align: right;">录入人</td>
            <td style="text-align: left;">
                <s:textfield name="tbjrqsqh.inputuser" id="inputuser" readonly="false"/>
            </td>
            <td style="text-align: right;">审核状态</td>
            <td style="text-align: left;">
            	<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"
                          listValue="name" name="tbjrqsqh.status" label="状态"
                          headerKey="" headerValue="" />
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <button method="tbjrqsqh!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <a href="javascript:void(0);" onclick="exportExcel();" class="btn btn-success">
                    <i class="icon-download-alt icon-white"></i>导出
                </a>
                <a style="display: none;" id="tbjrqsqhA">导出</a>
                <button method="tbjrqsqh!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
				</button>
				

                <div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
                    <%@ include file="/manage/system/pager.jsp" %>
                </div>
            </td>
        </tr>
    </table>

    <!--列表部分-->
    <table class="table table-bordered table-hover">
        <thead>
        <tr style="background-color: #dff0d8">
            <th width="20"><input type="checkbox" id="firstCheckbox"/></th>
           	<th>机构名称</th>
            <th>数据时点</th>
            <th>全年证券交易量</th>
            <th>高新区内网点数</th>
            <th>员工数</th>
            <th>营业收入</th>
            <th>审核状态</th>
            <th>录入人</th>
            <th>修改时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td>&nbsp;${org_name }</td>
                <td>&nbsp;${time_port }</td>
                <td>&nbsp;<fmt:formatNumber value="${transaction_amount }" pattern="#,#00.00#"/>万元</td>
                <td>&nbsp;${point_count }</td>
                <td>&nbsp;${staff_count }</td>
                <td>&nbsp;<fmt:formatNumber value="${business_income }" pattern="#,#00.00#"/>万元</td>
                <td>&nbsp;<% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("status")); if( o != null){out.print(o.getName());}%></td>
                <td>&nbsp;${inputuser }</td>
                <td>&nbsp;${fn:substring(lastchgtime, 0, 19)}</td>
                <td nowrap="nowrap">
                    <s:a href="tbjrqsqh!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-check"></i>审核</s:a>
                    <s:a href="tbjrqsqh!exportCustomExcel.action?e.id=%{id}" class="btn btn-mini btn-success"><i class="icon-white icon-download-alt"></i>导出</s:a>
                </td>
            </tr>
        </s:iterator>
        <tr>
            <td colspan="16" style="text-align:center;">
                <%@ include file="/manage/system/pager.jsp" %>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
	if ('${flag}' != "") {
		alert('${flag}');
	}
	function deletes() {
		msg.confirm("是否要执行此操作？", function() {
			var ids = $('input:checkbox[name=ids]:checked');
			var checkLength = ids.length;
			if (checkLength <= 0) {
				msg.info("被勾选的条数不能等于0！");
			} else {
				$("#tbjrqsqhA").attr("href","/manage/tbjrqsqh!deletes.action?ids="+ids.serialize()).click();
			}
		})
	}
	
	function exportExcel() {
		var array = new Array()
		$('input:checkbox[name=ids]:checked').each(function(i){
			array[i] = $(this).val();
		});
		/* if (array.length <= 0) {
			alert("被勾选的条数不能等于0！");
		} else { */
			$("#tbjrqsqhA").attr("href","/manage/tbjrqsqh!exportExcel.action?ids=" + array.join())[0].click()
		//}
	}
</script>
</body>
</html>
