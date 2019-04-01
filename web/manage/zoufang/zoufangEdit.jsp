<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
	.td_right{text-align: right;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});
</script>
</head>

<body>
	<s:form action="zoufang" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right">主键</th>
				<td style="text-align: left;">
				<s:textfield name="e.id" id="id" readonly="false" data-rule="主键:required;id;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" data-rule="企业名称:required;qiyemingcheng;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业性质</th>
				<td style="text-align: left;">
				<s:textfield name="e.qiyexingzhi" id="qiyexingzhi" readonly="false" data-rule="企业性质:required;qiyexingzhi;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">所在地址</th>
				<td style="text-align: left;">
				<s:textfield name="e.suozaidizhi" id="suozaidizhi" readonly="false" data-rule="所在地址:required;suozaidizhi;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">成立日期</th>
				<td style="text-align: left;">
				<s:textfield name="e.chengliriqi" id="chengliriqi" readonly="false" data-rule="成立日期:required;chengliriqi;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">行业归属</th>
				<td style="text-align: left;">
				<s:textfield name="e.hangyeguishu" id="hangyeguishu" readonly="false" data-rule="行业归属:required;hangyeguishu;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">注册资本</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuceziben" id="zhuceziben" readonly="false" data-rule="注册资本:required;zhuceziben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">法人</th>
				<td style="text-align: left;">
				<s:textfield name="e.faren" id="faren" readonly="false" data-rule="法人:required;faren;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">法人电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.farentele" id="farentele" readonly="false" data-rule="法人电话:required;farentele;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">联系人</th>
				<td style="text-align: left;">
				<s:textfield name="e.lianxiren" id="lianxiren" readonly="false" data-rule="联系人:required;lianxiren;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">联系人电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.lianxirentele" id="lianxirentele" readonly="false" data-rule="联系人电话:required;lianxirentele;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">公司简介</th>
				<td style="text-align: left;">
				<s:textfield name="e.gongsijianjie" id="gongsijianjie" readonly="false" data-rule="公司简介:required;gongsijianjie;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主要产品</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuyaochanpin" id="zhuyaochanpin" readonly="false" data-rule="主要产品:required;zhuyaochanpin;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">最远的那一年</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdyear" id="thirdyear" readonly="false" data-rule="最远的那一年:required;thirdyear;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdsell" id="thirdsell" readonly="false" data-rule="销售收入:required;thirdsell;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdinte" id="thirdinte" readonly="false" data-rule="利润:required;thirdinte;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondsell" id="secondsell" readonly="false" data-rule="销售收入:required;secondsell;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondinte" id="secondinte" readonly="false" data-rule="利润:required;secondinte;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstsell" id="firstsell" readonly="false" data-rule="销售收入:required;firstsell;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstinte" id="firstinte" readonly="false" data-rule="利润:required;firstinte;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">其他关注内容</th>
				<td style="text-align: left;">
				<s:textfield name="e.qitaguanzhuneirong" id="qitaguanzhuneirong" readonly="false" data-rule="其他关注内容:required;qitaguanzhuneirong;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业融资需求</th>
				<td style="text-align: left;">
				<s:textfield name="e.qiyerongzixuqiu" id="qiyerongzixuqiu" readonly="false" data-rule="企业融资需求:required;qiyerongzixuqiu;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">是否跟进</th>
				<td style="text-align: left;">
				<s:textfield name="e.shifougenjin" id="shifougenjin" readonly="false" data-rule="是否跟进:required;shifougenjin;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">跟进意见</th>
				<td style="text-align: left;">
				<s:textfield name="e.memo" id="memo" readonly="false" data-rule="跟进意见:required;memo;length[2~1024]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">拜访时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.baifangshijian" id="baifangshijian" readonly="false" data-rule="拜访时间:required;baifangshijian;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">拜访人</th>
				<td style="text-align: left;">
				<s:textfield name="e.baifangren" id="baifangren" readonly="false" data-rule="拜访人:required;baifangren;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule="录入时间:required;lurushijian;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入人</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="录入人:required;inputuser;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">最后修改时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" data-rule="最后修改时间:required;lastchgtime;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.yixiangchanpin" id="yixiangchanpin" readonly="false" data-rule=":required;yixiangchanpin;length[2~512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.genzongdongtai" id="genzongdongtai" readonly="false" data-rule=":required;genzongdongtai;length[2~512]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="zoufang!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="zoufang!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
