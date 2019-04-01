<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js"></script>
	<script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
	<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
</head>
<body class="bPageBody">
<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
		<tr>
			<td style="text-align: right;">名称</td>
			<td style="text-align: left;" >
				<s:textfield id="title" readonly="false" theme="simple"/>
			</td>
 		</tr>
		
		<tr>
			<td colspan="2">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/appCommon!schoolDetail.action" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
				<a href="javascript:void(0)" onclick="rele();" class="btn btn-warning">
					<i class="icon-list-alt icon-white"></i> 绑定
                </a>
			</td>
		</tr>
	</table>
	<table
		class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>名称</th>
				<th>主讲人</th>
				<th>价格(元)</th>
				<th>排序</th>
				<th>资源分类</th>
				<th>是否开放</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/appCommon!schoolListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"appschool.title" : $("#title").val()
        };
    },
    render : function(data) {
    	var whether =  $.parseJSON('${application.diccode.whether}');
    	var mediatype =  $.parseJSON('${application.diccode.mediatype}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.pkid + "'/></td>");
    		html.push("<td style='display: none;'>" + row.id + "</td>");
    		html.push("<td>" + udf(row.title) + "</td>");
    		html.push("<td>" + udf(row.username) + "</td>");
    		html.push("<td>" + udf(row.price) + "</td>");
    		html.push("<td>" + udf(row.sort) + "</td>");
    		html.push("<td>" + udf(mediatype[row.sourcetype]) + "</td>");
    		html.push("<td>" + udf(whether[row.enable]) + "</td>");
    		html.push("<td>" + timeformat(row.lurushijian) + "</td>");
    		html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.pkid + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a></td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
</script>
<script type="text/javascript">
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 7, title : '提示'});
	}
	function rele() {
		msg.confirm("是否要将选中的资源绑定在一起？", function () {
            var ids = $('input:checkbox[name=ids]:checked');
            if (ids.length <= 1) {
                msg.info("请至少勾选2个资源！");
            } else {
                $.post("/manage/appCommon!releSchool.action", ids.serialize(), function (data) {
                    if (data.msg == 'success') {
                        msg.info("绑定成功");
                    }
                }, 'json')
            }
        });
	}
	function toDetail(id) {
		layer.open({
		    title: '详细信息',
		    type: 2,
		    skin: 'layui-layer-lan bpagenarrowtitle',
		    area: ['100%', '100%'],
		    content: 'appCommon!schoolDetail.action?pkid=' + id
		});
	}
</script>
</body>
</html>
