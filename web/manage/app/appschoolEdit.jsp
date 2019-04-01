<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
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
    <style>
        .td_right {text-align: right;width: 130px;}
        select {height: auto;}
        .table_title {text-align: left;font-weight: bold;font-size: 16px;background-color: #dff0d8;}
        .intro {width: 100%;}
    </style>
</head>
<body>
<!--绝对定位元素放在最前-->
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
<s:form action="/manage/appCommon!saveSchool.action" id="form" name="form" theme="simple" method="post">
    <table class="table table-bordered">
        <tr>
            <td colspan="4" class="table_title">盈创学院
                <s:hidden name="school.pkid"/>
                <s:hidden name="school.rele"/>
                <span style="float:right;">
            		视频转换:<a target="_blank" href="http://www.pcfreetime.com/formatfactory/CN/index.html">格式工厂</a>
            	</span>
            </td>
        </tr>

        <tr>
            <td class="td_right">名称<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.title" id="title" readonly="false"/>
            </td>
            <td class="td_right">主讲人<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.username" id="username" readonly="false"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">所属公司<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.qiyename" id="qiyename" readonly="false"/>
            </td>
            <td class="td_right">标签(空格分隔)<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.label" id="label" readonly="false"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">是否开放<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.whether.childs}" listKey="id" listValue="name" headerKey=""
                          headerValue="" name="school.enable" id="enable"/>
            </td>
            <td class="td_right">价格(元)<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.price" id="price" readonly="false"/></td>
        </tr>
        <tr>
            <td class="td_right">类别<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.mediagenre.childs}" listKey="id" listValue="name" headerKey=""
                          headerValue="" name="school.genre" id="genre"/>
            </td>
            <td class="td_right">排序（1-1000）<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.sort" id="sort" readonly="false"/>
            </td>
        </tr>

        <tr>
            <td class="td_right"><span class="uploadbtn btn btn-success" reg="image" type="image">上传图片</span><br>支持jpg、jpeg、png、bmp<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.imgurl" id="imgurl" class="file1" readonly="false"/>
                    <s:if test="school.imgurl != null">
                        <img src="${school.imgurl}" alt="" class="smallpic">
                    </s:if>
            </td>
            <td class="td_right"><span class="uploadbtn btn btn-success" reg="mps" type="mps" aim="1">上传资源</span><br>资源地址1(mp3,mp4超清)<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.sourceurl_super" id="sourceurl_super" class="file1" readonly="false"/>

                <s:if test="school.sourceurl_super!=null&&school.sourceurl_super.contains('mp3')">
                    <audio class="mp3"  src="${school.sourceurl_super}" controls="controls">您的浏览器不支持 audio 预览。</audio>
                </s:if>
                <s:elseif test="school.sourceurl_super!=null&&school.sourceurl_super.contains('mp4')" >
                    <div class="mp4box">
                        <video class="mp4" src="${school.sourceurl_super}" controls="controls"></video>
                        <a href="${school.sourceurl_super}" target="_blank">新窗口打开视频</a>
                    </div>
                </s:elseif>
            </td>
        </tr>
        <tr>
            <td class="td_right"><span class="uploadbtn btn btn-success" reg="mp4" type="mp4">上传资源</span><br>资源地址2(mp4高清)</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.sourceurl_high" id="sourceurl_high" class="file1" readonly="false"/>
                <s:if test="school.sourceurl_high != null&&school.sourceurl_high!=''">
                    <div class="mp4box">
                        <video  class="mp4" src="${school.sourceurl_high}" controls="controls"></video>
                        <a href="${school.sourceurl_high}" target="_blank">新窗口打开视频</a>
                    </div>
                </s:if>
            </td>
            <td class="td_right"><span class="uploadbtn btn btn-success" reg="mp4" type="mp4">上传资源</span><br>资源地址3(mp4普清)</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.sourceurl_stand" id="sourceurl_stand" class="file1" readonly="false"/>
                <s:if test="school.sourceurl_stand != null&&school.sourceurl_stand!=''">
                    <div class="mp4box">
                        <video  class="mp4" src="${school.sourceurl_stand}" controls="controls"></video>
                        <a href="${school.sourceurl_stand}" target="_blank">新窗口打开视频</a>
                    </div>

                </s:if>
            </td>

        </tr>
        <tr>
            <td class="td_right">资源时长(秒)<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.sourcetime" id="sourcetime" readonly="false"/>
            </td>
            <td class="td_right">资源分类<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.mediatype.childs}" listKey="id" listValue="name" headerKey=""
                          headerValue="" name="school.sourcetype"  id="sourcetype" disabled="disabled" />
            </td>
        </tr>
         <tr>
            <td class="td_right">简单描述<span style="color:red;">*</span></td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="school.intro" id="intro" readonly="false"/>
            </td>
            <td></td><td></td>
        </tr>
        <tr>
            <td class="td_right"><span class="uploadbtn btn btn-success" reg="image" type="image" num="multiple">上传课程讲义</span><span style="color:red;">*</span><br></td>
            <td style="text-align: left;" colspan="3">
                <s:textfield theme="simple" name="school.coursenotes"  class="file1 multipleImage" id="coursenotes" style="width:99%;"/>

                <!--<s:textarea name="school.coursenotes" style="width:99%;" id="coursenotes"></s:textarea>-->
            </td>
        </tr>
        <tr>
            <td class="td_right">简介<span style="color:red;">*</span></td>
            <td style="text-align: left;" colspan="3">
                <s:textarea name="school.bewrite" style="width:99%;" id="bewrite"></s:textarea>
            </td>
        </tr>
        <tr>
            <td class="td_right">详细介绍<span style="color:red;">*</span></td>
            <td style="text-align: left;" colspan="3">
                <s:textarea name="school.content" id="content"
                            style="width:100%;height:400px;visibility:hidden;"></s:textarea>
            </td>
        </tr>
        <tr>
            <td class="td_right">播放次数</td>
            <td style="text-align: left;">${school.playtimes }</td>
            <td class="td_right">下载次数</td>
            <td style="text-align: left;">${school.downtimes }</td>
        </tr>
        <tr>
            <td class="td_right">发布人</td>
            <td style="text-align: left;">${school.userid }</td>
            <td class="td_right">创建人</td>
            <td style="text-align: left;">${school.inputuser }</td>
        </tr>
        <tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(school.lurushijian, 0, 19)}</td>
            <td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(school.lastchgtime, 0, 19)}</td>
       	</tr>
       	<tr>
      		<td colspan="4">
      			<span onclick="submit()" class="btn btn-success"><i class="icon-ok icon-white"></i>保存</span>
      		</td>
        </tr>
	</table>
</s:form>

<script type="text/javascript">

	function submit() {
		var submit = 1;
		var checkobj = ["title", "username", "qiyename", "label", "intro", "imgurl", "price", "genre", "sourcetype", "sourceurl_super", "sourcetime", "bewrite", "content", "enable", "sort"]; 
		for (var i = 0;i < checkobj.length; i++) {
			if ($.trim($("[name='school." + checkobj[i] + "']").val()) == "") {
				submit = 0;
			}
		}
		if (submit == 1) {
			$("#form").submit();
		} else {
			layer.alert("有输入框未填写，请检查后提交!", {icon: 7, title : '提示'});
		}
	}

</script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="school.content"]', {
			allowFileManager : true,
            afterBlur:function(){this.sync();}
		});
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=isEmpty]').click(function(e) {
			alert(editor.isEmpty());
		});
		K('input[name=getText]').click(function(e) {
			alert(editor.text());
		});
		K('input[name=selectedHtml]').click(function(e) {
			alert(editor.selectedHtml());
		});
		K('input[name=setHtml]').click(function(e) {
			editor.html('<h3>Hello KindEditor</h3>');
		});
		K('input[name=setText]').click(function(e) {
			editor.text('<h3>Hello KindEditor</h3>');
		});
		K('input[name=insertHtml]').click(function(e) {
			editor.insertHtml('<strong>插入HTML</strong>');
		});
		K('input[name=appendHtml]').click(function(e) {
			editor.appendHtml('<strong>添加HTML</strong>');
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
<link rel="stylesheet" href="/resource/easyUpload/easy-upload.css?${sysversion}" />
<script charset="utf-8" src="/resource/easyUpload/easyUpload.js?${sysversion}"></script>
</body>
</html>