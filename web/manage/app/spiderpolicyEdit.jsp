<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/manage/system/common.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
<style>
	.td_right{text-align: right;width: 130px;}
	.table_title{text-align: left;font-weight: bold;font-size:16px;background-color: #dff0d8;}
</style>
</head>

<body>
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
<s:form action="/manage/appCommon!savePolicy.action" id="form" name="form" theme="simple" method="post">
	<table class="table table-bordered">
       	<tr>
            <td colspan="4" class="table_title">爬虫政策
            	<s:hidden name="spiderpolicy.pkid"/>
            </td>
        </tr>
        <tr>
        	<td class="td_right">标题</td>
            <td style="text-align: left;">${spiderpolicy.title }</td>
            <td class="td_right">网站名称</td>
            <td style="text-align: left;">${spiderpolicy.info_source }</td>
        </tr>
        <tr>
        	<td class="td_right">政策链接</td>
            <td style="text-align: left;" colspan="3"><a href="${spiderpolicy.detail_url }" target="_black">${spiderpolicy.detail_url }</a></td>
        </tr>
		<tr>
			<td class="td_right">详细介绍</td>
			<td style="text-align: left;" colspan="3">
				${spiderpolicy.content }
			</td>
		</tr>
		<tr>
        	<td class="td_right">所属行业</td>
            <td style="text-align: left;">
            	<s:select list="%{#application.dic.industryclassify.childs}" listKey="id" listValue="name" 
            		headerKey="" headerValue="" name="spiderpolicy.domaintype" id="domaintype"/>
            </td>
            <td class="td_right">所属分类</td>
            <td style="text-align: left;">
            	<s:select list="%{#application.dic.typeclassify.childs}" listKey="id" listValue="name" 
            		headerKey="" headerValue="" name="spiderpolicy.infotypes" id="infotypes"/>
            </td>
        </tr>
        <tr>
			<td class="td_right">状态</td>
        	<td style="text-align: left;">
            	<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id" listValue="name" 
            		headerKey="" headerValue="" name="spiderpolicy.checkresult" id="checkresult"/>
            </td>
            
            <td class="td_right">是否置顶</td>
        	<td style="text-align: left;">
            	<s:select list="%{#application.dic.whether.childs}" listKey="id" listValue="name" 
            		headerKey="" headerValue="" name="spiderpolicy.istop" id="istop"/>
            </td>
        </tr>
        <tr>
        	<td class="td_right">政策分类</td>
            <td style="text-align: left;">${spiderpolicy.infotype }</td>
            <td class="td_right">地区编码</td>
            <td style="text-align: left;">${spiderpolicy.locationcode }</td>
        </tr>
        <tr>
        	<td class="td_right">所属地区</td>
            <td style="text-align: left;">${spiderpolicy.location }</td>
        	<td class="td_right">浏览次数</td>
            <td style="text-align: left;">${spiderpolicy.visitfrequency }</td>
       	</tr>
        <tr>
       		<td class="td_right">录入人</td>
            <td style="text-align: left;">${spiderpolicy.inputuser }</td>
            <td class="td_right">政策公布时间</td>
            <td style="text-align: left;">${fn:substring(spiderpolicy.publishtime, 0, 11)}</td>
       	</tr>
		<tr>
            <td class="td_right">审核人</td>
            <td style="text-align: left;">${spiderpolicy.checkuser }</td>
       		<td class="td_right">审核时间</td>
            <td style="text-align: left;">${fn:substring(spiderpolicy.checktime, 0, 19)}</td>
       	</tr>
       	<tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(spiderpolicy.input_time, 0, 19)}</td>
       		<td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(spiderpolicy.lastchgtime, 0, 19)}</td>
       	</tr>
      	<tr>
      		<td colspan="4" style="text-align: center;">
      			<span onclick="$('#form').submit();" class="btn btn-success"><i class="icon-ok icon-white"></i>保存</span>
      		</td>
        </tr>
	</table>
</s:form>
<script type="text/javascript">
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
</body>
</html>