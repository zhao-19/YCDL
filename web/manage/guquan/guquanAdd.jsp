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
					editor.loadPlugin('multiimage', function() {
						editor.plugin.multiImageDialog({
							insertfile : K('#picdeatil').val(),
							clickFn : function(urlList) {
								K.each(urlList, function(i, data) {
									var val = $('#picdeatil').val();
									var url = val == "" ? data.url : "," + data.url;
									K('#picdeatil').val(val + url);
								});
								editor.hideDialog();
								depic();
							}
						});
					});
				});
			});
</script>

<style type="text/css">
.iframeChild .layui-layer-content,.iframeChild iframe {height:100%;}
</style>		 
		 
</head>

<body>
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
    
<div id="newsmark" style="display: none;">guquanmarks</div>    
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
							<s:textarea rows="5" style="width:100%;" id="picdeatil" name="e.picdeatil" data-rule="小图;maxPicture;"></s:textarea>
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
						<th class="td_right">分站</th>
                		<td style="text-align: left;" colspan="3">
                			<s:select list="%{#request.areamap}" headerKey="all" headerValue="" theme="simple"
                        		name="e.substation" id="substation"/>
                		</td>
					</tr>
	 				<tr>
					
						 	<th class="td_right">审核状态</th>
						<td style="text-align: left;">
							<s:select list="%{#application.dic.wfstatus.childs}" listKey="id"  
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
					<tr>
						<td class="td_right"><span class="uploadbtn btn btn-success" reg="mp4" type="mp4" aim="1">微路演资源</span><br>资源地址1(mp4超清,有视频必传)</td>
			            <td style="text-align: left;">
			                <s:textfield theme="simple" name="e.sourceurl_super" id="sourceurl_super" class="file1" readonly="false"/>
			                <s:if test="e.sourceurl_super!=null&&e.sourceurl_super.contains('mp4')" >
			                    <div class="mp4box">
			                        <video class="mp4" src="${e.sourceurl_super}" controls="controls"></video>
			                        <a href="${e.sourceurl_super}" target="_blank">新窗口打开视频</a>
			                    </div>
			                </s:if>
			            </td>
					 
						<td class="td_right"><span class="uploadbtn btn btn-success" reg="mp4" type="mp4">微路演资源</span><br>资源地址2(mp4高清)</td>
			            <td style="text-align: left;">
			                <s:textfield theme="simple" name="e.sourceurl_high" id="sourceurl_high" class="file1" readonly="false"/>
			                <s:if test="e.sourceurl_high != null&&e.sourceurl_high!=''">
			                    <div class="mp4box">
			                        <video  class="mp4" src="${e.sourceurl_high}" controls="controls"></video>
			                        <a href="${e.sourceurl_high}" target="_blank">新窗口打开视频</a>
			                    </div>
			                </s:if>
			            </td>
					</tr>
					<tr>
						<td class="td_right"><span class="uploadbtn btn btn-success" reg="mp4" type="mp4">微路演资源</span><br>资源地址3(mp4普清)</td>
			            <td style="text-align: left;" colspan="3">
			                <s:textfield theme="simple" name="e.sourceurl_stand" id="sourceurl_stand" class="file1" readonly="false"/>
			                <s:if test="e.sourceurl_stand != null&&e.sourceurl_stand!=''">
			                    <div class="mp4box">
			                        <video  class="mp4" src="${e.sourceurl_stand}" controls="controls"></video>
			                        <a href="${e.sourceurl_stand}" target="_blank">新窗口打开视频</a>
			                    </div>
			
			                </s:if>
			            </td>
					</tr>
 					<tr>
						<th class="td_right"><a href="cust!toEdit.action?e.id=<s:property value="id"/>">发布企业ID </a></th>
						<td style="text-align: left;">
						<s:textfield name="e.qiyeid" id="qiyeid" readonly="false" data-rule="发布企业ID:qiyeid;length[2~32]"/>
						<s:a href="javascript:getQiyeinfo()" cssClass="btn btn-success" id="selectPbczdbase">查看企业</s:a>
						</td>
						<th class="td_right">数据来源</th>
                        <td style="text-align: left;"><s:select
                                list="%{#application.dic.datasources.childs}" listKey="id" listValue="name"
                                name="e.data_source" id="data_source"
                                value="#request.e.datasource" /></td>
                    </tr>
				</table>
			</div>
		</div>
	</s:form>	
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script>
$(function() {
	$( "#tabs" ).tabs({
	});
});
if ('${msg}' != "") {
	layer.alert('${msg}', {icon: 1, title : '提示'});
}
function getQiyeinfo() {
	var qiyeid = '${e.qiyeid}';
	if (qiyeid == "") {
		layer.alert('未获取到企业id，请稍候再试！', {icon: 1, title : '提示'});
		return;
	}
    layer.open({
        title: '查看企业',
        type: 2,
        skin: 'layui-layer-lan iframeChild',
        area: ['96%', '88%'],
        offset: ['2%', '2%'],
        fix: false,
        maxmin: false,
        content: '/manage/guquan!toUserinfo.action?userid=' + qiyeid
    });
}
</script>
<link rel="stylesheet" href="/resource/easyUpload/easy-upload.css?${sysversion}" />
<script charset="utf-8" src="/resource/easyUpload/easyUpload.js?${sysversion}"></script>
</body>
</html>