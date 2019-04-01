<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script>
<style type="text/css">
	.td_right{text-align: right;}
	select{height: auto;}
	.table_title{text-align: left;font-weight: bold;font-size:16px;background-color: #dff0d8;}
	.td_right span{font-size: 25px;color:red;}
</style>
</head>

<script>
KindEditor.ready(function (K) {
    var editor = K.editor({
    	 allowFileManager : true
    });
    K('input[name=filemanager3]').click(function () {
        editor.loadPlugin('image', function() {
            editor.plugin.imageDialog({
                insertfile : $("#headimg").val(),
                clickFn : function(url, title) {
                    $("#headimg").val(url);
                    $("#head").attr("src", url);
                    editor.hideDialog();
                }
            });
        });
    });
});
KindEditor.ready(function(K) {
    var editor2 = K.create('textarea[id="increcontenttext"]', {
        allowFileManager : true,
        afterBlur:function(){this.sync();}
    });
    K('input[name=getHtml]').click(function(e) {
        alert(editor2.html());
    });
    K('input[name=isEmpty]').click(function(e) {
        alert(editor2.isEmpty());
    });
    K('input[name=getText]').click(function(e) {
        alert(editor2.text());
    });
    K('input[name=selectedHtml]').click(function(e) {
        alert(editor2.selectedHtml());
    });
    K('input[name=setHtml]').click(function(e) {
        editor2.html('<h3>Hello KindEditor</h3>');
    });
    K('input[name=setText]').click(function(e) {
        editor2.text('<h3>Hello KindEditor</h3>');
    });
    K('input[name=insertHtml]').click(function(e) {
        editor2.insertHtml('<strong>插入HTML</strong>');
    });
    K('input[name=appendHtml]').click(function(e) {
        editor2.appendHtml('<strong>添加HTML</strong>');
    });
    K('input[name=clear]').click(function(e) {
        editor2.html('');
    });
});
</script>

<body>
<s:form action="person!" namespace="/" theme="simple" id="form">
    <table class="table table-bordered">
        <tr>
            <td colspan="4" class="table_title">基本信息(融资导师)
				<s:hidden name="e.id"/>
            </td>
        </tr>
        <tr>
            <th class="td_right"><input type="button" name="filemanager3" value="上传头像(300*300)" class="btn btn-success"/><span>*</span></th>
            <td style="text-align: left;" colspan="3">
            	<img src="${e.headimg }" style="max-height: 300px;" id="head"/><br/>
                <s:textfield onchange="$('#head').attr('src',$(this).val());" type="text" id="headimg" name="e.headimg" ccc="imagesInput" style="width:400px;" data-rule="头像:required;headimg;length[1~64]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">用户名</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="true"/>
            </td>
            <th class="td_right">姓名<span>*</span></th>
            <td style="text-align: left;">
                <s:textfield name="e.username" id="usernam" readonly="false"
                 data-rule="姓名:required;usernam;length[0~32]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">联系地址</th>
            <td style="text-align: left;">
                <s:textfield name="e.address" id="address" readonly="false" data-rule="联系地址:address;length[0~64]"/>
            </td>
            <th class="td_right">学历</th>
            <td style="text-align: left;">
                <select class="select" name="e.education" id="education">
					<option value=""></option>
					<option value="小学">小学</option>
					<option value="初中">初中</option>
					<option value="高中">高中</option>
					<option value="大学专科">大学专科</option>
					<option value="大学本科">大学本科</option>
					<option value="硕士">硕士</option>
					<option value="博士">博士</option>
				</select>
            </td>
       </tr>
        <tr>
            <th class="td_right">类型(导师为投资人或专家)<span>*</span></th>
            <td style="text-align: left;" >
                <s:select list="%{#application.dic.persontype.childs}" listKey="id" id="persontype" listValue="name" 
                	name="e.persontype" label="用户类型" headerKey="" headerValue="" data-rule="类型:required;persontype"/>
            </td>
            <th class="td_right">机构名称<span>*</span></th>
            <td style="text-align: left;">
            	<s:textfield name="e.org" id="org" readonly="false" data-rule="机构名称:required;org;length[1~64]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">标签（空格分隔）<span>*</span></th>
            <td style="text-align: left;" >
                <s:textfield name="e.label" id="label" readonly="false" data-rule="标签:required;label;length[1~64]"/>
            </td>
            <th class="td_right">数据是否完整</th>
            <td style="text-align: left;">
            	<s:select list="%{#application.dic.whether.childs}" listKey="id" headerKey="" headerValue=""
                    listValue="name" name="e.iscomplete" id="iscomplete"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">是否认证<span>*</span></th>
            <td style="text-align: left;">
            	<s:select list="%{#application.dic.whether.childs}" listKey="id" headerKey="" headerValue=""
                    listValue="name" name="e.approve" id="approve" data-rule="是否认证:required;approve"/>
            </td>
            <th class="td_right">认证优先级</th>
            <td style="text-align: left;" >
            	<select id="priority" name="e.priority"></select>
            </td>
        </tr>
        <tr>
            <th class="td_right">自我介绍</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea rows="3" cols="80" name="e.introduce" id="introduce" readonly="false"
                            data-rule="自我介绍:introduce;length[0~1024]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">详细介绍<span>*</span></th>
            <td style="text-align: left;" colspan="3">
                 <s:textarea name="e.investment" rows="3" cols="80" style="width:100%;height:400px;"
                  id="increcontenttext" readonly="false" data-rule="自我介绍:required;investment"/>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="table_title">其它信息
            </td>
        </tr>
        <tr>
            <th class="td_right">身份证号码</th>
            <td style="text-align: left;">
                <s:textfield name="e.orgid" id="orgid" readonly="false" data-rule="身份证号码:orgid;length[0~32]"/>
            </td>

            <th class="td_right">性别</th>
            <td style="text-align: left;">
                <s:select list="#{'':'','男':'男','女':'女'}" id="sex" name="e.sex"  cssClass="input-medium" 
						listKey="key" listValue="value"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">出生日期</th>
            <td style="text-align: left;">
                <input id="birthday" class="Wdate search-query input-medium" type="text" name="e.birthday"
                	value="${fn:substring(e.birthday, 0, 10)}" onFocus="WdatePicker()"/>
            </td>
			<th class="td_right">毕业院校</th>
            <td style="text-align: left;">
                <s:textfield name="e.graduate" id="graduate" readonly="false" data-rule="毕业院校:graduate;length[0~16]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">专业</th>
            <td style="text-align: left;">
                <s:textfield name="e.subject" id="subject" readonly="false" data-rule="专业:subject;length[0~16]"/>
            </td>
            <th class="td_right">职位</th>
            <td style="text-align: left;" >
            	<s:textfield name="e.position" id="position" readonly="false" data-rule="职位:position;length[0~256]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">所在省</th>
            <td style="text-align: left;" >
            	<s:textfield name="e.person_province" id="person_province" readonly="false" data-rule="所在省:person_province;length[0~16]"/>
            </td>
            <th class="td_right">所在市</th>
            <td style="text-align: left;" >
            	<s:textfield name="e.person_city" id="person_city" readonly="false" data-rule="所在市:person_city;length[0~16]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">所在区</th>
            <td style="text-align: left;" >
            	<s:textfield name="e.person_county" id="person_county" readonly="false" data-rule="所在区:person_county;length[0~16]"/>
            </td>
            <th class="td_right"></th>
            <td style="text-align: left;" ></td>
        </tr>
        <tr>
            <th class="td_right">身份证正面</th>
            <td style="text-align: left;" >
                <s:textfield name="e.idcardpositive" id="idcardpositive" readonly="false" data-rule="身份证正面:idcardpositive;length[0~32]"/>
            </td>
            <th class="td_right">身份证反面</th>
            <td style="text-align: left;">
            	<s:textfield name="e.idcardnegative" id="idcardnegative" readonly="false" data-rule="身份证反面:idcardnegative;length[0~32]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">客户经理</th>
            <td style="text-align: left;" >
                <s:textfield name="e.custmanage" id="custmanage" readonly="false" data-rule="客户经理:custmanage;length[0~16]"/>
            </td>

            <th class="td_right">客户经理数据来源</th>
            <td style="text-align: left;" >
                <s:select list="#{'':'','系统分配':'系统分配','主动营销':'主动营销'}" id="custmanagesource" name="e.custmanagesource"
                 cssClass="input-medium" listKey="key" listValue="value"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">工作室介绍</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea rows="3" cols="80" name="e.studio" id="studio" readonly="false" data-rule="工作室介绍:studio;length[0~512]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">擅长行业</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea rows="3" cols="80" name="e.profession" id="profession" readonly="false" data-rule="擅长行业:profession;length[0~512]"/>
            </td>
        </tr>
        
        <tr>
            <th class="td_right">阅读量</th>
            <td style="text-align: left;" >${e.readtimes }</td>
            <th class="td_right">点赞数</th>
            <td style="text-align: left;" >${e.likenum }</td>
        </tr>
        <tr>
            <th class="td_right">录入时间</th>
            <td style="text-align: left;" >${e.lurushijian }</td>
            <th class="td_right">修改时间</th>
            <td style="text-align: left;" >${e.lastchgtime }</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <button method="person!update.action" class="btn btn-success">
                    <i class="icon-ok icon-white"></i> 保存
                </button>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
	$("#education").val('${e.education}');
	var ahtml = "<option value =\"\"></option>";
    for (var i = 1; i <= 100; i ++ ) {
    	ahtml += "<option value =\"" + i + "\">" + i + "</option>";
    }
    $("#priority").html(ahtml)
    $("#priority").val('${e.priority}');
</script>
</body>
</html>
