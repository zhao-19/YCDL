<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href=/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />

<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
.btnCCC{
	background-image: url("../img/glyphicons-halflings-white.png");
	background-position: -288px 0;
}
select{height:auto;}
</style>
<style>
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

.ke-dialog-default, .ke-dialog {
    top: 50%;
    transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -webkit-transform: translateY(-50%);
    -o-transform: translateY(-50%);
}
label {display: inline;}
</style>
<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

<script>
	 	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile').click(function() {
					editor.loadPlugin('insertfile', function() {
						editor.plugin.fileDialog({
							insertfile : K('#fileurl').val(),
							clickFn : function(url, title) {
								K('#fileurl').val(url);
								editor.hideDialog();
							}
						});
					});
				});
				
				
				
		 
				K('#filemanager').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#activities_image').val(),
							clickFn : function(url, title) {
								K('#activities_image').val(url);
								//压缩图片
								$.post('/manage/image!narrowImage.action', {path : url});
								editor.hideDialog();
							}
						});
					});
				});
			});
</script>
 
</head>

<body>
	<div class="navbar navbar-inverse" >
		<div id="insertOrUpdateMsg">
			<s:property value="#session.insertOrUpdateMsg"/>
			<%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
		</div>
	</div>
	
	<s:form action="activities" namespace="/manage" theme="simple" name="form" id="form" >
<%-- 		<s:hidden name="type"/> --%>
		<s:hidden name="e.type"/>
		<input type="hidden" value="<s:property value="e.catalogID"/>" id="catalogID"/>
		<table class="table table-bordered">
			
			<tr style="background-color: #dff0d8">
				<td colspan="4" style="background-color: #dff0d8;text-align: center;">
					<strong>活动内容编辑</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td colspan="3"><s:hidden name="e.id" label="id"  /></td>
			</tr>
			 
		 
		   
				<tr>
				<th class="td_right">名称</th>
				<td style="text-align: left;"  colspan="3">
				<s:textfield name="e.activities_name" id="activities_name" size="64" readonly="false" data-rule="名称:required;activities_name;length[2~128]"/>
				</td>
				</tr>
 			
 				<!-- 
 				  <tr>
				<th class="td_right">主题</th>
				<td style="text-align: left;"  colspan="3">
				<s:textfield name="e.activities_theme" id="activities_theme" size="80" readonly="false" data-rule="主题:required;activities_theme;length[2~128]"/>
				</td>
				</tr>
 				 -->
 								<tr>
				<th class="td_right">活动地址</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.address" id="address"   size="80" readonly="false" data-rule="活动地址:required;address;length[2~64]"/>
				</td>
				 </tr>
 				
 								<tr>
				<th class="td_right">主办方</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.agenciesname" id="agenciesname"   size="80" readonly="false" data-rule="主办方:required;agenciesname;length[2~64]"/>
				</td>
				</tr>
				
				
				<tr>
				<th class="td_right">适用人群</th>
				<td style="text-align: left;" colspan="3">
 				<s:checkboxlist name="e.adapttype" id="adapttype" list="%{#application.dic.khlx.childs}" listKey="id" listValue="name"  value="#request.e.adapttype.split(',')"  />
				</td>
				</tr>
				
				<tr>
				<th class="td_right">活动类型</th>
				<td style="text-align: left;" >

					<s:select list="%{#application.dic.activitytype.childs}" listKey="id"  headerKey="" headerValue=""  listValue="name" name="e.activitiestype" label="活动类型"      />  
           	 	</td>
           	 	
           	 	
           	 	<td style="text-align: right;">分站</td>
           		<td style="text-align: left;" >
           			<s:select list="%{#application.areasubstmap}" headerKey="all" headerValue="" theme="simple"
                   		name="e.substation" id="substation"/>
           		</td>
           	 	
				</tr>
 				
 								<tr>
				<th class="td_right">开始时间</th>
				<td style="text-align: left;">
				<input type="text" class="Wdate" id="begintime"  value="<s:property value="e.begintime"/>" name="e.begintime" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss'  })"  />
				
				</td>
			 
				<th class="td_right">结束时间</th>
				<td style="text-align: left;">
				<input type="text" class="Wdate" id="endtime"   value="<s:property value="e.endtime"/>"  name="e.endtime" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss'  })"  />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">报名截止时间</th>
				<td style="text-align: left;">
				<input type="text" class="Wdate" id="stoptime"  value="<s:property value="e.stoptime"/>"   name="e.stoptime" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss'  })"  />
				
				
 				</td>
				 
				<th class="td_right">最大参加人数</th>
				<td style="text-align: left;">
				<s:textfield name="e.maxattend" id="maxattend" readonly="false" data-rule="最大参加人数:required;maxattend;length[1~4]"/>
				</td>
				</tr>
 					<tr>
					<th class="td_right">嘉宾</th>
					<td style="text-align: left;">
					<s:textfield name="e.activities_guests" id="activities_guests" readonly="false" data-rule="嘉宾:activities_guests;length[2~18]"/>
					</td>
				
					<th class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经纬度(点击获取)</a></th>
					<td style="text-align: left;">
						<s:textfield name="e.lnglat" id="lnglat" readonly="false" data-rule="经纬度:lnglat;length[0~128]"/>
					</td>
				</tr>
				<tr>
					<td  style="text-align: left;"   >
					<input type="button" name="insertfile"  id="insertfile" value="附件" class="btn btn-success"/>
						</td>
						<td style="text-align: left;"  colspan="3">
									<s:textfield type="text" id="fileurl" name="fileurl"   style="width: 600px;"  />
									 
					</td>
					
				</tr>
				
			<tr>
 			 
					<td  style="text-align: left;"   >
					<input type="button" name="filemanager"  id="filemanager" value="封面图片（304px*203px）" class="btn btn-success"/>
						</td>
						<td style="text-align: left;"  colspan="3">
									<s:textfield type="text" id="activities_image" name="e.activities_image"   style="width: 600px;"  />
						<s:if test="e.activities_image!=null">
                            <a target="_blank" href="<s:property value="e.activities_image" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='e.activities_image'/>">
                            </a>	
                            </s:if>		 
					</td>
					
			</tr>
 				
			<tr>
				<th class="td_right">内容</th>
				<td style="text-align: left;"  colspan="3">
				<s:textarea name="e.activities_detail"  rows="3" cols="80" style="width:100%;height:400px;visibility:hidden;"   id="activities_detail" readonly="false"  />
				</td>
				</tr>		
		 <tr>
		 <tr>
                <th class="td_right">数据来源</th>
                <td style="text-align: left;"><s:select
                        list="%{#application.dic.datasources.childs}" listKey="id" listValue="name"
                        name="e.data_source" id="data_source" />
                </td>
         </tr>
         <tr>
                <th class="td_right">app编号</th>
                <td style="text-align: left;" >
                <s:textfield name="e.appid" id="appid" readonly="ture" />
                 <c:if test="${e.appid eq '' or empty e.appid }">
                        <s:a href="javascript:getAppList()" cssClass="btn btn-success" id="selectPbczdbase">请选择</s:a>
                    </c:if>
                </td>
                <th class="td_right">用户id</th>
                <td style="text-align: left;" >
                <s:textfield name="e.releuserid" id="releuserid" readonly="ture" />
                </td>
         </tr>
         
				<td colspan="4" style="text-align: center;">
						<button method="activities!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
				</td>
			</tr>
		 
		</table>
		<div id="ldksq">
        <div id="ldksq_c">
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
                            <th width="20"><input type="radio" id="checkBox" /></th>
                            <th>pkid</th>
                            <th>类别</th>
                            <th>申请人</th>
                            <th>标题</th>
                            <th>审核状态</th>
                            <th>审核人</th>
                            <th>审核时间</th>
                        </tr>
                    </thead>
                    <tbody id="dataBody">

                    </tbody>


                </table>

            </div>
            <p>
                <button id="ldksq_lose2" type="reset" class="btn btn-inverse"
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
                    function getAppList() {
                 //1.查询之后返回到当前
                 $.post("activities!selectAppProducts.action",function(data) {
                    var dataObj = eval("("+ data+ ")");
                    var htmlStr = "";
                    $.each(dataObj,function(k,v) {
                        var a = typeof(v.reviwer_id) == "undefined" ? "" : v.reviwer_id;
                        var b = typeof(v.reviwer_date) == "undefined" ? "" : v.reviwer_date;
                        
                        
                        htmlStr += '<tr>'
                        + '<th width="20"><input lang="'+v.pkid+'" type="radio" name="dataCheckBox"  user="'+v.userid+'" qiye="'+v.qiyeid+'"/>'
                        + '</th><th>'+ v.pkid+ '</th>'+ '<th>'+ '活动发布'+ '</th>'
                        + '<th>'+ v.userid+ '</th>'+ '<th>'+ v.title+ '</th>'
                        + '<th>'+ v.chstatus+ '</th>'+ '<th>'+ a + '</th>'+'<th>'+ b + '</th>'
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
                    $("#ldksq_lose2").click(function() {
                        $("#ldksq").hide();
                    });
                    $("#btn-successok").click(function() {
                        var appTag = getDataIds();
                        $("#appid").val(appTag.attr("lang"));
                        $("#releuserid").val(appTag.attr("user"));
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
	</s:form>
<script type="text/javascript">
	$(function() {
		//$("#title").focus();
		selectDefaultCatalog();
		
		var ccc = $("#insertOrUpdateMsg").html();
		//console.log("insertOrUpdateMsg="+insertOrUpdateMsg);
		if(ccc!='' && ccc.trim().length>0){
			$("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
		};
	});
	
	 
		
	function doSubmitFunc(obj){
			var m = $(obj).attr("name");
			//console.log(m);
			//console.log(m.split(":")[1]+".action");
			
			$("#form").on("valid.form", function(e, form){
				var _formAction = $("#form").attr("action");
				var aa = _formAction.substring(0,_formAction.lastIndexOf("/")+1);
				//console.log(aa);
				
				var lastFormAction = aa + m.split(":")[1]+".action";
				$("#form").attr("action",lastFormAction);
				
				//console.log($("#form").attr("action"));
				//console.log(this.isValid);
				//form.submit();
			});
	}
	
	
	
	function doSubmitFuncByLink(obj){
		var _href = $(obj).attr("href");
		var _form = $("#form");
		_form.attr("action",_href);
		
		//console.log("_href="+_href);
		
		$("#form").on("valid.form", function(e, form){
			//console.log("this.isValid="+this.isValid);
			
			
			//_form.submit();
		});
		//_form.submit();
		return false;
	}

	function selectDefaultCatalog(){
		var _catalogID = $("#catalogID").val()+"";//alert(_catalogID);
		if(_catalogID!='' && _catalogID>0){//alert("_catalogID="+_catalogID);
			$("#catalogSelect").val(_catalogID);
		}
	}
</script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="e.activities_detail"]', {
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
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
</body>
</html>
