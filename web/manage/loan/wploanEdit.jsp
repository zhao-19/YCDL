<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href="/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">

 
  <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />
<script language="JavaScript" type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
.xzxld{display:none;}
select{height:auto;}
</style>
<script type="text/javascript">


function getbaserate(){
	var _term = $("#term").val();
	var _url = "wploan!getbaserate.action";
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {"e.term":_term},
	  dataType:"text",
	  //async:false,
	  success: function(data){
		  if(!data){return null;}
		  ////console.log("data="+data);
		  $("#baserate").val(data*100);
	  },
	  error:function(){
		  ////console.log("加载数据失败，请联系管理员。");
	  }
	});
};

function rateset(){
	//如果为固定利率 ，那么利率浮动值只读，且为空
	//如果为浮动利率 ，那么可以根据填利率浮动值或执行利率 来反推另外个值
	var intetype = $("#intetype").val();
	if(intetype=='1'){
		$("#float").val('');
		$("#float").attr({ readonly: 'true' });
	}else {
		$("#float").removeAttr("readonly");
		
	}
	
};
function calcrate(s) {
	var _float = $("#float").val();
	var _rate = $("#rate").val();
	var _baserate = $("#baserate").val();
	if(s=='1') {
		//由修改浮动值触发  设置执行利率
		$("#rate").val(parseFloat(parseFloat(_baserate)*(1+parseFloat(_float/100))).toFixed(5));
	}else {
		//由修改执行利率触发  设置浮动利率
		$("#float").val(100*parseFloat((parseFloat(_rate)/parseFloat(_baserate)-1)).toFixed(5));
	}
};
function checkorgcode(){
	return;
	var orgcode = $("#paperid").val();
	orgcode.Trim;
	if( orgcode.length==0) {
		return;
	}
	if(orgcode.length!=9   ) {
		
		alert("组织机构代码长度必须为9位.");
		 $("#paperid").val('');
		return false;
	}

	var patrn=/^[0-9A-Z]+$/;

	if(patrn.test(orgcode)==false){

		alert("组织机构代码只可为数字或大写拉丁字母.");
		 $("#paperid").val('');
		return false;

	}

	var lastpatrn=/^[0-9X]+$/;

	var checkcode=orgcode.substring(8,9);

	if(lastpatrn.test(checkcode)==false){
		alert("组织机构代码最后一位只可为数字或大写拉丁字母:X");
		 $("#paperid").val('');
		return false;

	}

	var ancode;

	var ancodevalue;

	var total=0;

	for(var i=0;i<orgcode.length-1;i++){

	ancode=orgcode.substring(i,i+1);

	ancodevalue=findvalueinorgcodemapping(ancode);

	total=total+ancodevalue*weightedfactors[i];

	}

	var logiccheckcode=11-total%11;

	if(logiccheckcode==10)

	logiccheckcode='X';

	if(logiccheckcode==11)

	logiccheckcode='0';

	if(checkcode != logiccheckcode)
		alert("组织机构代码结构错误.最后一位校验码应为:"+logiccheckcode);
	 $("#paperid").val('');
	return false;
	}
</script>
	
</head>

<body> <s:form action="productapp" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
 	<tr style="display: none;">
								<td>id</td>
								<td><s:hidden name="e.id" label="id" id="id"/></td>
									<td><s:hidden name="e.rele_id" label="rele_id" id="rele_id"/></td>
										<td><s:hidden name="e.rele_table" label="rele_table" id="rele_table"/></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							
							

			 	 <tr >
						<td colspan="4" style="background-color: #dff0d8" >	
						&nbsp;基本信息
						</td>
					</tr>
			 					 
 				
							<tr>
								<td style="text-align: right;">组织机构代码（可自动赋值）</td>
								<td style="text-align: left;" colspan="3">
									<s:textfield name="e.paperid" onblur="checkorgcode()" maxlength="32" style="width: 20%;" id="paperid" /></td>
							</tr>
							<tr>
								<td style="text-align: right;">公司名称</td>
								<td style="text-align: left;" colspan="3">
									<s:textfield name="e.compname" data-rule="公司名称;required;compname;length[0~128];" size="60" maxlength="60" style="width: 80%;"
										id="compname" /></td>
							</tr>
							
							<tr>
								<td style="text-align: right;">行业类别</td>
								 <td  colspan="3">
									<s:select list="%{#application.dic.cdzhygs.childs}" id="industry" name="e.industry"  cssClass="input-medium" 
										listKey="id"   listValue="name"  headerKey="" headerValue=""/>
								</td>
						 
							
							 </tr>
							<tr>
								<td style="text-align: right;">银行</td>
								 <td   >
									 
  								<s:select list="#{'国家开发银行':'国家开发银行','进出口银行':'进出口银行','盈创动力分配银行':'盈创动力分配银行','成都银行科技支行':'成都银行科技支行','成都银行高新支行':'成都银行高新支行','盈创动力分配银行':'盈创动力分配银行','成都银行营业部':'成都银行营业部','成都银行华兴支行':'成都银行华兴支行','成都银行高新支行':'成都银行高新支行','成都银行琴台支行':'成都银行琴台支行','成都银行金河支行':'成都银行金河支行','成都银行长顺支行':'成都银行长顺支行','成都银行锦江支行':'成都银行锦江支行','成都银行成华支行':'成都银行成华支行','成都银行武侯支行':'成都银行武侯支行','成都银行德盛支行':'成都银行德盛支行','成都银行青羊支行':'成都银行青羊支行','成都银行高升桥支行':'成都银行高升桥支行','成都银行金牛支行':'成都银行金牛支行','成都银行沙湾支行':'成都银行沙湾支行','成都银行体育场路支行':'成都银行体育场路支行','成都银行科技支行':'成都银行科技支行','成都银行双流支行':'成都银行双流支行','成都银行龙泉驿支行':'成都银行龙泉驿支行','成都银行彭州支行':'成都银行彭州支行','成都银行邛崃支行':'成都银行邛崃支行','成都银行新津支行':'成都银行新津支行','成都银行郫县支行':'成都银行郫县支行','成都银行都江堰支行':'成都银行都江堰支行','成都银行温江支行':'成都银行温江支行','成都银行崇州支行':'成都银行崇州支行','成都银行新都支行':'成都银行新都支行','成都银行大邑支行':'成都银行大邑支行','成都银行青白江支行':'成都银行青白江支行','成都银行金堂支行':'成都银行金堂支行','成都银行蒲江支行':'成都银行蒲江支行','工行高新支行':'工行高新支行','邮储银行四川省分行直属支行':'邮储银行四川省分行直属支行','邮储银行成都市高新区支行':'邮储银行成都市高新区支行','邮储银行成都市太升南路支行':'邮储银行成都市太升南路支行','邮储银行成都市高新支行':'邮储银行成都市高新支行','邮储银行省分行直属支行':'邮储银行省分行直属支行','邮储银行成都市沙湾支行':'邮储银行成都市沙湾支行','邮储银行成都市双楠支行':'邮储银行成都市双楠支行','建设银行成都第五支行':'建设银行成都第五支行','工行双流支行':'工行双流支行'}" id="bank" name="e.bank"  cssClass="input-medium" 
										listKey="key" listValue="value"  headerKey="" headerValue=""  data-rule="贷款银行:required;daikuanyinhang"/>
			
								</td>
								<td style="text-align: right;">贷款产品</td>
								 <td  >
									<s:select list="#{'成长贷':'成长贷','壮大贷':'壮大贷','新创贷':'新创贷','期权贷':'期权贷','园保贷':'园保贷','开行统借统还贷款':'开行统借统还贷款','口行统借统还贷款':'口行统借统还贷款'}" id="prodname" name="e.prodname"  cssClass="input-medium" 
										listKey="key" listValue="value"   headerKey="" headerValue=""/>
								</td>
								
							</tr>
							
								<tr>
								<td style="text-align: right;">担保平台</td>
								<td style="text-align: left;">
								
								<s:select list="#{'无':'无','成都中小担':'成都中小担','成都高投担':'成都高投担'}" id="guranplant" name="e.guranplant"  cssClass="input-medium" 
										listKey="key" listValue="value"  headerKey="" headerValue="" data-rule="担保公司:required;guranplant;length[1~32]" />
			
						 
										</td>
										
										
								<td style="text-align: right;">状态</td>
								 <td>
									<s:select list="%{#application.dic.wploanstatus.childs}" id="status" name="e.status"  cssClass="input-medium" 
										listKey="id"   listValue="name"  headerKey="" headerValue=""/>
								</td>
							</tr>	
							<tr>
								<td style="text-align: right;">贷款金额(万元)</td>
								<td style="text-align: left;" >
									<s:textfield onkeyup="value=value.replace(/[^\d]/g,'')" name="e.amt" data-rule="贷款金额;required;amt;length[0~128];" size="60" maxlength="60" style="width: 20%;"
										id="amt" /></td>
										<td style="text-align: right;">贷款期限(月)</td>
								<td style="text-align: left;" >
									<s:textfield  onkeyup="value=value.replace(/[^\d]/g,'')" onblur="getbaserate()"   name="e.term" data-rule="贷款期限;required;term;length[0~128];" size="60" maxlength="60" style="width: 20%;"
										id="term" /></td>
							 </tr>
						 	
							
						
							<tr>
								
										
										<td style="text-align: right;">起始日期</td>
								<td style="text-align: left;" >
									 <input id="begindate" class="Wdate search-query" type="text" name="e.begindate"
									value="<s:property value="e.begindate" />"
									onFocus="WdatePicker({isShowClear:false,readOnly:true})" data-rule="起始日期;required"
									onchange="DateAdd(this);"
									/> 
									</td>
										
										
										
										
										<td style="text-align: right;">到期日期</td>
							 
											<td style="text-align: left;" >
									 <input id="enddate" class="Wdate search-query" type="text" name="e.enddate"
									value="<s:property value="e.enddate" />"
									onFocus="WdatePicker({isShowClear:false,readOnly:true})" data-rule="起始日期;required"/> 
									</td>
							</tr>
							
							   
						
							
							<tr>
								<td style="text-align: right;">还款方式</td>
								<td style="text-align: left;" >
								<s:select list="#{1:'按季结息到期还本（季度末月20日）',2:'按月结息，到期还本'}" id="retutype" name="e.retutype"  cssClass="input-medium" 
										headerKey="" headerValue="" listKey="key" listValue="value" data-rule="起始日期;required" /></td>
										
							<td style="text-align: right;">区域</td>
								 <td  >
									<s:select list="#{1:'高新区内',2:'高新区外'}" id="area" name="e.area"  cssClass="input-medium" 
										listKey="key" listValue="value"  headerKey="" headerValue=""  />
								</td>
							</tr>
								
						
			 	 <tr class="xzxld"  >
						<td colspan="4" style="background-color: #dff0d8" >	
						&nbsp;核算信息
						</td>
					</tr>
			 				<tr class="xzxld" >
								<td class="xzxld" style="text-align: right;">利率调整类型</td>
								<td class="xzxld"  style="text-align: left;" colspan="3">
								<s:select list="#{0:'',1:'固定利率',2:'浮动利率'}" onchange="rateset()" id="intetype" name="e.intetype"  cssClass="input-medium" 
										listKey="key" listValue="value"  />
										</td>
						<!-- 		<td style="text-align: right;">利率调整方式</td>
								<td style="text-align: left;"><s:select list="#{1:'不调整',2:'下次计息调整'}" id="intechangetype" name="e.intechangetype"  cssClass="input-medium" 
										listKey="key" listValue="value"  /></td>   -->
							</tr>
							<tr class="xzxld" >
								<td style="text-align: right;">基准利率(%)</td>
								<td style="text-align: left;" >
									<s:textfield name="e.base_rate"   id="baserate" data-rule="基准利率;required;base_rate;length[0~128];" size="60" maxlength="60" style="width: 20%;"
										  /></td>
										
									<td style="text-align: right;">利率浮动值(%)</td>
								<td style="text-align: left;" >
									<s:textfield name="e.floatrate" onblur="calcrate('1')"  data-rule="利率浮动值;required;floatrate;length[0~128];" size="60" maxlength="60" style="width: 20%;"
										id="float" /></td>
												
								</tr>
							<tr class="xzxld" >		
								<td style="text-align: right;">执行利率(%)</td>
								<td style="text-align: left;" colspan="3">
`									<s:textfield name="e.rate" onblur="calcrate('2')" data-rule="执行利率;required;rate;length[0~128];" size="60" maxlength="60" style="width: 20%;" id="rate" /></td>
										
										
			 
							</tr>
		<!-- 					
						
				 	 <tr >
						<td colspan="4" style="background-color: #dff0d8" >	
						&nbsp;其他信息
						</td>
					</tr>
			 							 
							
						 
							<tr>
								<td style="text-align: right;" nowrap="nowrap">联系人</td>
								<td style="text-align: left;" colspan="3">
									<s:textfield type="text" name="e.contactname" maxlength="30" size="30" style="width: 20%;" />
								</td>
							 </tr>
							 
							<tr>
								<td style="text-align: right;" nowrap="nowrap">联系电话</td>
								<td style="text-align: left;" colspan="3">
									<s:textfield type="text" name="e.contacttele" maxlength="30" size="30" style="width: 20%;" />
								</td>
							</tr>
							 
							  -->
							<tr><td colspan="4" style="text-align: center;" >
								<s:if test="e.id=='' or e.id==null">
				<button method="wploan!insert.action" class="btn btn-success">
					<i class="icon-ok icon-white"></i> 新增
				</button>
			</s:if> 
			<s:else>
				ID：<span class="badge badge-success"><s:property value="e.id"/></span>
				<s:if test="e.activityID!=null">
					ID：<span class="badge badge-success"><s:property value="e.activityID"/></span>
				</s:if>
				<button method="wploan!update.action" class="btn btn-success">
					<i class="icon-ok icon-white"></i> 保存
				</button>
				
			</s:else>
			
			<button method="wploan!wploanUpdate.action?type=1" class="btn btn-success">
				<i class="icon-ok icon-white"></i> 保存并新增
			</button>
			</td>
							</tr>
		</table>
	</s:form>
 
<!--根据贷款产品,控制核算信息是否显示-->
<script type="text/javascript">
var ifkaiorkou = $("#prodname");
var ifkaiorkou_val = $("#prodname").val();
if(ifkaiorkou_val=='开行统借统还贷款' ||  ifkaiorkou_val=='口行统借统还贷款'){
	$(".xzxld").show();
	//$(".xzxld input").attr('disabled',false);
	//$(".xzxld input").attr('data-rule',"data-rule");
	
}else{
	var inputs = $(".xzxld input");
	inputs.each(function(){
		var yshuxing = $(this).attr('data-rule');
		$(this).attr('data-ruleys',yshuxing).removeAttr('data-rule');
	});
	
}
ifkaiorkou.change(function(){
	ifkaiorkou_val = $("#prodname").val();
	if(ifkaiorkou_val=='开行统借统还贷款' ||  ifkaiorkou_val=='口行统借统还贷款'){
		$(".xzxld").show();
		//$(".xzxld input").attr('disabled',false);
		var inputs = $(".xzxld input");
		inputs.each(function(){
			var yshuxing = $(this).attr('data-ruleys');
			$(this).attr('data-rule',yshuxing).removeAttr('data-ruleys');
		});
	}else{
		$(".xzxld").hide();
		//$(".xzxld input").attr('disabled',true);
		//$(".xzxld input").attr('data-rule',"data-rule2");
		var inputs = $(".xzxld input");
		inputs.each(function(){
			var yshuxing = $(this).attr('data-rule');
			$(this).attr('data-ruleys',yshuxing).removeAttr('data-rule');
		});
	}
});
function DateAdd(obj) {
	var val = $(obj).val();
	var split = $("#term").val();
	split = split == "" ? 12 : split;
	var date = new Date(val);
	date.setFullYear(date.getFullYear() + Number(split / 12))
	date.setMonth(date.getMonth() + split % 12);
	date.setDate(date.getDate() - 1);
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	m = m < 10 ? ("0" + m) : m;
	d = d < 10 ? ("0" + d) : d;
	$("#enddate").val(y + "-" + m + "-" + d);
}

</script>
 
</body>
</html>
