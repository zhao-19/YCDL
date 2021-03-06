<%@page import="com.winpow.services.manage.catalog.bean.Catalog"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href="../resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="../resource/kindeditor-4.1.7/themes/default/default.css" />
<script src="../resource/kindeditor-4.1.7/kindeditor.js"></script>
<script src="../resource/kindeditor-4.1.7/lang/zh_CN.js"></script>

<script>

 	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile').click(function() {
					editor.loadPlugin('insertfile', function() {
						editor.plugin.fileDialog({
							insertfile : K('#jihuashu').val(),
							clickFn : function(url, title) {
								K('#jihuashu').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
			
			
  	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile1').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#tuijianpic').val(),
							clickFn : function(url, title) {
								K('#tuijianpic').val(url);
								editor.hideDialog();
								tuijian(); 
							}
						});
					});
				});
			});
			
			
  	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile2').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#leftpic').val(),
							clickFn : function(url, title) {
								K('#leftpic').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
			
			
  	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile3').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#detailpic').val(),
							clickFn : function(url, title) {
								K('#detailpic').val(url);
								editor.hideDialog();
							}
						});
					});
				});
				K('#insertfile4').click(function() {
                    editor.loadPlugin('image', function() {
                        editor.plugin.imageDialog({
                            insertfile : K('#applistimg').val(),
                            clickFn : function(url, title) {
                                K('#applistimg').val(url);
                                editor.hideDialog();
                            }
                        });
                    });
                });
				K('#insertfile5').click(function() {
                    editor.loadPlugin('image', function() {
                        editor.plugin.imageDialog({
                            insertfile : K('#appproimg').val(),
                            clickFn : function(url, title) {
                                K('#appproimg').val(url);
                                editor.hideDialog();
                            }
                        });
                    });
                });
                K('#insertfile11').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#picdeatil').val(),
							clickFn : function(url, title) {
								var val = $('#picdeatil').val();
								url = val == "" ? url : "," + url;
								K('#picdeatil').val(val + url);
								editor.hideDialog();
								depic();
							}
						});
					});
				});
			});
</script>
		 
<style type="text/css">
	#insertOrUpdateMsg{border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;}
	select{height:auto;}
	.ke-dialog-default, .ke-dialog{top: 50%;transform: translateY(-50%);-ms-transform: translateY(-50%);-moz-transform: translateY(-50%);-webkit-transform: translateY(-50%);-o-transform: translateY(-50%);}
	#ldksq{display: none;width: 100%;height: 100%;position: fixed;left: 0;top: 0;bottom: 0;right: 0;margin: auto;z-index: 9999 !important;background: url("../img/lobg_03.png") repeat;}
	#ldksq_c{background-color: #fff;width: 95%;min-height: 410px;/*position: absolute;top:0;left:0;right:0;bottom: 0;*/margin: auto;border-radius: 5px;behavior: url(PIE.htc);padding: 10px;}
	#ldksq_c p{text-align: center;}
	#ldksq_c .qx{background: url("../img/delete.png") no-repeat;}
	#ldksq_c form{margin: 0;padding-top: 10px;;}
	#ldksq_c input.title, textarea.duanxin{width: 240px;;}
	.pbczdbaseTitle{font-size: 20px;text-align: left !important;}
	.pbczdbaseTable{height: 320px;width: 100%;overflow: auto;}
</style>
</head>

<body>

    
    
<s:form action="guquan" id="form" name="form" namespace="/manage" theme="simple" method="post">
	<div class="navbar navbar-inverse" >
		<div id="insertOrUpdateMsg">
			<s:property value="#session.insertOrUpdateMsg"/>
			<%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
		</div>
	</div>
	
	<span id="pifeSpan" class="input-group-addon" style="display:none"><%=SystemManager.systemSetting.getImagerootpath()%></span>
	<input type="hidden" value="<s:property value="e.id"/>" id="productID"/>
	<input type="hidden" value="<s:property value="e.catalogID"/>" id="catalogID"/>

	 
		 
		 	<div style="text-align: center;">
			<div id="updateMsg"><font color='red'><s:property value="updateMsg" /></font></div>
				<button method="guquan!insertOrUpdate.action" class="btn btn-success">
					<i class="icon-ok icon-white"></i> 保存
				</button>
		</div>
		
		<div id="tabs">
		
			<ul>
				<li><a href="#tabs-1">股权项目信息</a></li>
			</ul>
			
			 	<!-- 股权项目信息 -->
			<div id="tabs-1">
				<table class="table table-condensed">
				 	<tr style="display:none;">
						<th>id</th>
						<td><s:hidden name="e.id" /></td>
						<th class="td_right">项目图片</th>
						<td style="text-align: left;">
						<s:textfield name="e.picture" id="picture" readonly="false" />
						</td>
					</tr>
				 	
			  		<tr>
						<th class="td_right">项目名称<span style="color:red;">*</span></th>
						<td style="text-align: left;" colspan="3">
						<s:textfield name="e.mingcheng" size="80" id="mingcheng" readonly="false" data-rule="项目名称:required;mingcheng;length[2~64]"/>
						</td>
					 
					</tr>
	 				
					<tr>
						<th class="td_right">核心竞争力<span style="color:red;">*</span></th>
						<td style="text-align: left;" colspan="3">
						<s:textarea   rows="3" cols="80" name="e.hexinjzl" id="hexinjzl" readonly="false" data-rule="核心竞争力:required;hexinjzl;length[2~1024]"/>
						</td>
				 </tr>
	 				
					<tr>
						<th class="td_right">项目/产品简介<span style="color:red;">*</span></th>
						<td style="text-align: left;"  colspan="3">
						<s:textarea   rows="3" cols="80" name="e.jianjie" id="jianjie" readonly="false" data-rule="项目/产品简介:required;jianjie"/>
						</td>
						
					</tr>
	 				
				 
	 				
					<tr>
 					 
				 
 		 
						<td  style="text-align: left;">
									<input type="button" name="e.insertfile"  id="insertfile"  value="项目计划书" class="btn btn-success"/>
									<span style="color:red;">*</span>
						</td>
						<td style="text-align: left;" colspan="2">
									<s:textfield type="text" id="jihuashu" name="e.jihuashu"   style="width: 574px;" 
								 />

						</td>
						<td>
							<a href="<s:property value="e.jihuashu"/>">下载</a>
						</td>
					
					
				</tr>
				
	
				
				<tr>
					<td  style="text-align: left;"   >
					<input type="button" name="insertfile1"  id="insertfile1" value="项目图片" class="btn btn-success"/>
					<span style="color:red;">*</span>
					<br/>分辨率(702*260px)
						</td>
						<td style="text-align: left;"  colspan="3">
									<s:textfield type="text" id="tuijianpic" name="e.tuijianpic"   style="width: 574px;" 
									data-rule="小图;maxPicture;"/>
							<span id="tuijianpicspan"></span>
					</td>
					
				</tr>
				
				<tr>
					<td style="text-align: left;">
					<input type="button" name="insertfile11"  id="insertfile11" value="详情图（多张）" class="btn btn-success"/>
					<span style="color:red;">*</span>
					<br/>分辨率(750*任意px)
						</td>
						<td style="text-align: left;"  colspan="3">
							<s:textfield type="text" id="picdeatil" name="e.picdeatil"  style="width: 574px;" data-rule="小图;maxPicture;"/>
                        <span id="picdeatilspan"></span>
					</td>
					
				</tr>
				
				
					<tr>
				
						<th class="td_right">行业<span style="color:red;">*</span></th>
						<td style="text-align: left;">
							<s:select list="%{#application.dic.guquanindustry.childs}" listKey="id"
								  listValue="name" name="e.hangye"
								  headerKey="" headerValue="" cssClass="select" data-rule="行业:required;hangye"/>
						
						</td>
						<th class="td_right">优先级（越高越靠前）</th>
						<td style="text-align: left;">
							<s:textfield name="e.number"  readonly="false" data-rule="优先级:number;length[1~4]"/>
						</td>
					</tr>
	 				
				
					
					<tr>
						<th class="td_right">融资额度（万元）<span style="color:red;">*</span></th>
						<td style="text-align: left;">
						<s:textfield name="e.rongziedu" id="rongziedu" readonly="false" data-rule="融资额度（万元）:required;rongziedu;length[2~32]"/>
						</td>
					 
						<th class="td_right">融资阶段<span style="color:red;">*</span></th>
						<td style="text-align: left;">
							<s:select list="%{#application.dic.guquanstage.childs}" listKey="id"
														  listValue="name" name="e.rongzhijieduan"
														  headerKey="" headerValue="" cssClass="select" data-rule="融资阶段:required;rongzhijieduan"/>
						</td>
					</tr>
	 				
					<tr>
						<th class="td_right">出让股权比例(%)<span style="color:red;">*</span></th>
						<td style="text-align: left;" colspan="3">
						<s:textfield name="e.crgqbl" id="crgqbl" readonly="false" data-rule="出让股权比例:required;crgqbl;length[2~9]"/>
						</td>
						 
					
					</tr>
	 				
				
	 				
	 				<tr>
						<th class="td_right">项目所处阶段<span style="color:red;">*</span></th>
						<td style="text-align: left;">
						
						<s:select list="%{#application.dic.e677910075c6406db2f9311f808dd63d.childs}" listKey="id"  
                            listValue="name" name="e.xiangmuzhuangtai" label="项目所处阶段"  
                            headerKey="" headerValue="" />  
						</td>
						 
						 
						<th class="td_right">融资状态</th>
						<td style="text-align: left;">
 						<s:select list="%{#application.dic.xmrzzt.childs}" listKey="id"  
                            listValue="name" name="e.rongzizhuangtai" label="融资状态"  
                            headerKey="" headerValue="" />  
						</td>
					</tr>
	 				
	 			
	 				
	 				<tr>
						<th class="td_right">标签<span style="color:red;">*</span></th>
						<td style="text-align: left;">
						<s:textfield name="e.biaoqian" id="biaoqian" readonly="false" data-rule="标签:required;biaoqian;length[2~32]"/>
						</td>
						<%-- <th class="td_right">站点<span style="color:red;">*</span></th>
						<td style="text-align: left;">
						<s:textfield name="e.sitename" id="sitename" readonly="false" data-rule="站点:sitename;length[2~16]"/>
						</td> --%>
						<th class="td_right"></th>
						<td style="text-align: left;"></td>
					</tr>
	 					<tr>
					
						 	<th class="td_right">审核状态</th>
						<td style="text-align: left;">
							<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"  
                            listValue="name" name="e.shenhezhuangtai" label="审核状态"  
                            headerKey="" headerValue="" />  
 						</td>
					 
						<th class="td_right">是否推荐到APP</th>
						<td style="text-align: left;" >
 						<s:select list="%{#application.dic.sf.childs}" listKey="id"  
                            listValue="name" name="e.shifoutuijian" label="状态"  
                            headerKey="" headerValue="" />  
 						</td>
					</tr>
	 				<%-- <tr>
						<th class="td_right">点击量</th>
						<td style="text-align: left;">
						<s:label name="e.browsecount" id="browsecount"  />
						</td>
					 
						<th class="td_right">约谈量</th>
						<td style="text-align: left;">
						<s:label name="e.markcount" id="markcount"  />
						</td>
					</tr> --%>
	 				
 					<tr>
						<%-- <th class="td_right">发布人类型</th>
						<td style="text-align: left;">
						<s:label name="e.fabuzheleixing" id="fabuzheleixing"  />
						</td> --%>
						 <th class="td_right">app发布编号</th>
                        <td style="text-align: left;"><s:textfield name="e.appId"
                                id="appid" readonly="false" />
                        <c:if test="${e.appId eq '' or empty e.appId }">
                        <s:a href="javascript:getAppList()" cssClass="btn btn-success" id="selectPbczdbase">请选择</s:a>
                        </c:if>
                                </td>
						
						 <th class="td_right">发布人id</th>
                        <td style="text-align: left;"><s:textfield name="e.releUserid"
                                id="releuserid" readonly="false" /></td>
					</tr>
					<tr>
						<th class="td_right"><a href="cust!toEdit.action?e.id=<s:property value="id"/>">发布企业ID </a></th>
						<td style="text-align: left;">
						<s:textfield name="e.qiyeid" id="qiyeid" readonly="false" data-rule="发布企业ID:qiyeid;length[2~32]"/>
						</td>
						<th class="td_right">企业id</th>
                        <td style="text-align: left;"><s:textfield name="e.releId"
                                id="releid" readonly="false" /></td> 	
                    </tr>
                   	<tr>
						<th class="td_right">数据来源</th>
                        <td style="text-align: left;"><s:select
                                list="%{#application.dic.datasources.childs}" listKey="id" listValue="name"
                                name="e.data_source" id="data_source"
                                value="#request.e.datasource" /></td>
                       
                        <th class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经纬度(点击获取)</a></th>
						<td style="text-align: left;">
							<s:textfield name="e.lnglat"  readonly="false" data-rule="序号:lnglat;length[0~128]"/>
						</td>
                    </tr>
	 				<%-- <tr>
						<th class="td_right">录入人</th>
						<td style="text-align: left;">
						<s:textfield name="e.inputuser" id="inputuser" readonly="true"  />
						</td>
						 
						<th class="td_right">最后修改时间</th>
						<td style="text-align: left;">
						<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="true"  />
						</td>
					</tr>
	 					<tr>
					 	<th class="td_right">发布日期</th>
						<td style="text-align: left;">
						<s:textfield name="e.faburiqi" id="faburiqi" readonly="true"  />
						</td>
						 
						<th class="td_right">录入时间</th>
						<td style="text-align: left;">
						<s:textfield name="e.lurushijian" id="lurushijian" readonly="true"  />
						</td>
					</tr> --%>
					
					
				</table>
			</div>
				
		</div>
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
                            <th>最后修改时间</th>
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
                 $.post("guquan!selectAppProducts.action",function(data) {
                    var dataObj = eval("("+ data+ ")");
                    var htmlStr = "";
                    $.each(dataObj,function(k,v) {
                        var a = typeof(v.review_id) == "undefined" ? "" : v.review_id;
                        var b = typeof(v.update_at) == "undefined" ? "" : v.update_at;
                        
                        
                        htmlStr += '<tr>'
                        + '<th width="20"><input lang="'+v.pkid+'" type="radio" name="dataCheckBox"  user="'+v.userid+'" qiye="'+v.qiyeid+'"/>'
                        + '</th><th>'+ v.pkid+ '</th>'+ '<th>'+ v.type+ '</th>'
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
                        $("#qiyeid").val(appTag.attr("user"));
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
</s:form>
 
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>

<script>
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
	//alert($("#insertOrUpdateMsg").html());
	if($("#insertOrUpdateMsg").html()!='' && $("#insertOrUpdateMsg").html().trim().length>0){
		$("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
	}
	
 	
	$("#removePife").click(function(){
		clearRootImagePath();
	});
});

function pichtml(url){
	return "<a target='_blank' href='" + url + "'><img style='max-width: 50px;max-height: 50px;' src='" + url + "'></a>";
}
                            
function depic() {
	var picdeatil = $("#picdeatil").val();
	if (picdeatil != "") {
		var pic = picdeatil.split(",");
		var html = "";
		for (var i = 0; i < pic.length; i++) {
			html += pichtml(pic[i]);
		}
		$("#picdeatilspan").html(html)
	}
}
function tuijian() {
	var tuijianpic = $("#tuijianpic").val();
	if (tuijianpic != "") {
		$("#tuijianpicspan").html(pichtml(tuijianpic))
	}
}
depic();
tuijian();                       
</script>

	 
</body>
</html>
