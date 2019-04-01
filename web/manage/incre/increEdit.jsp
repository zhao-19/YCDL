<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style>
select {
    height: auto;
}
.ke-dialog-default,.ke-dialog{top:50%;}
</style>

<script type="text/javascript">
KindEditor.ready(function(K) {
    var editor = K.editor({
        allowFileManager : false
    });

    
K('#filemanager').click(function() {
        editor.loadPlugin('image', function() {
            editor.plugin.imageDialog({
                insertfile : K('#picture').val(),
                clickFn : function(url, title) {
                    K('#picture').val(url);
                    editor.hideDialog();
                }
            });
            });
    });
    K('#filemanager2').click(function() {
        editor.loadPlugin('image', function() {
            editor.plugin.imageDialog({
                insertfile : K('#logo').val(),
                clickFn : function(url, title) {
                    K('#logo').val(url);
                    editor.hideDialog();
                }
            });
        });
    });
    //项目图片：
     K('#logo').click(function() {
        if (t == 'v') {
            return;
        }
        var val = $(this).attr("id");
        //重新获取窗口宽高
        var inHeight = window.innerHeight;
        var inWidth = window.innerWidth;
        var outHeight = window.outerHeight;
        var outWidth = window.outerWidth;

        editor.loadPlugin('image', function() {
            editor.plugin.imageDialog({
                insertfile : K('#logo').val(),
                clickFn : function(url, title) {
                    K('#logo').val(url);
                    editor.hideDialog();
                    removError(val)
                }
            });
            //重新定位上传图片弹出框在浏览器窗口中居中
            var dlgH = $(".ke-dialog-default").height();
            var dlgW = $(".ke-dialog-default").width();
            //以下公式是计算出浏览器的居中位置
            var nTop = (inHeight - dlgH) / 2;
            var nLeft = (inWidth - dlgW) / 2;
            $('.ke-dialog-default').css({
                "top" : nTop,
                "left" : nLeft
            });
        });
    }); 

});    
</script>
<style type="text/css">
select {
	margin-bottom: 0px;
	height: auto;
}
</style>
</head>

<body>
	<s:form action="incre!" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">

			<tr style="display: none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>




			<tr>
				<th class="td_right">产品编号</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.increid" id="increid" readonly="true"
						data-rule="产品编号:required;increid;length[8~8]" /></td>
			</tr>



			<tr>
				<th class="td_right">增值业务名称(不超过10个字)</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.increname" size="50" id="increname" readonly="false"
						data-rule="增值业务名称:required;increname;length[2~10]" /></td>


			</tr>



			<tr>

				<td style="text-align: left;" colspan="4"><input type="button"
					name="filemanager" id="filemanager" value="产品图标" class="btn btn-success" /> <s:textfield
						type="text" id="picture" name="e.picture" ccc="imagesInput"
						style="width: 600px;margin-bottom:0px;"
						data-rule="小图;required;maxPicture;" /> <s:if
						test="e.picture!=null">
						<a target="_blank"
							href="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.picture" />">
							<img style="max-width: 50px; max-height: 50px;" alt=""
							src="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.picture" />">
						</a>
					</s:if></td>

			</tr>



			<tr>
				<th class="td_right">增值业务描述(不超过20个字)</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.incredescrip" id="incredescrip" size="50" readonly="false"
						data-rule="增值业务描述:required;incredescrip;length[2~20]" /></td>
			</tr>

			<tr>
				<th class="td_right">价格（元）</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.increprice" id="increprice" readonly="false"
						onkeyup="value=value.replace(/[^\d]/g,'')"
						data-rule="价格:required;amt;increprice;money" /></td>
			</tr>

			<tr>
				<th class="td_right">内容(不用这个框框了)</th>
				<td style="text-align: left;" colspan="3"><s:textarea rows="5"
						cols="80" name="e.increcomtent" id="increcomtent" readonly="false" />
				</td>
			</tr>


			<tr>
				<th class="td_right">内容</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="e.increcontenttext" rows="3" cols="80"
						style="width:100%;height:400px;" id="increcontenttext"
						readonly="false" /></td>
			</tr>


			<tr>
				<th class="td_right">是否推荐(首页只展示推荐的产品且最近修改的排序在前)</th>
				<td style="text-align: left;" colspan="3"><s:select
						list="%{#request.status2list}" listKey="id" listValue="name"
						name="e.shifoutuijian" id="shifoutuijian"
						onchange="changetuijian()" value="#request.e.shifoutuijian" /></td>
			</tr>

			<tr>
				<th class="td_right">点击量</th>
				<td style="text-align: left;"><s:textfield name="e.browsecount"
						id="browsecount" readonly="true" /></td>

				<th class="td_right">关注量</th>
				<td style="text-align: left;"><s:textfield name="e.markcount"
						id="markcount" readonly="true" /></td>
			</tr>
			<tr>
				<th class="td_right">录入时间</th>
				<td style="text-align: left;"><s:textfield name="e.lurushijian"
						id="lurushijian" readonly="true" /></td>

				<th class="td_right">录入人</th>
				<td style="text-align: left;"><s:textfield name="e.inputuser"
						id="inputuser" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">最后修改时间</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.lastchgtime" id="lastchgtime" readonly="true" /></td>
			</tr>
			<tr>
				<th class="td_right">数据来源</th>
				<td style="text-align: left;"><s:select
						list="%{#request.datasourcetype}" listKey="id" listValue="name"
						name="e.datasource" id="datasource" value="#request.e.datasource" /></td>

				<th class="td_right">app发布编号</th>
				<td style="text-align: left;"><s:textfield name="e.appid"
						id="appid" readonly="false" /></td>
			</tr>
			<tr>
				<th class="td_right">企业id</th>
				<td style="text-align: left;"><s:textfield name="e.releid"
						id="releid" readonly="false" /></td>

				<th class="td_right">发布人id</th>
				<td style="text-align: left;"><s:textfield name="e.releuserid"
						id="releuserid" readonly="false" /></td>
			</tr>
			<tr>
				<div class="inputtest inputtestl">
					<td class="td_right"><span class="leftname leftnamel"><input
							type="button" name="filemanager2" id="filemanager2"
							value="详情图片（720*288）" class="btn btn-success" /></span></td>
					<td style="text-align: left;"><span class="rightinfo"><input
							readonly="readonly" type="text" class="input" id="logo"
							name="e.imgdetail" value="<s:property value='e.imgdetail'/>" />
					</span></td>
				</div>
			</tr>

			<tr>
				<td colspan="4" style="text-align: center;"><s:if
						test="e.id=='' or e.id==null">
						<button method="incre!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if> <s:else>
						<button method="incre!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else></td>
			</tr>
		</table>
	</s:form>



	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/themes/default/default.css" />
	<script charset="utf-8"
		src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8"
		src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script>
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="e.increcontenttext"]', {
				allowFileManager : true
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
	</script>

</body>
</html>
