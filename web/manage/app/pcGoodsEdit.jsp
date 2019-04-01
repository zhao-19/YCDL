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
#ldksq {
    display: none;
    width: 100%;
    height: 100%;
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    right: 0;
    margin: auto;
    z-index: 9999 !important;
    background: url("../img/lobg_03.png") repeat;
}

#ldksq_c {
    background-color: #fff;
    width: 95%;
    min-height: 410px;
    /*position: absolute;top:0;left:0;right:0;bottom: 0;*/
    margin: auto;
    border-radius: 5px;
    behavior: url(PIE.htc);
    padding: 10px;
}

#ldksq_c p {
    text-align: center;
}

#ldksq_c .qx {
    background: url("../img/delete.png") no-repeat;
}

#ldksq_c form {
    margin: 0;
    padding-top: 10px;;
}

#ldksq_c input.title, textarea.duanxin {
    width: 240px;;
}

.pbczdbaseTitle {
    font-size: 20px;
    text-align: left !important;
}

.pbczdbaseTable {
    height: 320px;
    width: 100%;
    overflow: auto;
}
</style>
<script>
	KindEditor.ready(function(K) {
		var editor = K.editor({
			allowFileManager : false
		});

		K('#filemanager').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					insertfile : K('#imgurl').val(),
					clickFn : function(url, title) {
						K('#imgurl').val(url);
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

	});
</script>

</head>

<body>
	<s:form action="product" namespace="/manage" theme="simple" id="form"
		name="form" method="post">
		<table class="table table-bordered">

			<tr style="display: none;">
				<th>id</th>
				<td colspan="3"><s:hidden name="e.pkid" /></td>
			</tr>

			<tr>
				<th class="td_right">类型</th>
				<td style="text-align: left;" colspan="3"><s:select
						list="%{#request.genreType}" name="genre" id="genre"
						value="e.genre" readonly="false" /></td>
			</tr>


			<tr>
				<th class="td_right">名称</th>
				<td style="text-align: left;"><s:textfield name="e.title"
						id="title" readonly="false"
						data-rule="标题:required;prodid;length[1~16]" /></td>
			</tr>
			<tr>
				<th class="td_right">简单描述</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="e.bewrite" id="bewrite" readonly="false" rows="3" cols="80" />
				</td>
			</tr>
			<tr>
				<th class="td_right">详细介绍</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="e.content" id="content" readonly="false" rows="3" cols="80" />
				</td>
			</tr>
			<tr>
				<th class="td_right">所属行业</th>
				<td style="text-align: left;" colspan="3"><s:select
						list="%{#request.industrylist}" listKey="id" listValue="name"
						name="industry" id="industry" value="e.industry" readonly="false" /></td>
			</tr>
			<tr>
				<th class="td_right">产品价格</th>
				<td style="text-align: left;"><s:textfield name="e.price"
						id="price" readonly="false" data-rule="产品价格:required;price;digits" /></td>
			</tr>
			<tr>
				<div class="inputtest inputtestl">
					<td class="td_right"><span class="leftname leftnamel"><input
							type="button" name="filemanager" id="filemanager"
							value="详情图片（720*288）" class="btn btn-success" /></span></td>
					<td style="text-align: left;"><span class="rightinfo"><input
							readonly="readonly" type="text" class="input" id="imgurl"
							name="e.imgurl" value="<s:property value='e.imgurl'/>" /> </span></td>
				</div>
			</tr>
			<tr>
				<div class="inputtest inputtestl">
					<td class="td_right"><span class="leftname leftnamel"><input
							type="button" name="filemanager2" id="filemanager2"
							value="列表图片（300*180）" class="btn btn-success" /></span></td>
					<td style="text-align: left;"><span class="rightinfo"><input
							readonly="readonly" type="text" class="input" id="logo"
							name="e.prologo" value="<s:property value='e.prologo'/>" /> </span></td>
				</div>
			</tr>

			<tr>
				<th class="td_right">数据来源</th>
				<td style="text-align: left;"><s:select
						list="%{#request.datasourcelist}" listKey="id" listValue="name"
						name="e.data_source" id="data_source"
						value="#request.e.data_source" /></td>

				<th class="td_right">app发布编号</th>
				<td style="text-align: left;"><s:textfield name="e.appid"
						id="appid" readonly="false" /><s:a href="#" cssClass="btn btn-success" id="selectPbczdbase">请选择</s:a></td>
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
				<th class="td_right">创建时间</th>
				<td style="text-align: left;" colspan="3"><s:textfield name="e.createdate"
						id="createdate" readonly="true" /></td>
			</tr>
			<tr>
				<th class="td_right">创建人</th>
				<td style="text-align: left;" colspan="3"><s:textfield name="e.createby"
						id="createby" readonly="true" /></td>
			</tr>
			<tr>
				<th class="td_right">最后修改人</th>
				<td style="text-align: left;" colspan="3"><s:textfield name="e.updateby"
						id="updateby" readonly="true" /></td>
			</tr>
			<tr>
				<th class="td_right">最后修改时间</th>
				<td style="text-align: left;" colspan="3"><s:textfield name="e.updatedate"
						id="updatedate" readonly="true" /></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;"><s:if
						test="e.pkid=='' or e.pkid==null">
						<button method="appGoods!insert.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if> <s:else>
						<button method="appGoods!update.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else></td>
			</tr>
		</table>
	</s:form>
	<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <form action="" name="indexdksq" id="indexdksq" method="post">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <p class="pbczdbaseTitle">app端未在pc端发布数据:<span style="margin-left:20px;">输入产品标题进行模糊筛选：</span><input onkeypress="if (event.keyCode == 13)  return false" type="text" value="" style="margin-left:20px;margin-bottom:0;"/><button type="button"  class="shaixuan btn btn-success" style="margin-left:20px;"><i class="icon-ok icon-white"></i> 筛选</button></p>
        <div class="pbczdbaseTable">
        
        <table id="pbczdbaseTablec" class="table table-bordered table-hover">
        
        <thead>
        <tr style="background-color: #dff0d8">
            <th width="20"><input type="radio" id="checkBox"/></th>
            <th>pkid</th>
            <th>类别</th>
            <th>申请人</th>
            <th>标题</th>
            <th>审核状态</th>
            <th>审核人</th>
            <th>最后修改时间</th>
        </tr>
        </thead>
        <tbody id="dataBody">
            
        </tbody>
        
        
    </table>
        
        </div>
        <p>
            <button id="ldksq_lose2" type="button" class="btn btn-inverse"  style="margin-left:20px;">
                <i class="icon-ok icon-white qx"></i> 取消
            </button>
            <button id="btn-successok" type="button" class="btn btn-success" style="margin-left:20px;">
                <i class="icon-ok icon-white"></i> 确定
            </button>
        </p>
        </form>
    </div>
</div>
<script type="text/javascript">
        if ('${flag}' != "") {
            alert('${flag}');
        }
        $("#selectPbczdbase").click(function(){
            //ajax异步请求查询贷款申请表审核通过数据返回到id为pbczdbaseTablec的table表里面
            //1.查询之后返回到当前
            $.post("appGoods!selectAppProducts.action", function(data) {
                var dataObj = eval("(" + data + ")");
                var htmlStr = "";
                $.each(dataObj, function(k, v) {
                    htmlStr += '<tr>' + '<th width="20"><input lang="'+v.pkid+'" type="radio" name="dataCheckBox"  user="'+v.userid+'" qiye="'+v.qiyeid+'"/>'+
                    '</th><th>'+v.pkid+'</th>'+
                    	'<th>' + v.genre + '</th>' + '<th>'
                            + v.userid + '</th>' + '<th>' + v.title
                            + '</th>' + '<th>' + v.review_id + '</th>'
                            + '<th>' + v.review_date + '</th>' + '<th>'
                            + v.update_at + '</th></tr>'
                });
                $("#dataBody").html(htmlStr);
            });

            $("#ldksq").show();
            var divName = $("#ldksq_c");
            var top = ($(window).height() - $(divName).height()) / 2;
            var left = ($(window).width() - $(divName).width()) / 2;
            var scrollTop = $(document).scrollTop();
            var scrollLeft = $(document).scrollLeft();
            $(divName).css({
                position : 'absolute',
                'top' : top,
                left : left + scrollLeft
            }).show();
        });
        $("#ldksq_lose2").click(function(){
            $("#ldksq").hide();
        });
        $("#btn-successok").click(function(){
               var appTag = getDataIds();
              $("#appid").val(appTag.attr("lang"));
              $("#releuserid").val(appTag.attr("user"));
              $("#releid").val(appTag.attr("qiye"));
//             alert(strid+"***"+pshid);return;
                    // 保存数据
                    // 设置数据
              $("#ldksq").hide();
                    
            return;
           });
        function getDataIds() {
            var dataTag = $("#dataBody input[name=dataCheckBox]:checked");
            return dataTag;
        }
    </script>	
</body>

</html>
