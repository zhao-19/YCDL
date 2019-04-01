<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
</head>
<body class="bPageBody">
	<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
			<td style="text-align: right;">产品名称</td>
			<td style="text-align: left;">
				<s:textfield id="prodname" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">贷款类型</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.loanstype.childs}" listKey="id" 
                	listValue="name" id="product_type" headerKey="" headerValue="" theme="simple"/>
			</td>
			<td style="text-align: right;">分站</td>
            <td style="text-align: left;">
                <s:select list="%{#application.areasubstmap}" listKey="key" 
                	listValue="value" id="substation" headerKey="" headerValue="" theme="simple"/>
			<td>
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/appGoods!toAdd.action?type=3" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
 				<th>产品名称</th>
				<th>产品类型</th>
				<th>贷款金额(万)</th>
				<th>优先级</th>
				<th>分站</th>
				<th>是否推荐</th>
				<th>修改时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/product!getListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.prodname" : $("#prodname").val(),
        	"e.product_type" : $("#product_type").val(),
        	"e.substation" : $("#substation").val()
        };
    },
    render : function(data) {
    	var loanstype =  $.parseJSON('${application.diccode.loanstype}');
    	var whether =  $.parseJSON('${application.diccode.whether}');
    	var areamap =  $.parseJSON('${areamap}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.ID + "'/></td>");
    		html.push("<td>" + udf(row.PRODNAME) + "</td>");
    		html.push("<td>" + udf(loanstype[row.product_type]) + "</td>");
    		html.push("<td>" + udf(row.LOANAMTMAX) + "</td>");
    		html.push("<td>" + udf(row.sort) + "</td>");
    		html.push("<td>" + udf(areamap[row.substation]) + "</td>");
    		html.push("<td>" + udf(whether[row.SHIFOUTUIJIAN]) + "</td>");
    		html.push("<td>" + timeformat(row.LASTCHGTIME) + "</td>");
 			html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a></td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(id) {
	layer.open({
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: 'appGoods!toEdit.action?type=3&product.id=' + id
	});
}
</script>
</body>
</html>
