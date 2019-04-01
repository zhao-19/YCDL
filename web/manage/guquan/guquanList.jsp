<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="/js/bPage/b.page.css?${sysversion}">
	<script type="text/javascript" src="/js/bPage/b.page.js?${sysversion}"></script>
</head>
<body class="bPageBody">
	<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
		<tr class="searchshort">
            <td style="text-align: right;">项目名称</td>
			<td style="text-align: left;" >
				<s:textfield id="mingcheng" theme="simple"/>
			</td>
			<td style="text-align: right;">录入人</td>
			<td style="text-align: left;" >
				<s:textfield id="inputuser" theme="simple"/>
			</td>
			<td style="text-align: right;">融资状态</td>
			<td style="text-align: left;" >
				<s:select list="%{#application.dic.xmrzzt.childs}" listKey="id" listValue="name" 
					id="rongzizhuangtai" headerKey="" headerValue="" theme="simple"/>  
 			</td>
			<td style="text-align: right;">审核状态</td>
			<td style="text-align: left;" >
				<s:select list="%{#application.dic.xmshzt.childs}" listKey="id" listValue="name" 
					id="shenhezhuangtai" headerKey="" headerValue="" theme="simple"/>  
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">是否推荐到APP</td>
			<td style="text-align: left;" >
                <s:select list="%{#application.dic.sf.childs}" listKey="id" listValue="name" 
                	id="shifoutuijian" headerKey="" headerValue=""  theme="simple"/>  
				</td>
 			</td>
			<td colspan="6">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/guquan!toAdd.action" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
				<button method="guquan!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
					<i class="icon-remove-sign icon-white"></i> 删除
				</button>
				<s:a href="#" cssClass="btn btn-warning" id="eamilExpand"><i class="icon-envelope icon-white"></i> 邮件推广</s:a>
			</td>
		</tr>
	</table>
	<form>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>项目名称</th>
				<th>发布企业</th>
				<th>行业</th>
				<th>点击量</th>
				<th>约谈量</th>
				<th>出让股权比例</th>
				<th>审核状态</th>
				<th>录入人</th>
				<th style="width:115px;">录入时间</th>
 				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	</form>
	<div id="pagebar"></div>
</div>


<div id="guquanEmailDiv" style="display: none;">
    <table id="guquanEmailTable" class="table table-bordered table-hover" style="padding: 5px;">
		<thead>
		<tr style="background-color: #dff0d8">
			<th>邮件地址</th>
			<th>公司名称</th>
			<th>操作
				<input type="hidden" id="emailId"/>
				<input type="hidden" id="comName"/>
			</th>
		</tr>
		</thead>
		<tbody id="guquanEmailTbody"></tbody>
	</table>
</div>

<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/guquan!getGuquanListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.mingcheng" : $("#mingcheng").val(),
        	"e.rongzizhuangtai" : $("#rongzizhuangtai").val(),
        	"e.shenhezhuangtai" : $("#shenhezhuangtai").val(),
        	"e.inputuser" : $("#inputuser").val(),
        	"e.shifoutuijian" : $("#shifoutuijian").val()
        };
    },
    render : function(data) {
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.ID + "'/></td>");
    		html.push("<td>" + udf(row.MINGCHENG) + "</td>");
    		html.push("<td>" + udf(row.qiyename) + "</td>");
    		html.push("<td>" + udf(row.Hangye) + "</td>");
    		html.push("<td>" + udf(row.BROWSECOUNT) + "</td>");
    		html.push("<td>" + udf(row.appcount) + "</td>");
    		html.push("<td>" + udf(row.CRGQBL) + "%</td>");
    		html.push("<td>" + udf(row.SHENHEZHUANGTAI) + "</td>");
    		html.push("<td>" + udf(row.INPUTUSER) + "</td>");
    		html.push("<td>" + timeformat(row.LURUSHIJIAN) + "</td>");
    		html.push("<td nowrap='nowrap'>");
    		html.push("	<a href='javascript:void(0);' onclick=\"toDetail('/manage/guquan!toNewEdit.action?e.id=" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a>");
    		//html.push("	<a href='javascript:void(0);' onclick=\"toDetail('/manage/guquan!toEdit.action?e.id=" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑更多</a>");
    		html.push("	<a target='_blank' href='/stockdetail/" + row.ID + ".html' class='btn btn-mini btn-success'>查看</a>");
    		html.push("</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(url) {
	layer.open({
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: url
	});
}

$('#eamilExpand').click(function(){
	var idsinput = $('input[name="ids"]:checked');
	if (idsinput.length != 1) {
		layer.alert('请选择一个项目!', {icon: 1, title : '提示'});
		return;
	}
	$("#emailId").val(idsinput.val());
	$("#comName").val(idsinput.parent("td").next().next().text());
	$.ajax({
		type: 'post',
		url: "/manage/tbemaillog!getEmail.action",
		dataType: "json",
		success: function(data) {
			var html = "";
			for (var key in data) {
				html += "<tr><td><input value='" + key + "'/></td><td><input value='" + data[key] + "'/></td><td><button type=\"button\" onclick=\"eamilAddTd();\" class=\"btn btn-success\"><i class=\"icon-plus\"></i></button><button type=\"button\" onclick=\"eamilDelTd(this);\" class=\"btn btn-success\"><i class=\"icon-minus\"></i></button></td></tr>";
			}
			if (html != "") {
				$("#guquanEmailTbody").html(html);
			}
			layer.open({
		        type:  1 ,
		        title:'邮件推广',
		        skin:'layui-layer-lan bpagenarrowtitle',
		        area: ['90%', '90%'],
		        content: $("#guquanEmailDiv").html(),
		        btn:['确认', '关闭'],
		        btn1:function (index, layero) {
		        	sendEamil();
		        	layer.close(index);
		        },
		        btn2:function (index, layero) {
		        	 layer.close(index);
		        }
		    });
		}
	});
});
function eamilAddTd() {
	var html = "<tr><td><input/></td><td><input/></td><td><button type=\"button\" onclick=\"eamilAddTd();\" class=\"btn btn-success\"><i class=\"icon-plus\"></i></button><button type=\"button\" onclick=\"eamilDelTd(this);\" class=\"btn btn-success\"><i class=\"icon-minus\"></i></button></td></tr>";
	$(".bpagenarrowtitle #guquanEmailTbody").append(html);
}
function eamilDelTd(obj) {
	if($(".bpagenarrowtitle #guquanEmailTbody").children('tr').length > 1){
		$(obj).parents('tr').remove();
	}
}
function sendEamil() {
	var arrAdd = new Array();
	var arrName = new Array();
	var num = 0;
	$(".bpagenarrowtitle #guquanEmailTbody tr").each(function(){
		$(this).children().each(function(i){
			var val = $(this).children().eq(0).val();
			if (val == "" && i != 2 && num == 0) {
				alert("有输入框未填写")
				num = 1;
			}
			if (i == 0 && num == 0) {
				var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
				if(!reg.test(val)){
					alert("请检查邮箱。")
					num = 1;
				}
				arrAdd.push(val);
			} else if (i == 1) {
				arrName.push(val);
			}
		});
	});
	if (num == 1) {
		return;
	}
	$.ajax({
		type: 'post',
		url: "/manage/tbemaillog!sendEmail.action",
		dataType: "json",
		data: {
			"id": $(".bpagenarrowtitle #emailId").val(),
			"comName": $(".bpagenarrowtitle #comName").val(),
			"adds": arrAdd.join(':::'),
			"names": arrName.join(':::')
		},
		success: function(data) {
			layer.alert(data.msg, {icon: 1, title : '提示'});
		}
	});
}
</script>
</body>
</html>
