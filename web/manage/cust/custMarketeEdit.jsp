<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <%@ include file="/resource/common_html_meat.jsp"%>
    <%@ include file="/manage/system/common.jsp"%>
    <%@ include file="/resource/common_html_validator.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.qrcode.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
    <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/resource/drag/dragImg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
    <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/sbapp/DataCheck.js"></script>
    <style>
        .td_right {text-align: right;width: 130px;}
        select {height: auto;width: 184px;}
        .table_title {text-align: left;font-weight: bold;font-size: 16px;background-color: #dff0d8;}
        label{display: inline;}
        .table th, .table td{width:25% !important;}
    </style>
</head>
<body>
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
<s:form action="/manage/cust!saveMarkete.action" id="form" name="form" theme="simple" method="post">
    <table class="table table-bordered first">
        <tr>
            <td colspan="4" class="table_title"><span id="name"></span>营销记录
            	<div style="display: none;">
            		<s:hidden name="appmarkete.pkid"/>
            		<s:hidden name="appmarkete.qiyeid"/>
            	</div>
            </td>
        </tr>
        <tr>
            <td class="td_right">沟通类型<span style="color:red;">*</span></td>
            <td style="text-align: left;">
            	<s:radio list="%{#application.dic.commtype.childs}" listKey="id" listValue="name" headerKey=""
                          headerValue="" name="appmarkete.commtype" id="enable" theme="simple"/>
            </td>
            <td class="td_right">拜访人名称<span style="color:red;">*</span></td>
            <td style="text-align: left;">
				<s:textfield theme="simple" name="appmarkete.vistperson" id="vistperson" readonly="false"/>
			</td>
        </tr>
        <tr>
            <td class="td_right">拜访人电话<span style="color:red;">*</span></td>
            <td style="text-align: left;">
				<s:textfield theme="simple" name="appmarkete.visttele" id="visttele" readonly="false"/>
			</td>
			<td class="td_right">拜访人职位</td>
            <td style="text-align: left;">
				<s:textfield theme="simple" name="appmarkete.vistposition" id="vistposition" readonly="false"/>
			</td>
        </tr>
        <tr>
            <td class="td_right">沟通时间<span style="color:red;">*</span></td>
            <td style="text-align: left;">
				<s:textfield style="width:155px;" theme="simple" class="Wdate search-query input-small" onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss'})" name="appmarkete.commdate" id="commdate" readonly="false"/>
			</td>
			<td class="td_right">沟通地点</td>
            <td style="text-align: left;">
				<s:textfield theme="simple" name="appmarkete.commaddress" id="commaddress" readonly="false"/>
			</td>
        </tr>
        <tr>
            <td class="td_right">主要沟通内容<span style="color:red;">*</span></td>
            <td style="text-align: left;" colspan="3">
                <s:textarea name="appmarkete.maincontent" style="width:99%;" id="maincontent" theme="simple"></s:textarea>
            </td>
        </tr>
        <tr>
            <td class="td_right">客户需求</td>
            <td style="text-align: left;width: 42%;" colspan="3">
            	<s:checkboxlist theme="simple" name="appmarkete.custdemand" list="%{#application.dic.servedemand.childs}"
            		id="custdemand" value="%{#request.custdemands}" listKey="id" listValue="name"></s:checkboxlist>
            </td>
        </tr>
        
        <tr>
            <td class="td_right"><span class="uploadbtn btn btn-success" reg="image" num="multiple" type="image">上传图片</span><br>现场照片（多张）</td>
            <td style="text-align: left;" colspan="3" id="imgback">
                <s:textfield isNotNull=""  theme="simple" name="appmarkete.commphoto" class="file1" id="commphoto"  style="width:99%;"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">经度</td>
            <td style="text-align: left;">
				<input type="text" theme="simple" name="appmarkete.longitude" id="longitude" value="${appmarkete.longitude}"/>
			</td>
			<td class="td_right">纬度</td>
            <td style="text-align: left;">
				<input type="text" theme="simple" name="appmarkete.latitude" id="latitude" value="${appmarkete.latitude}"/>
			</td>
        </tr>
        <tr>
            <td class="td_right">录入人</td>
            <td style="text-align: left;">${appmarkete.inputuser}</td>
            <td class="td_right"></td>
            <td style="text-align: left;"></td>
        </tr>
        <tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(appmarkete.inputtime, 0, 19)}</td>
            <td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(appmarkete.lastchgtime, 0, 19)}</td>
        </tr>
        <tr>
      		<td colspan="4" style="text-align: center;">
      			<span onclick="submit()" class="btn btn-success" id="subbutton"><i class="icon-ok icon-white"></i>保存</span>
      		</td>
        </tr>
    </table>
 </s:form>  
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/easyUpload/easy-upload.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/easyUpload/easyUpload.js"></script>
    
    <script type="text/javascript">
        var imgs='${appmarkete.commphoto}';
        if(imgs!=""){
            var imgarr= imgs.split(',');
            $.each(imgarr,function (i,v) {
                $('#imgback').append('<img src="'+v+'" class="smallpic">')
            });
        }
        $("#name").html("【" + decodeURI('${qiyename }') + "】");
        
        if ($("#commdate").val() == "") {
        	$("#commdate").val();
        }
        function submit() {
			var submit = 1;
			var checkobj = ["vistperson", "visttele", "maincontent"];
			if (typeof($("[name='appmarkete.commtype']:checked").val()) == "undefined") {
				submit = 0;
			}
			for (var i = 0;i < checkobj.length; i++) {
				if ($.trim($("[name='appmarkete." + checkobj[i] + "']").val()) == "") {
					submit = 0;
				}
			}
			if (submit == 1) {
				$.ajax({
					type: 'post',
					url: "/manage/cust!saveMarkete.action",
					dataType: "text",
					data: $("#form").serialize(),
					success: function(data) {
						layer.confirm(data, {
							title:"提示",btn:['确定'],area: ['200px', '200px']
				        }, function(index) {
				            layer.close(index);
				            if (data == "保存成功！") {
								// window.parent.location = "/manage/cust!getList.action";
                                parent.location.reload(); //刷新父页面
                                var parentIndex = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(parentIndex);
							}	
				        });
					}
				});
			} else {
				layer.alert("有输入框未填写，请检查后提交!", {icon: 7, title : '提示'});
			}
		}
		if ('${appmarkete.pkid}' != "" && '${userid}' != '${appmarkete.inputuser}') {
			$("#subbutton").remove();
		}
    </script>
</body>
</html>