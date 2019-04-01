<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/manage/system/common.jsp" %>

</head>

<body>
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
	<s:form action="/manage/appBanner!update.action" namespace="/manage" theme="simple" id="form"
		name="form" method="post">
		<table class="table table-bordered">

			<tr style="display: none;">
				<th>id</th>
				<td colspan="3"><s:hidden name="e.pkid" /></td>
			</tr>

			<tr>
				<th class="td_right" width="30%">名称</th>
				<td style="text-align: left;"><s:textfield name="e.title"
						id="title" readonly="false"
						data-rule="标题:required;prodid;length[1~32]" /></td>
			</tr>
			<tr>
				<td class="td_right"><span class="uploadbtn btn btn-success" reg="image" type="image">banner图</span></td>
            	<td style="text-align: left;" colspan="3">
					<s:textfield theme="simple" name="e.image" id="image" class="file1" readonly="false" />
					<s:if test="e.image != null">
	                    <img src="${e.image }" class="smallpic"/>
	                </s:if>
				</td>
			</tr>
            <tr>
                <th class="td_right">是否生效</th>
                <td style="text-align: left;" colspan="3"><s:select
                        list="%{#application.dic.whether.childs}" listKey="id" listValue="name"
                        name="iseffective" id="iseffective"
                        value="e.iseffective" /></td>
            </tr>
            <tr>
                <th class="td_right">banner展示位置</th>
                <td style="text-align: left;" colspan="3"><s:select
                        list="%{#application.dic.bannerlocation.childs}" listKey="id" listValue="name"
                        name="location" id="location" headerKey="" headerValue="--请选择--"
                        value="e.location" 
                        data-rule="展示位置:required;location;length[2~256]"/></td>
            </tr>
            <tr>
                <th class="td_right">跳转类型</th>
                <td style="text-align: left;" colspan="3"><s:select
                        list="%{#application.dic.urlmethod.childs}" listKey="id" listValue="name"
                        name="jumptype" id="jumptype" headerKey="" headerValue="--请选择--"
                        value="e.jumptype" 
                        data-rule="跳转类型:required;jumptype;length[2~256]"/></td>
            </tr>
            <tr>
                <th class="td_right">数据类型</th>
                <td style="text-align: left;" colspan="3"><s:select
                        list="%{#application.dic.bannerdata.childs}" listKey="id" listValue="name"
                        name="datatype" id="datatype" headerKey="" headerValue="--请选择--"
                        value="e.datatype"  /></td>
            </tr>
			<tr>
                <th class="td_right">页面url</th>
                <td style="text-align: left;"><s:textfield name="e.url"
                        id="url" readonly="false"/></td>
            </tr>
			<tr>
                <th class="td_right">页面编号(app主键)</th>
                <td style="text-align: left;"><s:textfield name="e.appid"
                        id="appid" readonly="false"/>
                        <c:if test="${e.appid eq '' or empty e.appid }">
                        <s:a href="javascript:getAppList()" cssClass="btn btn-success" id="selectPbczdbase">请选择</s:a>
                        </c:if>
                        </td>
                        </td>
            </tr>
            <tr>
                <th class="td_right">优先级(1~100,数字越大越优先)</th>
                <td style="text-align: left;"><s:textfield name="e.sort"
                        id="sort" readonly="false"/></td>
            </tr>
            <tr style="display: none;">
                <th class="td_right">简单描述(10个字以内)</th>
                <td style="text-align: left;">
                	<s:textfield name="e.intro" id="intro" readonly="false"/>
                    </td>
            </tr>
            <tr>
                <th class="td_right">展示位置</th>
                <td style="text-align: left;" colspan="3">
                <s:select
                        list="%{#application.dic.showequipment.childs}" listKey="id" listValue="name"
                        name="e.showdevice" id="showdevice" 
                         /></td>
            </tr>
            <tr>
                <th class="td_right">分站</th>
                <td style="text-align: left;" colspan="3">
                	<s:select list="%{#application.areasubstmap}" headerKey="all" headerValue="" theme="simple"
                        name="e.substation" id="substation"/>
                </td>
            </tr>
            <tr>
                <th class="td_right">创建时间</th>
                <td style="text-align: left;"><s:textfield name="e.createdate"
                        id="createdate" readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">创建人</th>
                <td style="text-align: left;"><s:textfield name="e.createby"
                        id="createby" readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">最后修改时间</th>
                <td style="text-align: left;"><s:textfield name="e.updatedate"
                        id="updatedate" readonly="true" /></td>
            </tr>
			<tr>
				<td colspan="4" style="text-align: center;">
					<button method="/manage/appBanner!update.action" style="display: none;" id="saveba">保存</button>
					<div class="btn btn-success" onclick="checkpara();">
						<i class="icon-ok icon-white"></i> 保存
					</div>
			</tr>
		</table>
	</s:form>
<div id="atitle" style="display:none;">
    <p class="pbczdbaseTitle" style="margin-top: 10px;">
        <span style="margin-left: 20px;">标题：</span><input type="text" id="dtitle"/>
        <button type="button" onclick="getAppListdate();" class="shaixuan btn btn-success" style="margin-left: 20px;">
            <i class="icon-ok icon-white"></i> 筛选
        </button>
    </p>
    <div class="pbczdbaseTable">
        <table id="pbczdbaseTablec" class="table table-bordered table-hover">
            <thead>
                <tr style="background-color: #dff0d8">
                    <th width="20"><input type="radio" id="checkBox" /></th>
                    <th>pkid</th>
                    <th>类别</th>
                    <th>标题</th>
                    <th>分站</th>
                    <th>修改时间</th>
                </tr>
            </thead>
            <tbody id="dataBody">
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
function getAppList() {
	var datatype = $("#datatype").val();
	if (datatype == "" || datatype > 12208 || datatype == 12207) {
		layer.alert("当前数据类型无需选择页面编号。", {icon: 7, title : '提示'});
		return; 
	}
	layer.open({
        type:  1 ,
        title:'页面编号',
        skin:'layui-layer-lan bpagenarrowtitle',
        area: ['90%', '90%'],
        content: $("#atitle").html(),
        btn:['确认', '关闭'],
        btn1:function (index, layero) {
        	$("#appid").val($("input[name='dataCheckBox']:checked").attr("lang"));
        	layer.close(index);
        },
        btn2:function (index, layero) {
        	 layer.close(index);
        }
    });
    getAppListdate();
}
function getAppListdate() {
	$.ajax({
         type: "post",
         url:"appBanner!selectAppProducts.action",
         data: {"datatype": $("#datatype").val(), title : $(".bpagenarrowtitle #dtitle").val()},
         dataType: "json",
         success: function(data) {
         	var html = "";
			for (var i = 0; i < data.length; i++) {
				html += "<tr><th><input lang='" + data[i].pkid + "' type='radio' name='dataCheckBox'></th><th>" + data[i].pkid + "</th><th>" + data[i].type + "</th><th>" + data[i].name + "</th><th>" + data[i].substation + "</th><th>" + data[i].time + "</th></tr>";
			}             
            $(".bpagenarrowtitle #dataBody").html(html);
         }
     });
}
</script>
<script type="text/javascript">
	function checkpara() {
		if($("#jumptype").val()=="12301") {
    		if($("#url").val()=="" || $("#url").val() == null) {
	            layer.alert("跳转方式为h5时，请输入页面url", {icon: 7, title : '提示'});
	            return;
    		}
        }
    	if($("#jumptype").val()=="12302") {
            if($("#datatype").val()=="" || $("#datatype").val() == null) {
	            layer.alert("跳转方式为原生态时，请选择数据类型", {icon: 7, title : '提示'});
	            return;
            }
        }
		$("#saveba")[0].click();
	}
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/easyUpload/easy-upload.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/easyUpload/easyUpload.js"></script>
</body>
</html>