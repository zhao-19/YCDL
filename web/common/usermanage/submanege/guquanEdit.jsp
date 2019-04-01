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
<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
<link rel="stylesheet" href="/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />
<script src="/resource/kindeditor-4.1.7/kindeditor.js"></script>
<script src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>

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
		 

</head>

<body class="FZbPageBody">
<div id="newsmark" style="display: none;">guquanmarks</div>    
<s:form action="guquan" id="form" name="form" namespace="/manage" theme="simple" method="post">
		 	<div style="text-align: center;margin-bottom:10px;">
			<div id="updateMsg"><font color='red'><s:property value="updateMsg" /></font></div>
				<button method="/usermanage/saveGuquan.html" class="btn btn-success">
					<i class="icon-ok icon-white"></i> 保存
				</button>
		</div>
		
		<div id="tabs">
		
			<ul>
				<li><a href="#tabs-1">股权项目信息</a></li>
			</ul>
			<div id="tabs-1">
				<table class="table  table-bordered">
				 	<tr style="display:none;">
						<th>id</th>
						<td><s:hidden name="guquan.id" /></td>
						<th class="td_right">项目图片</th>
						<td style="text-align: left;">
						<s:textfield name="guquan.picture" id="picture" readonly="false" />
						</td>
					</tr>
				 	
			  		<tr>
						<th class="td_right">项目名称<span style="color:red;">*</span></th>
						<td style="text-align: left;" colspan="3">
						<s:textfield name="guquan.mingcheng" size="80" id="mingcheng" readonly="false" data-rule="项目名称:required;mingcheng;length[2~64]"/>
						</td>
					 
					</tr>
	 				
					<tr>
						<th class="td_right">核心竞争力<span style="color:red;">*</span></th>
						<td style="text-align: left;" colspan="3">
						<s:textarea   rows="3" cols="80" name="guquan.hexinjzl" id="hexinjzl" readonly="false" data-rule="核心竞争力:required;hexinjzl;length[2~1024]"/>
						</td>
				 </tr>
	 				
					<tr>
						<th class="td_right">项目/产品简介<span style="color:red;">*</span></th>
						<td style="text-align: left;"  colspan="3">
						<s:textarea   rows="3" cols="80" name="guquan.jianjie" id="jianjie" readonly="false" data-rule="项目/产品简介:required;jianjie"/>
						</td>
						
					</tr>
	 				
				 
	 				
					<tr>
 					 
				 
 		 
						<td  style="text-align: left;">
									<input type="button" name="guquan.insertfile"  id="insertfile"  value="项目计划书" class="btn btn-success"/>
									<span style="color:red;">*</span>
						</td>
						<td style="text-align: left;" colspan="2">
									<s:textfield type="text" id="jihuashu" name="guquan.jihuashu"   style="width: 574px;" 
								 />

						</td>
						<td>
							<a href="${guquan.jihuashu }" target="_black">下载</a>
						</td>
					
					
				</tr>
				
	
				
				<tr>
					<td  style="text-align: left;"   >
					<input type="button" name="insertfile1"  id="insertfile1" value="项目图片" class="btn btn-success"/>
					<span style="color:red;">*</span>
					<br/>分辨率(702*260px)
						</td>
						<td style="text-align: left;"  colspan="3">
									<s:textfield type="text" id="tuijianpic" name="guquan.tuijianpic"   style="width: 574px;" 
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
							<s:textarea rows="5" style="width:100%;" id="picdeatil" name="guquan.picdeatil" data-rule="小图;maxPicture;"></s:textarea>
							<%-- <s:textfield type="text" id="picdeatil" name="guquan.picdeatil"  style="width: 574px;" data-rule="小图;maxPicture;"/> --%>
                        <span id="picdeatilspan"></span>
					</td>
					
				</tr>
				
				
					<tr>
				
						<th class="td_right">行业<span style="color:red;">*</span></th>
						<td style="text-align: left;">
							<s:select list="%{#application.dic.guquanindustry.childs}" listKey="id"
								  listValue="name" name="guquan.hangye"
								  headerKey="" headerValue="" cssClass="select" data-rule="行业:required;hangye"/>
						
						</td>
						<th class="td_right">优先级（越高越靠前）</th>
						<td style="text-align: left;">
							<s:textfield name="guquan.number"  readonly="false" data-rule="优先级:number;length[1~4]"/>
						</td>
					</tr>
	 				
				
					
					<tr>
						<th class="td_right">融资额度（万元）<span style="color:red;">*</span></th>
						<td style="text-align: left;">
						<s:textfield name="guquan.rongziedu" id="rongziedu" readonly="false" data-rule="融资额度（万元）:required;rongziedu;length[2~32]"/>
						</td>
					 
						<th class="td_right">融资阶段<span style="color:red;">*</span></th>
						<td style="text-align: left;">
							<s:select list="%{#application.dic.guquanstage.childs}" listKey="id"
														  listValue="name" name="guquan.rongzhijieduan"
														  headerKey="" headerValue="" cssClass="select" data-rule="融资阶段:required;rongzhijieduan"/>
						</td>
					</tr>
	 				
					<tr>
						<th class="td_right">出让股权比例(%)<span style="color:red;">*</span></th>
						<td style="text-align: left;" colspan="3">
						<s:textfield name="guquan.crgqbl" id="crgqbl" readonly="false" data-rule="出让股权比例:required;crgqbl;length[2~9]"/>
						</td>
						 
					
					</tr>
	 				
				
	 				
	 				<tr>
						<th class="td_right">项目所处阶段<span style="color:red;">*</span></th>
						<td style="text-align: left;">
						
						<s:select list="%{#application.dic.e677910075c6406db2f9311f808dd63d.childs}" listKey="id"  
                            listValue="name" name="guquan.xiangmuzhuangtai" label="项目所处阶段"  
                            headerKey="" headerValue="" />  
						</td>
						 
						 
						<th class="td_right">融资状态</th>
						<td style="text-align: left;">
 						<s:select list="%{#application.dic.xmrzzt.childs}" listKey="id"  
                            listValue="name" name="guquan.rongzizhuangtai" label="融资状态"  
                            headerKey="" headerValue="" />  
						</td>
					</tr>
	 				
	 			
	 				
	 				<tr>
						<th class="td_right">标签<span style="color:red;">*</span></th>
						<td style="text-align: left;" colspan="3">
						<s:textfield name="guquan.biaoqian" id="biaoqian" readonly="false" data-rule="标签:required;biaoqian;length[2~32]"/>
						</td>
						<th class="td_right" style="display:none;">分站</th>
                		<td style="text-align: left;display:none;" colspan="3" >
                        	 <select name="guquan.substation" id="substation">
							    <option value="${sessionsubcode }" selected="selected">${sessionsubstation }</option>
							</select>
                		</td>
					</tr>
	 					<tr>
					
						 	<th class="td_right">审核状态</th>
						<td style="text-align: left;">
							<s:select list="%{#application.dic.wfstatus.childs}" listKey="id"  
                            listValue="name" name="guquan.shenhezhuangtai" label="审核状态"  
                            headerKey="" headerValue="" />  
 						</td>
					 
						<th class="td_right">是否推荐到APP</th>
						<td style="text-align: left;" >
 						<s:select list="%{#application.dic.sf.childs}" listKey="id"  
                            listValue="name" name="guquan.shifoutuijian" label="状态"  
                            headerKey="" headerValue="" />  
 						</td>
					</tr>
	 				<%-- <tr>
						<th class="td_right">点击量</th>
						<td style="text-align: left;">
						<s:label name="guquan.browsecount" id="browsecount"  />
						</td>
					 
						<th class="td_right">约谈量</th>
						<td style="text-align: left;">
						<s:label name="guquan.markcount" id="markcount"  />
						</td>
					</tr> --%>
	 				
 					<tr style="display: none;">
						 <th class="td_right">app发布编号</th>
                        <td style="text-align: left;" colspan="3"><s:textfield name="guquan.appId"
                                id="appid" readonly="false" />
                        
                                </td>
						
						
					</tr>
					<tr style="display: none;">
						<th class="td_right"><a href="cust!toEdit.action?e.id=<s:property value="id"/>">发布企业ID </a></th>
						<td style="text-align: left;">
						<s:textfield name="guquan.qiyeid" id="qiyeid" readonly="false" data-rule="发布企业ID:qiyeid;length[2~32]"/>
						</td>
						<th class="td_right">企业id</th>
                        <td style="text-align: left;"><s:textfield name="guquan.releId"
                                id="releid" readonly="false" /></td> 	
                    </tr>
                   	<tr>
						<th class="td_right">数据来源</th>
                        <td style="text-align: left;"><s:select
                                list="%{#application.dic.datasources.childs}" listKey="id" listValue="name"
                                name="guquan.data_source" id="data_source"
                                value="#request.e.datasource" /></td>
                        <th class="td_right">发布人用户编号</th>
                        <td style="text-align: left;"><s:textfield name="guquan.releUserid"
                                id="releuserid" readonly="false" /></td>
                    </tr>
                    <tr style="display: none;">
                        <th class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经纬度(点击获取)</a></th>
						<td style="text-align: left;" colspan="3">
							<s:textfield name="guquan.lnglat"  readonly="false" data-rule="序号:lnglat;length[0~128]"/>
						</td>
                    </tr>
	 				<%-- <tr>
						<th class="td_right">录入人</th>
						<td style="text-align: left;">
						<s:textfield name="guquan.inputuser" id="inputuser" readonly="true"  />
						</td>
						 
						<th class="td_right">最后修改时间</th>
						<td style="text-align: left;">
						<s:textfield name="guquan.lastchgtime" id="lastchgtime" readonly="true"  />
						</td>
					</tr>
	 					<tr>
					 	<th class="td_right">发布日期</th>
						<td style="text-align: left;">
						<s:textfield name="guquan.faburiqi" id="faburiqi" readonly="true"  />
						</td>
						 
						<th class="td_right">录入时间</th>
						<td style="text-align: left;">
						<s:textfield name="guquan.lurushijian" id="lurushijian" readonly="true"  />
						</td>
					</tr> --%>
					
					
				</table>
			</div>
				
		</div>
	</s:form>	
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>

<script>
if ('${msg}' != "") {
	layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
}
$(function() {
	$( "#tabs" ).tabs({
	});
});
</script>
</body>
</html>
