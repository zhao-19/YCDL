<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<style type="text/css">
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
SELECT{margin-bottom:0px!;}
select, textarea, input[type='text'], input[type='password'], input[type='datetime'], input[type='datetime-local'], input[type='date'], input[type='month'], input[type='time'], input[type='week'], input[type='number'], input[type='email'], input[type='url'], input[type='search'], input[type='tel'], input[type='color'], .uneditable-input{margin-bottom:0px;height:auto;}
.pageLink{padding-top:2px!important;}
.selectPageLink {padding-top:3px!important;}
/*.searchshort input{width:90px;}*/
</style>
</head>

<body>
<s:form action="cust!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr class="searchshort">
			<td style="text-align: right;">用户名</td>
			<td style="text-align: left;" >
				<s:textfield name="cust.userid" id="userid" readonly="false" />
			</td>
			
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield name="cust.qiyemingcheng" id="qiyemingcheng" readonly="false" />
			</td>
 					
			<td style="text-align: right;">电话号码</td>
			<td style="text-align: left;" >
				<s:textfield name="cust.cellphone" id="cellphone" readonly="false" />
			</td>
			<td style="text-align: right;">客户类型</td>
			<td style="text-align: left;" >
			<s:select list="%{#request.usertypelist}" listKey="id"  
                            listValue="name" name="cust.usertype" label="客户类型"  
                            headerKey="" headerValue="" />  
            </td>
		</tr>
		<tr>
			<td style="text-align: right;">客户经理</td>
			<td style="text-align: left;" >
				<s:textfield name="cust.custmanage" id="custmanage" readonly="false" />
			</td>
 				
			<td style="text-align: right;">是否融资导师</td>
			<td style="text-align: left;" >
				<select name="cust.needcheck">
				    <option value=""></option>
				    <option value="10002">待审核</option>
				    <option value="10001">已通过</option>
				</select>
      		</td>
			<td style="text-align: right;">QQ微信用户</td>
			<td style="text-align: left;" >
				<select name="cust.qq_openid">
					<option value=""></option>
					<option value="10000">所有</option>
					<option value="10001">未关联</option>
					<option value="10002">已关联</option>
				</select>
			</td>
			<td></td>
			<td></td>
		</tr>

		<!--按钮-->


		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "cust!selectList.action")){%>

					<button method="cust!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "cust!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				
				<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
				</div>
			</td>
		</tr>
	</table>
	
	<!--列表部分-->
	<table class="table table-bordered table-hover">
		<thead>
		<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
			<th style="display: none;">id</th>
 							<th>用户名</th>
 							<th>企业名称</th>
 							<th>客户类型</th>
 							<th>手机号码</th>
 							<th>客户经理</th>
							<th>数据来源</th>
							<th>是否主账号</th>
 							<th>注册时间</th>
 							<th>上次登录时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td> <input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
 								<td>&nbsp;<s:property value="userid"/></td>
 								<td>
 									<s:if test="!(status=='注销' && f_id != '')">
 										<s:property value="companyName"/>
 									</s:if>
								</td>
								<td><s:property value="usertype"/></td>
 								
 								 
 								<td><s:property value="cellphone"/></td>
 								<td><s:property value="custmanage"/></td>
								<td><s:property value="custmanagesource"/></td>
 							 	<td>
	 							 	<s:if test="main_user_stat == 1"><span style="color:red;">主账号</span></s:if>
	 							 	<s:if test="main_user_stat == 0">子账号</s:if>
 							 	</td>
 						 
 								<td>&nbsp;<s:date name="adddate" format="yyyy-MM-dd HH:mm:ss"/></td>
 								<td>&nbsp;<s:date name="lastlogintime" format="yyyy-MM-dd HH:mm:ss"/></td>
 								
			 
				<td>
			 
					<s:a href="cust!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
<style>
	.messcontent,.tcustomer,.sendAll{border: 1px solid #ddd;padding:15px;}
	.sendbutton{margin-top:15px;}
	.messcontent textarea{width:1024px;height: 80px;}
	.tcustomer label{width:244px;margin-right: 15px;float: left;}
	.tcustomer input{width:200px;float:left;}
	.tcustomer span{font-size:22px;padding:5px;background-color: #ccc;float: right;}
</style>

<div class="sendAll">
	<form action="" id="sendmessform" name="sendmessform" method="post">
		<div>
			<div><h4><button id="sureadd" type="button" class="btn btn-success" ><i class="icon-plus-sign icon-white"></i> 添加</button>发送对象：</h4></div>
			<div class="tcustomer">
				<%--<label><input type="text" readonly="readonly" name="13548195657" value="13548195657"/><span>&times;</span></label>
				--%>
				<div id="clear" style="clear:both;"></div>
			</div>
		</div>
		<div>
			<div><h4>消息内容：</h4></div>
			<div class="messcontent">
			<textarea name= "messcontent" >我们将在16年12月10日举行融资服务座谈会，届时欢迎各位融资伙伴到场观摩，这次座谈将就“如何提升融资，以融筑荣”主题展开探讨，莅临本次座谈的有成都市融资服务专家张华光先生，成都市融资局副主任刘铭怡女士等等8位重量级人物。举办时间：xxxxxx地点:xxxxxxxxxxxx</textarea>
			</div>
		</div>
		<div class="sendbutton">
			<button id="suresend" type="button" class="btn btn-primary" ><i class="icon-ok icon-white"></i> 发送</button>
		</div>
	</form>
</div>

<script type="text/javascript">
		$('#sureadd').click(function(){	
			//click的时候动态创建元素	
			var sureaddlengthx= $("input[name='ids']:checked");
			sureaddlengthx.each(function(){
				var name = $(this).parent().next().next().next().html();
				var tel = $(this).parent().next().next().next().next().next().html();
				var input = $('<label><input type="text" readonly="readonly" name="'+tel+'" value="'+name+'"/><span>&times;</span></label>');
				input.insertBefore($("#clear"));

			});




			//在这个click里面写动态绑定事件，用on,不用live   点击删除这个节点
			var spansx = $('.tcustomer span');
				//alert(spansx.length);
				spansx.on('click',function(){
					$(this).parent().remove();
				});
		});


		//点击发送
		$("#suresend").click(function(){
			var labell = $('.tcustomer label').length;
			if(labell<1){
				alert("请先添加发送对象！");
				return;
			}
			if(confirm("确定发送内容？")){
				$("#sendmessform").submit();
			}else{

			}
		});

		
$("select[name='e.needcheck']").val('${e.needcheck}');	
$("select[name='e.qq_openid']").val('${e.qq_openid}');		
</script>

</body>
</html>
