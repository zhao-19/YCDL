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
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/productczddwdbqk.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>	
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
</head>
<body>
<!-- t有值代表是查看 -->
<input type="hidden" id="t" value="<s:property value="e.t"/>">
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#t").val();
	if(t=='v'){
		$("#productczddwdbqk input,radio,select,textarea,checkbox").attr('disabled',true).parent().addClass("nohover");
		$("#czdsteponesbt").attr("disabled",false);
		$("#czdsteponesave").attr("disabled",false);
		var id = $("#czdsteponesbt").attr("lang");
		$("#productczddwdbqk").attr("action","/productczdbase/tostep7.html?e.id="+id+"&e.t="+t);
		/* $("#czdsteponesbt").click(function(){
			var id=$(this).attr("lang");
			//点击下一步 链接是第六步
			location.href="/productczdbase/tostep7.html?id="+id+"&e.t="+t;
		}); */
		$(".nextnotice").hide();
	}else{
		productczddwdbqk();
	}
	$("#czdsteponesave").click(function(){
	//	返回上一步
		var id=$(this).attr("lang");
		location.href="/productczdbase/tostep5.html?id="+id+"&e.t="+t;
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
     .ycactifs tr td input {width:145px;}
</style>
<!-- 网站头部 -->
<div class="nav widthbox">
    <div class="logo fl"><img src="../image/index/logo.jpg" alt="logo"></div>
    <div class="nav_right fr">
    
    <%@ include file="../userinfo.jsp"%>

    <%@ include file="../menu.jsp"%>
    </div>
</div>





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
				<div class="title"><li><span class="t">复审第六步（共七步）：本次申请贷款 拟提供的反担保</span> </li></div>

				<form action="/productczdbase!updatestep6.action?e.id=<s:property value='e.id'/>&e.t=<s:property value='e.t'/> " id="productczddwdbqk" name="czdsteptwo" method="post">
 				<table id="ycacti"  name="bzgc"  class="ycactifs gdqkinputs"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="5" >企业目前对外担保情况</td>
					</tr>
					<tr lang="firsttr" class="TT">
 						<td  >被担保人</td>
 						<td  >担保余额</td>
						<td  >担保方式</td>
						<td  >担保起始日期</td>
						<td  >到期日期</td>
					</tr>
					<s:iterator value="#request.dwdbqkList" status="index">
					
						<tr class="trorder">
	 						<td  class="input"   ><input type="text" class="iname"  name="beidanbaoren<s:property value="#index.index"/>"  value="<s:property value='beidanbaoren'/>"></td>
	 						<td  class="input"   ><input type="text" class="inumber"   name="danbaoyue<s:property value="#index.index"/>"  value="<s:property value='danbaoyue'/>"></td>
							<td  class="input"   ><input type="text" class="iname"   name="danbaofangshi<s:property value="#index.index"/>"  value="<s:property value='danbaofangshi'/>"></td>
							<td  class="input"   ><input type="text" id="kaishiriqi<s:property value="#index.index"/>" class="laydate-icon idate"  name="kaishiriqi<s:property value="#index.index"/>"  value="<s:property value='kaishiriqi'/>"></td>
							<td  class="input"   ><input type="text" id="daoqiriqi<s:property value="#index.index"/>" class="laydate-icon idate"   name="daoqiriqi<s:property value="#index.index"/>"  value="<s:property value='daoqiriqi'/>"></td>
						</tr>
					</s:iterator>
					
					<tr >
						<td colspan="5"><input type="button"  id="gbdel"  class="gbdel"    name="gbdel"  value="删除"><input type="button"  id="gbadd"  class="gbadd"   name="gbadd"  value="增加"></td>
					</tr>
			
				</table>
				
				<table id="ycacti"  name="bzgc"  class="ycactifs"  align="center" border="0" cellpadding="0" cellspacing="1">
					<tr>
 						<td colspan="5" >本次贷款的反担保措施</td> <input type="hidden" name="fdbcs.id" value="<s:property value='fdbcs.id'/>" />  
					</tr>
					<tr lang="firsttr" class="TT">
 						<td  >保证担保</td>
 						<td  >质押担保</td>
						<td  >抵押担保</td>
						<td  style="width:165px;">其它担保</td>
					</tr>
					
					<tr>
 						<td  class="input"   >
 						
	 						<select class="dbselect"  name="fdbcs.baozhegndanbao">
	 							<option <%if ("企业法人提供个人无限连带责任担保".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getBaozhegndanbao())) { out.print("selected=selected");}  %> name="企业法人提供个人无限连带责任担保" >企业法人提供个人无限连带责任担保</option>
	 							<option  <% if ("实际控制人提供个人无限连带责任担保".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getBaozhegndanbao())) { out.print("selected=selected");} %> name="实际控制人提供个人无限连带责任担保" >实际控制人提供个人无限连带责任担保</option>
	 						</select>
 						</td>
 						<td  class="input"   >
	 						<select class="dbselect" name="fdbcs.zhiyadanbao">
	 							<option <% if ("提供专利等知识产权质押".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getZhiyadanbao())) { out.print("selected=selected");} %> name="提供专利等知识产权质押" value="提供专利等知识产权质押">提供专利等知识产权质押</option>
	 							<option <% if ("股东的股权质押".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getZhiyadanbao())) { out.print("selected=selected");} %> name="股东的股权质押" value="股东的股权质押">股东的股权质押</option>
	 							<option <% if ("应收账款质押".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getZhiyadanbao())) { out.print("selected=selected");} %> name="应收账款质押" value="应收账款质押">应收账款质押</option>
	 							<option <% if ("无".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getZhiyadanbao())) { out.print("selected=selected");} %> name="无" value="无">无</option>
	 						</select>
 						</td>
 						<td  class="input"   >
	 						<select class="dbselect" name="fdbcs.diyadanbao">
	 							<option <%  if ("公司或个人的房产抵押".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getDiyadanbao())) { out.print("selected=selected");}  %> name="公司或个人的房产抵押">公司或个人的房产抵押</option>
	 							<option <% if ("公司或个人的土地抵押".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getDiyadanbao())) { out.print("selected=selected");}  %> name="公司或个人的土地抵押">公司或个人的土地抵押</option>
	 							<option <% if ("无".equals(((com.winpow.services.manage.productczdfdbcs.bean.Productczdfdbcs) request.getAttribute("fdbcs")).getDiyadanbao())) { out.print("selected=selected");}  %> name="无">无</option>
	 						</select>
 						</td>
 						
 						<td  class="input"   ><textarea name="fdbcs.qitadanbao"><s:property value='fdbcs.qitadanbao'/></textarea></td>
					</tr>
					<!-- <tr >
						<td colspan="4"><input type="button"  id="gbdel2"  class="gbdel2"   name="gbdel2"  value="删除"><input type="button"  id="gbadd2"  class="gbadd2"  name="gbadd"  value="增加"></td>
					</tr> -->
					
					<tr class="tijiao">
						<td colspan="4"><input type="button"  id="czdsteponesave" lang="<s:property value="id"/>"    name="czdsteponesave"  value="上一步">&nbsp;&nbsp;&nbsp;<input type="submit"  id="czdsteponesbt" lang="<s:property value="id"/>"     name="czdsteponesbt" value="下一步"><span class="nextnotice">&nbsp;&nbsp;(注：点击下一步会保存当前这一步的数据)</span></td>
					</tr>
			
			
			
				</table>
				
				</form>
			 
			 
			 			
			 
				<script type="text/javascript">
				//日期控件
				!function(){
					laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
					laydate({elem: '#kaishiriqi0'});//绑定元素
					laydate({elem: '#kaishiriqi0'});//绑定元素
					laydate({elem: '#kaishiriqi1'});//绑定元素
					laydate({elem: '#kaishiriqi1'});//绑定元素
					//laydate({elem: '#fksj'});//绑定元素
					//laydate({elem: '#dqsj'});//绑定元素
				}();

				//日期范围限制
				var start = {
				    elem: '#start',
				    format: 'YYYY-MM-DD',
				    min: laydate.now(), //设定最小日期为当前日期
				    max: '2099-06-16', //最大日期
				    istime: true,
				    istoday: false,
				    choose: function(datas){
				         end.min = datas; //开始日选好后，重置结束日的最小日期
				         end.start = datas //将结束日的初始值设定为开始日
				    }
				};

				var end = {
				    elem: '#end',
				    format: 'YYYY-MM-DD',
				    min: laydate.now(),
				    max: '2099-06-16',
				    istime: true,
				    istoday: false,
				    choose: function(datas){
				        start.max = datas; //结束日选好后，充值开始日的最大日期
				    }
				};
				laydate(start);
				laydate(end);

				//自定义日期格式
				laydate({
				    elem: '#test1',
				    format: 'YYYY年MM月DD日',
				    festival: true, //显示节日
				    choose: function(datas){ //选择日期完毕的回调
				        alert('得到：'+datas);
				    }
				});

				//日期范围限定在昨天到明天
				laydate({
				    elem: '#hello3',
				    min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
				    max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
				});
								
				
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
					var gdqkinputs_iname = $(".gdqkinputs input[class=laydate-icon idate]");
					gdqkinputs_iname.each(function(){
						$(this).rules("add", {required :true,isDate :true, messages: {required :"请输入",isDate:"请正确输入"} })
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
						
						var tr =$("<tr class='trorder'><td class='input'  ><input type='text'  value='' class='iname'  name='beidanbaoren"+curtabdatatr_num+"'></td><td class='input'  ><input class='inumber' type='text'  value=''  name='danbaoyue"+curtabdatatr_num+"'></td><td class='input' ><input class='iname' type='text'  value=''  name='danbaofangshi"+curtabdatatr_num+"'></td><td class='input' ><input id='kaishiriqi"+curtabdatatr_num+"' class='laydate-icon idate' type='text'  value=''  name='kaishiriqi"+curtabdatatr_num+"'></td><td class='input' ><input id='daoqiriqi"+curtabdatatr_num+"' class='laydate-icon idate' type='text'  value=''  name='daoqiriqi"+curtabdatatr_num+"'></td></tr>");
						tr.insertBefore($(this).parent().parent()); 
						var gdqkinputs_iname = $(".gdqkinputs input[class=iname]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true, messages: {required:"请输入"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs input[class=inumber]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isNum :true, messages: {required :"请输入",isNum:"请填写数字"} })
						});
						var gdqkinputs_iname = $(".gdqkinputs input[class=laydate-icon idate]");
						gdqkinputs_iname.each(function(){
							$(this).rules("add", {required :true,isDate :true, messages: {required :"请输入",isDate:"请正确输入"} })
						});
						
						//动态添加到期日期控件
						
						//laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
						//laydate({elem: '#kaishiriqi'+curtabdatatr_num});//绑定元素
						//laydate({elem: '#daoqiriqi'+curtabdatatr_num});//绑定元素
						
					});
					
					//function aaa(){
						var gdqkinputs_inamex = $(".gdqkinputs input[class=laydate-icon idate]");
						gdqkinputs_inamex.live('click',function(){
						var naowdate = $(this).attr("id");
						laydate({elem: '#'+naowdate});//绑定元素
						});
					//}
					//aaa();
					
					$("#gbdel").click(function(){
						var prev = $(this).parent().parent().prev();
						var firsttr = prev.attr("lang");
						if(firsttr!="firsttr"){
							prev.remove();
						}
						
					});
					
					/* $("#laydate_box").click(function(){
						alert(1111);
						//b.onblur();
						//laydate-icon
					}) */
					
	
					
					
					
			 	</script>
			</div>
			</div>
			</div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("redebtsinfo");
 </script>
</body>
</html>
 