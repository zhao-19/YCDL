<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

	<s:form action="productczdcpxx" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">主表主键</th>
				<td style="text-align: left;">
				<s:textfield name="e.releid" id="releid" readonly="false" data-rule="主表主键:required;releid;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主要产品</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuyaochanpin" id="zhuyaochanpin" readonly="false" data-rule="主要产品:required;zhuyaochanpin;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主要销售市场</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuyaoxiaoshoushichang" id="zhuyaoxiaoshoushichang" readonly="false" data-rule="主要销售市场:required;zhuyaoxiaoshoushichang;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">技术先进性</th>
				<td style="text-align: left;">
				<s:textfield name="e.jishuxianjinxing" id="jishuxianjinxing" readonly="false" data-rule="技术先进性:required;jishuxianjinxing;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">国内市场占有率</th>
				<td style="text-align: left;">
				<s:textfield name="e.guoneishichagnzhanyoulv" id="guoneishichagnzhanyoulv" readonly="false" data-rule="国内市场占有率:required;guoneishichagnzhanyoulv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">四川占有率</th>
				<td style="text-align: left;">
				<s:textfield name="e.sichuanshichagnzhanyoulv" id="sichuanshichagnzhanyoulv" readonly="false" data-rule="四川占有率:required;sichuanshichagnzhanyoulv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">上年度销售额</th>
				<td style="text-align: left;">
				<s:textfield name="e.shangnianduxiaoshoue" id="shangnianduxiaoshoue" readonly="false" data-rule="上年度销售额:required;shangnianduxiaoshoue;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">占收入比例</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhanshourubili" id="zhanshourubili" readonly="false" data-rule="占收入比例:required;zhanshourubili;length[2~9]"/>
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
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="productczdcpxx!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="productczdcpxx!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
