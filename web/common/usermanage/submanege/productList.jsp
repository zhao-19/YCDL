<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
	<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js"></script>
</head>
<body class="bPageBody FZbPageBody">
	<div class="bodyBox">
	<table class="table  table-condensed table-search">
			<td style="text-align: right;">产品名称</td>
			<td style="text-align: left;">
				<s:textfield id="prodname" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">贷款类型</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.loanstype.childs}" listKey="id" 
                	listValue="name" id="product_type" headerKey="" headerValue="" theme="simple"/>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<button class="btn btn-warning" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<a href="/usermanage/toProductEdit.html?type=3" class="btn btn-info">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped  table-hover table-condensed">
		<thead class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
 				<th>产品名称</th>
				<th>产品类型</th>
				<th>贷款金额(万)</th>
				<th>优先级</th>
				<!--<th>分站</th>-->
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
var substation = '${sessionsubcode}';
if (substation == "") {
	window.parent.location.href = "/usermanage/loginout.html";
}
$('#pagebar').bPage({
    url : '/usermanage/getProductListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"product.prodname" : $("#prodname").val(),
        	"product.product_type" : $("#product_type").val(),
        	"product.substation" : substation
        };
    },
    render : function(data) {
    	var loanstype =  $.parseJSON('${application.diccode.loanstype}');
    	var whether =  $.parseJSON('${application.diccode.whether}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.ID + "'/></label></td>");
    		html.push("<td>" + udf(row.PRODNAME) + "</td>");
    		html.push("<td>" + udf(loanstype[row.product_type]) + "</td>");
    		html.push("<td>" + udf(row.LOANAMTMAX) + "</td>");
    		html.push("<td>" + udf(row.sort) + "</td>");
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
	    title: '< 返回上一级',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: '/usermanage/toProductEdit.html?type=3&product.id=' + id
	});
}
</script>
</body>
</html>
