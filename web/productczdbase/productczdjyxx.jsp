<%@ page contentType="text/html; charset=UTF-8"%>
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
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/productczdjyxx.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="e.t"/>">
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	if(t=='v'){
		$("#productczdjyxx input,radio,select,textarea,checkbox").attr('disabled',true).parent().addClass("nohover");
		$("#czdsteponesbt").attr("disabled",false);
		$("#czdsteponesave").attr("disabled",false);
		var id = $("#czdsteponesbt").attr("lang");
		$("#productczdjyxx").attr("action","/productczdbase/tostep5.html?e.id="+id+"&e.t="+t);
		/* $("#czdsteponesbt").click(function(){
			var id=$(this).attr("lang");
			//点击下一步 链接是第四步
			location.href="/productczdbase/tostep5.html?id="+id+"&e.t="+t;
		}); */
		$(".nextnotice").hide();
	}else{
		productczdjyxx();
	}
	$("#czdsteponesave").click(function(){
	//	返回上一步
		var id=$(this).attr("lang");
		location.href="/productczdbase/tostep3.html?id="+id+"&e.t="+t;
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
    .ycactifs tr td input {width:94px;}
    .ycactifsbz tr td input {width:250px;}
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
				<div class="title"><li><span class="t">复审第四步（共七步）：经营信息</span><a href="/usercenter/toAppProductappinfo.html"><%-- <span id="CreateTBpxhd" class="update">债权融资申请</span> --%></a></li></div>
				<form action="/productczdbase!updatestep4.action?e.id=${e.id}&e.t=${e.t}&taskid=${taskid}" id="productczdjyxx" name="czdsteptwo" method="post">
				<p class="ptitle"><span  class="trleft" >企业主要产品</span><span class="trright" >计量单位：万元</span></p>
				<table id="ycacti" name="gdqk"  class="ycactifs gdqkinputs1 zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT"  lang="firsttr">
 						<td  >主要产品</td>
 						<td >主要销售市场</td>
						<td  >技术先进性</td>
						<td  >国内市场占有率(%)</td>
						<td  >四川市场占有率(%)</td>
						<td  >上年销售额(万元)</td>
						<td  >占收入比例(%)</td>
					</tr>
					
					<s:iterator value="cpxxList" status="index">
					<tr class="trorder">
 						<td class="input"  ><input type="text"  name="zhuyaochanpin<s:property value="#index.index"/>"  value="<s:property value='zhuyaochanpin'/>" class="iname"></td>
 						<td class="input"  ><input type="text"  name="zhuyaoxiaoshoushichang<s:property value="#index.index"/>"  value="<s:property value='zhuyaoxiaoshoushichang'/>"  class="iname"></td>
						<td class="input"  >
							<input  class="rad isname"   type="radio" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa230".equals(request.getAttribute("jishuxianjinxing"))) { out.print("checked=checked");} %> value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa230"  name="jishuxianjinxing<s:property value="#index.index"/>">a 国际领先
							<input  class="rad"   type="radio" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa231".equals(request.getAttribute("jishuxianjinxing"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa231"  name="jishuxianjinxing<s:property value="#index.index"/>">b 国际先进
							<input  class="rad"   type="radio" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa232".equals(request.getAttribute("jishuxianjinxing"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa232"  name="jishuxianjinxing<s:property value="#index.index"/>">c 国内领先
							<input  class="rad"   type="radio" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa233".equals(request.getAttribute("jishuxianjinxing"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa233"  name="jishuxianjinxing<s:property value="#index.index"/>">d 国内先进
						</td>
						<td class="input"  ><input type="text"  name="guoneishichagnzhanyoulv<s:property value="#index.index"/>"  value="<s:property value='guoneishichagnzhanyoulv'/>"></td>
						<td class="input"  ><input type="text"  name="sichuanshichagnzhanyoulv<s:property value="#index.index"/>"  value="<s:property value='sichuanshichagnzhanyoulv'/>"></td>
						<td class="input"  ><input type="text"  name="shangnianduxiaoshoue<s:property value="#index.index"/>"  value="<s:property value='shangnianduxiaoshoue'/>"  class="inumber"></td>
						<td class="input"  ><input type="text"  name="zhanshourubili<s:property value="#index.index"/>"  value="<s:property value='zhanshourubili'/>" class="inumber"></td>
					</tr>
					</s:iterator>
					
					
					<tr >
						<td colspan="7"><input type="button"  id="gbdel"   name="gbdel"  value="删除"><input type="button"  id="gbadd"  name="gbadd"  value="增加"></td>
					</tr>
			
				</table>
				
				<p class="ptitle ptitle2"><span  class="trleft" >上一年度主要供应商、销售商</span></p>
				<table id="ycacti"  name="bzgc"  class="ycactifs gdqkinputs2 ycactifsbz zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="3" class="tabletitle">供应商</td>
					</tr>
					
					<tr>
 						<td colspan="3"  class="input trleft">
 						<span>市场集中区域：</span>
 						<input  class="rad"   type="radio" name="shichangquyu0"  <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa240".equals(request.getAttribute("shichangquyu0")) || request.getAttribute("shichangquyu0") == null) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa240"  >本地
 						<input  class="rad"   type="radio" name="shichangquyu0"  <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa241".equals(request.getAttribute("shichangquyu0"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa241"  >国内
 						<input  class="rad"   type="radio" name="shichangquyu0"  <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa242".equals(request.getAttribute("shichangquyu0"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa242"  >国外
 						</td>
					</tr>
					<tr lang="firsttr" class="TT">
 						<td  >公司名称</td>
 						<td  >商品名称</td>
						<td  >供应额(万元)</td>
					</tr>
					<s:iterator value="#request.gysList" status="index">
					<tr class="trorder">
 						<td  class="input"   ><input type="text"  class="iname"  name="gongshingmingcheng<s:property value="#index.index"/>"  value="<s:property value='gongshingmingcheng'/>"></td>
 						<td  class="input"   ><input type="text" class="iname"   name="shagnminmingcheng<s:property value="#index.index"/>"  value="<s:property value='shagnminmingcheng'/>"></td>
						<td  class="input"   ><input type="text" class="inumber"   name="jine<s:property value="#index.index"/>"  value="<s:property value='jine'/>"></td>
						<input type="hidden" value="gys" name="custype<s:property value="#index.index"/>" />  
					</tr>
					</s:iterator>
					
					<tr >
						<td colspan="3"><input type="button"  id="gbdel2"  class="gbdel2"    name="gbdel2"  value="删除"><input type="button"  id="gbadd2"  class="gbadd2"   name="gbadd2"  value="增加"></td>
					</tr>
			
				</table>
				
				<table id="ycacti"  name="bzgc"  class="ycactifs gdqkinputs3 ycactifsbz zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="3" class="tabletitle">主要客户</td>
					</tr>
					<tr>
 						<td colspan="3"  class="input trleft">
 						<span>市场集中区域：</span>
 						<input  class="rad"   type="radio" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa240".equals(request.getAttribute("shichangquyu1"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa240"  name="shichangquyu1">本地
 						<input  class="rad"   type="radio" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa241".equals(request.getAttribute("shichangquyu1"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa241"  name="shichangquyu1">国内
 						<input  class="rad"   type="radio" <%if ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa242".equals(request.getAttribute("shichangquyu1"))) { out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa242"  name="shichangquyu1">国外
 						</td>
					</tr>
					<tr lang="firsttr" class="TT">
 						<td  >公司名称</td>
 						<td  >商品名称</td>
						<td  >供应额(万元)</td>
					</tr>
					
					<s:iterator value="#request.xssList" status="index">
					<tr class="trorder">
 						<td  class="input"   ><input type="text" class="iname"   name="x_gongshingmingcheng<s:property value="#index.index"/>"  value="<s:property value='gongshingmingcheng'/>"></td>
 						<td  class="input"   ><input type="text" class="iname"   name="x_shagnminmingcheng<s:property value="#index.index"/>"  value="<s:property value='shagnminmingcheng'/>"></td>
						<td  class="input"   ><input type="text" class="inumber"   name="x_jine<s:property value="#index.index"/>"  value="<s:property value='jine'/>"></td>
						 <input type="hidden" value="xss" name="x_custype<s:property value="#index.index"/>" />  
						
					</tr>
					</s:iterator>
					
					<tr >
						<td colspan="3"><input type="button"  id="gbdel3"  class="gbdel3"   name="gbdel3"  value="删除"><input type="button"  id="gbadd3"  class="gbadd3"  name="gbadd3"  value="增加"></td>
					</tr>
					
					<tr class="tijiao">
						<td colspan="3"><input type="button"  id="czdsteponesave"  lang="<s:property value="id"/>"  name="czdsteponesave"  value="上一步">&nbsp;&nbsp;&nbsp;<input type="submit"  id="czdsteponesbt"  lang="<s:property value="id"/>"   name="czdsteponesbt" value="下一步"><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span></td>
					</tr>
			
				</table>
				
				</form>
			 
			 
			 			
			 
				<script type="text/javascript">
				
				$(window).load(function(){
					jQuery.validator.addMethod("isNum", function(value, element) {       
					    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
					    return this.optional(element) || (num.test(value));       
					}, "请正确填写数字");

					$(".gdqkinputs3").children().find("tr").eq(3).attr("lang","firsttr");
					var gdqkinputs_iname = $(".gdqkinputs1 input[class=iname]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,maxlength:18, messages: {required:"请输入",maxlength:"18字符以内"} })
					});
					var gdqkinputs_iname = $(".gdqkinputs1 input[class=rad isname]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true, messages: {required:"请选择"} })
					});
					var gdqkinputs_iname = $(".gdqkinputs1 input[class=inumber]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,isNum :true, maxlength:18,messages: {required :"请输入",isNum:"请填写数字",maxlength:"18字符以内"} })
					});
					
					var gdqkinputs_iname = $(".gdqkinputs3 input[class=iname]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,maxlength:64, messages: {required:"请输入",maxlength:"64字符以内"} })
					});
					var gdqkinputs_iname = $(".gdqkinputs3 input[class=inumber]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,isNum :true, maxlength:18,messages: {required :"请输入",isNum:"请填写数字",maxlength:"18字符以内"} })
					});
							
					
				});
				
				
				
				
				jQuery.validator.addMethod("isNum", function(value, element) {       
				    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
				    return this.optional(element) || (num.test(value));       
				}, "请正确填写数字");
					//企业主要产品增加和删除
					$("#gbadd").click(function(){
						//先查询前面有几个装变化数据的tr
						
						var curtabdatatr_num = $(this).parent().parent().parent().children(".trorder").length;
						var tr =$("<tr class='trorder'><td class='input'  ><input type='text'  value='' class='iname'  name='zhuyaochanpin"+curtabdatatr_num+"'></td><td class='input'  ><input type='text'  value=''  class='iname'  name='zhuyaoxiaoshoushichang"+curtabdatatr_num+"'></td><td class='input'><input  class='rad isname'   type='radio'  value='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa230'   name='jishuxianjinxing"+curtabdatatr_num+"' >a 国际领先<input  class='rad'   type='radio'  value='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa231' name='jishuxianjinxing"+curtabdatatr_num+"'>b 国内领先<input  class='rad'   type='radio'  value='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa232'  name='jishuxianjinxing"+curtabdatatr_num+"'>c 国际先进<input  class='rad'   type='radio'  value='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa233'  name='jishuxianjinxing"+curtabdatatr_num+"'>d 国内先进</td><td class='input' ><input type='text' class='inumber'  value=''   name='guoneishichagnzhanyoulv"+curtabdatatr_num+"'></td><td class='input' ><input type='text' class='inumber'  value=''  name='sichuanshichagnzhanyoulv"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value='' class='inumber'   name='shangnianduxiaoshoue"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value='' class='inumber'   name='zhanshourubili"+curtabdatatr_num+"'></td></tr>");
						tr.insertBefore($(this).parent().parent());
						
						var gdqkinputs_iname = $(".gdqkinputs1 input[class=iname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,maxlength:18, messages: {required:"请输入",maxlength:"18字符以内"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs1 input[class=rad isname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true, messages: {required:"请选择"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs1 input[class=inumber]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isNum :true, maxlength:18,messages: {required :"请输入",isNum:"请填写数字",maxlength:"18字符以内"} })
						});
						
						var gdqkinputs_iname = $(".gdqkinputs3 input[class=iname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,maxlength:64, messages: {required:"请输入",maxlength:"64字符以内"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs3 input[class=inumber]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isNum :true, maxlength:18,messages: {required :"请输入",isNum:"请填写数字",maxlength:"18字符以内"} })
						});
												
						
					});
					$("#gbdel").click(function(){
						var prev = $(this).parent().parent().prev();
						var firsttr = prev.attr("lang");
						if(firsttr!="firsttr"){
							prev.remove();
						}
						
					});
					
					//供应商、销售商增加和删除
					$("#gbadd2").click(function(){
						//先查询前面有几个装变化数据的tr
						var curtabdatatr_num = $(this).parent().parent().parent().children(".trorder").length;
						
						var tr =$("<tr class='trorder'><td class='input'  ><input type='text'  value='' class='iname'  name='gongshingmingcheng"+curtabdatatr_num+"'></td><td class='input'  ><input type='text'  value='' class='iname'  name='shagnminmingcheng"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value='' class='inumber'  name='jine"+curtabdatatr_num+"'></td><input type='hidden' value='gys'  name='custype"+curtabdatatr_num+"' /></tr>");
						tr.insertBefore($(this).parent().parent());
						
						var gdqkinputs_iname = $(".gdqkinputs2 input[class=iname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,maxlength:18, messages: {required:"请输入",maxlength:"18字符以内"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs2 input[class=inumber]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {isNum :true, maxlength:18,messages: {isNum:"请填写数字",maxlength:"18字符以内"} })
						});
						
					});
					$("#gbdel2").click(function(){
						var prev = $(this).parent().parent().prev();
						var firsttr = prev.attr("lang");
						if(firsttr!="firsttr"){
							prev.remove();
						}
						
					});
					
					//供应商、销售商增加和删除
					$("#gbadd3").click(function(){
						//先查询前面有几个装变化数据的tr
						var curtabdatatr_num = $(this).parent().parent().parent().children(".trorder").length;
						
						var tr =$("<tr class='trorder'><td class='input'  ><input type='text'  value='' class='iname'  name='x_gongshingmingcheng"+curtabdatatr_num+"'></td><td class='input'  ><input type='text'  value='' class='iname'  name='x_shagnminmingcheng"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value='' class='inumber'  name='x_jine"+curtabdatatr_num+"'></td><input type='hidden' value='xss' name='x_custype"+curtabdatatr_num+"' /></tr>");
						tr.insertBefore($(this).parent().parent());
						
						var gdqkinputs_iname = $(".gdqkinputs3 input[class=iname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,maxlength:64, messages: {required:"请输入",maxlength:"64字符以内"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs3 input[class=inumber]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isNum :true, maxlength:18,messages: {required :"请输入",isNum:"请填写数字",maxlength:"18字符以内"} })
						});
						
					});
					$("#gbdel3").click(function(){
						var prev = $(this).parent().parent().prev();
						var firsttr = prev.attr("lang");
						if(firsttr!="firsttr"){
							prev.remove();
						}
						
					});
					
			 	</script>
			</div>
			</div>
			</div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("debtsinfo");
 </script>
</body>
</html>
 