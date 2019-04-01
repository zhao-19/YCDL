<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />


<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
.btnCCC{
    background-image: url("../img/glyphicons-halflings-white.png");
    background-position: -288px 0;
}
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
select{height:auto;}
</style>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>


<style>
select {
	height: auto;
}
.ke-dialog-default,.ke-dialog{top:50%;transform:translateY(-50%);-ms-transform:translateY(-50%);
-moz-transform:translateY(-50%);-webkit-transform:translateY(-50%);-o-transform:translateY(-50%);}
</style>
<script>
	KindEditor.ready(function(K) {
		var editor = K.editor({
			allowFileManager : false
		});
		/* K('input[name=filemanager]').click(function() {
			var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
			editor.loadPlugin('filemanager', function() {
				editor.plugin.filemanagerDialog({
					viewType : 'VIEW',
					dirName : 'image',
					clickFn : function(url, title) {
						//K('#picture').val(url);
						//alert(url);
						imagesInputObj.val(url);
						editor.hideDialog();
						clearRootImagePath(imagesInputObj);//$("#picture"));
					}
				});
			});
		}); */

		K('#filemanager3').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					insertfile : K('#logo').val(),
					clickFn : function(url, title) {
						K('#logo').val(url);
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

	function changetuijian() {
		var _type = $("#shifoutuijian").val();
		if (_type == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005') { //否 就只读
			$("#tuijianpic").attr("disabled", "disabled");
			$("#tuijianpic").removeAttr("required");
			$("#tuijianpic").val('');
		} else {
			$("#tuijianpic").removeAttr("disabled");
			$("#tuijianpic").attr("required", "required");

		}

	}
</script>
</head>

<body>
	<s:form action="product" namespace="/manage" theme="simple" id="form"
		name="form" method="post">
		<table class="table table-bordered">

			<tr style="display: none;">
				<th>id</th>
				<td colspan="3"><s:hidden name="e.id" /></td>
			</tr>




			<tr>
				<th class="td_right">产品编号（八位数字）</th>
				<td style="text-align: left;"><s:textfield name="e.prodid"
						id="prodid" readonly="false"
						data-rule="产品编号:required;prodid;length[8~8]" /></td>

				<th class="td_right">产品名称</th>
				<td style="text-align: left;"><s:textfield name="e.prodname"
						id="prodname" readonly="false"
						data-rule="产品名称:required;prodname;length[2~32]" /></td>
			</tr>

			<tr>
				<th class="td_right">担保方式</th>
				<td style="text-align: left;" colspan="3"><s:checkboxlist
						name="e.loangur" id="loangur" list="%{#request.gur2list}"
						listKey="id" listValue="name"
						value="#request.e.loangur.split(',')" /></td>
			</tr>




			<tr>
				<th class="td_right">贷款期限（月）</th>
				<td style="text-align: left;"><s:textfield name="e.loanterm"
						id="loanterm" readonly="false" onblur="checkloanamt(this.id)"
						data-rule="贷款期限:required;integer;length[1~9]" /></td>

				<th class="td_right">最大贷款期限（月）</th>
				<td style="text-align: left;"><s:textfield name="e.loantermmax"
						id="loantermmax" readonly="false" onblur="checkloanamt(this.id)"
						data-rule="最大贷款期限:required;integer;length[1~9]" /></td>

			</tr>

			<tr>
				<th class="td_right">贷款金额（万元）</th>
				<td style="text-align: left;"><s:textfield name="e.loanamt"
						id="loanamt" readonly="false" onblur="checkloanamt(true)"
						data-rule="贷款金额:required;integer;length[1~9]" /></td>

				<th class="td_right">最大贷款金额（万元）</th>
				<td style="text-align: left;"><s:textfield name="e.loanamtmax"
						id="loanamtmax" readonly="false" onblur="checkloanamt(true)"
						data-rule="最大贷款金额:required;integer;length[1~9]" /></td>

			</tr>

			<tr>
				<th class="td_right">是否贴息</th>
				<td style="text-align: left;"><s:select
						list="%{#request.status2list}" listKey="id" listValue="name"
						name="e.loanbonus" id="loanbonus" value="#request.e.loanbonus" />
				</td>

				<th class="td_right">贴息比例（%）</th>
				<td style="text-align: left;"><s:textfield name="e.bonusper"
						id="bonusper" readonly="false"
						data-rule="贴息比例:required;int;length[1~32]" /> %</td>


			</tr>

			<tr>
				<th class="td_right">还款方式</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.retutype" id="retutype" readonly="false"
						data-rule="还款方式:required;retutype;length[2~32]" /></td>
			</tr>
			<tr>
				<th class="td_right">贷款利率（年）</th>
				<td style="text-align: left;"><s:textfield name="e.loanrate"
						id="loanrate" readonly="false"
						data-rule="贷款利率:required;loanrate;length[2~16]" /></td>



				<th class="td_right">适用地区（用空格分隔）</th>
				<td style="text-align: left;"><s:textfield name="e.loanarea"
						id="loanarea" readonly="false"
						data-rule="适用地区:required;loanarea;length[2~16]" /></td>
			</tr>




			<tr>
				<th class="td_right">合作银行</th>
				<td style="text-align: left;" colspan="3"><s:radio
						name="e.banks" id="banks" list="%{#request.bankMap}"
						value="#request.e.banks" /></td>
			</tr>
			<tr>
				<th class="td_right">是否推荐</th>
				<td style="text-align: left;" colspan="3"><s:select
						list="%{#request.status2list}" listKey="id" listValue="name"
						name="e.shifoutuijian" id="shifoutuijian"
						value="#request.e.shifoutuijian" /></td>
			</tr>

			<tr>
				<div class="inputtest inputtestl">
					<td class="td_right"><span class="leftname leftnamel"><input
							type="button" name="filemanager3" id="filemanager3" value="推荐图片"
							class="btn btn-success" /></span></td>
					<td style="text-align: left;"><span class="rightinfo"><input
							readonly="readonly" type="text" class="input" id="logo"
							name="e.tuijianpic" value="<s:property value='e.tuijianpic'/>" />
					</span></td>
				</div>
			</tr>
			<tr>
				<div class="inputtest inputtestl">
					<td class="td_right"><span class="leftname leftnamel"><input
							type="button" name="filemanager2" id="filemanager2" value="服务流程"
							class="btn btn-success" /></span></td>
					<td style="text-align: left;"><span class="rightinfo"><input
							readonly="readonly" type="text" class="input" id="logo2"
							name="e.banliliuc" value="<s:property value='e.banliliuc'/>" />
					</span></td>
				</div>
			</tr>

			<!-- 	   <tr>
				<th class="td_right">是否推荐</th>
				<td style="text-align: left;" colspan="3">
				
				<s:select list="%{#request.status2list}" listKey="id"  
	                            listValue="name"  name="e.shifoutuijian"   id="shifoutuijian"   onchange="changetuijian()"  value="#request.e.shifoutuijian"   />   
				</td>
				</tr>
 				
 				 <tr>
			 
					
				<td style="text-align: left;" colspan="4">
					<input type="button" name="filemanager" value="推荐图片" class="btn btn-success"/>
					<s:textfield type="text" id="tuijianpic" name="e.tuijianpic" ccc="imagesInput" style="width: 600px;" 
					data-rule="小图;required;maxPicture;"/>
					<s:if test="e.tuijianpic!=null">
						<a target="_blank" href="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.tuijianpic" />">
							<img style="max-width: 50px;max-height: 50px;" alt="" src="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.tuijianpic" />">
						</a>
					</s:if>
				</td>
				
			 
				</tr>
 			 -->

			<tr>
				<th class="td_right">贷款条件（用空格分隔）</th>
				<td style="text-align: left;" colspan="3"><s:textarea rows="6"
						cols="100" name="e.loancondition" id="loancondition"
						readonly="false"
						data-rule="贷款条件:required;loancondition;length[2~1024]" /></td>
			</tr>
			<tr>
				<th class="td_right">产品特点（用空格分隔）</th>
				<td style="text-align: left;" colspan="3"><s:textarea rows="6"
						cols="100" name="e.productdetail" id="productdetail"
						readonly="false"
						data-rule="产品特点:required;productdetail;length[2~1024]" /></td>
			</tr>
			<tr>
				<th class="td_right">标签(用空格分隔)</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.biaoqian" size="64" id="biaoqian" readonly="false"
						data-rule="标签:required;biaoqian;length[2~64]" /></td>
			</tr>

			<tr>
				<th class="td_right">是否发布</th>
				<td style="text-align: left;" colspan="3"><s:select
						list="%{#request.status2list}" listKey="id" listValue="name"
						name="e.openstat" id="openstat" value="#request.e.openstat" />
				</td>
			</tr>
			<tr>
				<th class="td_right">产品类型</th>
				<td style="text-align: left;"><s:select
						list="%{#request.loanstype}" listKey="id" listValue="name"
						name="e.product_type" id="product_type"
						value="#request.e.product_type" /></td>

				<th class="td_right">发布类型</th>
				<td style="text-align: left;"><s:select
						list="%{#request.publishtype}" listKey="id" listValue="name"
						name="e.rele_type" id="rele_type" value="#request.e.rele_type" />
				</td>

			</tr>

			<tr>
				<th class="td_right">发布机构id</th>
				<td style="text-align: left;"><s:textfield name="e.rele_bankid"
						id="rele_bankid" readonly="false"
						data-rule="发布机构:required;rele_bankid;length[2~32]" /></td>

				<th class="td_right">发布人id</th>
				<td style="text-align: left;"><s:textfield name="e.rele_userid"
						id="rele_userid" readonly="false"
						data-rule="发布人:required;rele_userid;length[2~32]" /></td>
			</tr>

			<tr>
				<th class="td_right">数据来源</th>
				<td style="text-align: left;"><s:select
						list="%{#request.datasourcetype}" listKey="id" listValue="name"
						name="e.datasource" id="datasource" value="#request.e.datasource" />
				</td>

				<th class="td_right">app发布编号</th>
				<td style="text-align: left;"><s:textfield name="e.appid"
						id="appid" readonly="false"
						data-rule="发布编号:required;appid;length[0~32]" /></td>

			</tr>
			<tr>
                <th class="td_right">产品描述</th>
                <td style="text-align: left;"><s:textfield
                        name="e.description" id="description" readonly="false"
                        data-rule="产品描述:required;description;length[1~18]" /></td>
            </tr>
			<tr>
				<th class="td_right">担保费</th>
				<td style="text-align: left;"><s:textfield
						name="e.guaranteefee" id="guaranteefee" readonly="false"
						data-rule="担保费:required;integer;length[1~9]" /></td>
			</tr>
			<tr>
				<th class="td_right">平台服务费</th>
				<td style="text-align: left;"><s:textfield
						name="e.servicecharge" id="servicecharge" readonly="false"
						data-rule="平台服务费:required;integer;length[1~9]" /></td>
			</tr>
			<tr>
				<th class="td_right">总成本</th>
				<td style="text-align: left;"><s:textfield name="e.totalcost"
						id="totalcost" readonly="false"
						data-rule="总成本:required;integer;length[1~9]" /></td>
			</tr>


			<tr>
				<td colspan="4" style="text-align: center;"><s:if
						test="e.id=='' or e.id==null">
						<button method="product!insert.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if> <s:else>
						<button method="product!update.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else></td>
			</tr>
		</table>
	</s:form>
</body>
<script type="text/javascript">
	//最小贷款(期限)金额不能大于最大贷款期限(金额)

	 function checkloanamt(id) {
		return checkLoanamtP(id);
	}

	function checkLoanamtP(id) {
		var nowid = id;
		var loanterm = $('#loanterm').val();
		var loantermmax = $('#loantermmax').val();
		if (loantermmax < loanterm) {
			// alert("最小期限不能大于最大期限");
			// $('#'+nowid).focus();
			return false;
		}

		var loanamt = $('#loanamt').val();
		var loanamtmax = $('#loanamtmax').val();
		if (loanamtmax < loanamt) {
			// alert("最小贷款金额不能大于最大贷款金额");
			// $('#'+nowid).focus();
			return false;
		} 
	}

	loanamtmax.blur(function() {

		loanamt = $('#loanamt').val();
		if ($(this).val() < loanamt) {
			$(this).attr('class', 'n-invalid')
					.attr('data-inputstatus', 'error').attr('aria-invalid',
							'true');
			$('span[for=loanamtmax]').children('.msg-wrap').addClass('n-error')
					.children('.n-msg').html('最小贷款金额不能大于最大贷款金额');
		} else {
			alert('ok');
			$(this).attr('class', 'n-valid').attr('data-inputstatus', 'ok')
					.attr('aria-invalid', 'no');
			$('span[for=loanamtmax]').children('.msg-wrap').removeClass(
					'n-error').children('.n-msg').html('');
		}
	});
</script>
</html>
