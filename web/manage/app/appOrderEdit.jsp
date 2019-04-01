<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>   
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
.td_right{text-align: right;width: 130px;}
select{height: auto;}
.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
</style>
</head>

<body>
	<table class="table table-bordered">
        <s:if test='appaddedproduct.pkid != ""'>
        	<tr>
	            <td colspan="4" class="table_title">服务产品
	            	<s:hidden name="appaddedproduct.pkid"/>
	            </td>
	        </tr>
        	<tr>
	        	<td class="td_right">编号</td>
	            <td style="text-align: left;">${appaddedproduct.chno }</td>
	            <td class="td_right">企业名称</td>
	            <td style="text-align: left;">${appaddedproduct.genre }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">申请人</td>
	            <td style="text-align: left;">${appaddedproduct.userid }&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-secondary round" type="button" value="查看详情" onclick="toUserinfo('${appaddedproduct.userid }')"/></td>
	            <td class="td_right">发起者</td>
	            <td style="text-align: left;"><% TreeNode x6 = SystemManager.treeNodeMap.get(request.getAttribute("appaddedproduct.initiator")); if( x6 != null){out.print(x6.getName());}%></td>
	        </tr>
	       	<tr>
	        	<td class="td_right">名称</td>
	            <td style="text-align: left;">${appaddedproduct.title }</td>
	            <td class="td_right">简介</td>
	            <td style="text-align: left;">${appaddedproduct.bewrite }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">详细介绍</td>
	            <td style="text-align: left;">${appaddedproduct.content }</td>
	            <td class="td_right">所属行业</td>
	            <td style="text-align: left;"><% TreeNode x4 = SystemManager.treeNodeMap.get(request.getAttribute("appaddedproduct.industry")); if( x4 != null){out.print(x4.getName());}%></td>
	        </tr>
	        <tr>
	        	<td class="td_right">价格</td>
	            <td style="text-align: left;">${appaddedproduct.price }</td>
	            <td class="td_right">状态</td>
	            <td style="text-align: left;"><% TreeNode x5 = SystemManager.treeNodeMap.get(request.getAttribute("appaddedproduct.chstatus")); if( x5 != null){out.print(x5.getName());}%></td>
	        </tr>
	        <tr>
	        	<td class="td_right">审核人</td>
	            <td style="text-align: left;">${appaddedproduct.reviwer_id }&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${appaddedproduct.reviwer_id }')" class="btn btn-secondary round" type="button" value="查看详情"/></td>
	            <td class="td_right">审核时间</td>
	            <td style="text-align: left;">${appaddedproduct.review_date }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">审核备注</td>
	            <td style="text-align: left;">${appaddedproduct.return_reason }</td>
	            <td class="td_right">创建时间</td>
	            <td style="text-align: left;">${appaddedproduct.create_time }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">修改时间</td>
	            <td style="text-align: left;">${appaddedproduct.update_at }</td>
	            <td class="td_right"></td>
	            <td style="text-align: left;"></td>
	        </tr>
        </s:if>
        
        <s:else>
        	<tr>
	            <td colspan="4" class="table_title">订单
	            	<s:hidden name="apporder.pkid"/>
	            	<s:hidden name="apporder.releid"/>
	            	<s:hidden name="apporder.provider_id"/>
	            </td>
	        </tr>
        	<tr>
	        	<td class="td_right">编号</td>
	            <td style="text-align: left;">${apporder.chno }</td>
	            <td class="td_right">类型</td>
	            <td style="text-align: left;"><% TreeNode x1 = SystemManager.treeNodeMap.get(request.getAttribute("apporder.genre")); if( x1 != null){out.print(x1.getName());}%></td>
	        </tr>
	        <tr>
	            <td class="td_right">标题</td>
	            <td style="text-align: left;">${apporder.title }</td>
	            <td class="td_right">单价</td>
	            <td style="text-align: left;">${apporder.price }</td>
	        </tr>
	        <tr>
	            <td class="td_right">数量</td>
	            <td style="text-align: left;">${apporder.num }</td>
	            <td class="td_right">总价</td>
	            <td style="text-align: left;">${apporder.total_price }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">服务商名称</td>
	            <td style="text-align: left;">${apporder.provider }</td>
	            <td class="td_right">需求描述</td>
	            <td style="text-align: left;">${apporder.bewrite }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">申请人</td>
	            <td style="text-align: left;">${apporder.userid }&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${apporder.userid }')" class="btn btn-secondary round" type="button" value="查看详情"/></td>
	            <td class="td_right">联系人</td>
	            <td style="text-align: left;">${apporder.contact_name }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">联系地址</td>
	            <td style="text-align: left;">${apporder.contact_address }</td>
	            <td class="td_right">联系电话</td>
	            <td style="text-align: left;">${apporder.contact_mobile }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">状态</td>
	            <td style="text-align: left;"><% TreeNode x2 = SystemManager.treeNodeMap.get(request.getAttribute("apporder.chstatus")); if( x2 != null){out.print(x2.getName());}%></td>
	            <td class="td_right">备注</td>
	            <td style="text-align: left;">${apporder.remark }</td>
	        </tr>
	         <tr>
	        	<td class="td_right">审核人</td>
	            <td style="text-align: left;">${apporder.reviwer_id }&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${apporder.reviwer_id }')" class="btn btn-secondary round" type="button" value="查看详情"/></td>
	            <td class="td_right">审核时间</td>
	            <td style="text-align: left;">${apporder.reviwer_date }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">审核备注</td>
	            <td style="text-align: left;">${apporder.reviwer_remark }</td>
	            <td class="td_right">是否已读</td>
	            <td style="text-align: left;"><% TreeNode x3 = SystemManager.treeNodeMap.get(request.getAttribute("apporder.iscusread")); if( x3 != null){out.print(x3.getName());}%></td>
	        </tr>
	        <tr>
	        	<td class="td_right">创建时间</td>
	            <td style="text-align: left;">${apporder.createdate }</td>
	            <td class="td_right">创建人</td>
	            <td style="text-align: left;">${apporder.updateby }</td>
	        </tr>
	        <tr>
	        	<td class="td_right">修改时间</td>
	            <td style="text-align: left;">${apporder.updatedate }</td>
	           	<td class="td_right"></td>
	            <td style="text-align: left;"</td>
	        </tr>
        </s:else>
	</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script>
<script type="text/javascript">
	 function toUserinfo(userid) {
        layer.open({
            title: '用户详情',
            type: 2,
            skin: 'layui-layer-lan',
            area: ['1100px', '600px'],
            fix: false,
            maxmin: false,
            content: 'appCommon!toUserinfo.action?userid=' + userid
        });
    }
</script>
</body>
</html>