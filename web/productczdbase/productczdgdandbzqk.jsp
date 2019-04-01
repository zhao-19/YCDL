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
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/productczdgdandbzqk.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
</head>
<body>
<!-- v有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="e.t"/>">
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	//alert(t);
	if(t=='v'){
		$("#productczdgdandbzqk input,radio,select,textarea,checkbox").attr('disabled',true).parent().addClass("nohover");
		$("#czdsteponesbt").attr("disabled",false);
		$("#czdsteponesave").attr("disabled",false);
		var id = $("#czdsteponesbt").attr("lang");
		$("#productczdgdandbzqk").attr("action","/productczdbase/tostep3.html?e.id="+id+"&e.t="+t);
		/* $("#czdsteponesbt").click(function(){
			var id=$(this).attr("lang");
			location.href="/productczdbase/tostep3.html?e.id="+id+"&e.t="+t;
			return;
		}); */
		$(".nextnotice").hide();
	}else{
		productczdgdandbzqk();
	}
	$("#czdsteponesave").click(function(){
		var id=$(this).attr("lang");
		location.href="/productczdbase/tostep1.html?e.id="+id+"&e.t="+t;
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
    
    .ycactifs tr td input {width:250px;}
    .ycactifsbz tr td input {width:145px;}
</style>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../usercenter/leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			
			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">复审第二步（共七步）：股东情况和班子情况</span> </li></div>

				<form action="/productczdbase!updatestep2.action?e.id=${e.id}&e.t=${e.t}&taskid=${taskid}"  id="productczdgdandbzqk" name="productczdgdandbzqk" method="post">
				<table id="ycacti" name="gdqk"  class="ycactifs gdqkinputs zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="4" class="tabletitle">股东情况</td>
					</tr>
					<tr class="TT"  lang="firsttr">
 						<td  >股东名称</td>
 						<td >出资金额(万元)</td>
						<td  >占比（%）</td>
					</tr>
					<s:iterator value="#request.gdqkList" status="index">
					<tr class="trorder">
 						<td class="input"  ><input type="text" class="iname"  name="gdqqList[<s:property value="#index.index"/>].gudongmingcheng"  value="<s:property value='gudongmingcheng'/>"><input type="hidden" name="gdqqList[<s:property value="#index.index"/>].id" value="<s:property value="id"/>"><input type="hidden" name="gdqqList[<s:property value="#index.index"/>].releid" value="<s:property value="releid"/>"></td>
 						<td class="input"  ><input type="text" class="inumber"  name="gdqqList[<s:property value="#index.index"/>].chuzijine"  value="<s:property value='chuzijine'/>"></td>
						<td class="input"  ><input type="text" class="inumber" name="gdqqList[<s:property value="#index.index"/>].zhanbi"  value="<s:property value='zhanbi'/>"></td>
					</tr>
					</s:iterator>
					<tr >
						<td colspan="4"><input type="button"  id="gbdel"   name="gbdel"  value="删除"><input type="button"  id="gbadd"  name="gbadd"  value="增加"></td>
					</tr>
			
				</table>
				
				
				<table id="ycacti"  name="bzgc"  class="ycactifs ycactifsbz zqrztable"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="5" class="tabletitle">经营班子构成</td>
					</tr>
					<tr class="TT" lang="firsttr">
 						<td  >职务</td>
 						<td  >姓名</td>
 						<td >年龄</td>
						<td  >学历</td>
						<td  >职称</td>
					</tr>
					
					<s:iterator value="#request.bzqkList" status="index">
						<tr>
							<td  ><input type="text"  name="bzqkList[<s:property value="#index.index"/>].zhiwu"  value="<s:property value='zhiwu'/>" readonly="readonly" style="background: none;"><input type="hidden" name="bzqkList[<s:property value="#index.index"/>].id" value="<s:property value='id'/>"><input type="hidden" name="bzqkList[<s:property value="#index.index"/>].releid" value="<s:property value='releid'/>"></td>
							<td  ><input type="text"  name="bzqkList[<s:property value="#index.index"/>].xingming"  value="<s:property value='xingming'/>"></td>
							<td  ><input type="text"  name="bzqkList[<s:property value="#index.index"/>].nianling"  value="<s:property value='nianling'/>"></td>
							<td  ><input type="text"  name="bzqkList[<s:property value="#index.index"/>].xueli"  value="<s:property value='xueli'/>"></td>
							<td  ><input type="text"  name="bzqkList[<s:property value="#index.index"/>].zhicheng"  value="<s:property value='zhicheng'/>"></td>
						</tr>
					</s:iterator>
					
					 
					
					<!-- <tr >
						<td colspan="5"><input type="button"  id="gbdel2"   name="gbdel2"  value="删除"><input type="button"  id="gbadd2"  name="gbadd"  value="增加"></td>
					</tr> -->
					
					<tr class="tijiao">
						<td colspan="5"><input type="button"  id="czdsteponesave"  lang="<s:property value="e.id"/>"  name="czdsteponesave"  value="上一步">&nbsp;&nbsp;&nbsp;<input type="submit"  id="czdsteponesbt"     name="czdsteponesbt" value="下一步"  lang="<s:property value="e.id"/>"><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span></td>
					</tr>
			
				</table>
				
				</form>
			 
				<script type="text/javascript">
				$(window).load(function(){
					jQuery.validator.addMethod("isNum", function(value, element) {       
					    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
					    return this.optional(element) || (num.test(value));       
					}, "请正确填写数字");
					var gdqkinputs_iname = $(".gdqkinputs input[class=iname]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true, messages: {required:"请输入"} })
					});
					var gdqkinputs_iname = $(".gdqkinputs input[class=inumber]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,isNum :true, messages: {required :"请输入",isNum:"请填写数字"} })
					});
				});
				jQuery.validator.addMethod("isNum", function(value, element) {       
				    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
				    return this.optional(element) || (num.test(value));       
				}, "请正确填写数字");
					//股东情况增加和删除
					$("#gbadd").click(function(){
						//先查询前面有几个装变化数据的tr
						var curtabdatatr_num = $(this).parent().parent().parent().children(".trorder").length;
						
						var tr =$("<tr class='trorder' id='trorer"+curtabdatatr_num+"'><td class='input'  ><input class='iname' type='text'  value=''  name='gdqqList["+curtabdatatr_num+"].gudongmingcheng'></td><td class='input'  ><input class='inumber'  type='text'  value=''  name='gdqqList["+curtabdatatr_num+"].chuzijine'></td><td class='input' ><input  class='inumber'   type='text'  value=''  name='gdqqList["+curtabdatatr_num+"].zhanbi'></td></tr>");
						tr.insertBefore($(this).parent().parent());
						//$("#trorer"+curtabdatatr_num).children().children("input").attr("name","111");
						var gdqkinputs_iname = $(".gdqkinputs input[class=iname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true, messages: {required:"请输入"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs input[class=inumber]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isNum :true, messages: {required :"请输入",isNum:"请填写数字"} })
						});
					});
					$("#gbdel").click(function(){
						var prev = $(this).parent().parent().prev();
						var firsttr = prev.attr("lang");
						if(firsttr!="firsttr"){
							prev.remove();
						}
						
					});
					
					//班子情况增加和删除
					$("#gbadd2").click(function(){
						//先查询前面有几个装变化数据的tr
						var curtabdatatr_num = $(this).parent().parent().parent().children(".trorder").length;
						var tr =$("<tr class='trorder'><td class='input'  ><input type='text'  value=''  name='xingming"+curtabdatatr_num+"'></td><td class='input'  ><input type='text'  value=''  name='zhiwu"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value=''  name='nianling"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value=''  name='xueli"+curtabdatatr_num+"'></td><td class='input' ><input type='text'  value=''  name='zhicheng"+curtabdatatr_num+"'></td></tr>");
						tr.insertBefore($(this).parent().parent());
					});
					$("#gbdel2").click(function(){
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
 