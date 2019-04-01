<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/productczdcwxx.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="e.t"/>">
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
	<div id="ggts2"></div>

<script type="text/javascript">
$(document).ready(function(){

  var backnotice = $("#backnotice").val();
	if(backnotice=='1'){
	     
	         var a = document.getElementById("ggts2");//获取div块对象
	         var Height=document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
	         var Width=document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
	         var gao1 = a.offsetHeight;//获取div块的高度值
	         var gao2 = a.offsetWidth;//获取div块的宽度值
	         var Sgao1= (Height - gao1)/2-110+"px";
	         var Sgao2= (Width - gao2)/2+"px";
	         a.style.top=Sgao1;
	         a.style.left=Sgao2;
	        // $("#ggts2").show();
	    ggts2('暂存成功');
	}  
	
	
	var t = $("#t").val();
	if(t=='v'){
		$("#productczdcwxx input,radio,select,textarea,checkbox").attr('disabled',true).parent().addClass("nohover");
		$("#czdsteponesbt").attr("disabled",false);
		$("#czdsteponesave").attr("disabled",false);
		$("#czdsteponesbt_zc").hide();
		var id = $("#czdsteponesbt").attr("lang");
		$("#productczdcwxx").attr("action","/productczdbase/tostep4.html?e.id="+id+"&e.t="+t);
		/* $("#czdsteponesbt").click(function(){
			var id=$(this).attr("lang");
			//点击下一步 链接是第三步
			location.href="/productczdbase/tostep4.html?e.id="+id+"&e.t="+t;
		}); */
		$(".nextnotice").hide();
	}else{
		$("#czdsteponesbt").click(function(){
			productczdcwxx();
		});
		//点击暂存按钮移除错误节点，改变form表单的id,提交form表单
		$("#czdsteponesbt_zc").click(function(){
			$(".error").remove();
			//$("#productczdcwxx").attr("id","productczdcwxx2");
			//$("#productczdcwxx2").attr("action","/productczdbase!updatestep3tempsave.action");
			//$("#productczdcwxx2").submit();
			$("#productczdcwxx").attr("action","/productczdbase!updatestep3tempsave.action");
			$("#productczdcwxx").submit();
		});
		
		
	}
	$("#czdsteponesave").click(function(){
	//	返回上一步
		var id=$(this).attr("lang");
		location.href="/productczdbase/tostep2.html?e.id="+id+"&e.t="+t;
	});
});
</script>
<style>
.error {
    border: none;
    background:none;
    }
label.error {
    border: 1px solid #f5694b!important;
    background:none;
	color: #f5694b;
	padding: 0 2px;
	display:inline-block;
    }
</style>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../usercenter/leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			
			<!--培训活动   所有用户显示    -->
			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">复审第三步（共七步）：财务信息</span> </li></div>

				<form action="/productczdbase!updatestep3.action" id="productczdcwxx" name="czdsteptwo" method="post">
				<table id="ycacti" name="gdqk"  class="ycactifs pcwxx zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="7" class="tabletitle">财务情况（万元）</td>
 						<input type="hidden"  name="cwxx.thirdyear"  value="<s:property value='cwxx.thirdyear'/>">
 						<input type="hidden"  name="cwxx.releid"  value="<s:property value='cwxx.releid'/>">
 						<input type="hidden"  name="cwxx.cudate"  value="<s:property value='cwxx.cudate'/>">
						<input type="hidden"  name="e.id"  value="<s:property value='#request.id'/>">
						<input type="hidden"  name="e.t"  value="<s:property value='e.t'/>">
						<input type="hidden"  name="cwxx.id"  value="<s:property value='cwxx.id'/>">
 						<input type="hidden"  name="taskid"  value="${taskid }">
					</tr>
				
					<tr class="TT" >
					    <td rowspan="2" style="width: 140px;">项目</td>
					    <td colspan="3">前三年度</td>
					    <td colspan="3">同期对比（累计）</td>
			      	</tr>
					<tr class="TT"  lang="firsttr">
					   <td><s:property value="cwxx.thirdyear"/>年</td>
					   <td><s:property value="cwxx.thirdyear+1"/>年</td>
					   <td><s:property value="cwxx.thirdyear+2"/>年</td>
					   <td>本年上月</td>
					   <td>去年同期</td>
					   <td>%</td>
					</tr>
					<tr>
					   <td><ol>总资产</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstzongzichan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstzongzichan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondzongzichan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondzongzichan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdzongzichan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdzongzichan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cuzongzichan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cuzongzichan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastzongzichan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastzongzichan'/></s:else>"></td>
					   <td class="input" ><input class="bfb" type="text"  name="cwxx.changezongzichan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changezongzichan'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>总负债</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstzongfuzai"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstzongfuzai'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondzongfuzai"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondzongfuzai'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdzongfuzai"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdzongfuzai'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cuzongfuzai"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cuzongfuzai'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastzongfuzai"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastzongfuzai'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changezongfuzai"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changezongfuzai'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>所有者权益</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstsuoyouzequanyi"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstsuoyouzequanyi'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondsuoyouzequanyi"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondsuoyouzequanyi'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdsuoyouzequanyi"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdsuoyouzequanyi'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cusuoyouzequanyi"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cusuoyouzequanyi'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastsuoyouzequanyi"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastsuoyouzequanyi'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changesuoyouzequanyi"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changesuoyouzequanyi'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>其中：实收资本</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstshishouzhiben"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstshishouzhiben'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondshishouzhiben"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondshishouzhiben'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdshishouzhiben"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdshishouzhiben'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cushishouzhiben"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cushishouzhiben'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastshishouzhiben"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastshishouzhiben'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changeshishouzhiben"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changeshishouzhiben'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>银行借款</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstyinhangjiekuan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstyinhangjiekuan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondyinhangjiekuan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondyinhangjiekuan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdyinhangjiekuan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdyinhangjiekuan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cuyinhangjiekuan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cuyinhangjiekuan'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastyinhangjiekuan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastyinhangjiekuan'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changeyinhangjiekuan"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changeyinhangjiekuan'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>销售收入</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstxiaoshoushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstxiaoshoushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondxiaoshoushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondxiaoshoushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdxiaoshoushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdxiaoshoushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cuxiaoshoushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cuxiaoshoushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastxiaoshoushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastxiaoshoushouru'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changexiaoshoushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changexiaoshoushouru'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>其中：主营业务收入</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstzhuyinyewushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstzhuyinyewushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondzhuyinyewushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondzhuyinyewushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdzhuyinyewushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdzhuyinyewushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cuzhuyinyewushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cuzhuyinyewushouru'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastzhuyinyewushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastzhuyinyewushouru'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changezhuyinyewushouru"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changezhuyinyewushouru'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>利润总额</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstlirunzonge"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstlirunzonge'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondlirunzonge"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondlirunzonge'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdlirunzonge"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdlirunzonge'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.culirunzonge"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.culirunzonge'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastlirunzonge"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastlirunzonge'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changelirunzonge"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changelirunzonge'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>其中：净利润</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstjinglirun"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstjinglirun'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondjinglirun"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondjinglirun'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdjinglirun"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdjinglirun'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cujinglirun"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cujinglirun'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastjinglirun"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastjinglirun'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changejinglirun"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changejinglirun'/></s:else>"></td>
					</tr>
					<tr>
					   <td><ol>年度纳税总额（万元）</ol></td>
					   <td class="input" ><input type="text"  name="cwxx.firstniandunashui"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.firstniandunashui'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.secondniandunashui"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.secondniandunashui'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.thirdniandunashui"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.thirdniandunashui'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.cuniandunashui"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cuniandunashui'/></s:else>"></td>
					   <td class="input" ><input type="text"  name="cwxx.lastniandunashui"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.lastniandunashui'/></s:else>"></td>
					   <td class="input" ><input class="bfb"  type="text"  name="cwxx.changeniandunashui"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.changeniandunashui'/></s:else>"></td>
					</tr>
				</table>
				<script type="text/javascript">
				//13、	自动计算%，公式=（本年上月-去年同期）/去年同期
					var bfbs = $(".bfb");//百分比结果 
					bfbs.each(function(){
						$(this).focus(function(){
							var bnsy = $(this).parent().prev().prev().children("input").eq(0).val();
							var qntq = $(this).parent().prev().children("input").eq(0).val();
							var bfb = (bnsy-qntq)/qntq;
							var bfbval = bfb.toFixed(2);							
							$(this).val(bfbval);

						});
					});
				</script>
				
				
				
				 
				<table id="ycacti" name="gdqk"  class="ycactifs zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
				 	
				 	<tr class="shuoming"><td colspan="4">
					财务指标（请自行计算）	<br/>
				 	毛利率&nbsp;=&nbsp;	（主营业务收入-主营业务成本）/主营业务收入	<br/>
					流动比率&nbsp;=&nbsp;	流动资产/流动负债	<br/>
					速动比率&nbsp;=&nbsp;	（流动资产-存货）/流动负债	<br/>
					存货周转率&nbsp;=&nbsp;	销售（营业）成本/平均存货，其中：平均存货＝（年初存货+年末存货）/2 <br/>	
					应收账款周转率&nbsp;=&nbsp;应收帐款周转率=营业收入/平均应收帐款，其中：平均应收帐款（应收帐款年初数+应收帐款年末数）/2	<br/>
					资产负债率&nbsp;=&nbsp;负债总额/资产总额</td>
				 </tr>
				 <tr>
 						<td colspan="7" class="tabletitle">2018年度财务指标</td>
					</tr>
					<tr>
					   <td>毛利率(%)</td>
					   <td class="input" ><input type="text"  name="cwxx.maolilv"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.maolilv'/></s:else>" ></td>
					   <td>存货周转率<br/><span style="color:red;">（请填写小数）</span></td>
					   <td class="input" ><input type="text"  name="cwxx.cunhuozhouzhuanlv"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.cunhuozhouzhuanlv'/></s:else>" ></td>
					</tr>
					<tr>
					   <td>流动比率<br/><span style="color:red;">（请填写小数）</span></td>
					   <td class="input" ><input type="text"  name="cwxx.liudongbilv"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.liudongbilv'/></s:else>" ></td>
					   <td>应收账款周转率<br/><span style="color:red;">（请填写小数）</span></td>
					   <td class="input" ><input type="text"  name="cwxx.yingshouzhangkuanzhouzhuanlv"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.yingshouzhangkuanzhouzhuanlv'/></s:else>" ></td>
					</tr>
					<tr>
					   <td>速动比率<br/><span style="color:red;">（请填写小数）</span></td>
					   <td class="input" ><input type="text"  name="cwxx.sudongbilv"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.sudongbilv'/></s:else>" ></td>
					   <td>资产负债率(%)</td>
					   <td class="input" ><input type="text"  name="cwxx.zichanfuzhailv"  value="<s:if test="cwxx.id == null"></s:if><s:else><s:property value='cwxx.zichanfuzhailv'/></s:else>" ></td>
					</tr>  	 
					<tr> 
						 <td>审计报表的会计师事务所：</td>
						 <td class="input" colspan="3">
							 <input type="text"  name="cwxx.shiwusuo"  value="<s:property value='cwxx.shiwusuo'/>" >
						</td>
					</tr>
					<tr class="tijiao">
						<td colspan="4"><input type="button"  id="czdsteponesave"  lang="<s:property value="id"/>"  name="czdsteponesave"  value="上一步">&nbsp;&nbsp;&nbsp;<input type="submit"  id="czdsteponesbt_zc"  lang="<s:property value="id"/>"   name="czdsteponesbt" value="暂存">&nbsp;&nbsp;&nbsp;<input type="submit"  id="czdsteponesbt"  lang="<s:property value="id"/>"   name="czdsteponesbt" value="下一步"><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span></td>
					</tr>
					
				</table>
			
				
				</form>
			 
			</div>
			</div>
			</div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("debtsinfo");
 </script>
 <script type="text/javascript">
 function changeNum(num) {
 	return num == "" ? "" : num.toFixed(2);
 }
 if ('${cwxx.id}' == "") {
 	$.ajax({
		type: 'post',
		url: "/usercenter/getFina.html",
		dataType:"json",
		success: function(data){
			var year = parseInt('${cwxx.thirdyear}');
			for (var i = 0; i < data.length; i ++ ) {
				var fina = data[i];
				var y = fina.report_time.substring(0, 4);
				if (y == year) {
					$("input[name='cwxx.firstzongzichan']").val(fina.assets);
					$("input[name='cwxx.firstzongfuzai']").val(fina.liabilities);
					$("input[name='cwxx.firstsuoyouzequanyi']").val(fina.owner_equity);
					$("input[name='cwxx.firstshishouzhiben']").val(fina.paicl_up);
					$("input[name='cwxx.firstyinhangjiekuan']").val(fina.bank_borrowings);
					$("input[name='cwxx.firstxiaoshoushouru']").val(fina.income);
					$("input[name='cwxx.firstzhuyinyewushouru']").val(fina.main_income);
					$("input[name='cwxx.firstlirunzonge']").val(fina.total_profit);
					$("input[name='cwxx.firstjinglirun']").val(fina.net_margin);
					$("input[name='cwxx.firstniandunashui']").val(fina.taxamt);
				} else if (y == (year + 1)) {
					$("input[name='cwxx.secondzongzichan']").val(fina.assets);
					$("input[name='cwxx.secondzongfuzai']").val(fina.liabilities);
					$("input[name='cwxx.secondsuoyouzequanyi']").val(fina.owner_equity);
					$("input[name='cwxx.secondshishouzhiben']").val(fina.paicl_up);
					$("input[name='cwxx.secondyinhangjiekuan']").val(fina.bank_borrowings);
					$("input[name='cwxx.secondxiaoshoushouru']").val(fina.income);
					$("input[name='cwxx.secondzhuyinyewushouru']").val(fina.main_income);
					$("input[name='cwxx.secondlirunzonge']").val(fina.total_profit);
					$("input[name='cwxx.secondjinglirun']").val(fina.net_margin);
					$("input[name='cwxx.secondniandunashui']").val(fina.taxamt);
				} else if (y == (year + 2)) {
					$("input[name='cwxx.thirdzongzichan']").val(fina.assets);
					$("input[name='cwxx.thirdzongfuzai']").val(fina.liabilities);
					$("input[name='cwxx.thirdsuoyouzequanyi']").val(fina.owner_equity);
					$("input[name='cwxx.thirdshishouzhiben']").val(fina.paicl_up);
					$("input[name='cwxx.thirdyinhangjiekuan']").val(fina.bank_borrowings);
					$("input[name='cwxx.thirdxiaoshoushouru']").val(fina.income);
					$("input[name='cwxx.thirdzhuyinyewushouru']").val(fina.main_income);
					$("input[name='cwxx.thirdlirunzonge']").val(fina.total_profit);
					$("input[name='cwxx.thirdjinglirun']").val(fina.net_margin);
					$("input[name='cwxx.thirdniandunashui']").val(fina.taxamt);
					
					/* $("input[name='cwxx.maolilv']").val(changeNum(fina.margin_rate));
					$("input[name='cwxx.cunhuozhouzhuanlv']").val(changeNum(fina.goods_rate));
					$("input[name='cwxx.liudongbilv']").val(changeNum(fina.total_rate));
					$("input[name='cwxx.yingshouzhangkuanzhouzhuanlv']").val(changeNum(fina.income_rate));
					$("input[name='cwxx.sudongbilv']").val(changeNum(fina.speed_rate));
					$("input[name='cwxx.zichanfuzhailv']").val(changeNum(fina.assets_rate)); */
				}
			}
		}
	});
 }
 </script>
</body>
</html>
 