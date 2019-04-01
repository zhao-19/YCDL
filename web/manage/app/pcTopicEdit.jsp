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
                    insertfile : K('#logo2').val(),
                    clickFn : function(url, title) {
                        K('#logo2').val(url);
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
				<th class="td_right">标题</th>
				<td style="text-align: left;"><s:textfield name="e.title"
						id="title" readonly="false"
						data-rule="标题:required;title;length[1~32]" /></td>
			</tr>
			
			<tr>
                <th class="td_right">标签</th>
                <td style="text-align: left;"><s:textfield name="e.tag"
                        id="tag" readonly="false" /></td>
            </tr>
            <tr>
                <th class="td_right">话题发起人</th>
                <td style="text-align: left;"><s:textfield name="e.userid"
                        id="userid" readonly="false" data-rule="发起人:required;userid;length[1~32]"/></td>
            </tr>
            <tr>
                <th class="td_right">股权id</th>
                <td style="text-align: left;"><s:textfield name="e.equityid"
                        id="equityid" readonly="true" />
                        <s:a href="javascript:getAppList(1)" cssClass="btn btn-success" >请选择</s:a>
                        </td>
            </tr>
            <tr>
                <th class="td_right">内容</th>
                <td style="text-align: left;"><s:textarea name="e.content"  rows="3" cols="80"
                        id="content" readonly="false" data-rule="内容:required;content;length[10~512]"/></td>
            </tr>
            <tr>
                <th class="td_right">来源</th>
                <td style="text-align: left;"><s:textfield name="e.source"
                        id="source" readonly="false" data-rule="来源:required;source;length[1~32]"/></td>
            </tr>
			<tr>
                <td style="text-align: left;">
                <input type="button" name="filemanager" id="filemanager" value="图片（702*180像素）" class="btn btn-success" /></td>
                     <td style="text-align: left;">
                     <s:textfield type="text" id="picture" name="e.picture" ccc="imagesInput" theme="simple"
                        style="width: 300px;margin-bottom:0px;" readonly="true"
                        data-rule="图片;required;" /> 
                        <s:if test="e.picture!=null">
                            <a target="_blank" href="<s:property value="e.picture" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='e.picture'/>">
                            </a>
                        </s:if>
                    </td>
            </tr>
            
			<tr>
                <th class="td_right">页面编号(app主键)</th>
                <td style="text-align: left;"><s:textfield name="e.appid"
                        id="appid" readonly="true"/>
                        <s:a href="javascript:getAppList(2)" cssClass="btn btn-success" >请选择</s:a>
                        </td>
            </tr>
            <tr>
                <th class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经纬度(点击获取)</a></th>
                <td style="text-align: left;">
                	<s:textfield name="e.lnglat" id="lnglat" readonly="false" data-rule="经纬度:lnglat;length[0~128]"/>
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
                <th class="td_right">最后修改人</th>
                <td style="text-align: left;"><s:textfield name="e.updateby"
                        id="updateby" readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">最后修改时间</th>
                <td style="text-align: left;"><s:textfield name="e.updatedate"
                        id="updatedate" readonly="true" /></td>
            </tr>
             <tr>
                <th class="td_right">备注</th>
                <td style="text-align: left;"><s:textarea name="e.remark"  rows="3" cols="80"
                        id="remark" readonly="false" /></td>
            </tr>
			<tr>
				<td colspan="4" style="text-align: center;"><s:if
						test="e.pkid=='' or e.pkid==null">
						<button method="appTopic!insert.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if> <s:else>
						<button method="appTopic!update.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else></td>
			</tr>
		</table>
		<div id="ldksq">
        <div id="ldksq_c">
            <input type="hidden" name="e.id" value="<s:property value="e.id" />" />
            <p class="pbczdbaseTitle">
                app端未在pc端发布数据:<span style="margin-left: 20px;">输入产品标题进行模糊筛选：</span><input
                    onkeypress="if (event.keyCode == 13)  return false" type="text"
                    value="" style="margin-left: 20px; margin-bottom: 0;" />
                <button type="button" class="shaixuan btn btn-success"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white"></i> 筛选
                </button>
            </p>
            <div class="pbczdbaseTable">

                <table id="pbczdbaseTablec" class="table table-bordered table-hover">

                    <thead>
                        <tr style="background-color: #dff0d8">
                            <th width="20"></th>
                            <th>pkid</th>
                            <th>类别</th>
                            <th>申请人</th>
                            <th>需求描述</th>
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
                <button id="ldksq_lose2" type="button" class="btn btn-inverse"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white qx"></i> 取消
                </button>
                <button id="btn-successok" type="button" class="btn btn-success"
                    style="margin-left: 20px;">
                    <i class="icon-ok icon-white"></i> 确定
                </button>
            </p>
        </div>
    </div>
      
    
<script type="text/javascript"> 
                    function getAppList(querytype) {
                 //1.查询之后返回到当前
                 if(querytype == 1) {
                 $.post("appTopic!selectAppProducts.action",{"querytype":querytype},function(data) {
                    var dataObj = eval("("+ data+ ")");
                    var htmlStr = "";
                    $.each(dataObj,function(k,v) {
                        var a = typeof(v.inputuser) == "undefined" ? "" : v.inputuser;
                        var b = typeof(v.lastchgtime) == "undefined" ? "" : v.lastchgtime;
                        var c = typeof(v.releuserid) == "undefined" ? "" : v.releuserid;
                        
                        
                        htmlStr += '<tr>'
                        + '<th width="20"><input lang="'+v.id+'" type="radio" name="dataCheckBox"  type2="1" />'
                        + '</th><th>'+ v.id+ '</th>'+ '<th>'+ '股权项目'+ '</th>'
                        + '<th>'+ c + '</th>'+ '<th class="sxmc">'+ v.mingcheng+ '</th>'
                        + '<th>'+ v.shenhezhuangtai+ '</th>'+ '<th>'+ a + '</th>'+'<th>'+ b + '</th>'
                        $("#dataBody").html(htmlStr);
                        });

                                        $("#ldksq").show();
                                        var divName = $("#ldksq_c");
                                        var top = ($(window).height() - $(
                                                divName).height()) / 2;
                                        var left = ($(window).width() - $(
                                                divName).width()) / 2;
                                        var scrollTop = $(document).scrollTop();
                                        var scrollLeft = $(document)
                                                .scrollLeft();
                                        $(divName).css({
                                            position : 'absolute',
                                            'top' : top,
                                            left : left + scrollLeft
                                        }).show();
                 });
                    }
                 if(querytype == 2) {
                     $.post("appTopic!selectAppProducts.action",{"querytype":querytype},function(data) {
                        var dataObj = eval("("+ data+ ")");
                        var htmlStr = "";
                        $.each(dataObj,function(k,v) {
                            var a = typeof(v.reviwer_id) == "undefined" ? "" : v.reviwer_id;
                            var b = typeof(v.updatedate) == "undefined" ? "" : v.updatedate;
                            htmlStr += '<tr>'
                            + '<th width="20"><input lang="'+v.pkid+'" type="radio" name="dataCheckBox"  type2="2" />'
                            + '</th><th>'+ v.pkid+ '</th>'+ '<th>'+ '融资辅导'+ '</th>'
                            + '<th>'+ v.userid+ '</th>'+ '<th class="sxmc">'+ v.content+ '</th>'
                            + '<th>'+ v.chstatus+ '</th>'+ '<th>'+ a + '</th>'+'<th>'+ b + '</th>'
                            });
                            $("#dataBody").html(htmlStr);

                                            $("#ldksq").show();
                                            var divName = $("#ldksq_c");
                                            var top = ($(window).height() - $(
                                                    divName).height()) / 2;
                                            var left = ($(window).width() - $(
                                                    divName).width()) / 2;
                                            var scrollTop = $(document).scrollTop();
                                            var scrollLeft = $(document)
                                                    .scrollLeft();
                                            $(divName).css({
                                                position : 'absolute',
                                                'top' : top,
                                                left : left + scrollLeft
                                            }).show();
                     });
                        }
                 }
                    $("#ldksq_lose2").click(function() {
                        $("#ldksq").hide();
                    });
                    $("#btn-successok").click(function() {
                        var appTag = getDataIds();
                        var type2 = appTag.attr("type2");
                        if (type2 == "1") {
                        $("#equityid").val(appTag.attr("lang"));
                        }
                        if (type2 == "2") {
                            $("#appid").val(appTag.attr("lang"));
                        }
                        $("#ldksq").hide();

                        return;
                    });
                    $(".shaixuan").click(function(){
                        var shaixuanInput = $(this).prev().val();
                        //alert(shaixuanInput);
                        var reg = new RegExp(shaixuanInput);
                        $("#dataBody tr th.sxmc").each(function(){
                            
                            if(!($(this).html().match(reg))){
                                $(this).parent().hide();
                            }else{
                                $(this).parent().show();
                            }
                        });
                        
                    });
                    function getDataIds() {
                        var dataTag = $("#dataBody input[name=dataCheckBox]:checked");
                        return dataTag;
                    }
                    
                </script>
		
	</s:form>
</body>
</html>
